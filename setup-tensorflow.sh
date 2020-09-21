#!/bin/bash

# https://qengineering.eu/install-tensorflow-2.2.0-on-raspberry-pi-4.html

# get a fresh start
$ sudo apt update
$ sudo apt upgrade

# remove old versions, if not placed in a virtual environment (let pip search for them)
$ sudo pip uninstall tensorflow

# install the dependencies (if not already onboard)
$ sudo apt install gfortran
$ sudo apt install libhdf5-dev libc-ares-dev libeigen3-dev
$ sudo apt install libatlas-base-dev libopenblas-dev libblas-dev
$ sudo apt install liblapack-dev cython
$ sudo pip install pybind11
$ sudo pip install h5py

# install TensorFlow from the wheel
$ wget https://github.com/Qengineering/Tensorflow-Raspberry-Pi/raw/master/tensorflow-2.1.0-cp37-cp37m-linux_armv7l.whl
$ sudo -H pip install tensorflow-2.1.0-cp37-cp37m-linux_armv7l.whl

# and complete the installation by rebooting
$ sudo reboot
