if(NOT HOST STREQUAL "")
  set(CMAKE_CROSSCOMPILING ON)
  set(CMAKE_SYSTEM_NAME Linux)

  find_program(C_COMPILER ${HOST}-gcc)
  if(C_COMPILER STREQUAL "C_COMPILER-NOTFOUND")
    find_program(C_COMPILER ${HOST}-clang)
  endif()
  set(CMAKE_C_COMPILER "${C_COMPILER}")
  if(CMAKE_C_COMPILER MATCHES "NOTFOUND")
    message(FATAL_ERROR "Can't deduce CMAKE_C_COMPILER from HOST, define it manually")
  endif()
  message(STATUS "Using CMAKE_C_COMPILER - ${CMAKE_C_COMPILER}")

  find_program(CXX_COMPILER ${HOST}-g++)
  if(CXX_COMPILER STREQUAL "CXX_COMPILER-NOTFOUND")
    find_program(CXX_COMPILER ${HOST}-clang++)
  endif()
  set(CMAKE_CXX_COMPILER "${CXX_COMPILER}")
  if(CMAKE_CXX_COMPILER MATCHES "NOTFOUND")
    message(FATAL_ERROR "Can't deduce CMAKE_CXX_COMPILER from HOST, define it manually")
  endif()
  message(STATUS "Using CMAKE_CXX_COMPILER - ${CMAKE_CXX_COMPILER}")

  find_program(CMAKE_AR ${HOST}-ar)
  if(CMAKE_AR MATCHES "NOTFOUND")
    message(FATAL_ERROR "Can't detect CMAKE_AR from HOST, define it manually")
  endif()
  message(STATUS "Using CMAKE_AR - ${CMAKE_AR}")

  find_program(CMAKE_RANLIB ${HOST}-ranlib)
  if(CMAKE_RANLIB MATCHES "NOTFOUND")
    message(FATAL_ERROR "Can't detect CMAKE_RANLIB from HOST, define it manually")
  endif()
  message(STATUS "Using CMAKE_RANLIB - ${CMAKE_RANLIB}")
endif()
