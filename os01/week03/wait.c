#include <stdio.h>
#include <stdlib.h>             // exit() 
#include <unistd.h>             // fork(), getpid() 
#include <sys/wait.h>           // wait() 


int main(int argc, char *argv[]){

        printf("Let's fork this process. (pid: %d)\n", (int)getpid());

        int fork_ = fork();     // fork
	int status;		

        if(fork_ == 0){
                // child process(New)
                printf("Here is a child process. (pid :%d)\n", (int)getpid());
                printf("@@@안녕@@@\n");
                sleep(1);       // sleep for 1 second
        }
        else if(fork_ > 0){
                // parent process(Original)
                int wait_ = waitpid(fork_, &status, 0); // wait for end of child process
		printf("Here is a parent process of %d. (pid: %d), (wait_: %d)\n",
                                fork_, (int)getpid(), wait_);
                printf("@@@잘가@@@\n");
        }
        else{
                // fork failed
                fprintf(stderr, "fork failed\n");
                exit(1);        // exit
        }
        return 0;
}

