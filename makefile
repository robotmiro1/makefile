all: crane server client reader clean

crane_server: crane server clean

crane_interface: client reader clean

crane: crane.o cranelib.o
	gcc $^ -g -o $@
server: server.o cranelib.o
	gcc $^ -g -o $@
client: client.o cranelib.o
	gcc $^ -g -o $@
reader: reader.o cranelib.o
	gcc $^ -g -o $@

crane.o: crane.c
	gcc -c $<
server.o: server.c
	gcc -c $<
client.o: main.c
	gcc -c $<
reader.o: reader.c
	gcc -c $<
	
crane.o: cranelib.c cranelib.h
	gcc -c $<

.PHONY: clean

clean:
	rm -f crane.o
	rm -f server.o
	rm -f client.o
	rm -f reader.o
	rm -f cranelib.o
