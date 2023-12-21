cmake_minimum_required(VERSION 3.27.0)

project(example-cpp-rope LANGUAGES CXX)

add_executable(helloworld
	hello.cpp
)

add_executable(tests
	tests_main.cpp
	tests.cpp
)

target_link_libraries( tests Catch2)