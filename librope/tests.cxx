import rope;

//#include <catch2/catch_test_macros.hpp>
//#include <cstddef>
#include <doctest/doctest.h>


TEST_CASE("trivial") {
    REQUIRE(true);
}

TEST_CASE("rope_something") {
    REQUIRE(3 == rope_something());
}