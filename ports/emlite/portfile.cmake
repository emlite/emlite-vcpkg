vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlite-cpp
    REF v${VERSION}
    SHA512 ceb176cc606a67b93e9166700b8fca6d11cff8cad64bc357ddd2598874e9f418284510f43e428a19d3ceea9979dcb592be10a65933cfc6a7e98dae60a7b959c2
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