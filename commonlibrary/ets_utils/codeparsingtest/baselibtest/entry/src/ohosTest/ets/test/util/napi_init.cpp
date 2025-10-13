// /entry/src/main/cpp/napi_init.cpp
#include "napi/native_api.h"
#include <js_native_api.h>
#include <stdlib.h>

napi_value result;
static napi_value Testexternal(napi_env env, napi_callback_info info) {
    int* raw = (int*) malloc(1024);
    napi_status status = napi_create_external(env, (void*) raw, NULL, NULL, &result);
    if (status != napi_ok) {
        napi_throw_error(env, NULL, "create external failed");
        return NULL;
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"testexternal", nullptr, Testexternal, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}