vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emcore
    REF v${VERSION}
    SHA512 1b660fbea4b2bc22d18982c21fccfe594be509d7e13f7c2b65b1b0081650ded0d34ca5c83846aac48fe838b9a068757822c1467d968293242b628e96ae8d49a7
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