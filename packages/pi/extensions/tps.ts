// Displays output tokens per second in the footer status line.
// Live value while streaming (≈ estimate until the provider reports usage),
// exact provider-reported average after each assistant message.

import type { AssistantMessage } from "@earendil-works/pi-ai";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

const KEY = "tps";
const MIN_DECODE_MS = 300;
const STATUS_INTERVAL_MS = 100;

export default function (pi: ExtensionAPI) {
	let decodeStart: number | undefined;
	let estimatedTokens = 0;
	let lastStatusAt = 0;

	const reset = () => {
		decodeStart = undefined;
		estimatedTokens = 0;
	};

	// Rough token estimate for streamed deltas: ASCII ≈ 4 chars/token, non-ASCII ≈ 1 char/token.
	const estimateTokens = (text: string) => {
		let ascii = 0;
		let other = 0;
		for (const char of text) {
			if (char.codePointAt(0)! < 128) ascii++;
			else other++;
		}
		return ascii / 4 + other;
	};

	pi.on("session_start", async (_event, ctx) => {
		reset();
		ctx.ui.setStatus(KEY, undefined);
	});

	pi.on("message_start", async (event) => {
		if (event.message.role === "assistant") reset();
	});

	pi.on("message_update", async (event, ctx) => {
		if (event.message.role !== "assistant") return;
		const streamEvent = event.assistantMessageEvent;
		if (streamEvent.type !== "text_delta" && streamEvent.type !== "thinking_delta" && streamEvent.type !== "toolcall_delta") {
			return;
		}

		const now = performance.now();
		decodeStart ??= now;
		estimatedTokens += estimateTokens(streamEvent.delta);

		if (now - lastStatusAt < STATUS_INTERVAL_MS) return;
		lastStatusAt = now;

		const elapsed = (now - decodeStart) / 1000;
		if (elapsed <= 0) return;

		const reported = event.message.usage.output;
		const tps = (reported > 0 ? reported : estimatedTokens) / elapsed;
		const theme = ctx.ui.theme;
		// Streaming is accent; the estimated marker stays dim so a guess never reads as a measurement.
		const estimate = reported > 0 ? "" : ` ${theme.fg("dim", "≈")}`;
		ctx.ui.setStatus(KEY, `${theme.fg("accent", "⚡")}${estimate} ${theme.fg("accent", `${tps.toFixed(1)} tok/s`)}`);
	});

	pi.on("message_end", async (event, ctx) => {
		if (event.message.role !== "assistant") return;
		const message = event.message as AssistantMessage;
		const output = message.usage.output;
		const decodeMs = decodeStart === undefined ? 0 : performance.now() - decodeStart;
		const windowMs = decodeMs > 0 ? decodeMs : (message.durationMs ?? 0);

		if (output > 0 && windowMs >= MIN_DECODE_MS) {
			const tps = output / (windowMs / 1000);
			const theme = ctx.ui.theme;
			ctx.ui.setStatus(
				KEY,
				`${theme.fg("dim", "⚡")} ${theme.fg("success", "✓")} ${theme.fg("dim", `${tps.toFixed(1)} tok/s`)}`,
			);
		} else {
			ctx.ui.setStatus(KEY, undefined);
		}
		reset();
	});
}
