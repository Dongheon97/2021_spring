#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define BUF_SIZE 100

int main(void)
{
	int pipe_parent[2];
	int pipe_child[2];
	char buf[BUF_SIZE];
	pid_t pid;

	pipe(pipe_parent);
	pipe(pipe_child);

	pid = fork();

	if(pid == 0)
	{
		sprintf(buf, "(child) test_pipe");
		write(pipe_child[1], buf, strlen(buf));
		memset(buf, 0x00, BUF_SIZE);

		read(pipe_parent[0], buf, BUF_SIZE);
		printf("child : %s\n", buf);
	}
	else
	{
		sprintf(buf, "(parent) test_pipe");
		write(pipe_parent[1], buf, strlen(buf));
		memset(buf, 0x00, BUF_SIZE);

		read(pipe_child[0], buf, BUF_SIZE);
		printf("parent :%s\n", buf);
	}
	sleep(1);
	return 0;
}
