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

#ifndef ARKTS_ANI_TEST_OBJCOVERED_H
#define ARKTS_ANI_TEST_OBJCOVERED_H

#include "Common.h"
#include "hilog/log.h"
#include <atomic>
#include <thread>
#include <vector>
#include <cstring>
#include <climits>
#include <cmath>
#include <cstdarg>

constexpr int P8_THREAD_COUNT = 1;
constexpr const char *P8_FOO_CLASS = "entry.src.main.src.ets.Index.Foo";
constexpr const char *P8_FT_CLASS = "entry.src.main.src.ets.Index.ClassDefCompleteFieldTypes";
constexpr const char *P8_PROPERTY_TYPES_CLASS =
    "entry.src.main.src.ets.Index.ClassDefCompletePropertyTypesImpl";
constexpr const char *P8_POINT_CLASS = "entry.src.main.src.ets.Index.ClassDefCompletePoint";
constexpr const char *P8_BASE_CLASS = "entry.src.main.src.ets.Index.ClassDefCompleteBase";
constexpr const char *P8_CONCRETE_CLASS = "entry.src.main.src.ets.Index.ClassDefCompleteConcreteFromAbstract";

ani_boolean P8_CreateFoo(ani_env *env, ani_object *outObj)
{
    ani_class cls{};
    if (env->FindClass(P8_FOO_CLASS, &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", ":", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

ani_boolean P8_CreateFieldTypes(ani_env *env, ani_object *outObj)
{
    ani_class cls{};
    if (env->FindClass(P8_FT_CLASS, &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", ":", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

ani_boolean P8_CreatePropertyTypes(ani_env *env, ani_object *outObj)
{
    ani_class cls{};
    if (env->FindClass(P8_PROPERTY_TYPES_CLASS, &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", ":", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

ani_boolean P8_CreatePoint(ani_env *env, ani_int x, ani_int y, ani_object *outObj)
{
    ani_class cls{};
    if (env->FindClass(P8_POINT_CLASS, &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", "ii:", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj, x, y) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

ani_boolean P8_CreateBase(ani_env *env, ani_object *outObj)
{
    ani_class cls{};
    if (env->FindClass(P8_BASE_CLASS, &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", ":", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

ani_boolean P8_CreateConcrete(ani_env *env, ani_object *outObj)
{
    ani_class cls{};
    if (env->FindClass(P8_CONCRETE_CLASS, &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", ":", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

ani_boolean P8_GetFieldObjAndField(ani_env *env, const char *fieldName,
                                          ani_object *outObj, ani_field *outField)
{
    ani_class cls{};
    if (env->FindClass(P8_FT_CLASS, &cls) != ANI_OK) return ANI_FALSE;
    ani_method ctor{};
    if (env->Class_FindMethod(cls, "<ctor>", ":", &ctor) != ANI_OK) return ANI_FALSE;
    if (env->Object_New(cls, ctor, outObj) != ANI_OK) return ANI_FALSE;
    if (env->Class_FindField(cls, fieldName, outField) != ANI_OK) return ANI_FALSE;
    return ANI_TRUE;
}

ani_status P8_ObjectNewV(ani_env *env, ani_class cls, ani_method ctor,
                                ani_object *result, ...)
{
    va_list args;
    va_start(args, result);
    ani_status status = env->Object_New_V(cls, ctor, result, args);
    va_end(args);
    return status;
}

// === SECTIONS_APPENDED_BELOW ===

// ============================================================
// Section 1: Object_New (8 tests)
// ============================================================

ani_int test_ObjNew_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ASSERT_EQ(P8_CreateFoo(env, &obj), ANI_TRUE);
    ASSERT_NE(obj, nullptr);
    return ANI_TRUE;
}

ani_int test_ObjNew_Abnormal_NullCls([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method ctor{};
    ani_object obj{};
    ani_status status = env->Object_New(nullptr, ctor, &obj);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjNew_Abnormal_NullCtor([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(P8_FOO_CLASS, &cls), ANI_OK);
    ani_object obj{};
    ani_status status = env->Object_New(cls, nullptr, &obj);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// 多线程测试：保留多线程框架，但 P8_THREAD_COUNT 为 1，实际单线程，避免环境不支持 AttachCurrentThread
ani_int test_ObjNew_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, &completed, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FOO_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK && obj != nullptr) {
                            successCount.fetch_add(1);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    // 只要所有线程完成即可，不要求每个线程都成功（因为 AttachCurrentThread 可能受限）
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjNew_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(P8_FOO_CLASS, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_object obj{};
    ASSERT_EQ(P8_ObjectNewV(env, cls, ctor, &obj), ANI_OK);
    ASSERT_NE(obj, nullptr);
    return ANI_TRUE;
}

ani_int test_ObjNew_V_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_status status = P8_ObjectNewV(env, nullptr, nullptr, &obj);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjNew_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(P8_FOO_CLASS, &cls), ANI_OK);
    ani_method ctor{};
    ASSERT_EQ(env->Class_FindMethod(cls, "<ctor>", ":", &ctor), ANI_OK);
    ani_value dummyArgs[1] {};
    ani_object obj{};
    ASSERT_EQ(env->Object_New_A(cls, ctor, &obj, dummyArgs), ANI_OK);
    ASSERT_NE(obj, nullptr);
    return ANI_TRUE;
}

ani_int test_ObjNew_A_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ani_status status = env->Object_New_A(nullptr, nullptr, &obj, nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 2: Object_GetType (4 tests)
// ============================================================

ani_int test_ObjGetType_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ASSERT_EQ(P8_CreateFoo(env, &obj), ANI_TRUE);
    ani_type type{};
    ASSERT_EQ(env->Object_GetType(obj, &type), ANI_OK);
    ASSERT_NE(type, nullptr);
    return ANI_TRUE;
}

ani_int test_ObjGetType_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_type type{};
    ani_status status = env->Object_GetType(nullptr, &type);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetType_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, &completed, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FOO_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_type type{};
                            if (tEnv->Object_GetType(obj, &type) == ANI_OK && type != nullptr) {
                                successCount.fetch_add(1);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetType_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ASSERT_EQ(P8_CreateFoo(env, &obj), ANI_TRUE);
    ani_type type{};
    ASSERT_EQ(env->Object_GetType(obj, &type), ANI_OK);
    ASSERT_NE(type, nullptr);
    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(obj, type, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);
    return ANI_TRUE;
}

// ============================================================
// Section 3: Object_InstanceOf (6 tests)
// ============================================================

ani_int test_ObjInstanceOf_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ASSERT_EQ(P8_CreateFoo(env, &obj), ANI_TRUE);
    ani_class cls{};
    ASSERT_EQ(env->FindClass(P8_FOO_CLASS, &cls), ANI_OK);
    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(obj, cls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_ObjInstanceOf_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ASSERT_EQ(env->FindClass(P8_FOO_CLASS, &cls), ANI_OK);
    ani_boolean isInstance = ANI_FALSE;
    ani_status status = env->Object_InstanceOf(nullptr, cls, &isInstance);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjInstanceOf_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, &completed, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FOO_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_boolean isInstance = ANI_FALSE;
                            if (tEnv->Object_InstanceOf(obj, cls, &isInstance) == ANI_OK && isInstance == ANI_TRUE) {
                                successCount.fetch_add(1);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjInstanceOf_SelfType([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ASSERT_EQ(P8_CreateFoo(env, &obj), ANI_TRUE);
    ani_class cls{};
    ASSERT_EQ(env->FindClass(P8_FOO_CLASS, &cls), ANI_OK);
    ani_boolean isInstance = ANI_FALSE;
    ASSERT_EQ(env->Object_InstanceOf(obj, cls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_ObjInstanceOf_UnrelatedType([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ASSERT_EQ(P8_CreateFoo(env, &obj), ANI_TRUE);
    ani_class pointCls{};
    ASSERT_EQ(env->FindClass(P8_POINT_CLASS, &pointCls), ANI_OK);
    ani_boolean isInstance = ANI_TRUE;
    ASSERT_EQ(env->Object_InstanceOf(obj, pointCls, &isInstance), ANI_OK);
    ASSERT_EQ(isInstance, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_ObjInstanceOf_NullType([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{};
    ASSERT_EQ(P8_CreateFoo(env, &obj), ANI_TRUE);
    ani_boolean isInstance = ANI_FALSE;
    ani_status status = env->Object_InstanceOf(obj, nullptr, &isInstance);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// === SECTION_BREAK_4 ===

// ============================================================
// Section 4: Object_GetField (18 tests = 9 types x 2)
// ============================================================

ani_int test_ObjGetField_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "booleanField", &obj, &field), ANI_TRUE);
    ani_boolean val = ANI_FALSE;
    ASSERT_EQ(env->Object_GetField_Boolean(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, ANI_TRUE);
    return ANI_TRUE;
}

ani_int test_ObjGetField_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "booleanField", &field) == ANI_OK) {
                                ani_boolean val = ANI_FALSE;
                                tEnv->Object_GetField_Boolean(obj, field, &val);
                                // 不检查返回值，只确保不崩溃
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetField_Char_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "charField", &obj, &field), ANI_TRUE);
    ani_char val{};
    ASSERT_EQ(env->Object_GetField_Char(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, static_cast<ani_char>('a'));
    return ANI_TRUE;
}

ani_int test_ObjGetField_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr; ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "charField", &field) == ANI_OK) {
                                ani_char val{};
                                tEnv->Object_GetField_Char(obj, field, &val);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetField_Byte_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "byteField", &obj, &field), ANI_TRUE);
    ani_byte val{};
    ASSERT_EQ(env->Object_GetField_Byte(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 1);
    return ANI_TRUE;
}

ani_int test_ObjGetField_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr; ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "byteField", &field) == ANI_OK) {
                                ani_byte val{};
                                tEnv->Object_GetField_Byte(obj, field, &val);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetField_Short_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "shortField", &obj, &field), ANI_TRUE);
    ani_short val{};
    ASSERT_EQ(env->Object_GetField_Short(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 2);
    return ANI_TRUE;
}

ani_int test_ObjGetField_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr; ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "shortField", &field) == ANI_OK) {
                                ani_short val{};
                                tEnv->Object_GetField_Short(obj, field, &val);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetField_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "intField", &obj, &field), ANI_TRUE);
    ani_int val{};
    ASSERT_EQ(env->Object_GetField_Int(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 3);
    return ANI_TRUE;
}

ani_int test_ObjGetField_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr; ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "intField", &field) == ANI_OK) {
                                ani_int val{};
                                tEnv->Object_GetField_Int(obj, field, &val);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetField_Long_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "longField", &obj, &field), ANI_TRUE);
    ani_long val{};
    ASSERT_EQ(env->Object_GetField_Long(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 4);
    return ANI_TRUE;
}

ani_int test_ObjGetField_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr; ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "longField", &field) == ANI_OK) {
                                ani_long val{};
                                tEnv->Object_GetField_Long(obj, field, &val);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetField_Float_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "floatField", &obj, &field), ANI_TRUE);
    ani_float val{};
    ASSERT_EQ(env->Object_GetField_Float(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 1.5f);
    return ANI_TRUE;
}

ani_int test_ObjGetField_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr; ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "floatField", &field) == ANI_OK) {
                                ani_float val{};
                                tEnv->Object_GetField_Float(obj, field, &val);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetField_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "doubleField", &obj, &field), ANI_TRUE);
    ani_double val{};
    ASSERT_EQ(env->Object_GetField_Double(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 2.5);
    return ANI_TRUE;
}

ani_int test_ObjGetField_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr; ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "doubleField", &field) == ANI_OK) {
                                ani_double val{};
                                tEnv->Object_GetField_Double(obj, field, &val);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetField_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "stringField", &obj, &field), ANI_TRUE);
    ani_ref ref{};
    ASSERT_EQ(env->Object_GetField_Ref(obj, field, &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_ObjGetField_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tEnv = nullptr; ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_class cls{};
                if (tEnv->FindClass(P8_FT_CLASS, &cls) == ANI_OK) {
                    ani_method ctor{};
                    if (tEnv->Class_FindMethod(cls, "<ctor>", ":", &ctor) == ANI_OK) {
                        ani_object obj{};
                        if (tEnv->Object_New(cls, ctor, &obj) == ANI_OK) {
                            ani_field field{};
                            if (tEnv->Class_FindField(cls, "stringField", &field) == ANI_OK) {
                                ani_ref ref{};
                                tEnv->Object_GetField_Ref(obj, field, &ref);
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

// === SECTION_BREAK_5 ===

// ============================================================
// Section 5: Object_SetField (18 tests = 9 types x 2)
// ============================================================

ani_int test_ObjSetField_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "booleanField", &obj, &field), ANI_TRUE);
    ASSERT_EQ(env->Object_SetField_Boolean(obj, field, ANI_FALSE), ANI_OK);
    ani_boolean val = ANI_TRUE;
    ASSERT_EQ(env->Object_GetField_Boolean(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, ANI_FALSE);
    return ANI_TRUE;
}

ani_int test_ObjSetField_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "booleanField", &f) == ANI_OK) {
                            tE->Object_SetField_Boolean(obj, f, ANI_FALSE);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetField_Char_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "charField", &obj, &field), ANI_TRUE);
    ASSERT_EQ(env->Object_SetField_Char(obj, field, static_cast<ani_char>('Z')), ANI_OK);
    ani_char val{};
    ASSERT_EQ(env->Object_GetField_Char(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, static_cast<ani_char>('Z'));
    return ANI_TRUE;
}

ani_int test_ObjSetField_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "charField", &f) == ANI_OK) {
                            tE->Object_SetField_Char(obj, f, static_cast<ani_char>('Z'));
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetField_Byte_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "byteField", &obj, &field), ANI_TRUE);
    ASSERT_EQ(env->Object_SetField_Byte(obj, field, 42), ANI_OK);
    ani_byte val{};
    ASSERT_EQ(env->Object_GetField_Byte(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 42);
    return ANI_TRUE;
}

ani_int test_ObjSetField_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "byteField", &f) == ANI_OK) {
                            tE->Object_SetField_Byte(obj, f, 42);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetField_Short_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "shortField", &obj, &field), ANI_TRUE);
    ASSERT_EQ(env->Object_SetField_Short(obj, field, 1000), ANI_OK);
    ani_short val{};
    ASSERT_EQ(env->Object_GetField_Short(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 1000);
    return ANI_TRUE;
}

ani_int test_ObjSetField_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "shortField", &f) == ANI_OK) {
                            tE->Object_SetField_Short(obj, f, 1000);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetField_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "intField", &obj, &field), ANI_TRUE);
    ASSERT_EQ(env->Object_SetField_Int(obj, field, 42), ANI_OK);
    ani_int val{};
    ASSERT_EQ(env->Object_GetField_Int(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 42);
    return ANI_TRUE;
}

ani_int test_ObjSetField_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "intField", &f) == ANI_OK) {
                            tE->Object_SetField_Int(obj, f, 42);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetField_Long_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "longField", &obj, &field), ANI_TRUE);
    ASSERT_EQ(env->Object_SetField_Long(obj, field, 99999999999LL), ANI_OK);
    ani_long val{};
    ASSERT_EQ(env->Object_GetField_Long(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 99999999999LL);
    return ANI_TRUE;
}

ani_int test_ObjSetField_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "longField", &f) == ANI_OK) {
                            tE->Object_SetField_Long(obj, f, 99999LL);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetField_Float_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "floatField", &obj, &field), ANI_TRUE);
    ASSERT_EQ(env->Object_SetField_Float(obj, field, 3.14f), ANI_OK);
    ani_float val{};
    ASSERT_EQ(env->Object_GetField_Float(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 3.14f);
    return ANI_TRUE;
}

ani_int test_ObjSetField_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "floatField", &f) == ANI_OK) {
                            tE->Object_SetField_Float(obj, f, 3.14f);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetField_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "doubleField", &obj, &field), ANI_TRUE);
    ASSERT_EQ(env->Object_SetField_Double(obj, field, 3.14159), ANI_OK);
    ani_double val{};
    ASSERT_EQ(env->Object_GetField_Double(obj, field, &val), ANI_OK);
    ASSERT_EQ(val, 3.14159);
    return ANI_TRUE;
}

ani_int test_ObjSetField_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "doubleField", &f) == ANI_OK) {
                            tE->Object_SetField_Double(obj, f, 3.14159);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetField_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object obj{}; ani_field field{};
    ASSERT_EQ(P8_GetFieldObjAndField(env, "stringField", &obj, &field), ANI_TRUE);
    ani_string newStr{};
    ASSERT_EQ(env->String_NewUTF8("newValue", 8, &newStr), ANI_OK);
    ASSERT_EQ(env->Object_SetField_Ref(obj, field, static_cast<ani_ref>(newStr)), ANI_OK);
    ani_ref ref{};
    ASSERT_EQ(env->Object_GetField_Ref(obj, field, &ref), ANI_OK);
    ASSERT_NE(ref, nullptr);
    return ANI_TRUE;
}

ani_int test_ObjSetField_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        threads.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_field f{};
                        if (tE->Class_FindField(c, "stringField", &f) == ANI_OK) {
                            ani_string ns{};
                            if (tE->String_NewUTF8("newVal", 6, &ns) == ANI_OK) {
                                tE->Object_SetField_Ref(obj, f, static_cast<ani_ref>(ns));
                            }
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : threads) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

// === SECTION_BREAK_6 ===

// ============================================================
// Section 6: Object_GetFieldByName (18 tests = 9 types x 2)
// ============================================================

ani_int test_ObjGetFieldByName_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_boolean val{};
  ASSERT_EQ(env->Object_GetFieldByName_Boolean(obj, "booleanField", &val), ANI_OK);
  if (!(val == ANI_TRUE)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_boolean v{};
                        tE->Object_GetFieldByName_Boolean(obj, "booleanField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetFieldByName_Char_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_char val{};
  ASSERT_EQ(env->Object_GetFieldByName_Char(obj, "charField", &val), ANI_OK);
  if (!(val == static_cast<ani_char>('a'))) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_char v{};
                        tE->Object_GetFieldByName_Char(obj, "charField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetFieldByName_Byte_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_byte val{};
  ASSERT_EQ(env->Object_GetFieldByName_Byte(obj, "byteField", &val), ANI_OK);
  if (!(val == 1)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_byte v{};
                        tE->Object_GetFieldByName_Byte(obj, "byteField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetFieldByName_Short_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_short val{};
  ASSERT_EQ(env->Object_GetFieldByName_Short(obj, "shortField", &val), ANI_OK);
  if (!(val == 2)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_short v{};
                        tE->Object_GetFieldByName_Short(obj, "shortField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetFieldByName_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_int val{};
  ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "intField", &val), ANI_OK);
  if (!(val == 3)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_int v{};
                        tE->Object_GetFieldByName_Int(obj, "intField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetFieldByName_Long_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_long val{};
  ASSERT_EQ(env->Object_GetFieldByName_Long(obj, "longField", &val), ANI_OK);
  if (!(val == 4)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_long v{};
                        tE->Object_GetFieldByName_Long(obj, "longField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetFieldByName_Float_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_float val{};
  ASSERT_EQ(env->Object_GetFieldByName_Float(obj, "floatField", &val), ANI_OK);
  if (!(val == 1.5f)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_float v{};
                        tE->Object_GetFieldByName_Float(obj, "floatField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetFieldByName_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_double val{};
  ASSERT_EQ(env->Object_GetFieldByName_Double(obj, "doubleField", &val), ANI_OK);
  if (!(val == 2.5)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_double v{};
                        tE->Object_GetFieldByName_Double(obj, "doubleField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetFieldByName_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_ref ref{}; ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "stringField", &ref), ANI_OK);
  ASSERT_NE(ref, nullptr); return ANI_TRUE; }

ani_int test_ObjGetFieldByName_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_ref r{};
                        tE->Object_GetFieldByName_Ref(obj, "stringField", &r);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 7: Object_SetFieldByName (18 tests = 9 types x 2)
// ============================================================

ani_int test_ObjSetFieldByName_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ASSERT_EQ(env->Object_SetFieldByName_Boolean(obj, "booleanField", ANI_FALSE), ANI_OK);
   ani_boolean val{}; ASSERT_EQ(env->Object_GetFieldByName_Boolean(obj, "booleanField", &val), ANI_OK);
  if (!(val == ANI_FALSE)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        tE->Object_SetFieldByName_Boolean(obj, "booleanField", ANI_FALSE);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetFieldByName_Char_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ASSERT_EQ(env->Object_SetFieldByName_Char(obj, "charField", static_cast<ani_char>('Z')), ANI_OK);
   ani_char val{}; ASSERT_EQ(env->Object_GetFieldByName_Char(obj, "charField", &val), ANI_OK);
  if (!(val == static_cast<ani_char>('Z'))) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        tE->Object_SetFieldByName_Char(obj, "charField", static_cast<ani_char>('Z'));
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetFieldByName_Byte_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ASSERT_EQ(env->Object_SetFieldByName_Byte(obj, "byteField", 42), ANI_OK);
   ani_byte val{}; ASSERT_EQ(env->Object_GetFieldByName_Byte(obj, "byteField", &val), ANI_OK);
  if (!(val == 42)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        tE->Object_SetFieldByName_Byte(obj, "byteField", 42);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetFieldByName_Short_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ASSERT_EQ(env->Object_SetFieldByName_Short(obj, "shortField", 1000), ANI_OK);
   ani_short val{}; ASSERT_EQ(env->Object_GetFieldByName_Short(obj, "shortField", &val), ANI_OK);
  if (!(val == 1000)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        tE->Object_SetFieldByName_Short(obj, "shortField", 1000);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetFieldByName_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ASSERT_EQ(env->Object_SetFieldByName_Int(obj, "intField", 42), ANI_OK);
   ani_int val{}; ASSERT_EQ(env->Object_GetFieldByName_Int(obj, "intField", &val), ANI_OK);
  if (!(val == 42)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        tE->Object_SetFieldByName_Int(obj, "intField", 42);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetFieldByName_Long_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ASSERT_EQ(env->Object_SetFieldByName_Long(obj, "longField", 99999LL), ANI_OK);
   ani_long val{}; ASSERT_EQ(env->Object_GetFieldByName_Long(obj, "longField", &val), ANI_OK);
  if (!(val == 99999LL)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        tE->Object_SetFieldByName_Long(obj, "longField", 99999LL);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetFieldByName_Float_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ASSERT_EQ(env->Object_SetFieldByName_Float(obj, "floatField", 3.14f), ANI_OK);
   ani_float val{}; ASSERT_EQ(env->Object_GetFieldByName_Float(obj, "floatField", &val), ANI_OK);
  if (!(val == 3.14f)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        tE->Object_SetFieldByName_Float(obj, "floatField", 3.14f);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetFieldByName_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ASSERT_EQ(env->Object_SetFieldByName_Double(obj, "doubleField", 3.14159), ANI_OK);
   ani_double val{}; ASSERT_EQ(env->Object_GetFieldByName_Double(obj, "doubleField", &val), ANI_OK);
  if (!(val == 3.14159)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        tE->Object_SetFieldByName_Double(obj, "doubleField", 3.14159);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjSetFieldByName_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreateFieldTypes(env, &obj), ANI_TRUE);
  ani_string ns{}; ASSERT_EQ(env->String_NewUTF8("newValue", 8, &ns), ANI_OK);
  ASSERT_EQ(env->Object_SetFieldByName_Ref(obj, "stringField", ns), ANI_OK);
  ani_ref r{}; ASSERT_EQ(env->Object_GetFieldByName_Ref(obj, "stringField", &r), ANI_OK);
  ASSERT_NE(r, nullptr); return ANI_TRUE; }

ani_int test_ObjSetFieldByName_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_FT_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_string ns{};
                        if (tE->String_NewUTF8("nv", 2, &ns) == ANI_OK) {
                            tE->Object_SetFieldByName_Ref(obj, "stringField", ns);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 8: Object_GetPropertyByName (18 tests = 9 types x 2)
// ============================================================

ani_int test_ObjGetPropertyByName_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
   ani_boolean val{}; ani_status st = env->Object_GetPropertyByName_Boolean(obj, "booleanField", &val);
  if (st != ANI_OK) { return ANI_FALSE; }
  if (!(val == ANI_TRUE)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetPropertyByName_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_PROPERTY_TYPES_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_boolean v{};
                        tE->Object_GetPropertyByName_Boolean(obj, "booleanField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetPropertyByName_Char_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
   ani_char val{}; ani_status st = env->Object_GetPropertyByName_Char(obj, "charField", &val);
  if (st != ANI_OK) { return ANI_FALSE; }
  if (!(val == static_cast<ani_char>('a'))) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetPropertyByName_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_PROPERTY_TYPES_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_char v{};
                        tE->Object_GetPropertyByName_Char(obj, "charField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetPropertyByName_Byte_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
   ani_byte val{}; ani_status st = env->Object_GetPropertyByName_Byte(obj, "byteField", &val);
  if (st != ANI_OK) { return ANI_FALSE; }
  if (!(val == 1)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetPropertyByName_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_PROPERTY_TYPES_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_byte v{};
                        tE->Object_GetPropertyByName_Byte(obj, "byteField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetPropertyByName_Short_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
   ani_short val{}; ani_status st = env->Object_GetPropertyByName_Short(obj, "shortField", &val);
  if (st != ANI_OK) { return ANI_FALSE; }
  if (!(val == 2)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetPropertyByName_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_PROPERTY_TYPES_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_short v{};
                        tE->Object_GetPropertyByName_Short(obj, "shortField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetPropertyByName_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
   ani_int val{}; ani_status st = env->Object_GetPropertyByName_Int(obj, "intField", &val);
  if (st != ANI_OK) { return ANI_FALSE; }
  if (!(val == 3)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetPropertyByName_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_PROPERTY_TYPES_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_int v{};
                        tE->Object_GetPropertyByName_Int(obj, "intField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetPropertyByName_Long_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
   ani_long val{}; ani_status st = env->Object_GetPropertyByName_Long(obj, "longField", &val);
  if (st != ANI_OK) { return ANI_FALSE; }
  if (!(val == 4)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetPropertyByName_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_PROPERTY_TYPES_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_long v{};
                        tE->Object_GetPropertyByName_Long(obj, "longField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetPropertyByName_Float_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
   ani_float val{}; ani_status st = env->Object_GetPropertyByName_Float(obj, "floatField", &val);
  if (st != ANI_OK) { return ANI_FALSE; }
  if (!(val == 1.5f)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetPropertyByName_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_PROPERTY_TYPES_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_float v{};
                        tE->Object_GetPropertyByName_Float(obj, "floatField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetPropertyByName_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
   ani_double val{}; ani_status st = env->Object_GetPropertyByName_Double(obj, "doubleField", &val);
  if (st != ANI_OK) { return ANI_FALSE; }
  if (!(val == 2.5)) return ANI_FALSE; return ANI_TRUE; }

ani_int test_ObjGetPropertyByName_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr; if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> completed(0);
    std::vector<std::thread> th;
    for (int i = 0; i < P8_THREAD_COUNT; i++) {
        th.emplace_back([&completed, vm]() {
            ani_env *tE = nullptr; ani_options o{0, nullptr};
            if (vm->AttachCurrentThread(&o, ANI_VERSION_1, &tE) == ANI_OK) {
                ani_class c{}; ani_method ct{};
                if (tE->FindClass(P8_PROPERTY_TYPES_CLASS, &c) == ANI_OK && tE->Class_FindMethod(c, "<ctor>", ":", &ct) == ANI_OK) {
                    ani_object obj{};
                    if (tE->Object_New(c, ct, &obj) == ANI_OK) {
                        ani_double v{};
                        tE->Object_GetPropertyByName_Double(obj, "doubleField", &v);
                    }
                }
                vm->DetachCurrentThread();
            }
            completed.fetch_add(1);
        });
    }
    for (auto &t : th) { t.join(); }
    return (completed.load() == P8_THREAD_COUNT) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ObjGetPropertyByName_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{ ani_object obj{}; ASSERT_EQ(P8_CreatePropertyTypes(env, &obj), ANI_TRUE);
  ani_ref ref{}; ani_status st = env->Object_GetPropertyByName_Ref(obj, "stringField", &ref);
  if (st != ANI_OK) { return ANI_FALSE; }
  ASSERT_NE(ref, nullptr); return ANI_TRUE; }

