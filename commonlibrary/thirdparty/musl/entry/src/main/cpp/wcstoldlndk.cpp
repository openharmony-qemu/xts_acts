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
#include <cerrno>
#include <cmath>
#include "libc_function_loader.h"

static bool LongDoubleEqual(long double a, long double b, long double eps = 1e-6L)
{
    return fabsl(a - b) < eps;
}

static napi_value WcstoldLTest(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto wcstoldL = loader.GetWcstoldL();

    int res = 0;
    if (wcstoldL != nullptr) {
        // 测试1：正常转换
        wchar_t* end1 = nullptr;
        long double val1 = wcstoldL(L"12.5tail", &end1, nullptr);
        bool test1 = LongDoubleEqual(val1, 12.5L) && end1 != nullptr && *end1 == L't';

        // 测试2：无效输入
        wchar_t* end2 = nullptr;
        long double val2 = wcstoldL(L"abc", &end2, nullptr);
        bool test2 = (val2 == 0.0L) && end2 == L"abc";

        // 测试3：溢出
        errno = 0;
        wchar_t* end3 = nullptr;
        long double val3 = wcstoldL(L"1e400000", &end3, nullptr);
        bool test3 = (errno == ERANGE) && (val3 == HUGE_VALL);

        res = (test1 && test2 && test3) ? 1 : 0;
    }

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, res, &result);
    return status == napi_ok ? result : nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"wcstoldLTest", nullptr, WcstoldLTest, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libwcstoldlndktest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
