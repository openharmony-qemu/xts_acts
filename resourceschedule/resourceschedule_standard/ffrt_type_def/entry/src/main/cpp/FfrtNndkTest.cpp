/*
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

#include <cstdio>
#include <ffrt/fiber.h>
#include "napi/native_api.h"
#include "ffrt/shared_mutex.h"

void ForffrtFiberInitTest(void* arg)
{
    (*static_cast<int*>(arg)) += 1;
}

static napi_value ffrt_fiber_initTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_fiber_t* fiber;
    size_t size = 0;
    int result = ffrt_fiber_init(fiber, ForffrtFiberInitTest, nullptr, nullptr, size);
    napi_create_int32(env, result, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_rwlockattr_tTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_rwlock_t* rwlock;
    ffrt_rwlockattr_t attr;
    int result = ffrt_rwlock_init(rwlock, &attr);
    napi_create_int32(env, result == (ffrt_error || ffrt_error_nomem || ffrt_error_timedout) ? 1 : 0, &resultEnd);
    return resultEnd;
}

napi_property_descriptor desc[] = {
    {"ffrt_fiber_initTest", nullptr, ffrt_fiber_initTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ffrt_rwlockattr_tTest", nullptr, ffrt_rwlockattr_tTest, nullptr, nullptr, nullptr, napi_default, nullptr},
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
