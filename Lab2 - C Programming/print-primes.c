#include <stdio.h>
#include <stdlib.h>

#define COLUMNS 3

int count; // Global count for print_number

void print_number(int n){

	if (count%COLUMNS == 0 && count != 0)
		printf("\n");
  
	printf("%10d ", n);
	count++;
}

void print_primes(int n){

	int i;

	for (i = 1; i <= n; i++) {

		if (is_prime(i))
			print_number(i);
	}

	printf("\n");
}

int is_prime(int n){

	int i;

	if (n == 1)
		return 0;

	for (i = 2; i <= n/2; i++) {		
		if (n%i == 0)
			return 0;
	}
	return 1;
}
// 'argc' contains the number of program arguments, and
// 'argv' is an array of char pointers, where each
// char pointer points to a null-terminated string.
int main(int argc, char *argv[]){
	if(argc == 2)
		print_primes(atoi(argv[1]));
	else
		printf("Please state an interger number.\n");
	return 0;
}
