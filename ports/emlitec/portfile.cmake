vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlitec
    REF v${VERSION}
    SHA512 b93ec66ef2edd9e281d8b4279d93feb874662246c5f3ebca2c3fb23fcc942ec1a65fc861894535bda0221e47c0f4f9b3b5853682931f5dc6cea02b2f5665cf4f
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