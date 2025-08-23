vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/wasmbind
    REF v${VERSION}
    SHA512 fd9bd4eb37842310ae68880c194d95487a36854c0320dce02128934b2e87661b20bdead24146e7203bb89939822ace798a75747da8f9847b6200cc62438c28a4
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
