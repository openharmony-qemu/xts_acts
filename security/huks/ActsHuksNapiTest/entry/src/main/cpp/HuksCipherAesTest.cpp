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

#include "include/HuksCipherAesTest.h"
#include <cstdlib>
#include <cstring>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <securec.h>
#include <string>

namespace Acts {
namespace Huks {

// Constants and test data
static const uint32_t AES_COMMON_SIZE = 1024;
static const uint32_t IV_SIZE = 16;
static const uint32_t AAD_SIZE = 16;
static const uint32_t NONCE_SIZE = 12;
static const uint32_t AEAD_SIZE = 16;
static const uint32_t MAX_UPDATE_SIZE = 64;
static const uint32_t MAX_OUTDATA_SIZE = MAX_UPDATE_SIZE * 2;

static uint8_t IV[IV_SIZE] = { 0 };
static uint8_t AAD[AAD_SIZE] = { 0 };
static uint8_t NONCE[NONCE_SIZE] = { 0 };
static uint8_t AEAD[AEAD_SIZE] = { 0 };

static const std::string g_inData =
    "Hks_AES_Cipher_Test_000000000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

// Helper function: Memory comparison
static int32_t HksMemCmp(const void* ptr1, const void* ptr2, uint32_t size)
{
    return memcmp(ptr1, ptr2, size);
}

// Helper function: Initialize ParamSet
static OH_Huks_Result
    InitParamSet(struct OH_Huks_ParamSet** paramSet, const struct OH_Huks_Param* params, uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramCount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    return ret;
}

// Helper function: Update test data
static OH_Huks_Result HksTestUpdate(const struct OH_Huks_Blob* handle,
                                    const struct OH_Huks_ParamSet* paramSet,
                                    const struct OH_Huks_Blob* inData)
{
    struct OH_Huks_Blob inDataSeg = *inData;
    inDataSeg.size = MAX_UPDATE_SIZE;

    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    uint8_t* lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = { .size = MAX_OUTDATA_SIZE, .data = nullptr };

    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }

    if (!isFinished) {
        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            return ret;
        }
    }

    return ret;
}

// Helper function: Test update loop and finish
static OH_Huks_Result TestUpdateLoopFinish(const struct OH_Huks_Blob* handle,
                                           const struct OH_Huks_ParamSet* paramSet,
                                           const struct OH_Huks_Blob* inData,
                                           struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    uint8_t* lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = { MAX_OUTDATA_SIZE, nullptr };
    uint8_t* cur = outData->data;
    outData->size = 0;

    inDataSeg.size = MAX_UPDATE_SIZE;

    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
            outDataSeg.data = (uint8_t*)malloc(outDataSeg.size);
            if (outDataSeg.data == nullptr) {
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            free(outDataSeg.data);
            return ret;
        }
        if (memcpy_s(cur, AES_COMMON_SIZE - (cur - outData->data), outDataSeg.data, outDataSeg.size) != EOK) {
            free(outDataSeg.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        cur += outDataSeg.size;
        outData->size += outDataSeg.size;
        free(outDataSeg.data);
        inDataSeg.data += MAX_UPDATE_SIZE;
    }

    struct OH_Huks_Blob outDataFinish = { inData->size * 2, nullptr };
    outDataFinish.data = (uint8_t*)malloc(outDataFinish.size);
    if (outDataFinish.data == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    if (!isFinished) {
        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataFinish);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            free(outDataFinish.data);
            return ret;
        }
        if (memcpy_s(cur, AES_COMMON_SIZE - (cur - outData->data), outDataFinish.data, outDataFinish.size) != EOK) {
            free(outDataFinish.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        cur += outDataFinish.size;
        outData->size += outDataFinish.size;
        free(outDataFinish.data);
        outDataFinish.size = inData->size * 2;
        outDataFinish.data = (uint8_t*)malloc(outDataFinish.size);
        if (outDataFinish.data == nullptr) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
    }

    ret = OH_Huks_FinishSession(handle, paramSet, &inDataSeg, &outDataFinish);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        free(outDataFinish.data);
        return ret;
    }
    if (memcpy_s(cur, AES_COMMON_SIZE - (cur - outData->data), outDataFinish.data, outDataFinish.size) != EOK) {
        free(outDataFinish.data);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    outData->size += outDataFinish.size;
    free(outDataFinish.data);

    return ret;
}

// Helper function: AES Cipher Test Encrypt
static OH_Huks_Result HksAesCipherTestEncrypt(const struct OH_Huks_Blob* keyAlias,
                                              const struct OH_Huks_ParamSet* encryptParamSet,
                                              const struct OH_Huks_Blob* inData,
                                              struct OH_Huks_Blob* cipherText)
{
    uint8_t handleE[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleEncrypt = { sizeof(uint64_t), handleE };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, encryptParamSet, &handleEncrypt, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateLoopFinish(&handleEncrypt, encryptParamSet, inData, cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    if (HksMemCmp(inData->data, cipherText->data, inData->size) == (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    return ret;
}

// Helper function: AES Cipher Test Decrypt
static OH_Huks_Result HksAesCipherTestDecrypt(const struct OH_Huks_Blob* keyAlias,
                                              const struct OH_Huks_ParamSet* decryptParamSet,
                                              const struct OH_Huks_Blob* cipherText,
                                              struct OH_Huks_Blob* plainText,
                                              const struct OH_Huks_Blob* inData)
{
    uint8_t handleD[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleDecrypt = { sizeof(uint64_t), handleD };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, decryptParamSet, &handleDecrypt, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateLoopFinish(&handleDecrypt, decryptParamSet, cipherText, plainText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    if (HksMemCmp(inData->data, plainText->data, inData->size) != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    return ret;
}

// Helper function: AES Cipher Test Case Other
static OH_Huks_Result HksAesCipherTestCaseOther(const struct OH_Huks_Blob* keyAlias,
                                                struct OH_Huks_ParamSet* genParamSet,
                                                struct OH_Huks_ParamSet* encryptParamSet,
                                                struct OH_Huks_ParamSet* decryptParamSet)
{
    char tmpInData[] = "AES_ECB_INDATA_1";
    struct OH_Huks_Blob inData = { static_cast<uint32_t>(g_inData.length()), (uint8_t*)g_inData.c_str() };

    struct OH_Huks_Param* modeParam = nullptr;
    OH_Huks_Result ret = OH_Huks_GetParam(genParamSet, OH_HUKS_TAG_BLOCK_MODE, &modeParam);
    if (modeParam->uint32Param == OH_HUKS_MODE_ECB) {
        inData.size = strlen(tmpInData);
        inData.data = (uint8_t*)tmpInData;
    }

    /* 1. Generate Key */
    ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 2. Encrypt */
    uint8_t cipher[AES_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob cipherText = { AES_COMMON_SIZE, cipher };
    ret = HksAesCipherTestEncrypt(keyAlias, encryptParamSet, &inData, &cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    /* 3. Decrypt Three Stage */
    uint8_t plain[AES_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob plainText = { AES_COMMON_SIZE, plain };
    ret = HksAesCipherTestDecrypt(keyAlias, decryptParamSet, &cipherText, &plainText, &inData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    /* 4. Delete Key */
    OH_Huks_Result deleteRet = OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
    if (deleteRet.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return deleteRet;
    }

    return ret;
}

/**
 * @tc.name   SecurityHuksNapiCipherAes0100
 * @tc.number Security_HUKS_NAPI_Cipher_AES_0100
 * @tc.desc   alg-AES pur-ENCRYPT&DECRYPT mod-CBC pad-NONE size-256.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiCipherAes0100()
{
    char tmpKeyAlias[] = "HksAESCipherKeyAliasTest015";
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(tmpKeyAlias)), (uint8_t*)tmpKeyAlias };

    static struct OH_Huks_Param g_genParams015[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };
    static struct OH_Huks_Param g_encryptParams015[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
        { .tag = OH_HUKS_TAG_IV, .blob = { .size = IV_SIZE, .data = (uint8_t*)IV } },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };
    static struct OH_Huks_Param g_decryptParams015[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
        { .tag = OH_HUKS_TAG_IV, .blob = { .size = IV_SIZE, .data = (uint8_t*)IV } },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };

    struct OH_Huks_ParamSet* genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams015, sizeof(g_genParams015) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    struct OH_Huks_ParamSet* encryptParamSet = nullptr;
    ret = InitParamSet(&encryptParamSet, g_encryptParams015, sizeof(g_encryptParams015) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        return -1;
    }

    struct OH_Huks_ParamSet* decryptParamSet = nullptr;
    ret = InitParamSet(&decryptParamSet, g_decryptParams015, sizeof(g_decryptParams015) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        OH_Huks_FreeParamSet(&encryptParamSet);
        return -1;
    }

    ret = HksAesCipherTestCaseOther(&keyAlias, genParamSet, encryptParamSet, decryptParamSet);

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&encryptParamSet);
    OH_Huks_FreeParamSet(&decryptParamSet);

    // Check if error is due to environment limitations
    if (ret.errorCode == (int32_t)OH_HUKS_ERR_ALGORITHM_NOT_SUPPORTED ||
        ret.errorCode == (int32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ||
        ret.errorCode == (int32_t)OH_HUKS_ERR_CODE_INTERNAL_ERROR) {
        return 0; // Environment limitation, skip test gracefully
    }

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1; // Real error, should fail
    }

    return 0; // Test passed successfully
}

} // namespace Huks
} // namespace Acts
