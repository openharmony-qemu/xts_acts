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

#ifndef ARKTS_ANI_TEST_COMMON_H
#define ARKTS_ANI_TEST_COMMON_H
#ifndef ARKTS_ANI_NATIVE_OBJECT_STORAGE_TEST_COMMON_H
#define ARKTS_ANI_NATIVE_OBJECT_STORAGE_TEST_COMMON_H
#include <cstdarg>
#include <cstdio>
#if __has_include(<securec.h>)
#include <securec.h>
#endif
#include <array>
#include <iostream>
#include <string>
#include <chrono>
#include <thread>
#include "ani/ani.h"
#include "hilog/log.h"
#include <iconv.h>
#include <cstring>
#include <codecvt>
#include <locale>
const uint32_t ANI_RES_INVALID_ARGS = 2;
const uint32_t ANI_RES_INVALID_TYPE = 3;
const uint32_t ANI_RES_OUT_OF_REF = 9;
constexpr ani_int FIND_CLASS_RETRY_ROUNDS = 10;
constexpr ani_int FIND_CLASS_RETRY_INTERVAL_MS = 20;

void AniTestLog(const char *fmt, ...);

const char *const NATIVE_RESOURCE_CLASS = "entry.src.main.src.ets.Index.NativeResource";
const char *const NATIVE_DATA_CLASS = "entry.src.main.src.ets.Index.NativeData";
const char *const ETS_INDEX_PREFIX = "entry.src.main.src.ets.Index.";

constexpr ani_int RES_INIT_VALUE = 42;
constexpr ani_int RES_INIT_VALUE_ALT = 100;
constexpr ani_int RES_INIT_VALUE_UPDATED = 200;
constexpr ani_int RES_INIT_VALUE_ZERO = 0;
constexpr ani_int RES_INCREMENT_STEP = 1;
constexpr ani_int LOCAL_REF_TEST_COUNT = 1000;
constexpr ani_size LOCAL_SCOPE_CAPACITY = 16;
constexpr ani_int CONCURRENT_MAP_PUT_COUNT = 50;
constexpr ani_int CONCURRENT_MAP_VALUE_STEP = 10;
constexpr ani_int CONCURRENT_SET_PUT_COUNT = 10;
constexpr ani_int CONCURRENT_QUEUE_PUT_COUNT = 100;
constexpr ani_int MULTI_THREAD_COUNT = 10;
constexpr ani_int EQUAL_TRUE_RESULT = 1;
constexpr ani_int EQUAL_FALSE_RESULT = 0;
constexpr ani_int ASYNC_PROMISE_FINAL_VALUE = 150;
constexpr ani_int EA_WORKER_MESSAGE_VALUE = 300;
constexpr ani_int EA_WORKER_MESSAGE_MODIFY = 50;
const ani_size SPECIFIED_CAPACITY = 60;
const ani_size LENGTH_5 = 5;
const ani_int TEST_INT_VAL1 = 5;
const ani_int TEST_INT_VAL2 = 6;
#define ASSERT_EQ(a, b) \
    do { \
        if ((a) != (b)) { \
            return ANI_FALSE; \
        } \
    } while (0)
#define ASSERT_NE(a, b) \
    do { \
        if ((a) == (b)) { \
            return ANI_FALSE; \
        } \
    } while (0)
#define ASSERT_STREQ(lhs, rhs)                                    \
    do {                                                          \
        std::string_view _sv1(lhs);                               \
        std::string_view _sv2(rhs);                               \
        if (_sv1 != _sv2) {                                       \
            return ANI_FALSE;                                     \
        }                                                         \
    } while (0)
template<typename T, typename U>
inline bool AssertEqMsg(const T &actual, const U &expected, const char *msg)
{
    if (actual != expected) {
        OH_LOG_INFO(LOG_APP, "%s: %d != %d",
            msg,
            static_cast<int>(actual),
            static_cast<int>(expected));
        return false;
    }
    return true;
}
ani_boolean GetClsData(ani_env *env, ani_object *objectResult, ani_class *outCls)
{
    ani_class cls {};
    if (env->FindClass("entry.src.main.src.ets.Index.Foo", &cls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " FindClass Failed");
        return ANI_FALSE;
    }
    if (cls == nullptr) {
        OH_LOG_INFO(LOG_APP, " FindClass cls is nullptr");
        return ANI_FALSE;
    }
    ani_static_method newMethod;
    if (env->Class_FindStaticMethod(cls, "new_Foo", ":C{entry.src.main.src.ets.Index.Foo}", &newMethod) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_FindStaticMethod Failed");
        return ANI_FALSE;
    }
    ani_ref ref;
    if (env->Class_CallStaticMethod_Ref(cls, newMethod, &ref) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, " Class_CallStaticMethod_Ref Failed");
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, " FindClass success!!!!!!!!!!!!!!!!");
    *objectResult = static_cast<ani_object>(ref);
    *outCls = cls;
    return ANI_TRUE;
}
ani_boolean GetClsByClassCallingName(ani_env *env, const char *class_descriptor, ani_class *cls)
{
    std::string classDescriptor = "entry.src.main.src.ets.ClassCallingStaticMethods.";
    std::string classDesc = classDescriptor.append(class_descriptor);
    OH_LOG_INFO(LOG_APP, "GetClsByClassCallingName classDesc %{public}s", classDesc.c_str());
    auto status = env->FindClass(classDesc.c_str(), cls);
    if (status != ANI_OK || cls == nullptr) {
        OH_LOG_INFO(LOG_APP, "GetClsByClassCallingName status is %{public}d", status);
        return ANI_FALSE;
    }
    return ANI_TRUE;
}
ani_ref g_doubleCls {};
ani_method doubleunbox {};
ani_status unboxDouble(ani_env *env, ani_object obj, ani_double *result)
{
    if (g_doubleCls == nullptr) {
        ani_class cls {};
        ani_method method {};
        auto status = env->FindClass("std.core.Double", &cls);
        if (status != ANI_OK) {
            return ANI_ERROR;
        }
        status = env->GlobalReference_Create(cls, &g_doubleCls);
        if (status != ANI_OK) {
            return ANI_ERROR;
        }
        status = env->Class_FindMethod(cls, "toDouble", ":d", &doubleunbox);
        if (status != ANI_OK) {
            return ANI_ERROR;
        }
    }
    return env->Object_CallMethod_Double(obj, doubleunbox, result);
}
ani_boolean GetStdString(ani_env *env, ani_string str, std::string &result)
{
    ani_size sz{};
    ASSERT_EQ(env->String_GetUTF8Size(str, &sz), ANI_OK);
    result.resize(sz + 1);
    ASSERT_EQ(env->String_GetUTF8SubString(str, 0, sz, result.data(), result.size(), &sz), ANI_OK);
    result.resize(sz);
    return ANI_TRUE;
}
ani_boolean FindClassByName(ani_env *env, const char *className, ani_class *outCls);

ani_boolean FindClassFallback(ani_env *env, const char *shortName, ani_class *out);

ani_object CreateNativeResource(ani_env *env, ani_int value);

void BindClassMethods(ani_env *env, const char *clsName, const ani_native_function *methods,
                      ani_size count, const char *tag);

inline void WarmupFindClass(ani_env *env, const char *className)
{
    ani_class cls = nullptr;
    if (env->FindClass(className, &cls) != ANI_OK) {
        env->ResetError();
    }
}

inline void SafeDeleteGlobalRef(ani_env *env, ani_ref &ref)
{
    if (ref != nullptr) {
        env->GlobalReference_Delete(ref);
        ref = nullptr;
    }
}
#endif
#endif
