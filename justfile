# vim: set ft=make

default:
    @just --list

hm-build:
    home-manager build --flake .
    git switch -c tmp
    git add --all
    git commit -m "build: {{uuid()}}"

hm-switch:
    home-manager switch --flake .
    git reset --soft main
    git commit -e
    git switch main
    git rebase tmp
    git branch -D tmp

test:
    exit -1
    @echo "this should be printed"
[macos]
dw-build:

[macos]
dw-switch:

