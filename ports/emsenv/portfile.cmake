vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emsenv
    REF v${VERSION}
    SHA512 7749385394bf85cd3e48cc3d0f291e58899d4ca6ae68cde77b276c62cad8ff324efc3b0d562c37433d136586977f70ca8411c371446d4bd4a7567905e70819d6
    HEAD_REF main
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME emsenv CONFIG_PATH "lib/cmake/emsenv")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")