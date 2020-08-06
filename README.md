# Saftladen

[zaftˈlaːdn̩] Juice store; disparaging term used to describe a facility with bad organization or poor service

This repository is a bundle of scripts to generate asciinema demos for pulp topics without live user interaction.
To add a new scene, add a new directory for it and create a `script.sh` inside it.
You can now create the screencast with `make <DIRNAME>.cast`.

## Available tools
* `bin/echo_type.py` Printing an anonymous promt and simulating a user typing a comand.
