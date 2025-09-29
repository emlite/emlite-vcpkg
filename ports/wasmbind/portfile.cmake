vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmbind
    REF v${VERSION}
    SHA512 e3f64c2004b05a931628b167a2112b98f619bf2c215b6488150a65c2b5a12fc25dfb22d31e4b9e2115b1624dbaea8ce6e9d6078f9d4506c130c1b0a7acb74ce5
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
