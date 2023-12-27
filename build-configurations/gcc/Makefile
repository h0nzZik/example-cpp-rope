ifeq ($(BUILDROOT), )
  $(error The variable BUILDROOT is not defined)
endif

CC=gcc
CXX=g++
CXXFLAGS=-std=gnu++20 -fmodules-ts
CXXFLAGS+=-Wall -Wextra
MCXXFLAGS=-x c++
MODULE_ARG=
#MODULE_ARG=$(1)
PCM_O_DEPENDENCY=$(1).o

include ../../librope/Makefile
