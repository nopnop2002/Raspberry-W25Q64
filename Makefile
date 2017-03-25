main : main.c W25Q64.c W25Q64.h
	cc -o main main.c W25Q64.c -lwiringPi
