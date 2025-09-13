vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlitec
    REF v${VERSION}
    SHA512 d6029a1b9a28c3ee3e3c2be63c3901cd11ef2130927d1a91cdfaec2fc69b97e8daab255fc366c6a072290ed4679c211860e085163d67291963aab38e9732304c
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