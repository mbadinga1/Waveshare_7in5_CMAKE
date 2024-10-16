set(F_SOURCES GUI_BMPfile.c GUI_Paint.c)
# set(F_INCLUDES "GUI_BMPfile.h" "GUI_Paint.h")

add_library(${LIB_GUI} SHARED ${F_SOURCES})
target_link_libraries(${LIB_GUI} PRIVATE ${LIB_CONFIG})

target_include_directories(${LIB_GUI} PUBLIC "./")
# Link against the math library (libm)
target_link_libraries(${LIB_GUI} PUBLIC m)