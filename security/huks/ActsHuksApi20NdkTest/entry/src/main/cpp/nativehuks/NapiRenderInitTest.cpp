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

#include "common/Common.h"
#include "nativehuks/HuksApiTest.h"

namespace NativeHuksTest {
EXTERN_C_START
static void RenderInitPush0(napi_property_descriptor* desc)
{
    napi_property_descriptor descTemp[] = {
        {"GetSdkVersionTest_001", nullptr, HuksApiTest::GetSdkVersionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_001", nullptr, HuksApiTest::GenerateKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_002", nullptr, HuksApiTest::GenerateKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_003", nullptr, HuksApiTest::GenerateKeyItemTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_004", nullptr, HuksApiTest::GenerateKeyItemTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_005", nullptr, HuksApiTest::GenerateKeyItemTest_005,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GenerateKeyItemTest_006", nullptr, HuksApiTest::GenerateKeyItemTest_006,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyItemTest_001", nullptr, HuksApiTest::ImportKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyItemTest_002", nullptr, HuksApiTest::ImportKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyItemTest_003", nullptr, HuksApiTest::ImportKeyItemTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportKeyItemTest_004", nullptr, HuksApiTest::ImportKeyItemTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportWrappedKeyItemTest_001", nullptr, HuksApiTest::ImportWrappedKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportWrappedKeyItemTest_002", nullptr, HuksApiTest::ImportWrappedKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportWrappedKeyItemTest_003", nullptr, HuksApiTest::ImportWrappedKeyItemTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ImportWrappedKeyItemTest_004", nullptr, HuksApiTest::ImportWrappedKeyItemTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportPublicKeyItemTest_001", nullptr, HuksApiTest::ExportPublicKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportPublicKeyItemTest_002", nullptr, HuksApiTest::ExportPublicKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportPublicKeyItemTest_003", nullptr, HuksApiTest::ExportPublicKeyItemTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ExportPublicKeyItemTest_004", nullptr, HuksApiTest::ExportPublicKeyItemTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DeleteKeyItemTest_001", nullptr, HuksApiTest::DeleteKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index] = descTemp[index];
    }
}

static void RenderInitPush1(napi_property_descriptor* desc)
{
    const uint32_t offset = 20;
    napi_property_descriptor descTemp[] = {
        {"DeleteKeyItemTest_002", nullptr, HuksApiTest::DeleteKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyItemParamSetTest_001", nullptr, HuksApiTest::GetKeyItemParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyItemParamSetTest_002", nullptr, HuksApiTest::GetKeyItemParamSetTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyItemParamSetTest_003", nullptr, HuksApiTest::GetKeyItemParamSetTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsKeyItemExistTest_001", nullptr, HuksApiTest::IsKeyItemExistTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsKeyItemExistTest_002", nullptr, HuksApiTest::IsKeyItemExistTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsKeyItemExistTest_003", nullptr, HuksApiTest::IsKeyItemExistTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AttestKeyItemTest_001", nullptr, HuksApiTest::AttestKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AttestKeyItemTest_002", nullptr, HuksApiTest::AttestKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AttestKeyItemTest_003", nullptr, HuksApiTest::AttestKeyItemTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AnonAttestKeyItemTest_001", nullptr, HuksApiTest::AnonAttestKeyItemTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AnonAttestKeyItemTest_002", nullptr, HuksApiTest::AnonAttestKeyItemTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AnonAttestKeyItemTest_003", nullptr, HuksApiTest::AnonAttestKeyItemTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InitSessionTest_001", nullptr, HuksApiTest::InitSessionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InitSessionTest_002", nullptr, HuksApiTest::InitSessionTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InitSessionTest_003", nullptr, HuksApiTest::InitSessionTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UpdateSessionTest_001", nullptr, HuksApiTest::UpdateSessionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UpdateSessionTest_002", nullptr, HuksApiTest::UpdateSessionTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UpdateSessionTest_003", nullptr, HuksApiTest::UpdateSessionTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UpdateSessionTest_004", nullptr, HuksApiTest::UpdateSessionTest_004,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush2(napi_property_descriptor* desc)
{
    const uint32_t offset = 40;
    napi_property_descriptor descTemp[] = {
        {"FinishSessionTest_001", nullptr, HuksApiTest::FinishSessionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FinishSessionTest_002", nullptr, HuksApiTest::FinishSessionTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FinishSessionTest_003", nullptr, HuksApiTest::FinishSessionTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AbortSessionTest_001", nullptr, HuksApiTest::AbortSessionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AbortSessionTest_002", nullptr, HuksApiTest::AbortSessionTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ListAliasesTest_001", nullptr, HuksApiTest::ListAliasesTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WrapKeyTest_001", nullptr, HuksApiTest::WrapKeyTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WrapKeyTest_002", nullptr, HuksApiTest::WrapKeyTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WrapKeyTest_003", nullptr, HuksApiTest::WrapKeyTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnwrapKeyTest_001", nullptr, HuksApiTest::UnwrapKeyTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnwrapKeyTest_002", nullptr, HuksApiTest::UnwrapKeyTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"UnwrapKeyTest_003", nullptr, HuksApiTest::UnwrapKeyTest_003,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InitParamSetTest_001", nullptr, HuksApiTest::InitParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddParamsTest_001", nullptr, HuksApiTest::AddParamsTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"BuildParamSetTest_001", nullptr, HuksApiTest::BuildParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CopyParamSetTest_001", nullptr, HuksApiTest::CopyParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetParamTest_001", nullptr, HuksApiTest::GetParamTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FreshParamSetTest_001", nullptr, HuksApiTest::FreshParamSetTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsParamSetTagValidTest_001", nullptr, HuksApiTest::IsParamSetTagValidTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"IsParamSetValidTest_001", nullptr, HuksApiTest::IsParamSetValidTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static void RenderInitPush3(napi_property_descriptor* desc)
{
    const uint32_t offset = 60;
    napi_property_descriptor descTemp[] = {
        {"CheckParamMatchTest_001", nullptr, HuksApiTest::CheckParamMatchTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    for (size_t index = 0; index < sizeof(descTemp) / sizeof(descTemp[0]); index++) {
        desc[index + offset] = descTemp[index];
    }
}

static napi_value RenderInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[100] = {};
    RenderInitPush0(desc);
    RenderInitPush1(desc);
    RenderInitPush2(desc);
    RenderInitPush3(desc);
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module nativehuksndkModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = RenderInit,
    .nm_modname = "nativehuksndk",
    .nm_priv = ((void *)0),
    .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativehuksndkModule); }
}