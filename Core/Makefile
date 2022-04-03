#Assembler using main symbol
AS=nasm #Assembly compiler
ASFLAGS=-f elf64 -g #Assembly flags
LD=gcc -m64 -no-pie #Linker
LDFLAGS= #Linker flags
SOURCES=$(wildcard *.asm) #Sources
OBJECTS=$(SOURCES:.asm=.o) #Object files
EXECUTABLE=test #Program name

#Check version
all: $(SOURCES) $(EXECUTABLE)

#Create executable
$(EXECUTABLE): $(OBJECTS) 
	$(LD) $(LDFLAGS) $(OBJECTS) -o $@

#Compile assembly program
$(OBJECTS): $(SOURCES)
	$(AS) $(ASFLAGS) $(SOURCES)
 
#Clean folder
clean:
	rm -rf *o $(EXECUTABLE)
