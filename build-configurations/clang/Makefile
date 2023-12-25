ifeq ($(BUILDROOT), )
  $(error The variable BUILDROOT is not defined)
endif

CC=clang
CXX=clang++
CXXFLAGS=-std=c++23
CXXFLAGS+=-Wall -Wextra
MCXXFLAGS=--precompile


#STDLIB_MODULES:=iostream variant memory string
#CFGDEPS:=$(foreach m,$(STDLIB_MODULES),$(BUILDROOT)/system/$(m).pcm) $(BUILDROOT)/system/catch2/catch_all.pcm

CFGCLEAN:=cfgclean

# https://releases.llvm.org/17.0.1/tools/clang/docs/StandardCPlusPlusModules.html#id4
# == How to specify the dependent BMIs ==
# We could use -fmodule-file to specify the BMIs, and this option may occur multiple times as well.
# With the existing implementation -fprebuilt-module-path cannot be used for header units (since they are nominally anonymous).
# For header units, use -fmodule-file to include the relevant PCM file for each header unit.
# This is expect to be solved in future editions of the compiler either by the tooling finding and specifying the -fmodule-file
# or by the use of a module-mapper that understands how to map the header name to their PCMs.

#STDLIBMODULESFLAGS:=$(foreach m,$(STDLIB_MODULES),-fmodule-file=$(BUILDROOT)/system/$(m).pcm)
#STDLIBMODULESFLAGS:=$(foreach m,$(STDLIB_MODULES),-fmodule-file=$(m)=$(BUILDROOT)/system/$(m).pcm)
#LIBSMODULEFLAGS:=-fmodule-file=catch2/catch_all.hpp=$(BUILDROOT)/system/catch2/catch_all.pcm
#LIBSMODULEFLAGS:=-fmodule-file=$(BUILDROOT)/system/catch2/catch_all.pcm
#STDLIBMODULESFLAGS:=-fimplicit-modules -fimplicit-module-maps
SYSMODULESFLAGS:=$(LIBSMODULEFLAGS) $(STDLIBMODULESFLAGS)
#CFGDEPS=$(BUILDROOT)/system/catch2/catch_all.pcm
#$(info $(SYSMODULESFLAGS))

include ../../librope/Makefile

$(BUILDROOT)/gcm.cache: $(BUILDROOT)/std.pcm

#$(BUILDROOT)/%.pcm.o: $(BUILDROOT)/%.pcm
#	mkdir -p $(shell dirname $@)
#	$(CXX) $(CXXFLAGS) -o $@ -c -fmodule-file=$< 

$(BUILDROOT)/system/%.pcm:
	mkdir -p $(shell dirname $@)
	$(CXX) $(CXXFLAGS) --precompile -fmodule-header=system -xc++-header $* -o $@

$(BUILDROOT)/system/catch2/%.pcm:
	mkdir -p $(shell dirname $@)
	$(CXX) $(CXXFLAGS) --precompile -fmodule-header=system -xc++-header catch2/$*.hpp -o $@

.PHONY: cfgclean
cfgclean:
	rm -rf $(CFGDEPS)
