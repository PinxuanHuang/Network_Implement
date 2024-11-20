CC=gcc
CFLAGS=-g
MAKE=make
TARGET:test.exe
LIBS=-lpthread -L ./CommandParser -lcli -lrt
OBJS=gluethread/glthread.o \
		  graph.o 		   \
		  topologies.o

test.exe:testapp.o ${OBJS} CommandParser/libcli.a
	${CC} ${CFLAGS} testapp.o ${OBJS} -o test.exe ${LIBS}

testapp.o:testapp.c
	${CC} ${CFLAGS} -c testapp.c -o testapp.o

gluethread/glthread.o:gluethread/glthread.c
	${CC} ${CFLAGS} -c -I gluethread gluethread/glthread.c -o gluethread/glthread.o
graph.o:graph.c
	${CC} ${CFLAGS} -c -I . graph.c -o graph.o
topologies.o:topologies.c
	${CC} ${CFLAGS} -c -I . topologies.c -o topologies.o
CommandParser/libcli.a:
	${MAKE} -C CommandParser
clean:
	rm *.o
	rm gluethread/glthread.o
	rm *exe
