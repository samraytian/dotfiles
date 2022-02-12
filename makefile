all:
	stow --verbose --ignore='\.DS_Store' --target=$$HOME --restow */
delete:
	stow --verbose --ignore='\.DS_Store' --target=$$HOME --delete */
