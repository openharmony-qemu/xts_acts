#include "AbilityKit/ability_runtime/native_ability_wrapper.h"
#include "napi/native_api.h"
#include "hilog/log.h"
#include "MainEventHandler.h"
#include <mutex>
#include <string>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // Global domain macro, identifying the business domain
#define LOG_TAG "testTag" // Global tag macro, identifying module log tags

static napi_threadsafe_function g_tsfn = nullptr;
static std::mutex g_tsfnMutex;

static MainEventHandler mainEventHandler;

const AbilityRuntime_NativeAbilityWrapper *g_ability = nullptr;

struct CallbackData {
    std::string message;
};

static void CallJs(napi_env env, napi_value js_callback, void *, void *data)
{
    CallbackData *callbackData = static_cast<CallbackData *>(data);

    napi_value argv[1];
    napi_create_string_utf8(env, callbackData->message.c_str(), callbackData->message.length(), &argv[0]);

    napi_value global;
    napi_get_global(env, &global);

    napi_value result;
    napi_call_function(env, global, js_callback, 1, argv, &result);

    delete callbackData;
}

static napi_value RegisterCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_function) {
        napi_throw_type_error(env, nullptr, "Expected a function");
        return nullptr;
    }

    if (g_tsfn != nullptr) {
        napi_release_threadsafe_function(g_tsfn, napi_tsfn_release);
    }

    napi_value resource_name;
    napi_create_string_utf8(env, "CallbackResource", NAPI_AUTO_LENGTH, &resource_name);

    napi_create_threadsafe_function(env, args[0], nullptr, resource_name, 0, 1, nullptr, nullptr, nullptr, CallJs,
                                    &g_tsfn);

    napi_value result;
    napi_get_undefined(env, &result);
    return result;
}

static void NotifyJs(const std::string &message)
{
    std::lock_guard<std::mutex> lock(g_tsfnMutex);
    if (g_tsfn == nullptr) {
        return;
    }

    CallbackData *data = new CallbackData();
    data->message = message;

    napi_call_threadsafe_function(g_tsfn, data, napi_tsfn_nonblocking);
}

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value GetInstanceId(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetInstanceId call, g_ability=%{public}p", g_ability);
    constexpr int kInstanceIdBufferSize = 37;
    char instanceId[kInstanceIdBufferSize] = {};
    if (g_ability != nullptr) {
        AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetAbilityInstanceId(
            g_ability, instanceId, kInstanceIdBufferSize);
        OH_LOG_INFO(LOG_APP, "GetInstanceId OH_AbilityRuntime_GetAbilityInstanceId "
            "ret=%{public}d, instanceId=%{public}s", errCode, instanceId);
        if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
            OH_LOG_INFO(LOG_APP, "GetInstanceId success, instanceId=%{public}s", instanceId);
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetInstanceId failed, errCode=PARAM_INVALID");
        } else {
            OH_LOG_ERROR(LOG_APP, "GetInstanceId failed, errCode=%{public}d", errCode);
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "GetInstanceId g_ability is nullptr");
    }
    napi_value sum;
    napi_create_string_utf8(env, instanceId, kInstanceIdBufferSize, &sum);
    return sum;
}

static napi_value GetInstanceIdError1(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetInstanceIdError1 call, testing null wrapper");
    constexpr int kInstanceIdBufferSize = 37;
    char instanceId[kInstanceIdBufferSize] = {};
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetAbilityInstanceId(
        nullptr, instanceId, kInstanceIdBufferSize);
    OH_LOG_INFO(LOG_APP, "GetInstanceIdError1 ret=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "GetInstanceIdError1 success");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetInstanceIdError1 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID");
    } else {
        OH_LOG_ERROR(LOG_APP, "GetInstanceIdError1 failed, errCode=%{public}d", errCode);
    }
    std::string errCodeStr = std::to_string(static_cast<int32_t>(errCode));
    napi_value result;
    napi_create_string_utf8(env, errCodeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value GetAbilityName(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetAbilityName call, g_ability=%{public}p", g_ability);
    constexpr int kAbilityNameBufferSize = 256;
    char abilityName[kAbilityNameBufferSize] = {};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode = ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID;

    if (g_ability != nullptr) {
        errCode = OH_AbilityRuntime_GetAbilityName(g_ability, abilityName, kAbilityNameBufferSize, &writeLength);
        OH_LOG_INFO(LOG_APP, "GetAbilityName OH_AbilityRuntime_GetAbilityName "
            "ret=%{public}d, writeLength=%{public}d", errCode, writeLength);

        if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
            OH_LOG_INFO(LOG_APP, "GetAbilityName success, abilityName=%{public}s, "
                "writeLength=%{public}d", abilityName, writeLength);
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetAbilityName failed, errCode=PARAM_INVALID");
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetAbilityName failed, errCode=ABILITY_WRAPPER_INVALID");
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
            OH_LOG_ERROR(LOG_APP, "GetAbilityName failed, errCode=INTERNAL_ERROR");
        } else {
            OH_LOG_ERROR(LOG_APP, "GetAbilityName failed, errCode=%{public}d", errCode);
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "GetAbilityName g_ability is nullptr");
    }

    napi_value result;
    napi_create_string_utf8(env, abilityName, kAbilityNameBufferSize, &result);
    return result;
}

static napi_value GetAbilityNameError1(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetAbilityNameError1 call, testing null wrapper");
    constexpr int kAbilityNameBufferSize = 256;
    char abilityName[kAbilityNameBufferSize] = {};
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetAbilityName(
        nullptr, abilityName, kAbilityNameBufferSize, &writeLength);
    OH_LOG_INFO(LOG_APP, "GetAbilityNameError1 ret=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "GetAbilityNameError1 success");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError1 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError1 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError1 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_INTERNAL");
    } else {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError1 failed, errCode=%{public}d", errCode);
    }

    std::string errCodeStr = std::to_string(static_cast<int32_t>(errCode));
    napi_value result;
    napi_create_string_utf8(env, errCodeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value GetAbilityNameError2(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetAbilityNameError2 call, testing null writeLength");
    constexpr int kAbilityNameBufferSize = 256;
    char abilityName[kAbilityNameBufferSize] = {};
    AbilityRuntime_ErrorCode errCode = ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID;
    if (g_ability != nullptr) {
        errCode = OH_AbilityRuntime_GetAbilityName(g_ability, abilityName, kAbilityNameBufferSize, nullptr);
        OH_LOG_INFO(LOG_APP, "GetAbilityNameError2 ret=%{public}d", errCode);
        if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
            OH_LOG_INFO(LOG_APP, "GetAbilityNameError2 success");
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetAbilityNameError2 failed, errCode = "
                "ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID");
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetAbilityNameError2 failed, errCode = "
                "ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID");
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
            OH_LOG_ERROR(LOG_APP, "GetAbilityNameError2 failed, errCode = "
                "ABILITY_RUNTIME_ERROR_CODE_INTERNAL");
        } else {
            OH_LOG_ERROR(LOG_APP, "GetAbilityNameError2 failed, errCode=%{public}d", errCode);
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError2 g_ability is nullptr");
    }

    std::string errCodeStr = std::to_string(static_cast<int32_t>(errCode));
    napi_value result;
    napi_create_string_utf8(env, errCodeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value GetAbilityNameError3(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetAbilityNameError3 call, testing fake wrapper");
    constexpr int kAbilityNameBufferSize = 256;
    char abilityName[kAbilityNameBufferSize] = {};
    int32_t writeLength = 0;
    auto fakeWrapper = reinterpret_cast<AbilityRuntime_NativeAbilityWrapper*>(0x12345678);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetAbilityName(
        fakeWrapper, abilityName, kAbilityNameBufferSize, &writeLength);
    OH_LOG_INFO(LOG_APP, "GetAbilityNameError3 ret=%{public}d", errCode);

    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "GetAbilityNameError3 success");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError3 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError3 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError3 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_INTERNAL");
    } else {
        OH_LOG_ERROR(LOG_APP, "GetAbilityNameError3 failed, errCode=%{public}d", errCode);
    }

    std::string errCodeStr = std::to_string(static_cast<int32_t>(errCode));
    napi_value result;
    napi_create_string_utf8(env, errCodeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value GetEnv(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetEnv call, g_ability=%{public}p", g_ability);
    napi_env newEnv = nullptr;
    AbilityRuntime_ErrorCode errCode = ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID;
    if (g_ability != nullptr) {
        errCode = OH_AbilityRuntime_GetEnv(g_ability, &newEnv);
        OH_LOG_INFO(LOG_APP, "GetEnv OH_AbilityRuntime_GetEnv ret=%{public}d, newEnv=%{public}p", errCode, newEnv);
        if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
            OH_LOG_INFO(LOG_APP, "GetEnv success, newEnv=%{public}p", newEnv);
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetEnv failed, errCode=PARAM_INVALID");
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetEnv failed, errCode=ABILITY_WRAPPER_INVALID");
        } else {
            OH_LOG_ERROR(LOG_APP, "GetEnv failed, errCode=%{public}d", errCode);
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "GetEnv g_ability is nullptr");
    }
    napi_value result;
    napi_create_int32(env, static_cast<int32_t>(errCode), &result);
    return result;
}

static napi_value GetEnvError1(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetEnvError1 call, testing null wrapper");
    napi_env outEnv = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetEnv(nullptr, &outEnv);
    OH_LOG_INFO(LOG_APP, "GetEnvError1 ret=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "GetEnvError1 success");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetEnvError1 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetEnvError1 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID");
    } else {
        OH_LOG_ERROR(LOG_APP, "GetEnvError1 failed, errCode=%{public}d", errCode);
    }
    std::string errCodeStr = std::to_string(static_cast<int32_t>(errCode));
    napi_value result;
    napi_create_string_utf8(env, errCodeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value GetEnvError2(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetEnvError2 call, testing null env output");
    AbilityRuntime_ErrorCode errCode = ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID;
    if (g_ability != nullptr) {
        errCode = OH_AbilityRuntime_GetEnv(g_ability, nullptr);
        OH_LOG_INFO(LOG_APP, "GetEnvError2 ret=%{public}d", errCode);
        if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
            OH_LOG_INFO(LOG_APP, "GetEnvError2 success");
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetEnvError2 failed, errCode = "
                "ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID");
        } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID) {
            OH_LOG_ERROR(LOG_APP, "GetEnvError2 failed, errCode = "
                "ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID");
        } else {
            OH_LOG_ERROR(LOG_APP, "GetEnvError2 failed, errCode=%{public}d", errCode);
        }
    } else {
        OH_LOG_ERROR(LOG_APP, "GetEnvError2 g_ability is nullptr");
    }

    std::string errCodeStr = std::to_string(static_cast<int32_t>(errCode));
    napi_value result;
    napi_create_string_utf8(env, errCodeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value GetEnvError3(napi_env env, napi_callback_info)
{
    OH_LOG_INFO(LOG_APP, "GetEnvError3 call, testing fake wrapper");
    napi_env outEnv = nullptr;
    auto fakeWrapper = reinterpret_cast<AbilityRuntime_NativeAbilityWrapper*>(0x12345678);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetEnv(fakeWrapper, &outEnv);
    OH_LOG_INFO(LOG_APP, "GetEnvError3 ret=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "GetEnvError3 success");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetEnvError3 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID");
    } else if (errCode == ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID) {
        OH_LOG_ERROR(LOG_APP, "GetEnvError3 failed, errCode = "
            "ABILITY_RUNTIME_ERROR_CODE_ABILITY_WRAPPER_INVALID");
    } else {
        OH_LOG_ERROR(LOG_APP, "GetEnvError3 failed, errCode=%{public}d", errCode);
    }
    std::string errCodeStr = std::to_string(static_cast<int32_t>(errCode));
    napi_value result;
    napi_create_string_utf8(env, errCodeStr.c_str(), NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value NAPI_Global_tick(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "NAPI_Global_tick call");
    mainEventHandler.AddEvent([]() { OH_LOG_INFO(LOG_APP, "Tick Event"); });
    constexpr int kInstanceIdBufferSize = 37;
    char instanceId[kInstanceIdBufferSize] = {};
    if (g_ability != nullptr) {
        AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetAbilityInstanceId(g_ability,
            instanceId, kInstanceIdBufferSize);
        OH_LOG_INFO(LOG_APP, "PostAbility OH_AbilityRuntime_GetAbilityInstanceId ret=%{public}d, instanceId=%{public}s",
                    ret, instanceId);
    }

    napi_value result;
    napi_get_undefined(env, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tick", nullptr, NAPI_Global_tick, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getInstanceId", nullptr, GetInstanceId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getInstanceIdError1", nullptr, GetInstanceIdError1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAbilityName", nullptr, GetAbilityName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAbilityNameError1", nullptr, GetAbilityNameError1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAbilityNameError2", nullptr, GetAbilityNameError2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getAbilityNameError3", nullptr, GetAbilityNameError3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEnv", nullptr, GetEnv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEnvError1", nullptr, GetEnvError1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEnvError2", nullptr, GetEnvError2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getEnvError3", nullptr, GetEnvError3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerCallback", nullptr, RegisterCallback, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

void OHMain()
{
    OH_LOG_INFO(LOG_APP, "Run Native Main");
    mainEventHandler.Run();
    OH_LOG_INFO(LOG_APP, "Exit Native Main");
}

void PostAbility(const AbilityRuntime_NativeAbilityWrapper *ability)
{
    OH_LOG_INFO(LOG_APP, "PostAbility call");
    OH_LOG_INFO(LOG_APP, "PostAbility ability pointer: %{public}p", ability);
    g_ability = ability;
}

void DestroyAbility(const AbilityRuntime_NativeAbilityWrapper *)
{
    OH_LOG_INFO(LOG_APP, "DestroyAbility call");
    g_ability = nullptr;
    mainEventHandler.AddEvent([]() { OH_LOG_INFO(LOG_APP, "DestroyAbility Event"); });
}

void NotifyProcessExit()
{
    OH_LOG_INFO(LOG_APP, "NotifyProcessExit");
    mainEventHandler.Quit();
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
