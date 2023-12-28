ifeq ($(BUILDROOT), )
  $(error The variable BUILDROOT is not defined)
endif

CC=clang
CXX=clang++
CXXFLAGS=-std=c++23
CXXFLAGS+=-Wall -Wextra
MCXXFLAGS=--precompile
MODULE_ARG=-fmodule-file=$(1)=$(2)
PCM_O_DEPENDENCY=$(1)

include ../../librope/Makefile


.PHONY: check
check:
	clang-tidy $(SRCDIR)/*.cxxm -checks=cppcoreguidelines-\* -- $(CXXFLAGS)


