# 目标操作系统
set(CMAKE_SYSTEM_NAME Android)
# Android API级别
set(CMAKE_SYSTEM_VERSION 21) # API level
# Android ABI（架构）。默认为armeabi、armeabi-v7a、arm64-v8a列表中第一个受支持的ABI
set(CMAKE_ANDROID_ARCH_ABI arm64-v8a)
# DNK编译器路径
set(CMAKE_ANDROID_NDK /Users/nagainn/Library/Android/sdk/ndk/22.1.7171670/ndk-build)
# C++标准库版本
set(CMAKE_ANDROID_STL_TYPE c++_static)