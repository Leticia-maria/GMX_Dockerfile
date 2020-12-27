#!/bin/bash


#external-dependencies installation
 apt update 
 apt upgrade --yes 
 apt install --yes build-essential 
 apt-get install --yes manpages-dev
 apt install --yes openmpi-bin
 apt-get install --yes cmake
 apt install --yes wget

#cuda installation
 wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
 mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 
 apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
 apt-get install --yes software-properties-common
 apt-get update
 add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
 apt-get -y update 
 apt-get -y install cuda

#finally, gromacs installation
 wget http://ftp.gromacs.org/pub/gromacs/gromacs-2020.4.tar.gz
 tar -xzvf gromacs-2020.4.tar.gz
 cd gromacs-2020.4
 cd build 
 CC=mpicc CXX=mpicxx cmake ../../gromacs-2020.4 -DGMX_OPENMP=ON -DGMX_GPU=ON -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DCMAKE_BUILD_TYPE=Release -DGMX_BUILD_UNITTESTS=ON -DCMAKE_INSTALL_PREFIX=/usr/local/gromacs   
 make
# make check
 sudo make install
#After installation, the path of executable file is: /usr/local/gromacs/bin/GMXRC
