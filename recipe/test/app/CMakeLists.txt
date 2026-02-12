cmake_minimum_required(VERSION 3.5)

project(app LANGUAGES CXX)

find_package(autodiff REQUIRED)

add_executable(app main.cpp)

target_link_libraries(app autodiff::autodiff)
