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

#include "NativeObjectStorageTest.h"
#include "Common.h"
#include "ThreadSafeStorageTest.h"
#include "ConcurrentStorageTest.h"
#include "ClassStorageTest.h"
#include "MapKeyStorageTest.h"
#include "ExceptionStorageTest.h"
#include "AniObjectTypeTest.h"
#include "ContainerStorageTest.h"

void AniTestLog(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    OH_LOG_VPrint(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, fmt, args);
    va_end(args);
}

ani_boolean FindClassByName(ani_env *env, const char *className, ani_class *outCls)
{
    if (env == nullptr || className == nullptr || outCls == nullptr) {
        return ANI_FALSE;
    }
    ani_status status = env->FindClass(className, outCls);
    if (status != ANI_OK || (*outCls) == nullptr) {
        AniTestLog("FindClass failed for %s", className);
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean FindClassFallback(ani_env *env, const char *shortName, ani_class *out)
{
    static const char *const prefixes[] = {"", "std.core.", "std.concurrency.", ETS_INDEX_PREFIX};
    for (ani_int round = 0; round < FIND_CLASS_RETRY_ROUNDS; ++round) {
        for (const char *prefix : prefixes) {
            std::string full = std::string(prefix) + shortName;
            if (env->FindClass(full.c_str(), out) == ANI_OK) {
                return ANI_TRUE;
            }
            env->ResetError();
        }
        if (round < FIND_CLASS_RETRY_ROUNDS - 1) {
            std::this_thread::sleep_for(std::chrono::milliseconds(FIND_CLASS_RETRY_INTERVAL_MS));
        }
    }
    AniTestLog("FindClassFallback: FAIL '%s' after retries", shortName);
    return ANI_FALSE;
}

ani_object CreateNativeResource(ani_env *env, ani_int value)
{
    ani_class resourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &resourceCls) != ANI_TRUE) {
        return nullptr;
    }
    ani_method ctor = nullptr;
    if (env->Class_FindMethod(resourceCls, "<ctor>", ":", &ctor) != ANI_OK) {
        env->ResetError();
        return nullptr;
    }
    ani_object resource = nullptr;
    if (env->Object_New(resourceCls, ctor, &resource) != ANI_OK) {
        env->ResetError();
        return nullptr;
    }
    if (env->Object_SetPropertyByName_Int(resource, "value", value) != ANI_OK) {
        env->ResetError();
        return nullptr;
    }
    return resource;
}

constexpr ani_size MAX_MATCHED_METHODS = 256;

void BindClassMethods(ani_env *env, const char *clsName, const ani_native_function *methods,
                      ani_size count, const char *tag)
{
    ani_class cls = nullptr;
    if (env->FindClass(clsName, &cls) != ANI_OK) {
        AniTestLog("%s: not found '%s'", tag, clsName);
        return;
    }
    ani_native_function matched[MAX_MATCHED_METHODS];
    ani_size matchedCount = 0;
    for (ani_size idx = 0; idx < count && matchedCount < MAX_MATCHED_METHODS; ++idx) {
        ani_method probe = nullptr;
        if (env->Class_FindMethod(cls, methods[idx].name, methods[idx].signature, &probe) == ANI_OK) {
            matched[matchedCount++] = methods[idx];
        }
    }
    if (matchedCount == 0) {
        AniTestLog("%s: no matched methods for '%s'", tag, clsName);
        return;
    }
    if (env->Class_BindNativeMethods(cls, matched, matchedCount) != ANI_OK) {
        AniTestLog("%s: bind failed '%s' (%u methods)", tag, clsName,
                   static_cast<uint32_t>(matchedCount));
    }
}

ANI_EXPORT ani_status ANI_Constructor(ani_vm *vm, uint32_t *result)
{
    AniTestLog("entering libentry.so's ANI_Constructor");

    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("ANI_Constructor: unsupported ANI_VERSION_1");
        *result = ANI_VERSION_1;
        return ANI_OK;
    }

    AniTestLog("BindClassStorageTest status: %d", BindClassStorageTest(vm));
    AniTestLog("BindContainerStorageTest status: %d", BindContainerStorageTest(vm));
    AniTestLog("BindThreadSafeStorageTest status: %d", BindThreadSafeStorageTest(vm));
    AniTestLog("BindAniObjectTypeTest status: %d", BindAniObjectTypeTest(vm));
    AniTestLog("BindConcurrentStorageTest status: %d", BindConcurrentStorageTest(vm));
    AniTestLog("BindMapKeyStorageTest status: %d", BindMapKeyStorageTest(vm));
    AniTestLog("BindExceptionStorageTest status: %d", BindExceptionStorageTest(vm));

    *result = ANI_VERSION_1;
    return ANI_OK;
}

ANI_EXPORT ani_status ANI_Destructor(ani_vm *vm, uint32_t *result)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) == ANI_OK && env != nullptr) {
        CleanupThreadSafeStorageTest(env);
        CleanupConcurrentStorageTest(env);
        CleanupClassStorageTest(env);
        CleanupMapKeyStorageTest(env);
        CleanupAniObjectTypeTest(env);
        CleanupExceptionStorageTest(env);
        CleanupContainerStorageTest(env);
    }
    *result = 0;
    return ANI_OK;
}
