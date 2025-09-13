vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emcore
    REF v${VERSION}
    SHA512 99afa5727bf67fc9fd5257f14d66ab6373f182d66cf477564f5f887de6d9497067b922438931cde00c6ad41e3c5a911bc596465141f43849755e6ebb43097f0f
    HEAD_REF main
)


set(EMLITE_USE_DLMALLOC OFF)
if("dlmalloc" IN_LIST FEATURES)
    set(EMLITE_USE_DLMALLOC ON)
endif()


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DEMLITE_USE_DLMALLOC=${EMLITE_USE_DLMALLOC}
)

vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME emcore CONFIG_PATH "lib/cmake/emcore")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")