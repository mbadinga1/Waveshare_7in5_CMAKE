set(SOURCES 
    font8.c
    font12.c
    font12CN.c
    font16.c
    font20.c
    font24.c
    font24CN.c
    )
set(HEADERS fonts.h)

add_library(${LIB_FONT} SHARED ${SOURCES} ${HEADERS})
target_include_directories(${LIB_FONT} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})