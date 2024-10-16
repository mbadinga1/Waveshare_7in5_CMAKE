add_subdirectory(ImageData)
set(F_SOURCES EPD_Test.c EPD_7in5_V2.c)
set(F_INCLUDES EPD_7in5_V2.h EPD_Test.h)

add_library(${LIB_EPD7in5} STATIC ${F_SOURCES} ${F_INCLUDES})
target_link_libraries(${LIB_EPD7in5} PRIVATE ${LIB_IMAGE} ${LIB_GUI} ${LIB_CONFIG} ${LIB_FONT})

target_include_directories(${LIB_EPD7in5} PUBLIC "./")
