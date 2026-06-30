#include "napi/native_api.h"
#include "common/native_common.h"
#include <securec.h>
#include <string>

static napi_value IsBuffer(napi_env env, napi_callback_info info)
{
    napi_status status;
    
    // 创建一个Buffer对象
    std::string str = "buffer";
    napi_value buffer = nullptr;
    void *bufferPtr = nullptr;
    
    status = napi_create_buffer(env, str.size(), &bufferPtr, &buffer);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create buffer");
        return nullptr;
    }

    // 调用napi_is_buffer接口判断创建的对象是否为buffer
    bool result = false;
    status = napi_is_buffer(env, buffer, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to check buffer type");
        return nullptr;
    }
    
    // 将结果返回出去
    napi_value returnValue = nullptr;
    status = napi_get_boolean(env, result, &returnValue);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create boolean return value");
        return nullptr;
    }
    
    return returnValue;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("isBuffer", IsBuffer),
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
