vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmbind
    REF v${VERSION}
    SHA512 39d7f546db7a7b4d8abd4ea20bd87933da7e8a75fcaf889d90f948bb995e6d7caa70fa9dd951fe7f073456a01900e1a6313f20ce937efe2036970f676d695885
    HEAD_REF main
)

set(WASMBIND_BUILD_WEBBIND OFF)
if("webbind" IN_LIST FEATURES)
    set(WASMBIND_BUILD_WEBBIND ON)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DWASMBIND_BUILD_WEBBIND=${WASMBIND_BUILD_WEBBIND}
        -DWASMBIND_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME wasmbind CONFIG_PATH "lib/cmake/wasmbind")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
