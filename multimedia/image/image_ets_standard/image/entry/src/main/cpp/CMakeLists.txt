cmake_minimum_required(VERSION 3.5.0)
project(ImageCreatorConsumerTest)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(TASK_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../..")

add_library(entry SHARED image_creator_consumer.cpp)

target_include_directories(entry PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/vendor/c_utils")

target_link_libraries(entry PUBLIC libace_napi.z.so)
