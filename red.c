#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "/usr/local/Cellar/hiredis/0.11.0/include/hiredis/hiredis.h"

void putz(char string[]){
  int i = 0;
  for(i = 0; string[i] != '\0'; ++i)
  {
    printf("%c", string[i]);
  }
  printf("\n");
}

int main(void) {
  redisContext *conn;
  redisReply *reply;
  
  conn = redisConnect("127.0.0.1", 6379);
  
  if (conn != NULL && conn->err) {
    printf("Connection error: %s\n", conn->errstr);
  }
  
  
  int i;
  int r;
  for(i = 0; i < 10000; ++i)
  {
    r = rand() % 20;
    reply = redisCommand(conn, "SET foo %s%i", "bar", r);
    reply = redisCommand(conn, "GET foo");
  }
  
  // reply = redisCommand(conn, "GET foo");
  // putz("reply:");
  // printf("%s\n", reply->str);
}

// gcc red.c -lhiredis; ./a.out 