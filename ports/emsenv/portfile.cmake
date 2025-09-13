vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emsenv
    REF v${VERSION}
    SHA512 4f3736be2a7e0f826883aaf52c3bbd56b842a552e7c8d9069374189767d297ff7e805508df0443a6d73759b2701a43ed6e59e8353f23338ed0ea4f41bd65441f
    HEAD_REF main
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME emsenv CONFIG_PATH "lib/cmake/emsenv")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")