vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmbind
    REF v${VERSION}
    SHA512 1c3cf27ee4a29f174005f20088a6ae01c15150700a83e96fe831453acdf6f36606c3cc41f74a7007dcb02e2ab44828cd0f6d4fa8f29ca67af61e7cb0703aa5c1
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
