cmake_minimum_required(VERSION 3.23)
project(
    BIM_Project
    VERSION 1.0.0
    DESCRIPTION "Test"
    LANGUAGES C CXX
)
# set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_CXX_EXTENSIONS OFF)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)

#for macro
add_definitions(-DRPI)
add_definitions(-DDEBUG)

set(EXEC_NAME Executable)
set(LIB_CONFIG DebugConfigHard)
set(LIB_GUI GuiConversion)
set(LIB_FONT Font)
set(LIB_IMAGE LibraryImage)
set(LIB_EPD7in5 Library)

add_subdirectory(lib)
add_subdirectory(app)
