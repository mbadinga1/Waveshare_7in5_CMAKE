# set(SOURCES 
#     ImageData.c
#     )
# set(HEADERS 
#     ImageData.h
#     )

add_library(${LIB_IMAGE} SHARED ImageData.c ImageData.h)

# add_library(${LIB_IMAGE} SHARED ${SOURCES} ${HEADERS})
target_include_directories(${LIB_IMAGE} PUBLIC "./")