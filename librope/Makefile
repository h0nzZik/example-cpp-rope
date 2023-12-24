ifeq ($(CC), )
   $(error The variable CC is not defined) 
endif

ifeq ($(CXX), )
   $(error The variable CXX is not defined) 
endif

ifeq ($(BUILDROOT), )
  $(error The variable BUILDROOT is not defined)
endif

SRCDIR=.

$(BUILDROOT)/%.o: $(SRCDIR)/%.cxx
	$(CXX) $(CXXFLAGS) $< -o $@


