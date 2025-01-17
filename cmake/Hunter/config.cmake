# cryptopp has very bad CMakeLists.txt config.
# We have to enforce "cross compiling mode" there by setting CMAKE_SYSTEM_VERSION=NO
# to any "false" value.
hunter_config(cryptopp VERSION ${HUNTER_cryptopp_VERSION} CMAKE_ARGS CMAKE_SYSTEM_VERSION=NO)

# Configure jsoncpp
hunter_config(
    jsoncpp
    VERSION "1.8.0"
    CMAKE_ARGS
        JSONCPP_WITH_TESTS=OFF
        JSONCPP_WITH_POST_BUILD_UNITTEST=OFF
)

# Configure libjson-rpc-cpp
hunter_config(
    libjson-rpc-cpp
    VERSION 0.7.0-p3
    CMAKE_ARGS
        UNIX_DOMAIN_SOCKET_SERVER=NO
        UNIX_DOMAIN_SOCKET_CLIENT=NO
        FILE_DESCRIPTOR_SERVER=NO
        FILE_DESCRIPTOR_CLIENT=NO
        TCP_SOCKET_SERVER=NO
        TCP_SOCKET_CLIENT=NO
        HTTP_SERVER=NO
        HTTP_CLIENT=NO
        LIBJSON_RPC_CPP_WITH_COVERAGE=OFF
        LIBJSON_RPC_CPP_BUILD_EXAMPLES=OFF
        COMPILE_STUBGEN=OFF
        COMPILE_TESTS=OFF
        JSONCPP_INCLUDE_DIR=${HUNTER_INSTALL_PREFIX}/include
        CMAKE_CXX_FLAGS=-I${HUNTER_INSTALL_PREFIX}/include
)
hunter_config(
    leveldb
    VERSION "1.22"
    CMAKE_ARGS
        LEVELDB_BUILD_TESTS=OFF
        LEVELDB_BUILD_BENCHMARKS=OFF
        LEVELDB_SNAPPY=OFF
)



hunter_config(Boost VERSION 1.70.0-p0)

hunter_config(intx VERSION ${HUNTER_intx_VERSION})
hunter_config(
    GTest
    VERSION "1.8.1"  # Use the base version without patches
    CMAKE_ARGS
        BUILD_GMOCK=OFF
        gtest_force_shared_crt=ON
        CMAKE_POSITION_INDEPENDENT_CODE=ON
)
hunter_config(
    yaml-cpp
    VERSION "0.6.2-p0"
    CMAKE_ARGS
        YAML_CPP_BUILD_TESTS=OFF
        YAML_CPP_BUILD_TOOLS=OFF
)
if (MSVC)
    hunter_config(
        libscrypt
        VERSION ${HUNTER_libscrypt_VERSION}
        CMAKE_ARGS CMAKE_C_FLAGS=-D_CRT_SECURE_NO_WARNINGS
    )
endif()
