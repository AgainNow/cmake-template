cmake_minimum_required(VERSION 3.20)

# set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/project/macos/toolchain.cmake")
# message(STATUS ${CMAKE_SOURCE_DIR}/project/macos/toolchain.cmake)

add_subdirectory(src/static_module)
add_subdirectory(src/shared_module)

# 项目名 相当于设置全局变量PROJECT_NAME
project(cmake-main)

# C++标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 引入常用第三方库，如boost（cmake v3.20+版本跨平台写法，库方自带BoostConfig.cmake或boost-config.cmake配置文件）
# 若安装到了自定义路径下，需要指定安装路径
# set(Boost_DIR "path/to/boost/lib/cmake/Boost-1.88.0")  # 设置配置文件所在目录
# set(BOOST_ROOT "/path/to/boost")  # 或设置Boost根目录
# 默认引入动态库，可指定静态库
# set(Boost_USE_STATIC_LIBS ON)
# 模块查找
find_package(Boost REQUIRED CONFIG COMPONENTS system)

# 引入非常用第三库
# 方案1：直接指定路径 include_directories()和link_libraries() / target_include_directories()和target_link_libraries()
# 方案2：（推荐）让库提供或自定义配置文件FindXXX.cmake，配合find_package()引入

# 引入源文件
file(GLOB SRC_FILES "src/*.cpp")
# 可执行文件编译
add_executable(${PROJECT_NAME} src/main.cpp ${SRC_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE include)
target_link_libraries(${PROJECT_NAME} PRIVATE Boost::system staticlib sharedlib)

add_subdirectory(tests)
