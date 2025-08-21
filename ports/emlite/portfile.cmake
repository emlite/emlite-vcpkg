vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlite-cpp
    REF v${VERSION}
    SHA512 dcf668b62df3f5b201aad0098f5bcb4f83e5f8dd942650f9c0e9cefd90de645e2ef088104645d6d4d9d7667455190fad2737561f5902085d6d180f47670b9951
    HEAD_REF main
)

set(EMLITE_CLIB_ONLY OFF)
if("capi" IN_LIST FEATURES)
    set(EMLITE_CLIB_ONLY ON)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DEMLITE_CLIB_ONLY=${EMLITE_CLIB_ONLY}
        -DEMLITE_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME emlite CONFIG_PATH "lib/cmake/emlite")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")