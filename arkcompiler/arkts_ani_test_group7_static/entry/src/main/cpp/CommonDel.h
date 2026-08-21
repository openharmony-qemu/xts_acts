/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_NATIVE_OBJECT_STORAGE_TEST_COMMON_H
#define ARKTS_ANI_NATIVE_OBJECT_STORAGE_TEST_COMMON_H

#include <cstdarg>
#include <cstdio>
#if __has_include(<securec.h>)
#include <securec.h>
#endif
#include <string>
#include <chrono>
#include <thread>
#include "ani/ani.h"
#include "hilog/log.h"

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
