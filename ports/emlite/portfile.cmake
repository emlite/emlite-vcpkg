vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlite-cpp
    REF v${VERSION}
    SHA512 d2229000d5f02778918cb9a9160d365e3d424b57da7ed2f442ab1cc9d957b873372066a1ca8a62efc7d10406d7f1408e125fe6dd87d356391572371d79af81da
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