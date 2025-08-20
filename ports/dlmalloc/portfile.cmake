vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/dlmalloc
    REF v${VERSION}
    SHA512 efe0727ea1086c897e615a0b86c398e90014b9d61e374e5759605886c13e29c63add1fd1f7f24e79fe23ae60a627b06c7ac819f0e418d40c9273c2c55e425014
    HEAD_REF main
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME dlmalloc CONFIG_PATH "lib/cmake/dlmalloc")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")