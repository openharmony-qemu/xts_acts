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
#include "common/memcpy_s.c"

namespace HuksApiTest {
napi_value GetSdkVersionTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_Huks_Blob *blobNullptr = nullptr;
    auto ret = OH_Huks_GetSdkVersion(blobNullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value GenerateKeyItemTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    auto ret = OH_Huks_GenerateKeyItem(&keyAlias, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

OH_Huks_Result InitParamSet(
    struct OH_Huks_ParamSet **paramSet,
    const struct OH_Huks_Param *params,
    uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_AddParams(*paramSet, params, paramCount);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }
    return ret;
}

//正确参数集
struct OH_Huks_Param g_testGenerateKeyParam[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,          // 指定密钥算法类型
        .uint32Param = OH_HUKS_ALG_ECC         // 使用ECC（椭圆曲线密码学）算法
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,            // 设置密钥用途
        .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE // 用于密钥协商（如ECDH密钥交换）
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,           // 定义密钥长度
        .uint32Param = OH_HUKS_ECC_KEY_SIZE_256 // ECC密钥大小为256位，相当于3072位RSA安全性
    }, {
        .tag = OH_HUKS_TAG_DIGEST,             // 设置摘要算法
        .uint32Param = OH_HUKS_DIGEST_NONE     // 不使用摘要算法（密钥协商通常不需要）
    }
};

napi_value GenerateKeyItemTest_002(napi_env env, napi_callback_info info)
{
    const char *alias = "test_generate_invalid_param";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_Param invalidParams[] = {
        {
            .tag = OH_HUKS_TAG_ALGORITHM,
            .uint32Param = OH_HUKS_ALG_AES  // 使用对称算法AES
        },
        {
            .tag = OH_HUKS_TAG_PURPOSE,
            .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN  // 但用途设置为签名，AES不支持签名操作
        },
        {
            .tag = OH_HUKS_TAG_KEY_SIZE,
            .uint32Param = OH_HUKS_AES_KEY_SIZE_256  // AES 256位密钥
        },
        {
            .tag = OH_HUKS_TAG_PADDING,
            .uint32Param = OH_HUKS_PADDING_NONE  // 无填充
        },
        {
            .tag = OH_HUKS_TAG_BLOCK_MODE,
            .uint32Param = OH_HUKS_MODE_ECB  // ECB模式
        }
    };
    struct OH_Huks_ParamSet *invalidParamSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&invalidParamSet, invalidParams, sizeof(invalidParams) / sizeof(OH_Huks_Param));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GenerateKeyItemTest_002", 
                    "InitParamSet failed: %{public}d", ohResult.errorCode);
        napi_value retValue;
        napi_create_int32(env, 1, &retValue); // 初始化失败，测试不通过
        return retValue;
    }
    ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, invalidParamSet, nullptr);
    OH_Huks_FreeParamSet(&invalidParamSet);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    napi_value retValue;
    napi_create_int32(env, ohResult.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value GenerateKeyItemTest_003(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&paramSet, g_testGenerateKeyParam, sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111", 
                    "InitParamSet failed: %{public}d", ohResult.errorCode);
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "First GenerateKey success: %{public}d", ohResult.errorCode);
    struct OH_Huks_Result ohResult2 = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "Second GenerateKey result: %{public}d", ohResult2.errorCode);
    struct OH_Huks_Result existResult = OH_Huks_IsKeyItemExist(&aliasBlob, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "Key exist check: %{public}d", existResult.errorCode);
    struct OH_Huks_Result deleteResult = OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "Delete key result: %{public}d", deleteResult.errorCode);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ohResult2.errorCode == OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST ? 0 : 1, &retValue);
    
    return retValue;
}

napi_value GenerateKeyItemTest_004(napi_env env, napi_callback_info info)
{
    const char *alias = "test_key_insufficient_memory";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = OH_Huks_InitParamSet(&paramSet);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    struct OH_Huks_Param hugeParam = {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = 65536
    };
    ohResult = OH_Huks_AddParams(paramSet, &hugeParam, 1);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111",
                 "GenerateKeyItem result: %{public}d", ohResult.errorCode);
    if (paramSet != nullptr) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    napi_value retValue;
    napi_create_int32(env, ohResult.errorCode == OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value GenerateKeyItemTest_005(napi_env env, napi_callback_info info)
{
    const char *alias = "test_key_require_device_password";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Param testParams[] = {
        {
            .tag = OH_HUKS_TAG_ALGORITHM,
            .uint32Param = OH_HUKS_ALG_RSA
        },
        {
            .tag = OH_HUKS_TAG_KEY_SIZE,
            .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048
        },
        {
            .tag = OH_HUKS_TAG_PURPOSE,
            .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT
        },
        {
            .tag = OH_HUKS_TAG_PADDING,
            .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5
        },
        {
            .tag = OH_HUKS_TAG_DIGEST,
            .uint32Param = OH_HUKS_DIGEST_SHA256
        },
        {
            .tag = OH_HUKS_TAG_IS_DEVICE_PASSWORD_SET,
            .boolParam = true
        }
    };
    auto ohResult = OH_Huks_InitParamSet(&paramSet);
    ohResult = OH_Huks_AddParams(paramSet, testParams, sizeof(testParams) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_BuildParamSet(&paramSet);
    ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "GenerateKeyItem result: %{public}d, expected: %{public}d", 
                ohResult.errorCode, OH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    napi_value retValue;
    napi_create_int32(env, ohResult.errorCode == OH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET ? 0 : 1, &retValue);
    return retValue;
}

napi_value GenerateKeyItemTest_006(napi_env env, napi_callback_info info)
{
    const char *alias = "test_internal_error";
    struct OH_Huks_Blob aliasBlob = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    OH_Huks_Param internalErrorParams[] = {
        {
            .tag = OH_HUKS_TAG_ALGORITHM,
            .uint32Param = OH_HUKS_ALG_RSA  // 使用有效算法
        },
        {
            .tag = OH_HUKS_TAG_KEY_SIZE,
            .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048  // 使用有效密钥尺寸
        },
        {
            .tag = OH_HUKS_TAG_PURPOSE,
            .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT
        },
        {
            .tag = OH_HUKS_TAG_PADDING,
            .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5
        },
        {
            .tag = OH_HUKS_TAG_DIGEST,
            .uint32Param = OH_HUKS_DIGEST_SHA256
        },
        /* 添加可能触发系统内部错误的特殊参数 */
        {
            .tag = OH_HUKS_TAG_IS_ASYNCHRONIZED,
            .uint32Param = 2  // 无效的异步标志（0或1有效）
        }
    };
    ohResult = OH_Huks_InitParamSet(&paramSet);
    ohResult = OH_Huks_AddParams(paramSet, internalErrorParams, sizeof(internalErrorParams) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_BuildParamSet(&paramSet);
    ohResult = OH_Huks_GenerateKeyItem(&aliasBlob, paramSet, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_DeleteKeyItem(&aliasBlob, nullptr);
    napi_value retValue;
    napi_create_int32(env, ohResult.errorCode == OH_HUKS_ERR_CODE_INTERNAL_ERROR ? 0 : 1, &retValue);
    return retValue;
}

static struct OH_Huks_Param g_encryptParams001[] = {
    // 指定加密算法为RSA非对称加密算法
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
    // 设置密钥用途为加密操作（非解密或签名）
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
    // 定义RSA密钥长度为4096位，提供高安全性
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096},
    // 使用OAEP填充模式，比PKCS#1更安全，能抵抗选择密文攻击
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384},
    // 设置分组模式为ECB（电子密码本模式），但对RSA算法可能不适用
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}
    // 注：这是一个高安全性的RSA加密配置，适用于敏感数据保护
};

napi_value ImportKeyItemTest_001(napi_env env, napi_callback_info info)
{
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = sizeof(tmpKey),
                                       .data = reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKey))};
    struct OH_Huks_ParamSet *encryptParamSet = nullptr;
    struct OH_Huks_Result ret = OH_Huks_ImportKeyItem(&newKeyAlias, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportKeyItemTest_002(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&paramSet, g_testGenerateKeyParam,
                          sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret1 = OH_Huks_ExportPublicKeyItem(&keyAlias, paramSet, &publicKey);
    struct OH_Huks_Param invalidParams[] = {
        {
            .tag = OH_HUKS_TAG_PURPOSE,
            .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN  // 但用途设置为签名，AES不支持签名操作
        },
        {
            .tag = OH_HUKS_TAG_KEY_SIZE,
            .uint32Param = OH_HUKS_AES_KEY_SIZE_256  // AES 256位密钥
        },
        {
            .tag = OH_HUKS_TAG_PADDING,
            .uint32Param = OH_HUKS_PADDING_NONE  // 无填充
        },
        {
            .tag = OH_HUKS_TAG_BLOCK_MODE,
            .uint32Param = OH_HUKS_MODE_ECB  // ECB模式
        }
    };
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;
    ret1 = InitParamSet(&verifyParamSet, invalidParams, sizeof(invalidParams) / sizeof(OH_Huks_Param));
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = (uint32_t)strlen(tmpKey), .data = (uint8_t *)tmpKey};
    auto ret = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret key result: %{public}d", ret.errorCode);
    struct OH_Huks_Result deleteResult = OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&newKeyAlias, nullptr);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportKeyItemTest_003(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&paramSet, g_testGenerateKeyParam,
                          sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret1 = OH_Huks_ExportPublicKeyItem(&keyAlias, paramSet, &publicKey);
    struct OH_Huks_Param invalidParams[] = {
        {
            .tag = OH_HUKS_TAG_ALGORITHM,
            .uint32Param = INVALID_Param  // 使用无效的算法值，触发INVALID_CRYPTO_ALG_ARGUMENT错误
        },
        {
            .tag = OH_HUKS_TAG_PURPOSE,
            .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT
        },
        {
            .tag = OH_HUKS_TAG_KEY_SIZE,
            .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096
        },
        {
            .tag = OH_HUKS_TAG_PADDING,
            .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5
        },
        {
            .tag = OH_HUKS_TAG_DIGEST,
            .uint32Param = OH_HUKS_DIGEST_SHA256
        }
    };
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;
    ret1 = InitParamSet(&verifyParamSet, invalidParams,
                        sizeof(invalidParams) / sizeof(OH_Huks_Param));
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = (uint32_t)strlen(tmpKey), .data = (uint8_t *)tmpKey};
    auto ret = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret key result: %{public}d", ret.errorCode);
    struct OH_Huks_Result deleteResult = OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportKeyItemTest_111(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&paramSet, g_testGenerateKeyParam,
                          sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111", 
                    "InitParamSet failed: %{public}d", ohResult.errorCode);
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "First GenerateKey success: %{public}d", ohResult.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret1 = OH_Huks_ExportPublicKeyItem(&keyAlias, paramSet, &publicKey);
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;
    InitParamSet(&verifyParamSet, g_testGenerateKeyParam, sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = (uint32_t)strlen(tmpKey), .data = (uint8_t *)tmpKey};
    auto ret = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    auto ret2 = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret key result: %{public}d", ret.errorCode);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret key result: %{public}d", ret2.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportKeyItemTest_004(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&paramSet, g_testGenerateKeyParam,
                          sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111", 
                    "InitParamSet failed: %{public}d", ohResult.errorCode);
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "First GenerateKey success: %{public}d", ohResult.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret1 = OH_Huks_ExportPublicKeyItem(&keyAlias, paramSet, &publicKey);
    /* 5. Import Key */
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;
    ret1 = InitParamSet(&verifyParamSet, g_testGenerateKeyParam,
                       sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = (uint32_t)strlen(tmpKey), .data = (uint8_t *)tmpKey};
    auto ret = OH_Huks_ImportKeyItem(&newKeyAlias, verifyParamSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret key result: %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportWrappedKeyItemTest_001(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    char tmpKeyAlias1[] = "HksRSACipherKeyAliasTest0001";
    OH_Huks_Blob wrappingKeyAlias = {sizeof(tmpKeyAlias1),
        reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias1))};
    auto ret = OH_Huks_ImportWrappedKeyItem(&keyAlias, &wrappingKeyAlias, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

void *HksMalloc(size_t size) { return malloc(size); }

OH_Huks_Result MallocAndCheckBlobData(struct OH_Huks_Blob *blob, const uint32_t blobSize)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    blob->data = (uint8_t *)HksMalloc(blobSize);
    if (blob->data == NULL) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
    }

    return ret;
}

static OH_Huks_Result BuildWrappedKeyData(struct OH_Huks_Blob **blobArray, uint32_t size, struct OH_Huks_Blob *outData)
{
    uint32_t totalLength = size * sizeof(uint32_t);
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    /* counter size */
    for (uint32_t i = 0; i < size; ++i) {
        totalLength += blobArray[i]->size;
    }

    struct OH_Huks_Blob outBlob = {0, nullptr};
    outBlob.size = totalLength;
    (void)MallocAndCheckBlobData(&outBlob, outBlob.size);

    uint32_t offset = 0;

    /* copy data */
    for (uint32_t i = 0; i < size; ++i) {
        if (memcpy_s(outBlob.data + offset, totalLength - offset, reinterpret_cast<uint8_t *>(&blobArray[i]->size),
                     sizeof(blobArray[i]->size)) != EOK) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        offset += sizeof(blobArray[i]->size);

        if (memcpy_s(outBlob.data + offset, totalLength - offset, blobArray[i]->data, blobArray[i]->size) != EOK) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        offset += blobArray[i]->size;
    }

    outData->size = outBlob.size;
    outData->data = outBlob.data;
    return ret;
}

napi_value ImportWrappedKeyItemTest_002(napi_env env, napi_callback_info info)
{
    auto result1 = OH_Huks_ImportWrappedKeyItem(nullptr, nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111", "result1: %{public}d", result1.errorCode);
    napi_value retValue;
    napi_create_int32(env, result1.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportWrappedKeyItemTest_003(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    char tmpKeyAlias1[] = "HksRSACipherKeyAliasTest0001";
    OH_Huks_Blob wrappingKeyAlias = {sizeof(tmpKeyAlias1),
        reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias1))};
    auto ret = OH_Huks_ImportWrappedKeyItem(&keyAlias, &wrappingKeyAlias, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ImportWrappedKeyItemTest_004(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    char tmpKeyAlias1[] = "HksRSACipherKeyAliasTest0001";
    OH_Huks_Blob wrappingKeyAlias = {sizeof(tmpKeyAlias1),
        reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias1))};
    auto ret = OH_Huks_ImportWrappedKeyItem(&keyAlias, &wrappingKeyAlias, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ExportPublicKeyItemTest_001(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    auto ret = OH_Huks_ExportPublicKeyItem(&keyAlias, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ExportPublicKeyItemTest_002(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    char tmpKeyAlias1[] = "HksRSACipherKeyAliasTest0001";
    OH_Huks_Blob wrappingKeyAlias = {sizeof(tmpKeyAlias1),
        reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias1))};
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret = OH_Huks_ExportPublicKeyItem(&wrappingKeyAlias, nullptr, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret1 Export %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value ExportPublicKeyItemTest_003(napi_env env, napi_callback_info info)
{
    const char *alias = "test_rsa_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&paramSet, g_testGenerateKeyParam,
                          sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "GenerateKey success: %{public}d", ohResult.errorCode);
    struct OH_Huks_Param missingAlgParams[] = {
        {
            .tag = OH_HUKS_TAG_PURPOSE,
            .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT
        },
        {
            .tag = OH_HUKS_TAG_KEY_SIZE,
            .uint32Param = OH_HUKS_RSA_KEY_SIZE_1024
        },
        {
            .tag = OH_HUKS_TAG_PADDING,
            .uint32Param = OH_HUKS_PADDING_PKCS1_V1_5
        },
        {
            .tag = OH_HUKS_TAG_DIGEST,
            .uint32Param = OH_HUKS_DIGEST_SHA256
        }
    };
    
    struct OH_Huks_ParamSet *missingAlgParamSet = nullptr;
    ohResult = InitParamSet(&missingAlgParamSet, missingAlgParams,
                          sizeof(missingAlgParams) / sizeof(OH_Huks_Param));
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret = OH_Huks_ExportPublicKeyItem(&keyAlias, missingAlgParamSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "Export Public Key result: %{public}d, Expected: 12000002", ret.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_FreeParamSet(&missingAlgParamSet);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value ExportPublicKeyItemTest_004(napi_env env, napi_callback_info info)
{
    const char *alias = "test_rsa_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    struct OH_Huks_ParamSet *paramSet1 = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&paramSet1, g_testGenerateKeyParam, sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet1, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "GenerateKey success: %{public}d", ohResult.errorCode);
    struct OH_Huks_ParamSet *paramSet = nullptr;
    ohResult = OH_Huks_InitParamSet(&paramSet);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    struct OH_Huks_Param hugeParam = {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = 65536
    };
    ohResult = OH_Huks_AddParams(paramSet, &hugeParam, 1);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret = OH_Huks_ExportPublicKeyItem(&keyAlias, paramSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "Export Public Key result: %{public}d, Expected: 12000002", ret.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_FreeParamSet(&paramSet1);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value DeleteKeyItemTest_001(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    auto ret = OH_Huks_DeleteKeyItem(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value DeleteKeyItemTest_002(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    auto ret = OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST  ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetKeyItemParamSetTest_001(napi_env env, napi_callback_info info)
{
    auto ret = OH_Huks_GetKeyItemParamSet(nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetKeyItemParamSetTest_002(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSetOut = nullptr;
    OH_Huks_InitParamSet(&paramSetOut);
    OH_Huks_BuildParamSet(&paramSetOut);
    auto ret = OH_Huks_GetKeyItemParamSet(&keyAlias, nullptr, paramSetOut);
    OH_Huks_FreeParamSet(&paramSetOut);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

struct OH_Huks_Param tmpParams[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS},
    {.tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DEFAULT},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
};

napi_value GetKeyItemParamSetTest_111(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    ret = OH_Huks_BuildParamSet(&paramSet);
    struct OH_Huks_Result resSt = OH_Huks_IsKeyItemExist(&keyAlias, paramSet);
    ret = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    struct OH_Huks_ParamSet *paramSetOut = nullptr;
    OH_Huks_InitParamSet(&paramSetOut);
    OH_Huks_BuildParamSet(&paramSetOut);
    paramSetOut->paramSetSize = COMMON_SIZE;
    struct OH_Huks_Result resultSt = OH_Huks_GetKeyItemParamSet(&keyAlias, paramSet, paramSetOut);
    OH_Huks_DeleteKeyItem(&keyAlias, paramSet);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_FreeParamSet(&paramSetOut);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111111", "ret: %{public}d", resultSt.errorCode);
    napi_value retValue;
    napi_create_int32(env, resultSt.errorCode == 0 ? 0 : 1, &retValue);
    return retValue;
}

struct OH_Huks_Param invalidParams1[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_AES  // 使用对称算法AES
    },
    {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN  // 但用途设置为签名，AES不支持签名操作
    },
    {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_AES_KEY_SIZE_256  // AES 256位密钥
    },
    {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_NONE  // 无填充
    },
    {
        .tag = OH_HUKS_TAG_BLOCK_MODE,
        .uint32Param = OH_HUKS_MODE_ECB  // ECB模式
    }
};

napi_value GetKeyItemParamSetTest_003(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                            sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    OH_Huks_BuildParamSet(&paramSet);
    struct OH_Huks_Result resSt = OH_Huks_IsKeyItemExist(&keyAlias, paramSet);
    OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    struct OH_Huks_ParamSet *paramSetOut = nullptr;
    OH_Huks_AddParams(paramSetOut, invalidParams1, sizeof(invalidParams1) / sizeof(invalidParams1[0]));
    OH_Huks_BuildParamSet(&paramSetOut);
    struct OH_Huks_Result resultSt = OH_Huks_GetKeyItemParamSet(&keyAlias, paramSet, paramSetOut);
    OH_Huks_DeleteKeyItem(&keyAlias, paramSet);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_FreeParamSet(&paramSetOut);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111111", "ret: %{public}d", resultSt.errorCode);
    napi_value retValue;
    napi_create_int32(env, resultSt.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value IsKeyItemExistTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_IsKeyItemExist(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value IsKeyItemExistTest_002(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_Result resSt = OH_Huks_IsKeyItemExist(&keyAlias, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", resSt.errorCode);
    napi_value retValue;
    napi_create_int32(env, resSt.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value IsKeyItemExistTest_003(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    ret = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                            sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret = OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    struct OH_Huks_ParamSet *paramSet1 = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret = OH_Huks_AddParams(paramSet1, invalidParams1, sizeof(invalidParams1) / sizeof(invalidParams1[0]));
    ret = OH_Huks_BuildParamSet(&paramSet1);
    struct OH_Huks_Result result = OH_Huks_IsKeyItemExist(&keyAlias, paramSet1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111", "result: %{public}d", result.errorCode);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    napi_value retValue;
    napi_create_int32(env, result.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
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
            memset((*certChain)->certs[i].data, certChainParam->certDataSize, certChainParam->certDataSize);
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

napi_value AttestKeyItemTest_003(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_AttestKeyItem(nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
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
    OH_Huks_FreeParamSet(&paramSet);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value AnonAttestKeyItemTest_003(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1.errorCode);
    ret1 = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1.errorCode);
    OH_Huks_CertChain *certChain = nullptr;
    const struct HksTestCertChain certParam = {true, true, true, g_size};
    (void)ConstructDataToCertChain(&certChain, &certParam);
    struct OH_Huks_Result ret = OH_Huks_AnonAttestKeyItem(&keyAlias, paramSet, certChain);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "paramSet: %{public}d", paramSet);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "certChain: %{public}d", certChain);
    napi_value retValue;
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value InitSessionTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_InitSession(nullptr, nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

static struct OH_Huks_Param g_genParamsTest001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}
};

static struct OH_Huks_Param g_signParamsTest001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}
};

napi_value InitSessionTest_002(napi_env env, napi_callback_info info)
{    
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    struct OH_Huks_Result ret = OH_Huks_InitSession(&keyAlias, signParamSet, &handle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&handle, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value InitSessionTest_003(napi_env env, napi_callback_info info)
{    
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1.errorCode);
    ret1 = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    InitParamSet(&genParamSet, g_genParamsTest001, sizeof(g_genParamsTest001) / sizeof(OH_Huks_Param));
    InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    struct OH_Huks_Result ret = OH_Huks_InitSession(&keyAlias, paramSet, &handle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&handle, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value UpdateSessionTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_UpdateSession(nullptr, nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value UpdateSessionTest_002(napi_env env, napi_callback_info info)
{    
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                  reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    struct OH_Huks_Result ret = OH_Huks_UpdateSession(&handle, signParamSet, &inData, &outData);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&handle, nullptr);
    OH_Huks_DeleteKeyItem(&outData, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value UpdateSessionTest_003(napi_env env, napi_callback_info info)
{    
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                  reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    struct OH_Huks_Result ret = OH_Huks_UpdateSession(&handle, signParamSet, &inData, &outData);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&outData, nullptr);
    OH_Huks_DeleteKeyItem(&handle, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value UpdateSessionTest_004(napi_env env, napi_callback_info info)
{    
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    auto ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "First GenerateKey success: %{public}d", ohResult.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret2 = OH_Huks_ExportPublicKeyItem(&keyAlias, paramSet, &publicKey);
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    struct OH_Huks_Blob inData = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                  reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    struct OH_Huks_Result ret = OH_Huks_UpdateSession(&handle, signParamSet, &inData, &inData);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&inData, nullptr);
    OH_Huks_DeleteKeyItem(&handle, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_DEVICE_PASSWORD_UNSET ? 0 : 1, &retValue);
    return retValue;
}

napi_value FinishSessionTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_FinishSession(nullptr, nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value FinishSessionTest_002(napi_env env, napi_callback_info info)
{    
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                  reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    struct OH_Huks_Result ret = OH_Huks_FinishSession(&handle, signParamSet, &inData, &outData);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&inData, nullptr);
    OH_Huks_DeleteKeyItem(&outData, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value FinishSessionTest_003(napi_env env, napi_callback_info info)
{    
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    auto ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "First GenerateKey success: %{public}d", ohResult.errorCode);
    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    struct OH_Huks_Result ret = OH_Huks_FinishSession(&handle, paramSet, &keyAlias, &outData);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&outData, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_KEY_ALREADY_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value AbortSessionTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_AbortSession(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value AbortSessionTest_002(napi_env env, napi_callback_info info)
{    
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    auto ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    uint8_t handleU[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), handleU};
    OH_Huks_Result ret2 = OH_Huks_InitSession(&keyAlias, paramSet, &handle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret2.errorCode);
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Result ret = OH_Huks_AbortSession(&handle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&handle, nullptr);
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value ListAliasesTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_ListAliases(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value WrapKeyTest_001(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    auto ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111111", "ret: %{public}d", ohResult.errorCode);
        static struct OH_Huks_Param g_wrapKeyParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
        {.tag = OH_HUKS_TAG_KEY_WRAP_TYPE, .uint32Param = OH_HUKS_KEY_WRAP_TYPE_HUK_BASED},
    };   
    struct OH_Huks_ParamSet *wrapKeyParamSet = nullptr;
    ohResult = InitParamSet(&paramSet, g_wrapKeyParams, sizeof(g_wrapKeyParams) / sizeof(OH_Huks_Param));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111111", "ret: %{public}d", ohResult.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob outData = {OH_HUKS_RSA_KEY_SIZE_1024, static_cast<unsigned char *>(tmpPublicKey)};
    struct OH_Huks_Result ret = OH_Huks_WrapKey(&keyAlias, paramSet, &outData);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&outData, nullptr);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value WrapKeyTest_002(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_WrapKey(nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value WrapKeyTest_003(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    auto ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ohResult.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob outData = {OH_HUKS_RSA_KEY_SIZE_1024, static_cast<unsigned char *>(tmpPublicKey)};
    struct OH_Huks_Result ret = OH_Huks_WrapKey(&keyAlias, paramSet, &keyAlias);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value UnwrapKeyTest_001(napi_env env, napi_callback_info info)
{
    const char *alias = "test_duplicate_key";
    struct OH_Huks_Blob keyAlias = { .size = (uint32_t)strlen(alias), .data = (uint8_t *)alias };
    char tmpKeyAlias[] = "HksPBKDF2DeriveKeyAliasTest001_1";
    OH_Huks_Blob keyAlias1 = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_Result ohResult;
    ohResult = InitParamSet(&paramSet, g_testGenerateKeyParam, sizeof(g_testGenerateKeyParam) / sizeof(OH_Huks_Param));
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111", 
                    "InitParamSet failed: %{public}d", ohResult.errorCode);
        napi_value retValue;
        napi_create_int32(env, 1, &retValue);
        return retValue;
    }
    ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", 
                "First GenerateKey success: %{public}d", ohResult.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, (uint8_t *)tmpPublicKey};
    auto ret1 = OH_Huks_ExportPublicKeyItem(&keyAlias, paramSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "1111111111111111", "ret1 Export  %{public}d", ret1.errorCode);
    struct OH_Huks_Result ret = OH_Huks_UnwrapKey(&keyAlias1, paramSet, &publicKey);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    OH_Huks_DeleteKeyItem(&keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&publicKey, nullptr);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value UnwrapKeyTest_002(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_UnwrapKey(nullptr, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_INVALID_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value UnwrapKeyTest_003(napi_env env, napi_callback_info info)
{
    char tmpKeyAlias[] = "testKey";
    OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret1 = OH_Huks_InitParamSet(&paramSet);
    ret1 = OH_Huks_AddParams(paramSet, g_testGenerateKeyParam,
                             sizeof(g_testGenerateKeyParam) / sizeof(g_testGenerateKeyParam[0]));
    ret1 = OH_Huks_BuildParamSet(&paramSet);
    auto ohResult = OH_Huks_GenerateKeyItem(&keyAlias, paramSet, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111111", "ret: %{public}d", ohResult.errorCode);
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob outData = {OH_HUKS_RSA_KEY_SIZE_1024, static_cast<unsigned char *>(tmpPublicKey)};
        static struct OH_Huks_Param g_wrapKeyParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
        {.tag = OH_HUKS_TAG_KEY_WRAP_TYPE, .uint32Param = OH_HUKS_KEY_WRAP_TYPE_HUK_BASED},
    };
    struct OH_Huks_ParamSet *wrapKeyParamSet = nullptr;
    InitParamSet(&wrapKeyParamSet, g_wrapKeyParams, sizeof(g_wrapKeyParams) / sizeof(OH_Huks_Param));
    struct OH_Huks_Result ret = OH_Huks_UnwrapKey(&keyAlias, wrapKeyParamSet, &keyAlias);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ITEM_NOT_EXIST ? 0 : 1, &retValue);
    return retValue;
}

napi_value InitParamSetTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_InitParamSet(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value AddParamsTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_AddParams(nullptr, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value BuildParamSetTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_BuildParamSet(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value CopyParamSetTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_CopyParamSet(nullptr, 0, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value GetParamTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_GetParam(nullptr, 0, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value FreshParamSetTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_FreshParamSet(nullptr, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value IsParamSetTagValidTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_IsParamSetTagValid(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value IsParamSetValidTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_IsParamSetValid(nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}

napi_value CheckParamMatchTest_001(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result ret = OH_Huks_CheckParamMatch(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret.errorCode);
    napi_value retValue;
    napi_create_int32(env, ret.errorCode == OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ? 0 : 1, &retValue);
    return retValue;
}
}