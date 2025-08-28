vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emcore
    REF v${VERSION}
    SHA512 4ba8446dfbffe4efc58292ab139af7319795126c61f1c5596bba7936507906178a663ce5efbdf617132141651e33b51da5fff0cd96f6ea20a5ecafdae36f77d0
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