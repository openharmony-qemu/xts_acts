#include "AbilityKit/ability_runtime/native_ability_wrapper.h"
#include "napi/native_api.h"
#include "hilog/log.h"
#include "MainEventHandler.h"
#include <mutex>
#include <string>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // Global domain macro, identifying the business domain
#define LOG_TAG "testTag"  // Global tag macro, identifying module log tags

static napi_threadsafe_function g_tsfn = nullptr;
static std::mutex g_tsfnMutex;

static MainEventHandler mainEventHandler;

const AbilityRuntime_NativeAbilityWrapper* g_ability = nullptr;

struct CallbackData {
    std::string message;
};

static void CallJs(napi_env env, napi_value js_callback, void*, void* data)
{
    CallbackData* callbackData = static_cast<CallbackData*>(data);

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

    napi_create_threadsafe_function(
        env,
        args[0],
        nullptr,
        resource_name,
        0,
        1,
        nullptr,
        nullptr,
        nullptr,
        CallJs,
        &g_tsfn);

    napi_value result;
    napi_get_undefined(env, &result);
    return result;
}

static void NotifyJs(const std::string& message)
{
    std::lock_guard<std::mutex> lock(g_tsfnMutex);
    if (g_tsfn == nullptr) {
        return;
    }

    CallbackData* data = new CallbackData();
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
    constexpr int kInstanceIdBufferSize = 37;
    char instanceId[kInstanceIdBufferSize] = {};
    if (g_ability != nullptr) {
        OH_AbilityRuntime_GetAbilityInstanceId(g_ability, instanceId, kInstanceIdBufferSize);
    }
    napi_value sum;
    napi_create_string_utf8(env, instanceId, kInstanceIdBufferSize, &sum);

    return sum;
}

static napi_value NAPI_Global_tick(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "NAPI_Global_tick call");
    mainEventHandler.AddEvent([]() {
        OH_LOG_INFO(LOG_APP, "Tick Event");
    });
    
    napi_value result;
    napi_get_undefined(env, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tick", nullptr, NAPI_Global_tick, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"getInstanceId", nullptr, GetInstanceId, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "registerCallback", nullptr, RegisterCallback, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

void OHMain()
{
    OH_LOG_INFO(LOG_APP, "Run Native Main");
    mainEventHandler.Run();
    OH_LOG_INFO(LOG_APP, "Exit Native Main");
}

void PostAbility(const AbilityRuntime_NativeAbilityWrapper* ability)
{
    OH_LOG_INFO(LOG_APP, "PostAbility call");
    g_ability = ability;
    mainEventHandler.AddEvent([]() {
        OH_LOG_INFO(LOG_APP, "PostAbility Event");
    });
    
    constexpr int kInstanceIdBufferSize = 37;
    char instanceId[kInstanceIdBufferSize] = {};
    if (g_ability != nullptr) {
        OH_AbilityRuntime_GetAbilityInstanceId(g_ability, instanceId, kInstanceIdBufferSize);
    }
    
    NotifyJs(instanceId);
}

void DestroyAbility(const AbilityRuntime_NativeAbilityWrapper*)
{
    OH_LOG_INFO(LOG_APP, "DestroyAbility call");
    g_ability = nullptr;
    mainEventHandler.AddEvent([]() {
        OH_LOG_INFO(LOG_APP, "DestroyAbility Event");
    });
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
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
