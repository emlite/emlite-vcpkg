# emlite-vcpkg

A custom vcpkg registry for emlite projects, which allows you to use emlite packages via vcpkg.

## Usage
When initializing a vcpkg project using for example `vcpkg new --application`. A vcpkg.json and a vcpkg-configuration.json are created for you.

You can modify the vcpkg.json to add emlite projects:
```json
{
  "name": "demo",
  "version": "0.0.1",
  "dependencies": [
    { "name": "wasmbind", "features": ["webbind"] }
  ]
}
```

And the vcpkg-configuration.json to add this custom registry:
```json
{
  "default-registry": {
    "kind": "git",
    "baseline": "ee0973d8090e4e3e452244bb50d34c25fe907dc2",
    "repository": "https://github.com/microsoft/vcpkg"
  },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/emlite/emlite-vcpkg",
      "baseline": "3ef2b8a8e56c84297799c86bac390d6be844f30a",
      "packages": ["emsenv", "emlite", "wasmbind"]
    }
  ]
}
```
Change the baseline according to your needs, the baselines correspond to the commit SHA of the vcpkg's repo you're using, and this custom registy.

Now you can link the necessary libraries in your CMakeLists.txt file:
```cmake
cmake_minimum_required(VERSION 3.28)
project(demo)

find_package(wasmbind CONFIG REQUIRED)

add_executable(myapp main.cpp)

target_link_libraries(myapp PRIVATE wasmbind::webbind)

set_target_properties(myapp PROPERTIES LINKER_LANGUAGE CXX SUFFIX .js LINK_FLAGS "-sSINGLE_FILE -sALLOW_MEMORY_GROWTH=1 -sEXPORTED_FUNCTIONS=_main -Wl,--strip-all,--export-dynamic")
```

To build, you will have to pass both the emscripten toolchain file and the vcpkg toolchain file:
```bash
cmake -S . -B bin -DCMAKE_TOOLCHAIN_FILE=$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET=wasm32-emscripten -DVCPKG_CHAINLOAD_TOOLCHAIN_FILE=$EMSDK/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build bin
```
