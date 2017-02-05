#include <stdio.h>

char* text1 = "This is a string.";
char* text2 = "Yet another thing.";

char* list1[80];
char* list2[80];
int* count = 0;

void copycodes() {

}

void work(char* text, char* list, int* count) {
	printf("%p\n", text1);
}

void printlist(const int* lst) {

	printf("ASCII codes and corresponding characters.\n");

	while(*lst != 0){
		printf("0x%03X '%c' ", *lst, (char)*lst);
		lst++;
	}
	printf("\n");
}

void endian_proof(const char* c) {

	printf("\nEndian experiment: 0x%02x,0x%02x,0x%02x,0x%02x\n", 
	(int)*c,(int)*(c+1), (int)*(c+2), (int)*(c+3));
}

int main(void){

	work(text1, list1, count);

	printf("\nlist1: ");
	printlist(list1);
	printf("\nlist2: ");
	printlist(list2);
	printf("\nCount = %d\n", count);

	endian_proof((char*) &count);
}
