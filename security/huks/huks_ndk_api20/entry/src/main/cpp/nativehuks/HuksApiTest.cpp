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

#include "HuksApiTest.h"


namespace HuksApiTest {
//正确参数集
struct OH_Huks_Param g_testGenerateKeyParam[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
};

void *HksMalloc(size_t size)
{
    if (size == 0 || size > SIZE_MAX) {
        return NULL;
    }
    return malloc(size);
}

napi_value AttestKeyItemTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_AttestKeyItem(nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

int32_t ConstructDataToCertChain(struct OH_Huks_CertChain **certChain, const struct HksTestCertChain *certChainParam)
{
    if (!certChainParam->certChainExist) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111", "certChainParam: %{public}d", certChainParam);
        return PARAM_0;
    }
    *certChain = static_cast<struct OH_Huks_CertChain *>(HksMalloc(sizeof(struct OH_Huks_CertChain)));
    if (*certChain == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111", "certChainParam: %{public}d", *certChain);
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    if (!certChainParam->certCountValid) {
        (*certChain)->certsCount = PARAM_0;
        (*certChain)->certs = nullptr;
        return PARAM_0;
    }
    (*certChain)->certsCount = CERT_COUNT;
    if (!certChainParam->certDataExist) {
        (*certChain)->certs = nullptr;
        return PARAM_0;
    }
    (*certChain)->certs =
        static_cast<struct OH_Huks_Blob *>(HksMalloc(sizeof(struct OH_Huks_Blob) * ((*certChain)->certsCount)));
    if (*certChain != nullptr) {
        for (uint32_t i = PARAM_0; i < (*certChain)->certsCount; i++) {
            (*certChain)->certs[i].size = certChainParam->certDataSize;
            (*certChain)->certs[i].data =
                reinterpret_cast<uint8_t *>(static_cast<char *>(HksMalloc((*certChain)->certs[i].size)));
            std::fill((*certChain)->certs[i].data, (*certChain)->certs[i].data + certChainParam->certDataSize, 0);
        }
    }
    return PARAM_0;
}
napi_value AttestKeyItemTest_002(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_CertChain *certChain = nullptr;
    const struct HksTestCertChain certParam = {true, true, true, g_size};
    (void)ConstructDataToCertChain(&certChain, &certParam);
    struct OH_Huks_Result ret = OH_Huks_AttestKeyItem(&keyAlias, paramSet, certChain);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value AnonAttestKeyItemTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_AnonAttestKeyItem(nullptr, nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value AnonAttestKeyItemTest_002(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "AnonAttestKeyItemTest_002";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_CertChain *certChain1 = nullptr;
    const struct HksTestCertChain certParam1 = {true, true, true, g_size};
    (void)ConstructDataToCertChain(&certChain1, &certParam1);
    struct OH_Huks_Result ret = OH_Huks_AnonAttestKeyItem(&keyAlias, paramSet, certChain1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111",
                 "retAnonAttestKeyItemTest_002: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}
}
