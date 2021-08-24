#!/bin/bash

mpic++ chroma_mpi.cpp -o mpi-chroma -lm `pkg-config --cflags --libs opencv4`

mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 1

mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 2

mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 3

mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out.jpg 4

mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 1

mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 2

mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 3

mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 1080bg.jpg 1080fg.jpg 1080out.jpg 4

mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 1
mpirun -np 1 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 1

mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 2
mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 2

mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 3
mpirun -np 3 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 3

mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 4
mpirun -np 4 --hostfile mpi_hosts ./mpi-chroma 4kbg.jpg 4kfg.jpg 4kout.jpg 4

