#include <stdio.h>
#include <stdlib.h> // exit
#include <unistd.h> // fork, getpid

int global = 0; // global variable

int main(int argc, char *argv[])
{
    printf("hello world (pid:%d)\n", (int) getpid());
    
    int local = 0;
    printf("-global: %d\n-local : %d\n", global, local);

    int ret_fork = fork();
    if (ret_fork < 0) {
        // fork failed; exit
        fprintf(stderr, "fork failed\n");
        exit(1);
    } else if (ret_fork == 0) {
        // child (new process)
	global ++;
	local ++;
        printf("hello, I am child (pid:%d)\n", (int) getpid());
	printf("-global: %d\n-local : %d\n", global, local);
    } else {
        // parent goes down this path (original process)
	global --;
	local --;
        printf("hello, I am parent of %d (pid:%d)\n",
	       ret_fork, (int) getpid());
    	printf("-global: %d\n-local : %d\n", global, local);
    }
    return 0;
}
