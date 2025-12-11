CC=g++
CFLAGS=-std=c++11 -g -Wall  -I./
# LDFLAGS= -lpthread -ltbb -lhiredis 
# SUBDIRS=core db redis lib

LDFLAGS= -ltbb
SUBDIRS=core db lib

GEM5_PATH =../../gem5
TARGET_ISA = x86

CFLAGS += -I$(GEM5_PATH)/include
LDFLAGS += -L$(GEM5_PATH)/util/m5/build/$(TARGET_ISA)/out -lm5

SUBSRCS=$(wildcard core/*.cc) $(wildcard db/*.cc) $(wildcard lib/*.cc)
OBJECTS=$(SUBSRCS:.cc=.o)
EXEC=ycsbc

all: $(SUBDIRS) $(EXEC)

$(SUBDIRS):
	$(MAKE) -C $@

$(EXEC): $(wildcard *.cc) $(OBJECTS)
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

clean:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done
	$(RM) $(EXEC)

.PHONY: $(SUBDIRS) $(EXEC)

