#####################
# Carpeta actual
#####################

ROOT = .

########################
# Configuracion carpetas
########################

CC ?= gcc
BIN_DIR		?= $(ROOT)/test_ejecutables
BUIL_DIR		?= $(ROOT)/test_output_o
LIB_AO_INC = $(ROOT)/lib/atomic_ops


##########################
# Configuracion compilador
##########################
CFLAGS	+= -g -DDEBUG -O0
CFLAGS	+= -O3 -DNDEBUG 
CFLAGS += -D_REENTRANT
CFLAGS += -D_GNU_SOURCE
CFLAGS += -DLOCKFREE
CFLAGS += -Wall
CFLAGS += -fno-strict-aliasing
CFLAGS += -I$(LIB_AO_INC) -I$(ROOT)/lib/include

LIB_DIR_FLAGS += -lpthread -lrt -lm

LINDENFLAGS = -DCACHE_LINE_SIZE=`getconf LEVEL1_DCACHE_LINESIZE` -DINTEL

SPRAY = $(BIN_DIR)/spray
SSSP = $(BIN_DIR)/sssp
BINS = $(BIN_DIR)/*


.PHONY:	all clean
############
# Ejecucion
############

all:	spray sssp

measurements.o:
	$(CC) $(CFLAGS) -c -o $(BUIL_DIR)/measurements.o measurements.c

ssalloc.o:
	$(CC) $(CFLAGS) -c -o $(BUIL_DIR)/ssalloc.o ssalloc.c

skiplist.o:
	$(CC) $(CFLAGS) -c -o $(BUIL_DIR)/skiplist.o skiplist.c

fraser.o: skiplist.h 
	$(CC) $(CFLAGS) -c -o $(BUIL_DIR)/fraser.o fraser.c 

linden.o: 
	$(CC) $(CFLAGS) $(LINDENFLAGS) -c -o $(BUIL_DIR)/linden.o linden.c

linden_common.o: 
	$(CC) $(CFLAGS) $(LINDENFLAGS) -c -o $(BUIL_DIR)/linden_common.o linden_common.c

gc.o: 
	$(CC) $(CFLAGS) $(LINDENFLAGS) -c -o $(BUIL_DIR)/gc.o gc/gc.c

ptst.o:
	$(CC) $(CFLAGS) $(LINDENFLAGS) -c -o $(BUIL_DIR)/ptst.o gc/ptst.c

intset.o: 
	$(CC) $(CFLAGS) -c -o $(BUIL_DIR)/intset.o intset.c

test.o: 
	$(CC) $(CFLAGS) -c -o $(BUIL_DIR)/test.o test.c

sssp.o: 
	$(CC) $(CFLAGS) -c -o $(BUIL_DIR)/sssp.o sssp.c

pqueue.o: 
	$(CC) $(CFLAGS) -c -o $(BUIL_DIR)/pqueue.o pqueue.c

spray: measurements.o ssalloc.o skiplist.o fraser.o intset.o test.o pqueue.o linden.o linden_common.o gc.o ptst.o
	$(CC) $(CFLAGS) $(BUIL_DIR)/pqueue.o $(BUIL_DIR)/measurements.o $(BUIL_DIR)/ssalloc.o $(BUIL_DIR)/skiplist.o $(BUIL_DIR)/fraser.o $(BUIL_DIR)/intset.o $(BUIL_DIR)/test.o $(BUIL_DIR)/linden.o $(BUIL_DIR)/linden_common.o $(BUIL_DIR)/ptst.o $(BUIL_DIR)/gc.o -o $(SPRAY) $(LIB_DIR_FLAGS)

sssp: measurements.o ssalloc.o skiplist.o fraser.o intset.o sssp.o pqueue.o linden.o linden_common.o gc.o ptst.o
	$(CC) $(CFLAGS) $(BUIL_DIR)/pqueue.o $(BUIL_DIR)/measurements.o $(BUIL_DIR)/ssalloc.o $(BUIL_DIR)/skiplist.o $(BUIL_DIR)/fraser.o $(BUIL_DIR)/intset.o $(BUIL_DIR)/sssp.o $(BUIL_DIR)/linden.o $(BUIL_DIR)/linden_common.o $(BUIL_DIR)/ptst.o $(BUIL_DIR)/gc.o -o $(SSSP) $(LIB_DIR_FLAGS)


############
# Borrar
############

clean:
	-rm -f $(BINS) $(BUIL_DIR)/*.o
