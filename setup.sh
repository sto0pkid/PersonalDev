#!/bin/bash
# "unofficial bash strict mode" from Aaron Maxwell
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
#
# -e
# Exit immediately if any command has non-zero exit status
#
# -u
# Referencing an unbound variable is an error
#
# -o pipefail
# If any command in a pipeline has non-zero exit status then so does the whole pipeline
set -euo pipefail

# Also from "unofficial bash strict mode"; less sure about this one
# IFS=$'\n\t'

# Tell apt-get we're never going to be able to give interactive feedback
export DEBIAN_FRONTEND=noninteractive

# NONDETERMINISTIC
# Update package list
apt-get update

# NONDETERMINISTIC
# Upgrade existing packages
# Do perform security updates
# https://pythonspeed.com/articles/security-updates-in-docker/
apt-get -y upgrade

# NONDETERMINISTIC
# Install packages
# This is the only content special to this particular image
# Can we abstract it out?
apt-get -y install --no-install-recommends \
 git            \
 openssh-client \
 vim

# NONDETERMINISTIC ?
# Delete cached files that we don't need anymore
# (should be automatic with official Debian & Ubuntu images?)
apt-get clean

# NONDETERMINISTIC ?
# Delete index files we don't need anymore
rm -rf /var/lib/apt/lists/*

# Add non-root user and user group
# -m: create home directory for appuser
# Without -m option it will by default not create home directory,
# as CREATE_HOME is not present in /etc/login.defs, and default value
# if it is not present is No
useradd -m appuser
