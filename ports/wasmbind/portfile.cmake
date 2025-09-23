vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmbind
    REF v${VERSION}
    SHA512 a24454850b159ba185ff82b13edd8878c71cf91fd0cb7ec9b18804dc651a44ef18ca3f567d53a146f9e0535f18d16724668f2dbcd8f1cb3dd1b347f73eb42dea
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
