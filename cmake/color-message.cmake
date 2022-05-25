cmake_minimum_required(VERSION 3.18)
if(${CMAKE_VERSION} VERSION_LESS 3.18)
cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
else()
cmake_policy(VERSION 3.18)
endif()

if(NOT WIN32)
  string(ASCII 27 Esc)
  set(ColourReset "${Esc}[m")
  set(Bold	  "${Esc}[1m")
  set(Underscore  "${Esc}[4m")
  set(Red         "${Esc}[31m")
  set(Green       "${Esc}[32m")
  set(Yellow      "${Esc}[33m")
  set(Blue        "${Esc}[34m")
  set(Magenta     "${Esc}[35m")
  set(Cyan        "${Esc}[36m")
  set(White       "${Esc}[37m")
  set(BoldRed     "${Esc}[1;31m")
  set(BoldGreen   "${Esc}[1;32m")
  set(BoldYellow  "${Esc}[1;33m")
  set(BoldBlue    "${Esc}[1;34m")
  set(BoldMagenta "${Esc}[1;35m")
  set(BoldCyan    "${Esc}[1;36m")
  set(BoldWhite   "${Esc}[1;37m")
endif()

function(ColorMessage)
    list(GET ARGV 0 MessageType)
  if(MessageType STREQUAL FATAL_ERROR OR MessageType STREQUAL SEND_ERROR)
    list(REMOVE_AT ARGV 0)
    message(${MessageType} "${BoldRed}>> ${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL WARNING)
    list(REMOVE_AT ARGV 0)
    message(${MessageType} "${BoldYellow}>> ${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL AUTHOR_WARNING)
    list(REMOVE_AT ARGV 0)
    message(${MessageType} "${BoldCyan}>> ${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL STATUS)
    list(REMOVE_AT ARGV 0)
    message(${MessageType} "${Green}>> ${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL INFO)
    list(REMOVE_AT ARGV 0)
    message("-- ${BoldBlue}>> ${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL NOTICE)
    list(REMOVE_AT ARGV 0)
    message("-- ${Blue}>> ${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL IMPORTANT)
    list(REMOVE_AT ARGV 0)
    message("-- ${Yellow}>> ${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL MORE_IMPORTANT)
    list(REMOVE_AT ARGV 0)
    message("-- ${BoldYellow}>> ${ARGV}${ColourReset}")
  else()
    message(">> ${ARGV}")
  endif()
endfunction()
