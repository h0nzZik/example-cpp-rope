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

$(BUILDROOT)/run_tests: $(BUILDROOT)/test_main.o $(BUILDROOT)/test_rope.o $(BUILDROOT)/rope.o $(CFGDEPS) #$(BUILDROOT)/rope.pcm 
	$(CXX) $(CXXFLAGS) -o $@ $^ # $(SYSMODULESFLAGS) $(LDFLAGS)  
#	$(CXX) $(CXXFLAGS) -o $@ $^ -lCatch2Main -lCatch2 --verbose $(LDFLAGS) # $(SYSMODULESFLAGS) $(LDFLAGS) #-fmodule-file=$(BUILDROOT)/rope.pcm  


$(BUILDROOT)/test_%.o: $(SRCDIR)/test_%.cxx $(CFGDEPS) $(BUILDROOT)/rope.pcm 
	$(CXX) $(CXXFLAGS) -c $< $(SYSMODULESFLAGS) -o $@ -fmodule-file=rope=$(BUILDROOT)/rope.pcm 

$(BUILDROOT)/%.pcm: $(SRCDIR)/%.cxxm $(CFGDEPS)
	$(CXX) $(CXXFLAGS) $(MCXXFLAGS) -c $< $(SYSMODULESFLAGS) -o $@

$(BUILDROOT)/rope.o: $(BUILDROOT)/rope.pcm
	mkdir -p $(shell dirname $@)
	$(CXX) $(CXXFLAGS) -o $@ -c $< 


.PHONY: clean
clean: $(CFGCLEAN)
	
