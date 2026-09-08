/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef ARKTS_ANI_TEST_FUNCCALLCOVERED_H
#define ARKTS_ANI_TEST_FUNCCALLCOVERED_H

#include "Common.h"
#include "hilog/log.h"
#include <atomic>
#include <thread>
#include <vector>

constexpr int P5_THREAD_COUNT = 4;
constexpr const char *P5_METHOD_FORMS = "entry.src.main.src.ets.Index.ClassDefCompleteMethodForms";
constexpr ani_int P5_CALL_ARG_VALUE = 5;
constexpr ani_int P5_VERIFY_ARG_VALUE = 7;

ani_boolean P5CreateInstance(ani_env *env, ani_class *outCls, ani_method *outMethod, ani_object *outObj)
{
    ani_class cls{};
    if (env->FindClass(P5_METHOD_FORMS, &cls) != ANI_OK || cls == nullptr) {
        return ANI_FALSE;
    }
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", ":", &ctor) != ANI_OK || ctor == nullptr) {
        return ANI_FALSE;
    }
    ani_object obj{};
    if (env->Object_New(cls, ctor, &obj) != ANI_OK || obj == nullptr) {
        return ANI_FALSE;
    }
    ani_method method{};
    if (env->Class_FindMethod(cls, "instanceMethod", "i:i", &method) != ANI_OK || method == nullptr) {
        return ANI_FALSE;
    }
    *outCls = cls;
    *outMethod = method;
    *outObj = obj;
    return ANI_TRUE;
}

ani_boolean P5FindStatic(ani_env *env, ani_class *outCls, ani_static_method *outMethod)
{
    ani_class cls{};
    if (env->FindClass(P5_METHOD_FORMS, &cls) != ANI_OK || cls == nullptr) {
        return ANI_FALSE;
    }
    ani_static_method method{};
    if (env->Class_FindStaticMethod(cls, "staticMethod", "i:i", &method) != ANI_OK || method == nullptr) {
        return ANI_FALSE;
    }
    *outCls = cls;
    *outMethod = method;
    return ANI_TRUE;
}

// ============================================================
// Section 1: Object_CallMethod (30 tests = 10 types x 3 variants)
// ============================================================

ani_int test_FuncCall_ObjCall_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_boolean result = ANI_FALSE;
                tEnv->Object_CallMethod_Boolean(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Boolean_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_boolean result = ANI_FALSE;
                tEnv->Object_CallMethod_Boolean_A(obj, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Boolean_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Boolean_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Boolean_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_byte result = 0;
                tEnv->Object_CallMethod_Byte(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Byte_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_byte result = 0;
                tEnv->Object_CallMethod_Byte_A(obj, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Byte_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Byte_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Byte_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_char result = 0;
                tEnv->Object_CallMethod_Char(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Char_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_char result = 0;
                tEnv->Object_CallMethod_Char_A(obj, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Char_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Char_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Char_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_short result = 0;
                tEnv->Object_CallMethod_Short(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Short_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_short result = 0;
                tEnv->Object_CallMethod_Short_A(obj, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Short_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Short_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Short_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_int result = 0;
                tEnv->Object_CallMethod_Int(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Int_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_int result = 0;
                tEnv->Object_CallMethod_Int_A(obj, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Int_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Int_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Int_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_long result = 0;
                tEnv->Object_CallMethod_Long(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Long_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_value args[1]{};
            ani_long result = 0;
            tEnv->Object_CallMethod_Long_A(obj, method, &result, args);
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Long_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Long_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Long_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_float result = 0.0f;
                tEnv->Object_CallMethod_Float(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Float_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_float result = 0.0f;
                tEnv->Object_CallMethod_Float_A(obj, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Float_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Float_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Float_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_double result = 0.0;
                tEnv->Object_CallMethod_Double(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Double_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_double result = 0.0;
                tEnv->Object_CallMethod_Double_A(obj, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Double_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Double_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Double_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_ref result{};
                tEnv->Object_CallMethod_Ref(obj, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Ref_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_ref result{};
                tEnv->Object_CallMethod_Ref_A(obj, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Ref_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Ref_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Ref_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Void_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                tEnv->Object_CallMethod_Void(obj, method, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Void_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_method method{};
    ani_object obj{};
    if (!P5CreateInstance(env, &cls, &method, &obj)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method, obj]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                tEnv->Object_CallMethod_Void_A(obj, method, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_ObjCall_Void_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_ObjCall_Void_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Object_CallMethod_Void_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 2: Class_CallStaticMethod (30 tests = 10 types x 3 variants)
// ============================================================

ani_int test_FuncCall_StaticCall_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_boolean result = ANI_FALSE;
                tEnv->Class_CallStaticMethod_Boolean(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Boolean_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_boolean result = ANI_FALSE;
                tEnv->Class_CallStaticMethod_Boolean_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Boolean_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Boolean_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Boolean_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_byte result = 0;
                tEnv->Class_CallStaticMethod_Byte(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Byte_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_byte result = 0;
                tEnv->Class_CallStaticMethod_Byte_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Byte_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Byte_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Byte_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_char result = 0;
                tEnv->Class_CallStaticMethod_Char(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Char_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_char result = 0;
                tEnv->Class_CallStaticMethod_Char_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Char_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Char_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Char_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_short result = 0;
                tEnv->Class_CallStaticMethod_Short(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Short_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_short result = 0;
                tEnv->Class_CallStaticMethod_Short_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Short_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Short_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Short_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_int result = 0;
                tEnv->Class_CallStaticMethod_Int(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Int_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_int result = 0;
                tEnv->Class_CallStaticMethod_Int_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Int_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Int_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Int_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_long result = 0;
                tEnv->Class_CallStaticMethod_Long(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Long_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_long result = 0;
                tEnv->Class_CallStaticMethod_Long_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Long_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Long_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Long_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_float result = 0.0f;
                tEnv->Class_CallStaticMethod_Float(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Float_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_float result = 0.0f;
                tEnv->Class_CallStaticMethod_Float_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Float_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Float_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Float_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_double result = 0.0;
                tEnv->Class_CallStaticMethod_Double(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Double_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_double result = 0.0;
                tEnv->Class_CallStaticMethod_Double_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Double_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Double_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Double_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_ref result{};
                tEnv->Class_CallStaticMethod_Ref(cls, method, &result, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Ref_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                ani_ref result{};
                tEnv->Class_CallStaticMethod_Ref_A(cls, method, &result, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Ref_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Ref_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Ref_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Void_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                tEnv->Class_CallStaticMethod_Void(cls, method, P5_CALL_ARG_VALUE);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Void_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class cls{};
    ani_static_method method{};
    if (!P5FindStatic(env, &cls, &method)) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_value args[1]{};
                tEnv->Class_CallStaticMethod_Void_A(cls, method, args);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncCall_StaticCall_Void_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Void_V_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethod_Void_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 3: Combo (1 test)
// ============================================================

ani_int test_FuncCall_StaticCall_Combo(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncCall_StaticCall_Combo GetVM failed");
        return ANI_FALSE;
    }
    ani_class cls{};
    if (env->FindClass(P5_METHOD_FORMS, &cls) != ANI_OK || cls == nullptr) {
        return ANI_FALSE;
    }
    ani_static_method method{};
    if (env->Class_FindStaticMethod(cls, "staticMethod", "i:i", &method) != ANI_OK || method == nullptr) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P5_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, cls, method]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_int result = 0;
                if (tEnv->Class_CallStaticMethod_Int(cls, method, &result, P5_VERIFY_ARG_VALUE) == ANI_OK &&
                    result == P5_VERIFY_ARG_VALUE) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    OH_LOG_INFO(LOG_APP, "testTag : FuncCall_StaticCall_Combo successCount=%{public}d", successCount.load());
    return successCount.load() == P5_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

#endif // ARKTS_ANI_TEST_FUNCCALLCOVERED_H
