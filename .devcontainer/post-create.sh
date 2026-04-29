#!/usr/bin/env bash
set -e

# Initialize oneAPI for current session
source /opt/intel/oneapi/setvars.sh

# Persist environment for all future shells (no condition, always append)
echo 'source /opt/intel/oneapi/setvars.sh' >> ~/.bashrc

# Install common tools (no checks, just install)
apt-get update
apt-get install -y cmake ninja-build

# Done
echo "Devcontainer setup complete"
