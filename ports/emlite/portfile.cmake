vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlite-cpp
    REF v${VERSION}
    SHA512 c53a3d20a18903acca0482d1f8abb6891cb159d2e1beb1c1a8c6e070e2647d7836af236f99e0b5bf8651669cd460f880fda2ac77a422fd870cf241992ebb43ab
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