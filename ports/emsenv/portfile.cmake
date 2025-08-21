vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emsenv
    REF v${VERSION}
    SHA512 2206f03976e5cbc673ce6925c60f0ff70014ab4763688d18404e536615e7c98e64f901774bf61f4c4ece1267749d062103ba57ba8d85e6dac6cc26333dba43f7
    HEAD_REF main
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME emsenv CONFIG_PATH "lib/cmake/emsenv")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")