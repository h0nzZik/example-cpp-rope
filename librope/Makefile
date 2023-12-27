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

$(BUILDROOT)/run_tests: $(BUILDROOT)/test_main.o $(BUILDROOT)/test_rope.o $(call PCM_O_DEPENDENCY,$(BUILDROOT)/rope.pcm)
# NOTE: when updating the Catch2 library to v3, one needs to specify `-lCatch2Main -lCatch2` there
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)    


$(BUILDROOT)/test_%.o: $(SRCDIR)/test_%.cxx $(BUILDROOT)/rope.pcm 
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(call MODULE_ARG,rope,$(BUILDROOT)/rope.pcm)

$(BUILDROOT)/%.pcm: $(SRCDIR)/%.cxxm
	$(CXX) $(CXXFLAGS) $(MCXXFLAGS) -c $< -o $@

$(BUILDROOT)/rope.pcm.o: $(BUILDROOT)/rope.pcm
	mkdir -p $(shell dirname $@)
	cp $< $@
	#$(CXX) $(CXXFLAGS) -o $@ -c $< 


.PHONY: clean
clean: $(CFGCLEAN)
	
