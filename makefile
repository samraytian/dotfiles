restow:
	stow --verbose --restow --target=$(HOME) --dir=$(CURDIR) $(shell ls -d */ | sed 's/\///g' | sed '/icons/d') --ignore='\.DS_Store'

delete:
	stow --verbose --delete --target=$(HOME) --dir=$(CURDIR) $(shell ls -d */ | sed 's/\///g' | sed '/icons/d') --ignore='\.DS_Store'

all: restow
