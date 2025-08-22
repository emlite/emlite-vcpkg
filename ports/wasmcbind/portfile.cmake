vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmcbind
    REF v${VERSION}
    SHA512 2cb6754ea1ee94963571eb088133612a6042a43de8f62158ca29ca12f4a6116b2f28f93a248b31cafa8234ad20b2c8e8fa9535239a57179535a24cb80f8822f8
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
