all:
	gcc -I. -I./breakpad/include/ -g3 -O0 -c test.cpp breakpad.cpp
	ar cr libtest.a test.o breakpad.o
	go build -gcflags=all="-N -l" main.go
	go build -o main2 -gcflags=all="-N -l" except_handle.go breakpad.go main2.go

godump:
	./main > 1.log 2>&1

cdump:
	env GOTRACEBACK=crash ./main

clean:
	rm -f *.o main main2 libtest.a core *.log

cmain:
	gcc -I. -g3 -O0 test.cpp main.cpp -o main


