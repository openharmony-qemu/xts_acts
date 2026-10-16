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

#include "napi/native_api.h"
#include "napi_har.h"

constexpr int32_t ARG_COUNT = 2;

double HarNativeAdd(double a, double b)
{
    return a + b;
}

void setHarEnv(napi_env env)
{
    g_har_env = env;
}

napi_value harArkTSAdd(double a, double b)
{
    napi_env env = g_har_env;
    napi_value module;
    napi_status status = napi_load_module_with_info(env,
        "static_module/src/main/ets/utils/Util", "com.example.normalized_napi_load/entry_test", &module);
    if (napi_ok != status) {
        return 0;
    }
    napi_value addFunc;
    napi_get_named_property(env, module, "add", &addFunc);
    napi_value addResult;
    napi_value argv[ARG_COUNT] = {nullptr, nullptr};
    napi_create_double(env, a, &argv[0]);
    napi_create_double(env, b, &argv[1]);
    napi_call_function(env, module, addFunc, ARG_COUNT, argv, &addResult);
    return addResult;
}
