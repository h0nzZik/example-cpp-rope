ifeq ($(BUILDROOT), )
  $(error The variable BUILDROOT is not defined)
endif

CC=gcc
CXX=g++
CXXFLAGS=-std=c++20 -fmodules-ts
CXXFLAGS+=-Wall -Wextra -pedantic


CFGDEPS=$(BUILDROOT)/gcm.cache
CFGCLEAN=cfgclean

include ../../librope/Makefile

$(BUILDROOT)/gcm.cache:
	mkdir -p $(shell dirname $@); pushd $(shell dirname $@); $(CXX) $(CXXFLAGS) \
	  -xc++-system-header iostream \
	  -xc++-system-header variant \
	  -xc++-system-header memory \
	  -xc++-system-header string


.PHONY: cfgclean
cfgclean:
	rm -rf gcm.cache
