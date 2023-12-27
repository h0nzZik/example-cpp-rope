ifeq ($(BUILDROOT), )
  $(error The variable BUILDROOT is not defined)
endif

CC=gcc
CXX=g++
CXXFLAGS=-std=gnu++23 -fmodules-ts
CXXFLAGS+=-Wall -Wextra
MCXXFLAGS=-x c++
MODULE_ARG=
PCM_O_DEPENDENCY=$(1).o

include ../../librope/Makefile

$(BUILDROOT)/%.pcm.o: $(BUILDROOT)/%.pcm
	mkdir -p $(shell dirname $@)
	cp $< $@
