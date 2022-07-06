cmake_minimum_required(VERSION 3.5)

project(PhoneBook LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(PhoneBook main.cpp)

# Local header files here ONLY
SET (TARGET_H
    filter.h
)

# Local source files here
SET (TARGET_SRC
    filter.cpp
    contact.cpp
)

