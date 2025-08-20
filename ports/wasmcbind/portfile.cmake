vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmcbind
    REF v${VERSION}
    SHA512 918353b37449b00021fe896fc3744ae0eb3c4f14b4ad72aaa939b132cb424f587c53e658dce173dff317f4da8a2c5bd726bfecb8a2cafce5cb6666ae78cca9c9
    HEAD_REF main
)

set(WASMCBIND_BUILD_WEBBIND OFF)
if("webbind" IN_LIST FEATURES)
    set(WASMCBIND_BUILD_WEBBIND ON)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DWASMCBIND_BUILD_WEBBIND=${WASMCBIND_BUILD_WEBBIND}
        -DWASMCBIND_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME wasmcbind CONFIG_PATH "lib/cmake/wasmcbind")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
