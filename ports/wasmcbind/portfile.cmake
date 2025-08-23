vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmcbind
    REF v${VERSION}
    SHA512 426d99a8777c7354ab2d2683ce7d0d4d5a83688014ba4bc62e05648ab966cd6863fa5e11c4bec0b347503980fcb4ad385cdc55ad2f5e8869860e0eedfceb9d00
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
