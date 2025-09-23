vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlite-cpp
    REF v${VERSION}
    SHA512 31e53f9dc5bdd5b70d9ebf2ed4d777f24467b8bdaeb508d6b8fcda9f93e4fc0bf0e8920787b51e255cf5221111bd65c97ab25c0124f57ca8af1b66306c9f0e57
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DEMLITE_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME emlite CONFIG_PATH "lib/cmake/emlite")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")