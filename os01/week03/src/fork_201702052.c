#include <stdio.h>
#include <stdlib.h>		// exit() function
#include <unistd.h>		// fork(), getpid() function

int global = 0;			// global variable

int main(int argc, char *argv[]){

	int local = 0;		// local variable

	printf("Let's fork this process. (pid: %d)\n", (int)getpid());
	printf("-global: %d\n-local : %d\n", global, local);		// checking variables

	int fork_ = fork();	// fork

	if(fork_ == 0){	
		// child process(New)
		global++;
		local++;
		printf("Here is a child process. (pid :%d)\n", (int)getpid());
		printf("-global: %d\n-local : %d\n", global, local);	// checking variables

	}
	else if(fork_ > 0){	
		// parent process(Original)
		global--;
		local--;
		printf("Here is a parent process of %d. (pid: %d)\n", fork_, (int)getpid());
		printf("-global: %d\n-local : %d\n", global, local);	// checking variables
	}
	else{	
		// fork failed
		fprintf(stderr, "fork failed\n");
		exit(1);	// exit
	}
	return 0;
}
