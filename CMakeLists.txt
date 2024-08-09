cmake_minimum_required(VERSION 3.20)

project(BeautyUI VERSION 1.0)

if (MSVC)
    #让Release也生成pdb文件
    set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} /DEBUG /OPT:REF /OPT:ICF")
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /DEBUG /OPT:REF /OPT:ICF")
endif ()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/.cmake/)

include(GetGitRevisionDescription)

option(BEAUTYUI_BUILD_EXAMPLES "Build Beauty demo applications." ON)
option(BEAUTYUI_BUILD_STATIC_LIB "Build static library." OFF)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core)

add_subdirectory(src)

#Release也支持日志打印代码位置
target_compile_definitions(beautyuiplugin
        PRIVATE
        QT_MESSAGELOGCONTEXT
)

if (BEAUTYUI_BUILD_EXAMPLES)
    add_subdirectory(example)
endif ()

message("------------------------ BeautyUI ------------------------")
message("Build BeautyUI demo applications.: ${BEAUTYUI_BUILD_EXAMPLES}")
message("Build static library.: ${BEAUTYUI_BUILD_STATIC_LIB}")
message("Path to BeautyUI plugin.: ${BEAUTYUI_QML_PLUGIN_DIRECTORY}")
