BUILDDIR:=$(shell pwd)/bin
TARGET:=x86/linux
CC:=$(CC) -m32
CFLAGS:=$(CFLAGS) -DLCCDIR='"$(BUILDDIR)/"'
HOSTFILE:=etc/linux.c

custom:
	rm -rvf ${BUILDDIR}
	mkdir -vp ${BUILDDIR}/include
	ln -vsf $$(pwd)/include/x86/linux/* ${BUILDDIR}/include
	mkdir -vp ${BUILDDIR}/gcc
	ln -vs $$(which cpp) ${BUILDDIR}/gcc/cpp
	ln -vs /usr/lib/gcc/x86_64-linux-gnu/13/32/crtbegin.o ${BUILDDIR}/gcc
	ln -vs /usr/lib/gcc/x86_64-linux-gnu/13/32/crtend.o ${BUILDDIR}/gcc
	ln -vs /usr/lib/gcc/x86_64-linux-gnu/13/32/libgcc.a ${BUILDDIR}/gcc
	make clean all test triple
