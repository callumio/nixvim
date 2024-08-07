default: 
	just --list

alias r := run
alias u := update
alias c := cache

cache:
	nix build --json | jq -r '.[].outputs | to_entries[].value' | cachix push callumio-public

run:
	nix run .#

update:
	nix flake update
