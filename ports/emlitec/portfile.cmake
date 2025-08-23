vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlitec
    REF v${VERSION}
    SHA512 88cb5bf2f87caa782de048cee2129efe68c19b0913aeace38b45a34f1af5010b5f0b5d9205ddb4ef3a49aa5552cd3664d1a2f17356c81d1cf0b741cbe3f764c0
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DEMLITEC_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME emlitec CONFIG_PATH "lib/cmake/emlitec")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")