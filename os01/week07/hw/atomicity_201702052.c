#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

typedef struct {
    int pid;
} proc_t;

typedef struct {
    proc_t *proc_info;
} thread_info_t; 

proc_t p;
thread_info_t *thd;
pthread_mutex_t mutex;	// make mutex

void *thread1(void *arg);
void *thread2(void *arg);

int main(int argc, char *argv[]) {
    
    pthread_mutex_init(&mutex, NULL);	// mutex initialize
    thread_info_t t;
    p.pid = 100;	// sharing variable
    t.proc_info = &p;
    thd = &t;

    pthread_t p1, p2;
    printf("main: begin\n");
    pthread_create(&p1, NULL, thread1, NULL); 
    pthread_create(&p2, NULL, thread2, NULL);
    // join waits for the threads to finish
    
    pthread_join(p1, NULL); 
    pthread_join(p2, NULL); 
    printf("main: end\n");
    return 0;
}

void *thread1(void *arg) {
    
    pthread_mutex_lock(&mutex); 	// lock : 'atomic' from now on
    
    printf("t1: before check\n");
    if (thd->proc_info) {
        printf("t1: after check\n");
        sleep(2);
        printf("t1: use!\n");
        printf("%d\n", thd->proc_info->pid);

    	pthread_mutex_unlock(&mutex);	// unlock : sharing memory reference end!
    
    }
    return NULL;
}

void *thread2(void *arg) {
    printf("                 t2: begin\n");
    sleep(1); // change to 5 to make the code "work"...

    pthread_mutex_lock(&mutex);		// lock 
    printf("                 t2: set to NULL\n"); 
    thd->proc_info = NULL;		
    pthread_mutex_unlock(&mutex);	// unlock
    
    return NULL;
}


