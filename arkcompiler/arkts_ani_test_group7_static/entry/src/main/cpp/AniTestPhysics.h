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

#ifndef ARKTS_ANI_TEST_NATIVETEST01_PHYSICS_H
#define ARKTS_ANI_TEST_NATIVETEST01_PHYSICS_H

#include "AniTestBase.h"

ani_object testAniSysInfo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    long cores = sysconf(_SC_NPROCESSORS_ONLN);
    long pageSize = sysconf(_SC_PAGESIZE);
    ani_object obj = createEmptyObject(env);
    if (obj == nullptr) {
        return nullptr;
    }
    ani_int coresVal = static_cast<int32_t>(cores > 0 ? cores : 0);
    ani_int pageVal = static_cast<int32_t>(pageSize > 0 ? pageSize : 0);
    ani_object coresBoxed = nullptr;
    ani_object pageBoxed = nullptr;
    if (env->Primitive_Box_Int(coresVal, &coresBoxed) != ANI_OK ||
        env->Primitive_Box_Int(pageVal, &pageBoxed) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetPropertyByName_Ref(obj, "cpuCores", (ani_ref)coresBoxed) != ANI_OK ||
        env->Object_SetPropertyByName_Ref(obj, "pageSize", (ani_ref)pageBoxed) != ANI_OK) {
        return nullptr;
    }
    return obj;
}

ani_long testAniCreatePhysics([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_double gravity)
{
    if (PHYSICS_STATE_BYTES == 0 || PHYSICS_STATE_BYTES > MAX_ALLOC_SIZE) {
        return 0;
    }
    auto *state = static_cast<float *>(malloc(PHYSICS_STATE_BYTES));
    if (state == nullptr) {
        return 0;
    }
    for (size_t i = 0; i < PHYSICS_STATE_SIZE; ++i) {
        state[i] = 0.0f;
    }
    state[PHYSICS_GRAVITY_INDEX] = static_cast<float>(gravity);
    {
        std::lock_guard<std::mutex> lock(g_handleMutex);
        g_validHandles.insert(reinterpret_cast<uintptr_t>(state));
    }
    return reinterpret_cast<int64_t>(state);
}

ani_double testAniStepPhysics([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_long handle, ani_double dt)
{
    if (handle == 0 || dt <= 0.0) {
        return 0.0;
    }
    auto handleAddr = static_cast<uintptr_t>(handle);
    {
        std::lock_guard<std::mutex> lock(g_handleMutex);
        if (g_validHandles.find(handleAddr) == g_validHandles.end()) {
            return 0.0;
        }
    }
    auto *state = reinterpret_cast<float *>(handleAddr);
    if (fabsf(state[PHYSICS_GRAVITY_INDEX]) < 1e-3f) {
        return 0.0;
    }
    float invMass = 1.0f / state[PHYSICS_GRAVITY_INDEX];
    state[PHYSICS_VEL_X] += state[PHYSICS_ACC_X] * invMass * static_cast<float>(dt);
    state[PHYSICS_VEL_Y] += state[PHYSICS_ACC_Y] * invMass * static_cast<float>(dt);
    state[PHYSICS_VEL_Z] += state[PHYSICS_ACC_Z] * invMass * static_cast<float>(dt);
    state[PHYSICS_POS_X] += state[PHYSICS_VEL_X] * static_cast<float>(dt);
    state[PHYSICS_POS_Y] += state[PHYSICS_VEL_Y] * static_cast<float>(dt);
    state[PHYSICS_POS_Z] += state[PHYSICS_VEL_Z] * static_cast<float>(dt);
    return static_cast<double>(dt * state[PHYSICS_GRAVITY_INDEX]);
}

void testAniDestroyPhysics([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_long handle)
{
    if (handle != 0) {
        auto handleAddr = static_cast<uintptr_t>(handle);
        {
            std::lock_guard<std::mutex> lock(g_handleMutex);
            g_validHandles.erase(handleAddr);
        }
        auto *state = reinterpret_cast<float *>(handleAddr);
        for (size_t i = 0; i < PHYSICS_STATE_SIZE; ++i) {
            state[i] = 0.0f;
        }
        free(state);
    }
}

#endif
