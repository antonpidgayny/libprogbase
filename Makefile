LIBVERSION=0.1.5
CC=gcc
LOCALDIR=/usr/local

repo:
	@git remote -v

version:
	@echo "libprogbase "$(LIBVERSION)

git-pull:
	@echo "Updating libprogbase..."
	@git pull origin master

update: git-pull install

install: headers libprogbase

headers:
	@echo "Copying headers to" $(LOCALDIR)/include/
	@ls include/*.h
	@sudo cp include/*.h $(LOCALDIR)/include/

libprogbase:
	@echo "Building library" $@.a
	@gcc -c src/*.c -Iinclude
	@ar rcs $@.a *.o
	@echo "Copying library" $@.a "to" $(LOCALDIR)/lib/
	@sudo mv $@.a $(LOCALDIR)/lib/$@.a
	@echo "Cleaning up"
	@rm *.o

build:
	@gcc -c src/*.c -Iinclude
	@ar rcs $@.a *.o

clean:
	@rm *.o
