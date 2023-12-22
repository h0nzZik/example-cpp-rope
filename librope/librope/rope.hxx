#pragma once

#include <iosfwd>
#include <string>

#include <librope/export.hxx>

namespace rope
{
  // Print a greeting for the specified name into the specified
  // stream. Throw std::invalid_argument if the name is empty.
  //
  LIBROPE_SYMEXPORT void
  say_hello (std::ostream&, const std::string& name);
}
