#include <catch2/catch.hpp>

import rope;

//import <catch2/catch_test_macros.hpp>
//import <catch2/catch_all.hpp>;
//#include <catch2/catch_all.hpp>

//#include <catch2/catch_all.hpp>
//#include <cstddef>
//#include <doctest/doctest.h>
//#include <iostream>


TEST_CASE("trivial") {
    REQUIRE(true);
}



TEST_CASE("rope_something") {
    REQUIRE(3 == rope_something());
}

