#include <stdio.h>		// perror
#include <unistd.h>		// open, write, read
#include <semaphore.h>		// library semaphore
#include <sys/stat.h>		// sem_open
#include <fcntl.h>		// mode, flag
#include <string.h>		
#include <stdlib.h>		// exit() 

#define FIFO_PATH "fifo_temp"
#define SEM_NAME "sem_pp"
#define BUF_SIZE 8
#define TURN 5


int main()
{
    const char *msg = "pong\n";
    int fd;
    int cnt;
    int score = 100;
    sem_t *p_sem;
    char buf[BUF_SIZE];

    sem_unlink(SEM_NAME);
    // create named semaphore
    if ((p_sem = sem_open(SEM_NAME, O_CREAT, 0666,1)) == SEM_FAILED){
	    // sem_open error -> exit()
	    perror("sem_open");
	    exit(1);
    }

    for(cnt=0; cnt<TURN; cnt++){
	     mkfifo(FIFO_PATH, 0666);
	     fd = open(FIFO_PATH, O_RDWR);
	     
	     sem_wait(p_sem);
	     
	     read(fd, buf, BUF_SIZE);
	     printf("\n[opponent] %s", buf);
	     memset(buf, 0, BUF_SIZE);
	     printf("Your turn!\n");
	     fgets(buf, BUF_SIZE, stdin);
	     write(fd, buf, strlen(buf));
	     if(strcmp(msg, buf)){
		printf("wrong! -20\n");
		score -= 20;	
	     }

	     sem_post(p_sem);
    }
    close(fd);
    printf("Done! Your score: %d\n", score);
    return 0;
}
