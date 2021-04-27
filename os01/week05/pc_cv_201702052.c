#include <stdio.h>
#include <pthread.h>
#include <unistd.h>     // usleep (micro sleep)

#define MAX 10 
#define PROD_SIZE 3
#define CONS_SIZE 7
#define PROD_ITEM 5
#define CONS_ITEM 2

/* homework */
/*----------*/
/* You need to make some variables (mutex, condition variables). */
pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t fill = PTHREAD_COND_INITIALIZER;	// conditional variable : fill
pthread_cond_t use = PTHREAD_COND_INITIALIZER;  // conditional varaible : use

pthread_mutex_t m_id = PTHREAD_MUTEX_INITIALIZER;
int buffer[MAX]; // ! buffer is circular queue !
int count = 0;
int get_ptr = 0;	
int put_ptr = 0;	
int prod_id = 1;
int cons_id = 1;

/* homework */
// return buffer's value using get_ptr if successful,
// otherwise, -1
int get()
{
    if(count == 0)
    {
	return -1;
    }

    int val = buffer[get_ptr];
    get_ptr = (get_ptr+1) % MAX;
    count--;
    return val;
}

/* homework */
// return buffer's value using put_ptr if successful,
// otherwise, -1
int put(int val)
{
    if(count == MAX)
    {
	return -1;
    }

    buffer[put_ptr] = val;
    put_ptr = (put_ptr+1) % MAX;
    count++;
    return val;
}

void *producer(void *arg)
{
    pthread_mutex_lock(&m_id);
    int id = prod_id++;
    pthread_mutex_unlock(&m_id);
    for (int i = 0; i < PROD_ITEM; ++i) {
        usleep(10);

        pthread_mutex_lock(&m);
	while(count == MAX)
	{
	    pthread_cond_wait(&use, &m);
	}	
	int ret = put(i);
	pthread_cond_signal(&fill);
	pthread_mutex_unlock(&m);

        if (ret == -1) {
            printf("can't put, becuase buffer is full.\n");
        } else {
            printf("producer %d PUT %d\n", id, ret);
        }
    }
}

void *consumer(void *arg)
{
    pthread_mutex_lock(&m_id);
    int id = cons_id++;
    pthread_mutex_unlock(&m_id);
    for (int i = 0; i < CONS_ITEM; ++i) {
        usleep(10);

        /* homework */
        pthread_mutex_lock(&m);
	while(count == 0)
	{
	    pthread_cond_wait(&fill, &m);
	}
	int ret = get();
        pthread_cond_signal(&use);
	pthread_mutex_unlock(&m);
	/* homework */

        if (ret == -1) {
            printf("can't get, becuase buffer is empty.\n");
        } else {
            printf("consumer %d GET %d\n", id, ret);
        }
    }
}

int main()
{
    pthread_t prod[PROD_SIZE];
    pthread_t cons[CONS_SIZE];

    for (int i = 0; i < PROD_SIZE; ++i)
        pthread_create(&prod[i], NULL, producer, NULL);
    for (int i = 0; i < CONS_SIZE; ++i)
        pthread_create(&cons[i], NULL, consumer, NULL);

    for (int i = 0; i < PROD_SIZE; ++i)
        pthread_join(prod[i], NULL);
    for (int i = 0; i < CONS_SIZE; ++i)
        pthread_join(cons[i], NULL);

    return 0;
}
