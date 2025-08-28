set(WASI_SDK "$ENV{WASI_SDK}")

if(NOT WASI_SDK)
    message(FATAL_ERROR "WASI_SDK not found")
endif()

if(NOT EXISTS "${WASI_SDK}/share/cmake/wasi-sdk-p2.cmake")
   message(FATAL_ERROR "wasi-sdk toolchain file not found")
endif()

set(VCPKG_TARGET_ARCHITECTURE wasm32)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CMAKE_SYSTEM_NAME WASI)
set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${WASI_SDK}/share/cmake/wasi-sdk-p2.cmake")