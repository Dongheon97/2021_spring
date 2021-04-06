#include <stdio.h>
#include <stdlib.h>		// exit() function
#include <unistd.h>		// fork(), getpid() function

int global = 0;	
int* ptr = &global;

int main(int argc, char *argv[]){

	printf("Let's fork this process. (pid: %d)\n", (int)getpid());

	int fork_ = fork();	// fork

	if(fork_ == 0){	
		// child process(New)
		// work nothing
	}
	else if(fork_ > 0){
		// parent process(Origianl)
		
		// print of child 
		printf("Here is a child process. (pid :%d)\n", fork_); // fork_ = child's pid
		printf("@@@안녕@@@\n");
		sleep(1);	// sleep for 1 second

		// print of parent
		printf("Here is a parent process of %d. (pid: %d)\n", fork_, (int)getpid());
		printf("@@@잘가@@@\n");
	}
	else{	
		// fork failed
		fprintf(stderr, "fork failed\n");
		exit(1);	// exit
	}
	return 0;
}
