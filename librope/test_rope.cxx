#include <catch2/catch.hpp>

import rope;


TEST_CASE("trivial") {
    REQUIRE(true);
}

#if defined(__GNUC__) && !defined(__clang__)
    // The compilation crashes with g++ (GCC) 13.2.0
    #warning("Compiling with GCC, disabling some tests due to bugs in GCC's RTL pass")
#else

TEST_CASE("simple conversions") {
    auto const simple_conversion_property = [](std::string s) {
        REQUIRE(std::string(Rope(s)) == s);
    };

    simple_conversion_property(std::string("I am a string!"));
}

#endif

TEST_CASE("rope_something") {
    REQUIRE(3 == rope_something());
}

