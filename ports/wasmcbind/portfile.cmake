vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmcbind
    REF v${VERSION}
    SHA512 3e19b846b521549cc3a7772f40dea5113c5d0fd8f5cf9a54c9351cc7a4e3cf0b6435a8667996db21e29bb46a86f5c8b29e9a469bcd4c0303bee5dba57e727dc3
    HEAD_REF main
)

set(WASMCBIND_BUILD_WEBCBIND OFF)
if("webcbind" IN_LIST FEATURES)
    set(WASMCBIND_BUILD_WEBCBIND ON)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DWASMCBIND_BUILD_WEBCBIND=${WASMCBIND_BUILD_WEBCBIND}
        -DWASMCBIND_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME wasmcbind CONFIG_PATH "lib/cmake/wasmcbind")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
