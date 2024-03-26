#!/bin/bash

# Make sure the VENV_PATH variable is correctly set based upon the computer system being used, as follows

# # For the workstation AnalyticalEngine
# VENV_PATH="/home/jason_mulderrig/research/projects/cuFJC-scission"

# For the Macbook Air
VENV_PATH="/Users/jasonmulderrig/research/projects/cuFJC-scission"

# Set up Python virtual environment and associated Python packages

if [ ! -d ${VENV_PATH} ]
then
  mkdir -p ${VENV_PATH}
  python3 -m venv ${VENV_PATH}
  cd ${VENV_PATH}
else
  cd ${VENV_PATH}
  if [ ! -f pyvenv.cfg ]
  then
    python3 -m venv ${VENV_PATH}
  else
    rm -rf bin include lib share && rm lib64 && rm pyvenv.cfg
    python3 -m venv ${VENV_PATH}
  fi
fi

source bin/activate

pip3 install wheel && pip3 install --upgrade setuptools && pip3 install --upgrade pip
pip3 install numpy
pip3 install cufjc==1.6.0

deactivate
