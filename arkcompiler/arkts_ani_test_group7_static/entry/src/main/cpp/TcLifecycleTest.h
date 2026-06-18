/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef TC_LIFECYCLE_TEST_H
#define TC_LIFECYCLE_TEST_H
#include "Common.h"
#include <atomic>
#include <chrono>
#include <cstring>
#include <iostream>
#include <mutex>
#include <string>
#include <thread>
#include <vector>
#include <dlfcn.h>
namespace tc_lifecycle_test {
inline constexpr const char *LIFECYCLE_FOO_CLASS = "entry.src.main.src.ets.Index.Foo";
inline constexpr const char *LIFECYCLE_STRING_CLASS = "std.core.String";
inline constexpr int LIFECYCLE_CROSS_THREAD_DELAY_MS = 20;
inline constexpr ani_int LIFECYCLE_INVALID_FACTOR = -1;
inline ani_env *g_savedEnv = nullptr;
inline ani_vm *g_savedVm = nullptr;
inline ani_string g_savedStringLocalRef = nullptr;
inline ani_object g_savedLocalObject = nullptr;
inline ani_ref g_savedGlobalObject = nullptr;
inline ani_ref g_cachedFooClassRef = nullptr;
inline std::vector<ani_ref> g_leakedGlobalRefs;
inline std::mutex g_lifecycleMutex;
inline std::atomic<int> g_loggerCallCount {0};
std::string ToStdString(ani_env *env, ani_string str)
{
    if (env == nullptr || str == nullptr) {
        return "";
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(str, &size);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8Size failed")) {
        return "";
    }
    std::string result(size, '\0');
    ani_size written = 0;
    status = env->String_GetUTF8(str, result.data(), size + 1, &written);
    if (!AssertEqMsg(status, ANI_OK, "String_GetUTF8 failed")) {
        return "";
    }
    return result;
}
inline ani_string NewString(ani_env *env, const std::string &value)
{
    ani_string result = nullptr;
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
ani_object CreateFooObject(ani_env *env, ani_int factor)
{
    ani_class cls {};
    ani_status status = env->FindClass(LIFECYCLE_FOO_CLASS, &cls);
    if (!AssertEqMsg(status, ANI_OK, "FindClass Foo failed")) {
        return nullptr;
    }
    ani_method ctor {};
    status = env->Class_FindMethod(cls, "<ctor>", nullptr, &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Class_FindMethod Foo.<ctor> failed")) {
        return nullptr;
    }
    ani_object obj {};
    status = env->Object_New(cls, ctor, &obj);
    if (!AssertEqMsg(status, ANI_OK, "Object_New Foo failed")) {
        return nullptr;
    }
    status = env->Object_SetFieldByName_Int(obj, "factor", factor);
    if (!AssertEqMsg(status, ANI_OK, "Object_SetFieldByName_Int factor failed")) {
        return obj;
    }
    return obj;
}
inline ani_int ReadFooFactor(ani_env *env, ani_object obj)
{
    ani_int value = LIFECYCLE_INVALID_FACTOR;
    if (env == nullptr || obj == nullptr) {
        return value;
    }
    ani_status status = env->Object_GetFieldByName_Int(obj, "factor", &value);
    if (!AssertEqMsg(status, ANI_OK, "Object_GetFieldByName_Int factor failed")) {
        return LIFECYCLE_INVALID_FACTOR;
    }
    return value;
}
inline void MyLifecycleLogger(FILE *stream, int logLevel, const char *component, const char *message)
{
    (void)logLevel;
    (void)component;
    (void)message;
    g_loggerCallCount.fetch_add(1);
    if (stream != nullptr) {
        std::fprintf(stream, "ANI logger callback invoked\n");
    }
}
using AniCreateVmFunc = ani_status (*)(const ani_options *options, uint32_t version, ani_vm **result);
AniCreateVmFunc ResolveAniCreateVM()
{
    void *symbol = dlsym(RTLD_DEFAULT, "ANI_CreateVM");
    if (symbol != nullptr) {
        return reinterpret_cast<AniCreateVmFunc>(symbol);
    }
    void *handle = dlopen("libani.z.so", RTLD_NOW | RTLD_GLOBAL);
    if (handle == nullptr) {
        return nullptr;
    }
    symbol = dlsym(handle, "ANI_CreateVM");
    if (symbol == nullptr) {
        return nullptr;
    }
    return reinterpret_cast<AniCreateVmFunc>(symbol);
}
inline ani_status CallANICreateVM(const ani_options *options, uint32_t version, ani_vm **result)
{
    AniCreateVmFunc createVm = ResolveAniCreateVM();
    if (createVm == nullptr) {
        if (result != nullptr) {
            *result = nullptr;
        }
        return ANI_NOT_FOUND;
    }
    return createVm(options, version, result);
}
}
void test_LifecycleSaveStringLocalRef(ani_env *env, ani_object object, ani_string str)
{
    (void)env;
    (void)object;
    tc_lifecycle_test::g_savedStringLocalRef = str;
}
ani_string test_LifecycleUseSavedStringLocalRef(ani_env *env, ani_object object)
{
    (void)object;
    if (tc_lifecycle_test::g_savedStringLocalRef == nullptr) {
        return tc_lifecycle_test::NewString(env, "no saved string");
    }
    std::string value = tc_lifecycle_test::ToStdString(env, tc_lifecycle_test::g_savedStringLocalRef);
    if (value.empty()) {
        value = "empty or invalid saved string";
    }
    return tc_lifecycle_test::NewString(env, value);
}
ani_boolean test_LifecycleSaveLocalObject(ani_env *env, ani_object object)
{
    (void)object;
    ani_object obj = tc_lifecycle_test::CreateFooObject(env, 303);
    tc_lifecycle_test::g_savedLocalObject = obj;
    return obj != nullptr ? ANI_TRUE : ANI_FALSE;
}
ani_int test_LifecycleUseSavedLocalObject(ani_env *env, ani_object object)
{
    (void)object;
    return tc_lifecycle_test::ReadFooFactor(env, tc_lifecycle_test::g_savedLocalObject);
}
ani_boolean test_LifecycleCreateGlobalObject(ani_env *env, ani_object object)
{
    (void)object;
    ani_object obj = tc_lifecycle_test::CreateFooObject(env, 404);
    if (obj == nullptr) {
        return ANI_FALSE;
    }
    ani_ref gref = nullptr;
    ani_status status = env->GlobalReference_Create(reinterpret_cast<ani_ref>(obj), &gref);
    if (!AssertEqMsg(status, ANI_OK, "GlobalReference_Create failed")) {
        return ANI_FALSE;
    }
    std::lock_guard<std::mutex> lock(tc_lifecycle_test::g_lifecycleMutex);
    if (tc_lifecycle_test::g_savedGlobalObject != nullptr) {
        env->GlobalReference_Delete(tc_lifecycle_test::g_savedGlobalObject);
        tc_lifecycle_test::g_savedGlobalObject = nullptr;
    }
    tc_lifecycle_test::g_savedGlobalObject = gref;
    return ANI_TRUE;
}
ani_int test_LifecycleUseGlobalObject(ani_env *env, ani_object object)
{
    (void)object;
    std::lock_guard<std::mutex> lock(tc_lifecycle_test::g_lifecycleMutex);
    if (tc_lifecycle_test::g_savedGlobalObject == nullptr) {
        return -1;
    }
    return tc_lifecycle_test::ReadFooFactor(
        env, reinterpret_cast<ani_object>(tc_lifecycle_test::g_savedGlobalObject));
}
ani_boolean test_LifecycleDeleteGlobalObject(ani_env *env, ani_object object)
{
    (void)object;
    std::lock_guard<std::mutex> lock(tc_lifecycle_test::g_lifecycleMutex);
    if (tc_lifecycle_test::g_savedGlobalObject == nullptr) {
        return ANI_FALSE;
    }
    ani_status status = env->GlobalReference_Delete(tc_lifecycle_test::g_savedGlobalObject);
    if (!AssertEqMsg(status, ANI_OK, "GlobalReference_Delete failed")) {
        return ANI_FALSE;
    }
    tc_lifecycle_test::g_savedGlobalObject = nullptr;
    return ANI_TRUE;
}
ani_int test_LifecycleCreateLeakedGlobalRefs(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_int created = 0;
    for (ani_int i = 0; i < count; i++) {
        ani_object obj = tc_lifecycle_test::CreateFooObject(env, i);
        if (obj == nullptr) {
            break;
        }
        ani_ref gref = nullptr;
        ani_status status = env->GlobalReference_Create(reinterpret_cast<ani_ref>(obj), &gref);
        if (status != ANI_OK) {
            break;
        }
        tc_lifecycle_test::g_leakedGlobalRefs.push_back(gref);
        created++;
    }
    return created;
}
ani_boolean test_LifecycleNativeThreadLocalRefsNoScope(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<bool> ok {true};
    std::thread worker([vm, count, &ok]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            ok.store(false);
            return;
        }
        for (ani_int i = 0; i < count; i++) {
            std::string text = "no-scope-" + std::to_string(i);
            ani_string str = nullptr;
            ani_status stringStatus = threadEnv->String_NewUTF8(text.c_str(), text.size(), &str);
            if (stringStatus != ANI_OK) {
                ok.store(false);
                break;
            }
        }
        vm->DetachCurrentThread();
    });
    worker.join();
    return ok.load() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleNativeThreadLocalRefsWithScope(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<bool> ok {true};
    std::thread worker([vm, count, &ok]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            ok.store(false);
            return;
        }
        for (ani_int i = 0; i < count; i++) {
            ani_status scopeStatus = threadEnv->CreateLocalScope(8);
            if (scopeStatus != ANI_OK) {
                ok.store(false);
                break;
            }
            std::string text = "with-scope-" + std::to_string(i);
            ani_string str = nullptr;
            ani_status s = threadEnv->String_NewUTF8(text.c_str(), text.size(), &str);
            if (s != ANI_OK || str == nullptr) {
                ok.store(false);
            }
            ani_status destroyStatus = threadEnv->DestroyLocalScope();
            if (destroyStatus != ANI_OK) {
                ok.store(false);
                break;
            }
            if (!ok.load()) {
                break;
            }
        }
        vm->DetachCurrentThread();
    });
    worker.join();
    return ok.load() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleArkCallLocalRefsAutoManaged(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    for (ani_int i = 0; i < count; i++) {
        std::string text = "ark-call-local-ref-" + std::to_string(i);
        ani_string str = nullptr;
        ani_status status = env->String_NewUTF8(text.c_str(), text.size(), &str);
        if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 in ArkTS native call failed")) {
            return ANI_FALSE;
        }
        if (str == nullptr) {
            return ANI_FALSE;
        }
    }
    return ANI_TRUE;
}
ani_boolean test_LifecycleGetVmAndGetEnv(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    ani_env *sameEnv = nullptr;
    status = vm->GetEnv(ANI_VERSION_1, &sameEnv);
    return status == ANI_OK && sameEnv == env ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleAttachDetachUseOldEnv(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<bool> ok {false};
    std::thread worker([vm, &ok]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            return;
        }
        ani_string beforeDetach = nullptr;
        ani_status beforeStatus = threadEnv->String_NewUTF8(
            "before-detach", std::strlen("before-detach"), &beforeDetach);
        ani_env *oldEnv = threadEnv;
        ani_status detachStatus = vm->DetachCurrentThread();
        ani_string afterDetach = nullptr;
        ani_status afterStatus = oldEnv->String_NewUTF8(
            "after-detach", std::strlen("after-detach"), &afterDetach);
        ok.store(beforeStatus == ANI_OK && detachStatus == ANI_OK && afterStatus != ANI_OK);
    });
    worker.join();
    return ok.load() ? ANI_TRUE : ANI_FALSE;
}
ani_boolean test_LifecycleAttachThenGetEnvSame(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK || vm == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<bool> same {false};
    std::thread worker([vm, &same]() {
        ani_env *env1 = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &env1);
        if (attachStatus != ANI_OK || env1 == nullptr) {
            return;
        }
        ani_env *env2 = nullptr;
        ani_status getStatus = vm->GetEnv(ANI_VERSION_1, &env2);
        same.store(getStatus == ANI_OK && env1 == env2);
        vm->DetachCurrentThread();
    });
    worker.join();
    return same.load() ? ANI_TRUE : ANI_FALSE;
}
#include "TcLifecycleTestPart2.h"
#endif
