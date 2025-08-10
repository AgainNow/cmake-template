cmake_minimum_required(VERSION 3.20)

# set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/project/macos/toolchain.cmake")
# message(STATUS ${CMAKE_SOURCE_DIR}/project/macos/toolchain.cmake)

add_subdirectory(src/static_module)
add_subdirectory(src/shared_module)

# 项目名 相当于设置全局变量PROJECT_NAME
project(cmake-test)

# C++标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 引入三方库
# cmake v3.20+版本跨平台引入boost写法
find_package(Boost REQUIRED CONFIG COMPONENTS system)

set(EXE_NAME cmake-main)
# 引入源文件
file(GLOB SRC_FILES "src/*.cpp")
# 可执行文件编译
add_executable(${EXE_NAME} src/main.cpp ${SRC_FILES})
target_include_directories(${EXE_NAME} PRIVATE include)
target_link_libraries(${EXE_NAME} PRIVATE Boost::system staticlib sharedlib)

########
set(EXE_NAME cmake-main2)
# 可执行文件编译
add_executable(${EXE_NAME} src/main.cpp ${SRC_FILES})
target_include_directories(${EXE_NAME} PRIVATE include)
target_link_libraries(${EXE_NAME} PRIVATE Boost::system staticlib sharedlib)
