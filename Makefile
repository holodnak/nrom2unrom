# Makefile for loader

TARGET = nrom2unrom 
SOURCE = nrom2unrom.c 
OBJECT = $(patsubst %.c,%.o,$(SOURCE))

CC = gcc 
LD = gcc 

CFLAGS = -O2
LDFLAGS = -s

$(TARGET): $(OBJECT)
	$(LD) $(LDFLAGS) $< -o $@

all: $(TARGET)

clean:
	rm -f $(OBJECT) $(TARGET) $(OUTPUT)

.SUFFIXES: .c

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: all clean

