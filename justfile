default: 
	just --list

alias r := run
alias u := update

run:
	nix run .#

update:
	nix flake update
