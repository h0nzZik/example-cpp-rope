mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
current_dir := $(dir $(mkfile_path))

ifeq ($(CC), )
   $(error The variable CC is not defined) 
endif

ifeq ($(CXX), )
   $(error The variable CXX is not defined) 
endif

ifeq ($(BUILDROOT), )
  $(error The variable BUILDROOT is not defined)
endif

SRCDIR=$(current_dir)
$(info SRCDIR $(SRCDIR))

.PHONY: default
default: all

.PHONY: all
all: tests

.PHONY: tests
tests: $(BUILDROOT)/run_tests

$(BUILDROOT)/run_tests: $(BUILDROOT)/rope.o $(BUILDROOT)/tests.o $(BUILDROOT)/test_main.o $(CFGDEPS)
	$(CXX) $(CXXFLAGS) $< -o $@

$(BUILDROOT)/%.o: $(SRCDIR)/%.cxx $(CFGDEPS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: clean
clean: $(CFGCLEAN)
	
