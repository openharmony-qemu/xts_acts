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

#ifndef ANI_TC_MT_TEST_H
#define ANI_TC_MT_TEST_H
#include "Common.h"
#include <atomic>
#include <chrono>
#include <iostream>
#include <mutex>
#include <string>
#include <thread>
#include <vector>
namespace ani_tc_mt {
inline std::atomic<int> g_mtCounter {0};
inline std::mutex g_mtMutex;
inline ani_vm *g_mtVm = nullptr;
constexpr int MT_SLEEP_SHORT_MS = 10;
constexpr ani_int MT_PROMISE_RESOLVE_VALUE = 100;
constexpr ani_int MT_THREAD_PROMISE_VALUE = 300;
constexpr ani_int MT_OTHER_THREAD_PROMISE_VALUE = 1000;
constexpr ani_int MT_COMPUTE_FACTOR = 2;
constexpr ani_int MT_FIND_CLASS_SYSTEM_ONLY = 1;
constexpr ani_int MT_FIND_CLASS_BOTH = 2;
constexpr ani_int MT_FIND_CLASS_NONE = 0;
constexpr ani_size MT_LOCAL_SCOPE_SIZE = 8;
inline ani_string MtNewString(ani_env *env, const std::string &value)
{
    ani_string result {};
    ani_status status = env->String_NewUTF8(value.c_str(), value.size(), &result);
    if (!AssertEqMsg(status, ANI_OK, "String_NewUTF8 failed")) {
        return nullptr;
    }
    return result;
}
inline ani_object MtBoxInt(ani_env *env, ani_int value)
{
    ani_object result {};
    ani_status status = env->Primitive_Box_Int(value, &result);
    if (!AssertEqMsg(status, ANI_OK, "Primitive_Box_Int failed")) {
        return nullptr;
    }
    return result;
}
ani_error MtCreateError(ani_env *env, const std::string &message)
{
    ani_class errorCls {};
    ani_status status = env->FindClass("std.core.Error", &errorCls);
    if (status != ANI_OK) {
        status = env->FindClass("escompat.Error", &errorCls);
    }
    if (!AssertEqMsg(status, ANI_OK, "Find Error class failed")) {
        return nullptr;
    }
    ani_method ctor {};
    status = env->Class_FindMethod(errorCls, "<ctor>", "C{std.core.String}:", &ctor);
    if (!AssertEqMsg(status, ANI_OK, "Find Error constructor failed")) {
        return nullptr;
    }
    ani_string msg = MtNewString(env, message);
    ani_object errObj {};
    status = env->Object_New(errorCls, ctor, &errObj, msg);
    if (!AssertEqMsg(status, ANI_OK, "Create Error object failed")) {
        return nullptr;
    }
    return static_cast<ani_error>(errObj);
}
}
ani_object test_MtCreateAndResolvePromise(ani_env *env, ani_object object)
{
    (void)object;
    ani_resolver resolver {};
    ani_object promise {};
    ani_status status = env->Promise_New(&resolver, &promise);
    if (!AssertEqMsg(status, ANI_OK, "Promise_New failed")) {
        return nullptr;
    }
    ani_object value = ani_tc_mt::MtBoxInt(env, ani_tc_mt::MT_PROMISE_RESOLVE_VALUE);
    status = env->PromiseResolver_Resolve(resolver, static_cast<ani_ref>(value));
    if (!AssertEqMsg(status, ANI_OK, "PromiseResolver_Resolve failed")) {
        return promise;
    }
    return promise;
}
ani_object test_MtCreateAndRejectPromise(ani_env *env, ani_object object)
{
    (void)object;
    ani_resolver resolver {};
    ani_object promise {};
    ani_status status = env->Promise_New(&resolver, &promise);
    if (!AssertEqMsg(status, ANI_OK, "Promise_New failed")) {
        return nullptr;
    }
    ani_error error = ani_tc_mt::MtCreateError(env, "Native promise rejected");
    status = env->PromiseResolver_Reject(resolver, error);
    if (!AssertEqMsg(status, ANI_OK, "PromiseResolver_Reject failed")) {
        return promise;
    }
    return promise;
}
ani_object test_MtAsyncWorkInThread(ani_env *env, ani_object object)
{
    (void)object;
    ani_resolver resolver {};
    ani_object promise {};
    ani_status status = env->Promise_New(&resolver, &promise);
    if (!AssertEqMsg(status, ANI_OK, "Promise_New failed")) {
        return nullptr;
    }
    ani_vm *vm = nullptr;
    status = env->GetVM(&vm);
    if (!AssertEqMsg(status, ANI_OK, "GetVM failed")) {
        return promise;
    }
    std::thread([vm, resolver]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            return;
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(ani_tc_mt::MT_SLEEP_SHORT_MS));
        ani_object value = ani_tc_mt::MtBoxInt(threadEnv, ani_tc_mt::MT_THREAD_PROMISE_VALUE);
        threadEnv->PromiseResolver_Resolve(resolver, static_cast<ani_ref>(value));
        vm->DetachCurrentThread();
    }).detach();
    return promise;
}
ani_int test_MtCompute(ani_env *env, ani_object object, ani_int input)
{
    (void)env;
    (void)object;
    std::this_thread::sleep_for(std::chrono::milliseconds(ani_tc_mt::MT_SLEEP_SHORT_MS));
    return input * ani_tc_mt::MT_COMPUTE_FACTOR;
}
ani_boolean test_MtUseEnvAcrossThread(ani_env *env, ani_object object)
{
    (void)object;
    ani_boolean finished = ANI_FALSE;
    ani_env *capturedEnv = env;
    std::thread([capturedEnv, &finished]() {
        ani_string str {};
        ani_status status = capturedEnv->String_NewUTF8("bad-env-cross-thread",
            std::strlen("bad-env-cross-thread"), &str);
        finished = status == ANI_OK ? ANI_TRUE : ANI_FALSE;
    }).join();
    return finished;
}
ani_boolean test_MtUseVmAttachThread(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean success = ANI_FALSE;
    std::thread([vm, &success]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            success = ANI_FALSE;
            return;
        }
        ani_string str {};
        const char *text = "attach-thread";
        ani_status stringStatus = threadEnv->String_NewUTF8(text, std::strlen(text), &str);
        success = stringStatus == ANI_OK ? ANI_TRUE : ANI_FALSE;
        vm->DetachCurrentThread();
    }).join();
    return success;
}
ani_boolean test_MtAttachGetEnvSame(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean same = ANI_FALSE;
    std::thread([vm, &same]() {
        ani_env *env1 = nullptr;
        ani_env *env2 = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &env1);
        ani_status getStatus = vm->GetEnv(ANI_VERSION_1, &env2);
        same = (attachStatus == ANI_OK && getStatus == ANI_OK && env1 == env2) ? ANI_TRUE : ANI_FALSE;
        vm->DetachCurrentThread();
    }).join();
    return same;
}
ani_boolean test_MtAttachWithoutDetach(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_status status = env->GetVM(&ani_tc_mt::g_mtVm);
    if (status != ANI_OK || ani_tc_mt::g_mtVm == nullptr) {
        return ANI_FALSE;
    }
    for (ani_int i = 0; i < count; i++) {
        std::thread([]() {
            ani_env *threadEnv = nullptr;
            ani_status attachStatus = ani_tc_mt::g_mtVm->AttachCurrentThread(
                nullptr, ANI_VERSION_1, &threadEnv);
            if (attachStatus != ANI_OK || threadEnv == nullptr) {
                return;
            }
            ani_string str {};
            const char *text = "leak-thread-env";
            threadEnv->String_NewUTF8(text, std::strlen(text), &str);
        }).join();
    }
    return ANI_TRUE;
}
ani_boolean test_MtLocalRefWithoutScope(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean success = ANI_FALSE;
    std::thread([vm, count, &success]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            success = ANI_FALSE;
            return;
        }
        for (ani_int i = 0; i < count; i++) {
            ani_string str {};
            std::string text = "local-ref-no-scope-" + std::to_string(i);
            threadEnv->String_NewUTF8(text.c_str(), text.size(), &str);
        }
        success = ANI_TRUE;
        vm->DetachCurrentThread();
    }).join();
    return success;
}
ani_boolean test_MtLocalRefWithScope(ani_env *env, ani_object object, ani_int count)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean success = ANI_FALSE;
    std::thread([vm, count, &success]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            success = ANI_FALSE;
            return;
        }
        for (ani_int i = 0; i < count; i++) {
            threadEnv->CreateLocalScope(ani_tc_mt::MT_LOCAL_SCOPE_SIZE);
            ani_string str {};
            std::string text = "local-ref-with-scope-" + std::to_string(i);
            threadEnv->String_NewUTF8(text.c_str(), text.size(), &str);
            threadEnv->DestroyLocalScope();
        }
        success = ANI_TRUE;
        vm->DetachCurrentThread();
    }).join();
    return success;
}
ani_int test_MtConcurrentAttachCounter(ani_env *env, ani_object object, ani_int threadCount, ani_int increment)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK) {
        return -1;
    }
    ani_tc_mt::g_mtCounter.store(0);
    std::vector<std::thread> threads;
    for (ani_int i = 0; i < threadCount; i++) {
        threads.emplace_back([vm, increment]() {
            ani_env *threadEnv = nullptr;
            ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
            if (attachStatus != ANI_OK || threadEnv == nullptr) {
                return;
            }
            for (ani_int j = 0; j < increment; j++) {
                ani_tc_mt::g_mtCounter.fetch_add(1);
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &thread : threads) {
        thread.join();
    }
    return ani_tc_mt::g_mtCounter.load();
}
ani_object test_MtResolvePromiseOnOtherThread(ani_env *env, ani_object object)
{
    (void)object;
    ani_resolver resolver {};
    ani_object promise {};
    ani_status status = env->Promise_New(&resolver, &promise);
    if (status != ANI_OK) {
        return nullptr;
    }
    ani_vm *vm = nullptr;
    status = env->GetVM(&vm);
    if (status != ANI_OK) {
        return promise;
    }
    std::thread([vm, resolver]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            return;
        }
        ani_object value = ani_tc_mt::MtBoxInt(threadEnv, ani_tc_mt::MT_OTHER_THREAD_PROMISE_VALUE);
        threadEnv->PromiseResolver_Resolve(resolver, static_cast<ani_ref>(value));
        vm->DetachCurrentThread();
    }).detach();
    return promise;
}
ani_int test_MtTaskpoolSafeAdd(ani_env *env, ani_object object, ani_int value)
{
    (void)env;
    (void)object;
    std::lock_guard<std::mutex> lock(ani_tc_mt::g_mtMutex);
    ani_tc_mt::g_mtCounter.fetch_add(value);
    return ani_tc_mt::g_mtCounter.load();
}
ani_int test_MtFindClassInNativeThread(ani_env *env, ani_object object)
{
    (void)object;
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status != ANI_OK) {
        return -1;
    }
    ani_int result = 0;
    std::thread([vm, &result]() {
        ani_env *threadEnv = nullptr;
        ani_status attachStatus = vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv);
        if (attachStatus != ANI_OK || threadEnv == nullptr) {
            result = -1;
            return;
        }
        ani_class stringCls {};
        ani_status stringStatus = threadEnv->FindClass("std.core.String", &stringCls);
        ani_class appCls {};
        ani_status appStatus = threadEnv->FindClass("entry.src.main.src.ets.Index.MyClass", &appCls);
        if (stringStatus == ANI_OK && appStatus != ANI_OK) {
            result = ani_tc_mt::MT_FIND_CLASS_SYSTEM_ONLY;
        } else if (stringStatus == ANI_OK && appStatus == ANI_OK) {
            result = ani_tc_mt::MT_FIND_CLASS_BOTH;
        } else {
            result = ani_tc_mt::MT_FIND_CLASS_NONE;
        }
        vm->DetachCurrentThread();
    }).join();
    return result;
}
#endif
