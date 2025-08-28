vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmcbind
    REF v${VERSION}
    SHA512 601d8df3edf60a6f0b58a35ddfbb679f54331d176808aef03228d2347c5634877a35896060f24e9a51d5dc772f8f199ac1f7e534fce5bdb540033b842929263a
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
