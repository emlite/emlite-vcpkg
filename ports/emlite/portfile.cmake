vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlite-cpp
    REF v${VERSION}
    SHA512 7cb88f4408faec473a993945f975d89c80fed9489c8c95d6224b914c080cb18b7c4f94b66376387402bf7ab4e1f4bd743964a499aea3f0d1387d0599eee0aa89
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