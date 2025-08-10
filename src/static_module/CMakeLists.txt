cmake_minimum_required(VERSION 3.20)

# 项目名 相当于设置全局变量PROJECT_NAME
project(staticlib)

# C++标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 静态库目标
file(GLOB STATIC_SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
add_library(${PROJECT_NAME} STATIC ${STATIC_SRC})
