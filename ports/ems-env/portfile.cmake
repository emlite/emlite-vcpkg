vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO emlite/emlite_emscripten_adapter
    REF v${VERSION}
    SHA512 5247b7ef2a29784ac54c493908060463a57188fdd89461d405b4bcb80e543ffd071f77ddc4b46af26d35f4a9d402bd81be57d2b9528cd43e0dfd56962e536865
    HEAD_REF main
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_build()
vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME ems_env CONFIG_PATH "lib/cmake/ems_env")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")