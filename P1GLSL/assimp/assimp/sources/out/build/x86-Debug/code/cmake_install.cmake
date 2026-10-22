# Install script for directory: D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/out/install/x86-Debug")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/out/build/x86-Debug/code/assimp-vc142-mtd.lib")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/out/build/x86-Debug/code/assimp-vc142-mtd.dll")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xassimp-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/assimp" TYPE FILE FILES
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/anim.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/aabb.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/ai_assert.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/camera.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/color4.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/color4.inl"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/out/build/x86-Debug/code/../include/assimp/config.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/defs.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Defines.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/cfileio.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/light.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/material.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/material.inl"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/matrix3x3.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/matrix3x3.inl"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/matrix4x4.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/matrix4x4.inl"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/mesh.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/pbrmaterial.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/postprocess.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/quaternion.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/quaternion.inl"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/scene.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/metadata.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/texture.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/types.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/vector2.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/vector2.inl"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/vector3.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/vector3.inl"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/version.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/cimport.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/importerdesc.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Importer.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/DefaultLogger.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/ProgressHandler.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/IOStream.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/IOSystem.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Logger.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/LogStream.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/NullLogger.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/cexport.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Exporter.hpp"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/DefaultIOStream.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/DefaultIOSystem.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/ZipArchiveIOSystem.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/SceneCombiner.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/fast_atof.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/qnan.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/BaseImporter.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Hash.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/MemoryIOWrapper.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/ParsingUtils.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/StreamReader.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/StreamWriter.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/StringComparison.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/StringUtils.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/SGSpatialSort.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/GenericProperty.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/SpatialSort.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/SkeletonMeshBuilder.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/SmoothingGroups.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/SmoothingGroups.inl"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/StandardShapes.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/RemoveComments.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Subdivision.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Vertex.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/LineSplitter.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/TinyFormatter.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Profiler.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/LogAux.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Bitmap.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/XMLTools.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/IOStreamBuffer.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/CreateAnimMesh.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/irrXMLWrapper.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/BlobIOSystem.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/MathFunctions.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Macros.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Exceptional.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/ByteSwapper.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xassimp-devx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/assimp/Compiler" TYPE FILE FILES
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Compiler/pushpack1.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Compiler/poppack1.h"
    "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/code/../include/assimp/Compiler/pstdint.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/out/build/x86-Debug/code/assimp-vc142-mtd.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES "D:/Users/Pablo/Desktop/P1/Visual2019/Assimp/Sources/out/build/x86-Debug/code/assimp-vc142-mt.pdb")
  endif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
endif()

