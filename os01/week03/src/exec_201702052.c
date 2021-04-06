#include <stdio.h>
#include <stdlib.h>		// exit() 
#include <unistd.h>		// fork(), getpid() 
#include <string.h>		// strdup
#include <sys/wait.h>		// wait() 


int main(int argc, char *argv[]){

	printf("Let's fork this process. (pid: %d)\n", (int)getpid());

	int fork_ = fork();	// fork

	if(fork_ == 0){	
		// child process(New)
		printf("Here is a child process. (pid :%d)\n", (int)getpid());
		// execv 'ls'
		char *myargs[3];		// command(string) list
		myargs[0] = strdup("ls");	// argument: command 
		myargs[1] = strdup("-al");	// argument: command option
		myargs[2] = NULL;		// mark end of array
		execv("/bin/ls", myargs);	// run 'ls' command
		printf("ls commanding was failed\n");	// if execv doesn't run, print this message
	}
	else if(fork_ > 0){	
		// parent process(Original)
		int wait_ = wait(NULL);		// wait for end of child process
		printf("Here is a parent process of %d. (pid: %d), (wait_: %d)\n", 
				fork_, (int)getpid(), wait_);
	}
	else{	
		// fork failed
		fprintf(stderr, "fork failed\n");
		exit(1);	// exit
	}
	return 0;
}
