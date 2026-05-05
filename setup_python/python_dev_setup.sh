#!/bin/bash -i

# mamba from conda-forge: only use the conda-forge channel, do NOT use the paid Anaconda Inc channels
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3.sh -b -p "${HOME}/conda"
source "${HOME}/conda/etc/profile.d/mamba.sh"
mamba shell init

# check the channels
conda config --show channels
mamba config list

# create a "dev" standard env
mamba create -n dev
mamba activate dev
mamba install -y numpy matplotlib xarray scipy pip ipython pandas

mamba deactivate dev

history -s "mamba activate dev"
history -s "mamba deactivate"
