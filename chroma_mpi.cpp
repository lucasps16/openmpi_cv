//g++ -fopenmp Chroma_openmp.cpp -o comp -std=c++11  `pkg-config --cflags --libs opencv4`
//mpic++ chroma_mpi.cpp -o mpi-chroma -lm `pkg-config --cflags --libs opencv4`
//mpirun -np 2 --hostfile mpi_hosts ./mpi-chroma 720bg.jpg 720fg.jpg 720out_1.jpg 2
#include <stdio.h>
#include <mpi.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>
#include <iostream>
#include <sys/time.h>
#include <pthread.h>
#include <fstream>

using namespace cv;
using namespace std;

Mat background, frame, hsv, mask, result;

//Argumentos pasados a cada hilo
struct args{
    int THREADS,H,W,id;
};

int main(int argc, char *argv[])
{
    printf("INICIO \n");
    //Argumentos esperados:
    string bg = argv[1];         //nombre imagen de fondo,
    string fg = argv[2];         //nombre imagen frontal
    string output = argv[3];     //nombre imagen final
    int threads = atoi(argv[4]); //numero de hilos.


    int imageTotalSize;
    int imagePartialSize;
    uchar* partialBuffer_fg;
    uchar* partialBuffer_bg;
    uchar* partialBuffer_result;
    uchar* maskBuffer;
    char buf[64];
    int threadId, i, *retval, h, w;
    int numprocs;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &threadId);
    int id = threadId;

    struct timeval tval_before, tval_after, tval_result;
    gettimeofday(&tval_before, NULL);
    printf("--------1---------ThreadId: %d\n",id);
    
        //Abrir imagenes como BGR
    if(id == 0){
        background = imread(bg, IMREAD_COLOR);
        frame = imread(fg, IMREAD_COLOR);

        //Transforma el espacio de color de la imagen de BGR a HSV y lo guarda en un objeto
        cvtColor(frame, hsv, COLOR_BGR2HSV);
        //Revisa si el pixel es verde y le convierte a blanco, si no es verde lo vuelve negro y se genera la mascara
        inRange(hsv, Scalar(35, 43, 46), Scalar(77, 255, 255), mask);
        

    }
        
        imageTotalSize = frame.cols*frame.rows*3;
        printf("imageTotalSize %d\n", imageTotalSize);
        printf("numprocs: %d\n",numprocs);
        imagePartialSize = imageTotalSize/numprocs;
        printf("Despues \n");
        printf("imagePartialSize %d\n", imagePartialSize);
        printf("HALP \n");
    if(id == 0){
        //Crea una imagen vacia del tamano de la imagen original
        result = Mat(frame.size(), frame.type());
        printf("result \n");
        //Creacion de hilos
        
    }
        printf("ThreadId: %d\n",id);
        MPI_Bcast( &imagePartialSize, 1, MPI_UNSIGNED_LONG_LONG, 0, MPI_COMM_WORLD );
        MPI_Barrier( MPI_COMM_WORLD );
        partialBuffer_fg = new uchar[imagePartialSize];
        partialBuffer_bg = new uchar[imagePartialSize];
        partialBuffer_result = new uchar[imagePartialSize];
        maskBuffer = new uchar[imagePartialSize/3];

        MPI_Scatter( frame.data, imagePartialSize, MPI_UNSIGNED_CHAR, partialBuffer_fg, imagePartialSize, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD );
        MPI_Barrier( MPI_COMM_WORLD );
        h = frame.rows;
        w = frame.cols;
        printf("HW \n");      
        
        
        printf("CAST 1 \n");
        printf("ThreadId: %d\n",id);
        MPI_Bcast( &threads, 1, MPI_INT, 0, MPI_COMM_WORLD );


        MPI_Barrier( MPI_COMM_WORLD );
        printf("SYNC 2\n");
        MPI_Scatter( background.data, imagePartialSize, MPI_UNSIGNED_CHAR, partialBuffer_bg, imagePartialSize, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD );
        printf("bg\n");
        //MPI_Scatter( hsv.data, imagePartialSize, MPI_UNSIGNED_CHAR, partialBuffer, imagePartialSize, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD );
        printf("hsv\n");
        MPI_Scatter( mask.data, imagePartialSize/3, MPI_UNSIGNED_CHAR, maskBuffer, imagePartialSize/3, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD );
        
        
        
        MPI_Barrier( MPI_COMM_WORLD );
        printf("SYNC 3\n");
        
        //Barrera 
            int THREADS = threads;
            int H = h*3;
            int W = w;
            int ID = id;
            printf("ThreadId: %d\n",id);
            printf("Antes de chroma\n");
    int mask_h = 0;
    //Calculo de la iteracion correspondiente al hilo
    int initIteration = (H / THREADS) * ID;
    printf("initIteration: %d\n", initIteration);
    int endIteration = initIteration + (H / THREADS);
    printf("endIteration: %d\n", endIteration);
    int m;
    bool print = true;
    MPI_Barrier( MPI_COMM_WORLD);
    printf("BEFORE FOR id: %d\n", id);
    for (int row = initIteration; row < endIteration; row+=3)
    {
        //Matrices de las imagenes
        uchar *current = frame.ptr<uchar>(mask_h);
        uchar *bgrow = background.ptr<uchar>(mask_h);
        uchar *maskrow = mask.ptr<uchar>(mask_h);/*
        uchar* B = &partialBuffer_result[row];
        uchar* G = &partialBuffer_result[row + 1];
        uchar* R = &partialBuffer_result[row + 2];*/
        if(print){
            printf("After mats, id: %d\n", id);
            print = false;
        }
        for (int col = 0; col < W; col++)
        {
            m = *maskrow++;
            if(print){
            printf("After mask, id: %d\n", id);
        }
            //Si el pixel de la mascara es blanco asigne el valor del la imagen de fondo
            if (m == 255) 
            {
                partialBuffer_result[row] = partialBuffer_bg[row];
                partialBuffer_result[row+1] = partialBuffer_bg[row+1];
                partialBuffer_result[row+2] = partialBuffer_bg[row+2];
                current += 3;
            }
            //Si el pixel de la mascara es negro asigne el valor del la imagen de frente
            else if (m == 0) 
            {
                partialBuffer_result[row] = partialBuffer_fg[row];
                partialBuffer_result[row+1] = partialBuffer_fg[row+1];
                partialBuffer_result[row+2] = partialBuffer_fg[row+2];
                bgrow += 3;
            }  
            if(print){
                printf("After pixels, id: %d\n", id);
                print = false;
            }   
        }
        mask_h++;

        //printf("ID: %d Itr: %d\n",id, row);
       
    }
    printf("Finished %d\n", id);

            
    MPI_Barrier( MPI_COMM_WORLD );
        printf("Despues de chroma sync\n");
    
    MPI_Gather(partialBuffer_result,imagePartialSize,MPI_UNSIGNED_CHAR,result.data, imagePartialSize, MPI_UNSIGNED_CHAR,0, MPI_COMM_WORLD);
    MPI_Barrier( MPI_COMM_WORLD );
    if(id == 0){
        printf("W to file \n");
        imwrite(output, result);
        //Calculo de tiempo de ejecucion
        gettimeofday(&tval_after, NULL);
        timersub(&tval_after, &tval_before, &tval_result);
        snprintf(buf, sizeof buf, "%ld.%06ld", tval_result.tv_sec, tval_result.tv_usec);
        string time = (string)(buf);
        string info = "H: " + to_string(h) + " W: " + to_string(w) + " Threads: " + to_string(threads) + " TIME ELAPSED: " + time + "\n";

        //Escritura de informacion de ejecucion en archivo de texto
        ofstream myfile;
        myfile.open("info.txt", ios_base::app);
        if (myfile.is_open())
        {
            myfile << info;
            myfile.close();
        }

    }
    
    delete[]partialBuffer_fg;
    delete[]partialBuffer_bg;
    delete[]partialBuffer_result;
    delete[]maskBuffer;

    MPI_Finalize();
    
    return 0;
}


