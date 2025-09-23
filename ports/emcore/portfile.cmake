vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emcore
    REF v${VERSION}
    SHA512 5533e101f431d400a6f214505fedb2e027e791bd695c3350ecd5b7afa45befebed18f0dedfdfac7ee3d160127fdcfa960748227f08ba4a573f62a02906a9edd7
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