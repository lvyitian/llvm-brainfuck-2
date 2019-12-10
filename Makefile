CC=clang
CFLAGS=-c -Wall
LDFLAGS=-lLLVM
SOURCES=main.cpp \
    BFCompiler.cpp \
    BFIncrement.cpp \
    BFReed.cpp \
    BFWrite.cpp \
    BFDataIncrement.cpp \
    BFLoop.cpp

OBJECTS=$(SOURCES:.cpp=.o)

EXECUTABLE=bfc

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf *.o *.ll *.bc $(EXECUTABLE)