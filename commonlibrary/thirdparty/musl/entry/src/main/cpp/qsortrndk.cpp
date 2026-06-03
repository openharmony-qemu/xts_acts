/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "libc_function_loader.h"

static int CompareInts(const void* left, const void* right, void* arg)
{
    if (arg == nullptr) {
        const int* lhs = static_cast<const int*>(left);
        const int* rhs = static_cast<const int*>(right);
        return (*lhs > *rhs) - (*lhs < *rhs);
    }
    const int* lhs = static_cast<const int*>(left);
    const int* rhs = static_cast<const int*>(right);
    int descending = *(int*)arg;
    int ret = *lhs - *rhs;
    return descending ? -ret : ret;
}

static bool IsSortedDescending(int32_t* arr, size_t size)
{
    for (size_t i = 0; i < size - 1; ++i) {
        if (arr[i] < arr[i + 1]) {
            return false;
        }
    }
    return true;
}

static napi_value QsortR(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto qsortR = loader.GetQsortR();

    int res = 0;
    if (qsortR != nullptr) {
        int values[] = {9, 2, 7, 11, 3, 87, 34, 6};
        size_t size = sizeof(values) / sizeof(values[0]);
        int descending = 1;   // 降序
        qsortR(values, size, sizeof(values[0]), CompareInts, &descending);
        res = IsSortedDescending(values, size) ? 1 : 0;
    }

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, res, &result);
    return status == napi_ok ? result : nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"qsortR", nullptr, QsortR, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libqsortrndktest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
