/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "database/udmf/udmf.h"
#include "database/udmf/udmf_err_code.h"
#include <bits/alltypes.h>
#include <iostream>
#include <string>
#include "database/udmf/udmf_meta.h"
#include "database/udmf/uds.h"
#include "database/udmf/utd.h"
#include "common.h"
#include "napi/native_api.h"

#define PARAM_0 0
#define PARAM_1 1

static napi_value UDMF_PERM_NONE_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, UDMF_PERM_NONE == PARAM_0, &result);
    return result;
}

static napi_value UDMF_PERM_READ_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, UDMF_PERM_READ == 1u, &result);
    return result;
}

static napi_value UDMF_PERM_WRITE_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, UDMF_PERM_WRITE == 2u, &result);
    return result;
}

static napi_value UDMF_PERM_PERSIST_001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_int32(env, UDMF_PERM_PERSIST == 4u, &result);
    return result;
}

static napi_value UDMF_PERM_Combination_001(napi_env env, napi_callback_info info)
{
    uint32_t combinedPerm = UDMF_PERM_READ | UDMF_PERM_WRITE;
    napi_value result = nullptr;
    napi_create_int32(env, combinedPerm == 3u, &result);
    return result;
}

static napi_value OH_UdsHtml_SetAuthPolicy_001(napi_env env, napi_callback_info info)
{
    int ret = OH_UdsHtml_SetAuthPolicy(nullptr, UDMF_PERM_READ);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsHtml_SetAuthPolicy_002(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetAuthPolicy(html, UDMF_PERM_NONE);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetAuthPolicy_003(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetAuthPolicy(html, UDMF_PERM_READ);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetAuthPolicy_004(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetAuthPolicy(html, UDMF_PERM_WRITE);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetAuthPolicy_005(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    int ret = OH_UdsHtml_SetAuthPolicy(html, UDMF_PERM_PERSIST);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetAuthPolicy_006(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    uint32_t combinedPerm = UDMF_PERM_READ | UDMF_PERM_WRITE;
    int ret = OH_UdsHtml_SetAuthPolicy(html, combinedPerm);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsHtml_SetAuthPolicy_007(napi_env env, napi_callback_info info)
{
    OH_UdsHtml* html = nullptr;
    html = OH_UdsHtml_Create();
    uint32_t combinedPerm = UDMF_PERM_READ | UDMF_PERM_WRITE | UDMF_PERM_PERSIST;
    int ret = OH_UdsHtml_SetAuthPolicy(html, combinedPerm);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsHtml_Destroy(html);
    return result;
}

static napi_value OH_UdsFileUri_SetAuthPolicy_001(napi_env env, napi_callback_info info)
{
    int ret = OH_UdsFileUri_SetAuthPolicy(nullptr, UDMF_PERM_READ);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_INVALID_PARAM, &result);
    return result;
}

static napi_value OH_UdsFileUri_SetAuthPolicy_002(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUri = nullptr;
    fileUri = OH_UdsFileUri_Create();
    int ret = OH_UdsFileUri_SetAuthPolicy(fileUri, UDMF_PERM_NONE);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsFileUri_Destroy(fileUri);
    return result;
}

static napi_value OH_UdsFileUri_SetAuthPolicy_003(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUri = nullptr;
    fileUri = OH_UdsFileUri_Create();
    int ret = OH_UdsFileUri_SetAuthPolicy(fileUri, UDMF_PERM_READ);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsFileUri_Destroy(fileUri);
    return result;
}

static napi_value OH_UdsFileUri_SetAuthPolicy_004(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUri = nullptr;
    fileUri = OH_UdsFileUri_Create();
    int ret = OH_UdsFileUri_SetAuthPolicy(fileUri, UDMF_PERM_WRITE);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsFileUri_Destroy(fileUri);
    return result;
}

static napi_value OH_UdsFileUri_SetAuthPolicy_005(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUri = nullptr;
    fileUri = OH_UdsFileUri_Create();
    int ret = OH_UdsFileUri_SetAuthPolicy(fileUri, UDMF_PERM_PERSIST);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsFileUri_Destroy(fileUri);
    return result;
}

static napi_value OH_UdsFileUri_SetAuthPolicy_006(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUri = nullptr;
    fileUri = OH_UdsFileUri_Create();
    uint32_t combinedPerm = UDMF_PERM_READ | UDMF_PERM_WRITE;
    int ret = OH_UdsFileUri_SetAuthPolicy(fileUri, combinedPerm);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsFileUri_Destroy(fileUri);
    return result;
}

static napi_value OH_UdsFileUri_SetAuthPolicy_007(napi_env env, napi_callback_info info)
{
    OH_UdsFileUri* fileUri = nullptr;
    fileUri = OH_UdsFileUri_Create();
    uint32_t combinedPerm = UDMF_PERM_READ | UDMF_PERM_WRITE | UDMF_PERM_PERSIST;
    int ret = OH_UdsFileUri_SetAuthPolicy(fileUri, combinedPerm);
    napi_value result = nullptr;
    napi_create_int32(env, ret == UDMF_E_OK, &result);
    OH_UdsFileUri_Destroy(fileUri);
    return result;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"UDMF_PERM_NONE_001", nullptr, UDMF_PERM_NONE_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UDMF_PERM_READ_001", nullptr, UDMF_PERM_READ_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UDMF_PERM_WRITE_001", nullptr, UDMF_PERM_WRITE_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UDMF_PERM_PERSIST_001", nullptr, UDMF_PERM_PERSIST_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UDMF_PERM_Combination_001", nullptr, UDMF_PERM_Combination_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetAuthPolicy_001", nullptr, OH_UdsHtml_SetAuthPolicy_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetAuthPolicy_002", nullptr, OH_UdsHtml_SetAuthPolicy_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetAuthPolicy_003", nullptr, OH_UdsHtml_SetAuthPolicy_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetAuthPolicy_004", nullptr, OH_UdsHtml_SetAuthPolicy_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetAuthPolicy_005", nullptr, OH_UdsHtml_SetAuthPolicy_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetAuthPolicy_006", nullptr, OH_UdsHtml_SetAuthPolicy_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsHtml_SetAuthPolicy_007", nullptr, OH_UdsHtml_SetAuthPolicy_007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetAuthPolicy_001", nullptr, OH_UdsFileUri_SetAuthPolicy_001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetAuthPolicy_002", nullptr, OH_UdsFileUri_SetAuthPolicy_002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetAuthPolicy_003", nullptr, OH_UdsFileUri_SetAuthPolicy_003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetAuthPolicy_004", nullptr, OH_UdsFileUri_SetAuthPolicy_004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetAuthPolicy_005", nullptr, OH_UdsFileUri_SetAuthPolicy_005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetAuthPolicy_006", nullptr, OH_UdsFileUri_SetAuthPolicy_006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_UdsFileUri_SetAuthPolicy_007", nullptr, OH_UdsFileUri_SetAuthPolicy_007, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "UdsAuthPolicyNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }