#!/bin/bash
curl -L https://git.io/n-install | bash

echo "Installed?"

# will need to `reset` window first

. ~/.bash_profile

n 6.11.3

echo "Worked?"
