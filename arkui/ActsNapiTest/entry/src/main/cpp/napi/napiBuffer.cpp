#include "napi/native_api.h"
#include "common/native_common.h"
#include <securec.h>

static napi_value IsBuffer(napi_env env, napi_callback_info info)
{
    napi_value args[1];
    size_t argc = 1;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    NAPI_ASSERT(env, argc == 1, "The number of arguments provided is incorrect.");
    napi_value napiBuffer = args[0];
    bool result;
    napi_status status = napi_is_buffer(env, napiBuffer, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "The parameter instance is not of type buffer.");
    }
    napi_value returnValue;
    NAPI_CALL(env, napi_get_boolean(env, result, &returnValue));
    return returnValue;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("IsBuffer", IsBuffer),
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
