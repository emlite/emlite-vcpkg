vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emcore
    REF v${VERSION}
    SHA512 40ef522f306888a62ec13c51d7c615df31d3136e081c8d628e2aa3fff021a154ab7fd2e628a41c72c6585e8cad3c1043243feb3b9a039221dc730472582b1430
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