cmake_minimum_required(VERSION 3.20)

# 项目名 相当于设置全局变量PROJECT_NAME
project(cmake-test)

# C++标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 引入常用第三方库
find_package(Boost REQUIRED CONFIG COMPONENTS system)

# 引入源文件
file(GLOB TESTS_FILES "${CMAKE_SOURCE_DIR}/tests/*.cpp")
# 可执行文件编译
add_executable(${PROJECT_NAME} ${TESTS_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE include)
target_link_libraries(${PROJECT_NAME} PRIVATE Boost::system staticlib sharedlib)
