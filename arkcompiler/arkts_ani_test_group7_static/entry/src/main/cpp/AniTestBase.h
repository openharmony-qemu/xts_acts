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

#ifndef ARKTS_ANI_TEST_NATIVETEST01_BASE_H
#define ARKTS_ANI_TEST_NATIVETEST01_BASE_H

#include "Common.h"
#include <thread>
#include <atomic>
#include <vector>
#include <unistd.h>
#include <sys/sendfile.h>
#include <fcntl.h>
#include <cmath>
#include <cstring>
#include <unordered_set>
#include <mutex>

constexpr int PHYSICS_STATE_SIZE = 10;
constexpr int PHYSICS_STATE_BYTES = PHYSICS_STATE_SIZE * sizeof(float);
constexpr int MAX_ALLOC_SIZE = 1024 * 1024;
constexpr int MAX_TASK_COUNT = 8;
constexpr int FEATURE_SAMPLE_INTERVAL = 4;
constexpr int MIN_TASK_COUNT = 2;
constexpr int INCREMENTS_PER_THREAD = 10000;
constexpr int ASYNC_CALLBACK_DELAY_MS = 100;
constexpr size_t PATH_PROBE_SIZE = 64;
constexpr const char *NATIVE_BINDINGS_MODULE = "entry.src.main.src.test.NativeBindings";
constexpr int PHYSICS_POS_X = 0;
constexpr int PHYSICS_POS_Y = 1;
constexpr int PHYSICS_POS_Z = 2;
constexpr int PHYSICS_VEL_X = 3;
constexpr int PHYSICS_VEL_Y = 4;
constexpr int PHYSICS_VEL_Z = 5;
constexpr int PHYSICS_ACC_X = 6;
constexpr int PHYSICS_ACC_Y = 7;
constexpr int PHYSICS_ACC_Z = 8;
constexpr int PHYSICS_GRAVITY_INDEX = 9;
constexpr int FILE_CREATE_PERMISSION = 0644;
constexpr double ARRAY_DOUBLE_FACTOR = 2.0;

inline std::unordered_set<uintptr_t> g_validHandles;
inline std::mutex g_handleMutex;
inline std::mutex g_asyncMutex;
inline std::mutex g_cacheMutex;
inline ani_ref g_asyncCallbackRef = nullptr;
inline ani_vm *g_vm = nullptr;
inline ani_ref g_cachedStringClass = nullptr;

using AtomicInt = std::atomic<int>;

inline ani_object CreateObjectFromClass(ani_env *env, ani_class objClass)
{
    ani_method ctor = nullptr;
    ani_object obj = nullptr;
    if (objClass == nullptr) {
        return nullptr;
    }
    env->Class_FindMethod(objClass, "<ctor>", "", &ctor);
    if (env->Object_New(objClass, ctor, &obj) != ANI_OK) {
        return nullptr;
    }
    return obj;
}

inline ani_object createEmptyObject([[maybe_unused]] ani_env *env)
{
    ani_class objClass = nullptr;
    if (env->FindClass("std.core.Object", &objClass) != ANI_OK) {
        return nullptr;
    }
    return CreateObjectFromClass(env, objClass);
}

#endif
