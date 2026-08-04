#include "ani/ani.h"
#include <array>
#include <iostream>
#include "AbilityKit/ability_runtime/native_ability_wrapper.h"
#include "MainEventHandler.h"
#include "hilog/log.h"
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200 // Global domain macro, identifying the business domain
#define LOG_TAG "testTag" // Global tag macro, identifying module log tags
#define ANI_UNSUPPORTED_VERSION  (ani_status)9
#define ANI_CLASS_NOT_FOUND      (ani_status)2
#define ANI_BIND_FAILED          (ani_status)3

static ani_vm *vm_ = nullptr;
static ani_ref g_callbackRef = nullptr;
static ani_ref g_method = nullptr;
static std::mutex g_callbackMutex;

static MainEventHandler mainEventHandler;

const AbilityRuntime_NativeAbilityWrapper *g_ability = nullptr;

static ani_int add([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_int arg1, ani_int arg2)
{
    OH_LOG_INFO(LOG_APP, "testTag : add call");
    std::cerr << "testTag : add call" << std::endl;
    std::cout << "testTag : add call" << std::endl;
    return arg1 + arg2;
}

ani_env *GetAniEnv()
{
    if (vm_ == nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : null vm_");
        return nullptr;
    }
    ani_env *env = nullptr;
    if (vm_->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : GetEnv failed");
        return nullptr;
    }
    return env;
}

ani_string GetAniString(ani_env *env, const std::string &str)
{
    if (env == nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : null env");
        return nullptr;
    }
    ani_string aniStr = nullptr;
    ani_status status = env->String_NewUTF8(str.c_str(), str.size(), &aniStr);
    if (status != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : status: %{public}d", status);
        return nullptr;
    }
    return aniStr;
}

static void ANI_Global_tick([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    OH_LOG_INFO(LOG_APP, "testTag : ANI_Global_tick call");
    mainEventHandler.AddEvent([]() { OH_LOG_INFO(LOG_APP, "testTag : Tick Event"); });
    char instanceId[37] = {};
    if (g_ability != nullptr) {
        AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetAbilityInstanceId(g_ability, instanceId, 37);
        OH_LOG_INFO(LOG_APP, "PostAbility OH_AbilityRuntime_GetAbilityInstanceId ret=%{public}d, instanceId=%{public}s",
                    ret, instanceId);
    }
}

static ani_string ANI_Global_getInstanceId(ani_env *env, [[maybe_unused]] ani_object object)
{
    OH_LOG_INFO(LOG_APP, "testTag : ANI_Global_getInstanceId call");
    constexpr int kInstanceIdBufferSize = 37;
    char instanceId[kInstanceIdBufferSize] = {};
    if (g_ability != nullptr) {
        OH_AbilityRuntime_GetAbilityInstanceId(g_ability, instanceId, kInstanceIdBufferSize);
    }
    return GetAniString(env, instanceId);
}

static void ANI_Global_registerCallback([[maybe_unused]] ani_env *env,
    [[maybe_unused]] ani_object object, ani_object fun)
{
    OH_LOG_INFO(LOG_APP, "testTag : ANI_Global_registerCallback call");
    if (g_callbackRef != nullptr) {
        env->GlobalReference_Delete(g_callbackRef);
    }
    env->GetVM(&vm_);
    env->GlobalReference_Create(fun, &g_callbackRef);
}

static void NotifyAni(const std::string &message)
{
    OH_LOG_INFO(LOG_APP, "testTag : NotifyAni call");
    OH_LOG_INFO(LOG_APP, "testTag : NotifyAni ok");
}

static ani_status bindCase(ani_vm *vm, const char *clsName)
{
    ani_env *env;
    if (ANI_OK != vm->GetEnv(ANI_VERSION_1, &env)) {
        std::cerr << "Unsupported ANI_VERSION_1" << std::endl;
        return ANI_UNSUPPORTED_VERSION;
    }

    ani_class cls{};
    if (ANI_OK != env->FindClass(clsName, &cls)) {
        std::cerr << "Not found '" << clsName << std::endl;
        return ANI_CLASS_NOT_FOUND;
    }

    const char *testSignature = "ii:i";
    std::array methods = {
        ani_native_function{"add", testSignature, reinterpret_cast<void *>(add)},
        ani_native_function{"tick", ":", reinterpret_cast<void *>(ANI_Global_tick)},
        ani_native_function{"getInstanceId", ":C{std.core.String}", reinterpret_cast<void *>(ANI_Global_getInstanceId)},
        ani_native_function{"registerCallback", nullptr, reinterpret_cast<void *>(ANI_Global_registerCallback)},
    };

    if (ANI_OK != env->Class_BindNativeMethods(cls, methods.data(), methods.size())) {
        std::cerr << "Cannot bind native methods to '" << clsName << std::endl;
        return ANI_BIND_FAILED;
    };

    return ANI_OK;
}


ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    OH_LOG_INFO(LOG_APP, "testTag : entering libentry.so's ANI_Constructor");
    bindCase(vm, "entry.src.main.ets.abilitystage.MyAbilityStage.Calc");
    bindCase(vm, "entry.src.main.ets.entryability.EntryAbility.Calc");
    bindCase(vm, "entry.src.main.ets.pages.Index.Calc");
    bindCase(vm, "entry.src.main.src.test.GetInstanceIdTestStatic.test.Calc");
    *result = ANI_VERSION_1;
    return ANI_OK;
}

extern "C" {
    void OHMain()
    {
        OH_LOG_INFO(LOG_APP, "testTag : Run Native Main");
        mainEventHandler.Run();
        OH_LOG_INFO(LOG_APP, "testTag : Exit Native Main");
    }

    void PostAbility(const AbilityRuntime_NativeAbilityWrapper *ability)
    {
        OH_LOG_INFO(LOG_APP, "testTag : PostAbility call");
        g_ability = ability;
        mainEventHandler.AddEvent([]() { OH_LOG_INFO(LOG_APP, "testTag : PostAbility Event"); });

        constexpr int kInstanceIdBufferSize = 37;
        char instanceId[kInstanceIdBufferSize] = {};
        if (g_ability != nullptr) {
            OH_AbilityRuntime_GetAbilityInstanceId(g_ability, instanceId, kInstanceIdBufferSize);
        }

        NotifyAni(instanceId);
    }

    void DestroyAbility(const AbilityRuntime_NativeAbilityWrapper *)
    {
        OH_LOG_INFO(LOG_APP, "testTag : DestroyAbility call");
        g_ability = nullptr;
        mainEventHandler.AddEvent([]() { OH_LOG_INFO(LOG_APP, "testTag : DestroyAbility Event"); });
    }

    void NotifyProcessExit()
    {
        OH_LOG_INFO(LOG_APP, "testTag : NotifyProcessExit");
        mainEventHandler.Quit();
    }
}
