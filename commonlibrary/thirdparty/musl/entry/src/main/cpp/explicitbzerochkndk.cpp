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
#include <cstring>
#include "libc_function_loader.h"

static napi_value ExplicitBzeroChkTest(napi_env env, napi_callback_info info)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto explicitBzeroChk = loader.GetExplicitBzeroChk();

    int res = 0;
    if (explicitBzeroChk != nullptr) {
        unsigned char buffer[8] = {0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x11, 0x22};
        size_t dstLen = sizeof(buffer);
        constexpr size_t clearLen = 5;   // 清除前5个字节
        explicitBzeroChk(buffer, clearLen, dstLen);

        // 验证前5字节已清零
        bool allCleared = true;
        for (size_t i = 0; i < clearLen; ++i) {
            if (buffer[i] != 0) {
                allCleared = false;
                break;
            }
        }
        // 验证后3字节未被修改 预期值 0xFF, 0x11, 0x22
        bool tailUnchanged = (buffer[5] == 0xFF && buffer[6] == 0x11 && buffer[7] == 0x22);

        if (allCleared && tailUnchanged && errno != ENOSYS) {
            res = 1;
        }
    }

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, res, &result);
    return status == napi_ok ? result : nullptr;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"explicitBzeroChkTest", nullptr, ExplicitBzeroChkTest, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libexplicitbzerochkndktest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};
extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
