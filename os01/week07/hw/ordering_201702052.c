#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define STATE_INIT (0)
typedef struct {
    pthread_t th;
    int state;
} my_thread_t;

my_thread_t *thd;
pthread_mutex_t mutex;

void *routine(void *arg) {
    printf("routine: begin\n");
    
    pthread_mutex_lock(&mutex);		// lock
    printf("routine: state is %d\n", thd->state);
    pthread_mutex_unlock(&mutex);	// unlock
    
    return NULL;
}

void myWaitThread(my_thread_t *p) {
    pthread_join(p->th, NULL); 
}

my_thread_t *myCreateThread(void *(*start_routine)(void *)) {
    my_thread_t *p = malloc(sizeof(my_thread_t));
    if (p == NULL) 
	    return NULL;
    p->state = STATE_INIT;
    
    pthread_mutex_lock(&mutex);		// lock
    pthread_create(&p->th, NULL, start_routine, NULL); 
    // turn the sleep off to avoid the fault, sometimes...
    sleep(1);
    pthread_mutex_unlock(&mutex); 	// sleep 이후로 unlock
    
    return p;
}

int main(int argc, char *argv[]) {
    pthread_mutex_init(&mutex, NULL);
    printf("ordering: begin\n");
    thd = myCreateThread(routine);
    myWaitThread(thd);
    printf("ordering: end\n");
    return 0;
}

