#!/bin/bash

# https://qengineering.eu/install-tensorflow-2.2.0-on-raspberry-pi-4.html

# get a fresh start
sudo apt update
sudo apt upgrade

# remove old versions, if not placed in a virtual environment (let pip search for them)
sudo pip uninstall tensorflow
sudo pip3 uninstall tensorflow

# install jupyter and some essential data exploration libs
pip install jupyter jupyterlab pandas matplotlib

# install the dependencies (if not already onboard)
sudo apt install gfortran
sudo apt install libhdf5-dev libc-ares-dev libeigen3-dev
sudo apt install libatlas-base-dev libopenblas-dev libblas-dev
sudo apt install liblapack-dev cython
sudo pip3 install --upgrade setuptools
sudo pip3 install pybind11
sudo pip3 install h5py

# for arm64
sudo pip3 install cython==0.29.21

# install gdrive downloader
gdown https://drive.google.com/uc?id=11mujzVaFqa7R1_lB7q0kVPW22Ol51MPg
pip install tensorflow-2.2.0-cp37-cp37m-linux_armv7l.whl

# armv71 download and install TensorFlow 2.1.0 wheel
# wget https://github.com/Qengineering/Tensorflow-Raspberry-Pi/raw/master/tensorflow-2.1.0-cp37-cp37m-linux_armv7l.whl
pip install tensorflow-2.1.0-cp37-cp37m-linux_armv7l.whl

# armv71 download and install TensorFlow 2.2.0 wheel
#gdown https://drive.google.com/uc?id=11mujzVaFqa7R1_lB7q0kVPW22Ol51MPg
#pip install tensorflow-2.2.0-cp37-cp37m-linux_armv7l.whl

# arm64 download and install TensorFlow 2.3.0 wheel
sudo -H pip3 install tensorflow-2.3.0-cp37-cp37m-linux_aarch64.whl

# and complete the installation by rebooting
#sudo reboot
