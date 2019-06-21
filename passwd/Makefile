.PHONY: select Linux OSX 

all: select

select:
	@echo "are you running on (L)inux or (O)SX \n "; \
    read os; \
	make $$os 

Linux:
	@echo "whats the lenght of your password? eg 12, 16, 20, 24, 32 \n "; \
	read lenght && date +%s | sha256sum | base64 | head -c $$lenght ; echo

OSX: 
	@echo "whats the lenght of your password? eg 12, 24, 32, 64, 128 etc \n "; \
	read lenght && date +%s | shasum -a 256| base64 | head -c $$lenght ; echo

L: Linux
l: Linux

O: OSX  
o: OSX 