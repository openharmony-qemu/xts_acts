#include "napi/native_api.h"
#include "common/native_common.h"
#include <securec.h>

const int NAPI_UTF8_LENGTH = 256;

napi_value CreateStringUtf8(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value argv[1];
    status = napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to parse arguments");
        return nullptr;
    }
    if (argc < 1) {
        napi_throw_type_error(env, nullptr, "Wrong number of arguments");
        return nullptr;
    }
    napi_value strValue = argv[0];
    char str[NAPI_UTF8_LENGTH];
    size_t strLength;
    status = napi_get_value_string_utf8(env, strValue, str, NAPI_UTF8_LENGTH, &strLength);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Invalid string was passed as argument");
        return nullptr;
    }
    napi_value result;
    status = napi_create_string_utf8(env, str, strLength, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create string");
        return nullptr;
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        DECLARE_NAPI_FUNCTION("createStringUtf8", CreateStringUtf8),
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
    .nm_modname = "napiString",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
