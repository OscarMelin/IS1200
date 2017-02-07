/*
Modify your solution from Assignment 3 so that it computes and prints out the nubmer of times there is a distance of 4 between two prime numbers.
*/

#include <stdio.h>
#include <math.h>

#define COLUMNS 1

int count; // Global count for print_number

void print_number(int n){

	if (count%COLUMNS == 0 && count != 0)
		printf("\n");
  
	printf("%10d ", n);
	count++;
}


void print_sieves(int n){

	int i;
	int j;

	int count = 0; // Number of times there is a distance of 4.
	int prev = 0;

	char numbers[n];

	for (i = 0; i < n; i++)
		numbers[i] = 1;

	for (i = 2; i <= (int) sqrt(n); i++) {
		if (numbers[i]) {
			for (j = i*i; j < n; j += i) 
				numbers[j] = 0;
		}
	}

	for (i = 2; i < n; i++){
		if ((int) numbers[i]) {
			print_number(i);

			if (i-prev == 4)
				count++;

			prev = i;
		}
	}

	printf("\nCount: %d\n", count);
	printf("\n");
}

// 'argc' contains the number of program arguments, and
// 'argv' is an array of char pointers, where each
// char pointer points to a null-terminated string.
int main(int argc, char *argv[]){
	if(argc == 2)
		print_sieves(atoi(argv[1]));
	else
		printf("Please state an interger number.\n");
	return 0;
}
