cmake_minimum_required(VERSION 2.8)
project(yacTest)



set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 ")

#flex et bison
include(FindFLEX)
include(FindBISON)


BISON_TARGET(YACParser "${CMAKE_SOURCE_DIR}/yacparser.y" "${CMAKE_CURRENT_BINARY_DIR}/YACParser.cpp" COMPILE_FLAGS "-d -v -y")
FLEX_TARGET(YACLexer "${CMAKE_SOURCE_DIR}/yaclexer.l" "${CMAKE_CURRENT_BINARY_DIR}/YACLexer.cpp")


ADD_FLEX_BISON_DEPENDENCY(YACLexer YACParser)
include_directories(${CMAKE_CURRENT_BINARY_DIR})



add_executable(yactest
    ${BISON_YACParser_OUTPUTS}
    ${FLEX_YACLexer_OUTPUTS}
    main.cpp
    )

