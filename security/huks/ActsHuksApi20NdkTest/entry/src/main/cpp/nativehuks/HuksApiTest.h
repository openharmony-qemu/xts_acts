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
#ifndef HUKSAPI_TEST_H
#define HUKSAPI_TEST_H

#include <napi/native_api.h>
#include "common/Common.h"
#include <huks/native_huks_api.h>
#include "huks/native_huks_param.h"


namespace HuksApiTest {
    static const uint32_t IV_SIZE = 16;
    static uint8_t IV[IV_SIZE] = "bababababababab";
    static const uint32_t AAD_SIZE = 16;
    static uint8_t AAD[AAD_SIZE] = "abababababababa";
    static const uint32_t NONCE_SIZE = 12;
    static uint8_t NONCE[NONCE_SIZE] = "hahahahahah";
    static const uint32_t AEAD_TAG_SIZE = 16;
    static const uint32_t X25519_256_SIZE = 256;
    struct HksImportWrappedKeyTestParams {
        struct OH_Huks_Blob *wrappingKeyAlias;
        struct OH_Huks_Blob *agreeKeyAlgName;
        struct OH_Huks_ParamSet *genWrappingKeyParamSet;
        uint32_t publicKeySize;
    
        struct OH_Huks_Blob *callerKeyAlias;
        struct OH_Huks_ParamSet *genCallerKeyParamSet;
    
        struct OH_Huks_Blob *callerKekAlias;
        struct OH_Huks_Blob *callerKek;
        struct OH_Huks_ParamSet *importCallerKekParamSet;
    
        struct OH_Huks_Blob *callerAgreeKeyAlias;
        struct OH_Huks_ParamSet *agreeParamSet;
    
        struct OH_Huks_ParamSet *importWrappedKeyParamSet;
        struct OH_Huks_Blob *importedKeyAlias;
        struct OH_Huks_Blob *importedPlainKey;
        uint32_t keyMaterialLen;
    };
    struct HksTestCertChain {
        bool certChainExist;
        bool certCountValid;
        bool certDataExist;
        uint32_t certDataSize;
    };
    static uint32_t CERT_COUNT = 4;
    static uint32_t INVALID_Param = 0xFFFFFFFF;
    static const uint32_t COMMON_SIZE = 2048;
    static uint32_t g_size = 4096;
    static uint32_t g_size1 = 65536;
    napi_value GetSdkVersionTest_001(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_003(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_004(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_005(napi_env env, napi_callback_info info);
    napi_value GenerateKeyItemTest_006(napi_env env, napi_callback_info info);
    napi_value ImportKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value ImportKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value ImportKeyItemTest_003(napi_env env, napi_callback_info info);
    napi_value ImportKeyItemTest_004(napi_env env, napi_callback_info info);
    napi_value ImportWrappedKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value ImportWrappedKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value ImportWrappedKeyItemTest_003(napi_env env, napi_callback_info info);
    napi_value ImportWrappedKeyItemTest_004(napi_env env, napi_callback_info info);
    napi_value ExportPublicKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value ExportPublicKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value ExportPublicKeyItemTest_003(napi_env env, napi_callback_info info);
    napi_value ExportPublicKeyItemTest_004(napi_env env, napi_callback_info info);
    napi_value DeleteKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value DeleteKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value GetKeyItemParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value GetKeyItemParamSetTest_002(napi_env env, napi_callback_info info);
    napi_value GetKeyItemParamSetTest_003(napi_env env, napi_callback_info info);
    napi_value IsKeyItemExistTest_001(napi_env env, napi_callback_info info);
    napi_value IsKeyItemExistTest_002(napi_env env, napi_callback_info info);
    napi_value IsKeyItemExistTest_003(napi_env env, napi_callback_info info);
    napi_value AttestKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value AttestKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value AttestKeyItemTest_003(napi_env env, napi_callback_info info);
    napi_value AnonAttestKeyItemTest_001(napi_env env, napi_callback_info info);
    napi_value AnonAttestKeyItemTest_002(napi_env env, napi_callback_info info);
    napi_value AnonAttestKeyItemTest_003(napi_env env, napi_callback_info info);
    napi_value InitSessionTest_001(napi_env env, napi_callback_info info);
    napi_value InitSessionTest_002(napi_env env, napi_callback_info info);
    napi_value InitSessionTest_003(napi_env env, napi_callback_info info);
    napi_value UpdateSessionTest_001(napi_env env, napi_callback_info info);
    napi_value UpdateSessionTest_002(napi_env env, napi_callback_info info);
    napi_value UpdateSessionTest_003(napi_env env, napi_callback_info info);
    napi_value UpdateSessionTest_004(napi_env env, napi_callback_info info);
    napi_value FinishSessionTest_001(napi_env env, napi_callback_info info);
    napi_value FinishSessionTest_002(napi_env env, napi_callback_info info);
    napi_value FinishSessionTest_003(napi_env env, napi_callback_info info);
    napi_value AbortSessionTest_001(napi_env env, napi_callback_info info);
    napi_value AbortSessionTest_002(napi_env env, napi_callback_info info);
    napi_value ListAliasesTest_001(napi_env env, napi_callback_info info);
    napi_value WrapKeyTest_001(napi_env env, napi_callback_info info);
    napi_value WrapKeyTest_002(napi_env env, napi_callback_info info);
    napi_value WrapKeyTest_003(napi_env env, napi_callback_info info);
    napi_value UnwrapKeyTest_001(napi_env env, napi_callback_info info);
    napi_value UnwrapKeyTest_002(napi_env env, napi_callback_info info);
    napi_value UnwrapKeyTest_003(napi_env env, napi_callback_info info);
    napi_value InitParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value AddParamsTest_001(napi_env env, napi_callback_info info);
    napi_value BuildParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value CopyParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value GetParamTest_001(napi_env env, napi_callback_info info);
    napi_value FreshParamSetTest_001(napi_env env, napi_callback_info info);
    napi_value IsParamSetTagValidTest_001(napi_env env, napi_callback_info info);
    napi_value IsParamSetValidTest_001(napi_env env, napi_callback_info info);
    napi_value CheckParamMatchTest_001(napi_env env, napi_callback_info info);

}

#endif // MINDSPORE_CONTEXT_TEST_H