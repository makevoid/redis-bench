#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "/usr/local/Cellar/hiredis/0.11.0/include/hiredis/hiredis.h"

int main(void) {
  redisContext *conn;
  redisReply *reply;
  
  conn = redisConnect("127.0.0.1", 6379);
  
  if (conn != NULL && conn->err) {
    printf("Connection error: %s\n", conn->errstr);
  }
  
  int times = 10000;
  
  int i;
  for(i = 0; i < times; ++i)
  {
    redisAppendCommand(conn, "SET foo bar");
    redisAppendCommand(conn, "GET foo");
  }
  
  
  for(i = 0; i < times*2; ++i)
  {  
    redisGetReply(conn, &reply); 
    // printf("%s\n", reply->str);
    freeReplyObject(reply);
  }
  
  // reply = redisCommand(conn, "GET foo");
  // printf("%s\n", reply->str);
}

// gcc redpipe.c -lhiredis; ./a.out