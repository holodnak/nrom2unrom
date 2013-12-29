# Makefile for loader

TARGET = loader.bin
SOURCE = loader.s
OBJECT = $(patsubst %.s,%.o,$(SOURCE))

AS = wla-6502
LD = wlalink

ASFLAGS =
LDFLAGS = -d linkfile

$(TARGET): $(OBJECT)
	$(LD) $(LDFLAGS) $@

all: $(TARGET)

clean:
	rm -f $(OBJECT) $(TARGET) $(OUTPUT)

.SUFFIXES: .s

.s.o:
	$(AS) -$(ASFLAGS)o $< $@

.PHONY: all clean
