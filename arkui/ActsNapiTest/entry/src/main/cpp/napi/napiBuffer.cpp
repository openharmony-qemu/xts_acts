#include "napi/native_api.h"
#include "common/native_common.h"
#include <securec.h>
#include <string>
#include <cstring>

static constexpr size_t BUF_SIZE_SMALL = 16;
static constexpr size_t BUF_SIZE_MEDIUM = 32;
static constexpr int32_t TEST_INT_VAL = 42;
static constexpr int32_t ERR_CREATE_FAILED = -1;
static constexpr int32_t ERR_NOT_BUFFER = -2;
static constexpr int32_t ERR_INFO_FAILED = -3;
static constexpr int32_t ERR_VERIFY_FAILED = -4;
static constexpr int32_t ERR_COPY_FAILED = -5;
static constexpr int32_t RET_SUCCESS = 0;

static napi_value IsBuffer(napi_env env, napi_callback_info info)
{
    napi_status status;

    std::string str = "buffer";
    napi_value buffer = nullptr;
    void *bufferPtr = nullptr;

    status = napi_create_buffer(env, str.size(), &bufferPtr, &buffer);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create buffer");
        return nullptr;
    }

    bool result = false;
    status = napi_is_buffer(env, buffer, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to check buffer type");
        return nullptr;
    }

    napi_value returnValue = nullptr;
    status = napi_get_boolean(env, result, &returnValue);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create boolean return value");
        return nullptr;
    }

    return returnValue;
}

static napi_value IsBufferAfterException(napi_env env, napi_callback_info info)
{
    napi_throw_error(env, "TEST_ERROR", "Simulated exception before isBuffer");

    napi_value buffer = nullptr;
    void *bufData = nullptr;
    napi_create_buffer(env, BUF_SIZE_MEDIUM, &bufData, &buffer);
    bool result = false;
    napi_status status = napi_is_buffer(env, buffer, &result);

    napi_value exception = nullptr;
    napi_get_and_clear_last_exception(env, &exception);

    napi_value returnValue = nullptr;
    napi_create_int32(env, (int32_t)status, &returnValue);
    return returnValue;
}

static napi_value IsBufferOnNonBuffer(napi_env env, napi_callback_info info)
{
    napi_value num = nullptr;
    napi_create_int32(env, TEST_INT_VAL, &num);

    bool result = true;
    napi_status status = napi_is_buffer(env, num, &result);

    int32_t ret = (int32_t)status * 1000 + (result ? 1 : 0);
    napi_value returnValue = nullptr;
    napi_create_int32(env, ret, &returnValue);
    return returnValue;
}

static napi_value IsBufferOnSlice(napi_env env, napi_callback_info info)
{
    void *rawData = nullptr;
    napi_value rawBuf = nullptr;
    napi_create_buffer(env, BUF_SIZE_SMALL, &rawData, &rawBuf);
    memset_s(rawData, BUF_SIZE_SMALL, 'A', BUF_SIZE_SMALL);

    bool result = false;
    napi_status status = napi_is_buffer(env, rawBuf, &result);

    int32_t ret = (int32_t)status * 1000 + (result ? 1 : 0);
    napi_value returnValue = nullptr;
    napi_create_int32(env, ret, &returnValue);
    return returnValue;
}

static napi_value CreateBufferAndVerify(napi_env env, napi_callback_info info)
{
    const char *testData = "Hello Buffer!";
    size_t testLen = strlen(testData);

    void *bufData = nullptr;
    napi_value buffer = nullptr;
    napi_status status = napi_create_buffer(env, testLen + 1, &bufData, &buffer);
    if (status != napi_ok) {
        napi_value ret = nullptr;
        napi_create_int32(env, ERR_CREATE_FAILED, &ret);
        return ret;
    }

    bool isBuf = false;
    status = napi_is_buffer(env, buffer, &isBuf);
    if (status != napi_ok || !isBuf) {
        napi_value ret = nullptr;
        napi_create_int32(env, ERR_NOT_BUFFER, &ret);
        return ret;
    }

    if (memcpy_s(bufData, testLen + 1, testData, testLen + 1) != EOK) {
        napi_value ret = nullptr;
        napi_create_int32(env, ERR_COPY_FAILED, &ret);
        return ret;
    }

    void *verifyData = nullptr;
    size_t verifyLen = 0;
    status = napi_get_buffer_info(env, buffer, &verifyData, &verifyLen);
    if (status != napi_ok) {
        napi_value ret = nullptr;
        napi_create_int32(env, ERR_INFO_FAILED, &ret);
        return ret;
    }

    if (verifyLen != testLen + 1 || memcmp(verifyData, testData, testLen) != 0) {
        napi_value ret = nullptr;
        napi_create_int32(env, ERR_VERIFY_FAILED, &ret);
        return ret;
    }

    napi_value ret = nullptr;
    napi_create_int32(env, RET_SUCCESS, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("isBuffer", IsBuffer),
        DECLARE_NAPI_FUNCTION("isBufferAfterException", IsBufferAfterException),
        DECLARE_NAPI_FUNCTION("isBufferOnNonBuffer", IsBufferOnNonBuffer),
        DECLARE_NAPI_FUNCTION("isBufferOnSlice", IsBufferOnSlice),
        DECLARE_NAPI_FUNCTION("createBufferAndVerify", CreateBufferAndVerify),
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "napiBuffer",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
