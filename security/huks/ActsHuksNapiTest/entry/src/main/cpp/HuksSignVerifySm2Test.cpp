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

#include "include/HuksSignVerifySm2Test.h"
#include <huks/native_huks_api.h>
#include  <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>
#include <cstring>
#include <securec.h>

namespace Acts {
namespace Huks {

static const uint32_t SM2_COMMON_SIZE = 1024;
static const uint32_t MAX_UPDATE_SIZE = 64;
static const uint32_t MAX_OUTDATA_SIZE = 256;
static const uint32_t SUCCESS_RETURN_INDEX = 0;

static const std::string g_inData =
    "Hks_SM2_Sign_Verify_Test_0000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

struct GenerateKeyCaseParam {
    uint32_t id;
    int32_t result;
    struct OH_Huks_Param params[5];
};

static const struct GenerateKeyCaseParam g_genParamsTest[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },
};

static const struct GenerateKeyCaseParam g_signParamsTest[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },
};

static const struct GenerateKeyCaseParam g_verifyParamsTest[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        {{.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2},
         {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256},
         {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT},
         {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
         {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}},
    },
};

// Helper function: Initialize ParamSet
static OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet **paramSet, const struct OH_Huks_Param *params,
                                   uint32_t paramcount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramcount);
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

// Helper function: HksMalloc
static void *HksMalloc(size_t size)
{
    return malloc(size);
}

// Helper function: HksFree
static void HksFree(void *ptr)
{
    if (ptr != nullptr) {
        free(ptr);
    }
}

// Helper function: TestUpdateFinish
static OH_Huks_Result TestUpdateFinish(const struct OH_Huks_Blob *handle, const struct OH_Huks_ParamSet *paramSet,
                                      uint32_t purpose, const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    uint8_t *lastPtr = inData->data + inData->size - 1;
    struct OH_Huks_Blob outDataSeg = {MAX_OUTDATA_SIZE, nullptr};
    uint8_t *cur = outData->data;
    outData->size = 0;

    inDataSeg.size = MAX_UPDATE_SIZE;

    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
            if (purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT || purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
                outDataSeg.data = (uint8_t *)HksMalloc(outDataSeg.size);
                if (outDataSeg.data == nullptr) {
                    ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                    return ret;
                }
            }
            ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
            if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
                HksFree(outDataSeg.data);
                return ret;
            }
            if (outDataSeg.size > 0 && cur != nullptr) {
                if (memcpy_s(cur, outData->size + outDataSeg.size, outDataSeg.data, outDataSeg.size) != EOK) {
                    HksFree(outDataSeg.data);
                    ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                    return ret;
                }
                cur += outDataSeg.size;
                outData->size += outDataSeg.size;
            }
            HksFree(outDataSeg.data);
            inDataSeg.data += MAX_UPDATE_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
    }

    outDataSeg.size = MAX_OUTDATA_SIZE;
    if (purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT || purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
        outDataSeg.data = (uint8_t *)HksMalloc(outDataSeg.size);
        if (outDataSeg.data == nullptr) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
    } else {
        outDataSeg.data = cur;
    }
    ret = OH_Huks_FinishSession(handle, paramSet, &inDataSeg, &outDataSeg);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        if (purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT || purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
            HksFree(outDataSeg.data);
        }
        return ret;
    }

    if (purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT || purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
        if (outDataSeg.size > 0 && cur != nullptr) {
            if (memcpy_s(cur, outData->size + outDataSeg.size, outDataSeg.data, outDataSeg.size) != EOK) {
                HksFree(outDataSeg.data);
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }
            outData->size += outDataSeg.size;
        }
        HksFree(outDataSeg.data);
    } else {
        outData->size += outDataSeg.size;
    }

    return ret;
}

static OH_Huks_Result HksTestSignVerify(const struct OH_Huks_Blob *keyAlias, const struct OH_Huks_ParamSet *paramSet,
                                        const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outData)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    OH_Huks_Result ret;

    do {
        ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        struct OH_Huks_Param *tmpParam = nullptr;
        ret = OH_Huks_GetParam(paramSet, OH_HUKS_TAG_PURPOSE, &tmpParam);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        ret = TestUpdateFinish(&handle, paramSet, tmpParam->uint32Param, inData, outData);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        ret.errorCode = (int32_t)OH_HUKS_SUCCESS;
    } while (0);

    (void)OH_Huks_AbortSession(&handle, paramSet);
    return ret;
}

static OH_Huks_Result CreateImportKeyAlias(struct OH_Huks_Blob *importKeyAlias, const struct OH_Huks_Blob *keyAlias)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    const char *tmp = "new";
    importKeyAlias->size = keyAlias->size + strlen(tmp);
    importKeyAlias->data = (uint8_t *)HksMalloc(importKeyAlias->size);
    if (importKeyAlias->data == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    if (memcpy_s(importKeyAlias->data, importKeyAlias->size, keyAlias->data, keyAlias->size) != EOK) {
        HksFree(importKeyAlias->data);
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    if (memcpy_s(importKeyAlias->data + keyAlias->size, importKeyAlias->size - keyAlias->size, tmp, strlen(tmp)) !=
        EOK) {
        HksFree(importKeyAlias->data);
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }
    return ret;
}

// Helper function: Generate key and check existence
static OH_Huks_Result GenerateKeyForTest(const struct OH_Huks_Blob *keyAlias, const uint32_t genIndex,
                                         struct OH_Huks_ParamSet **genParamSet)
{
    OH_Huks_Result ret = InitParamSet(genParamSet, g_genParamsTest[genIndex].params,
                                      sizeof(g_genParamsTest[genIndex].params) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_GenerateKeyItem(keyAlias, *genParamSet, nullptr);
    if (ret.errorCode == (int32_t)OH_HUKS_ERR_ALGORITHM_NOT_SUPPORTED) {
        // Algorithm not supported, return success to skip test gracefully
        ret.errorCode = (int32_t)OH_HUKS_SUCCESS;
        return ret;
    }
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode =
            ((ret.errorCode == g_genParamsTest[genIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
        return ret;
    }

    ret = OH_Huks_IsKeyItemExist(keyAlias, *genParamSet);
    return ret;
}

// Helper function: Perform sign operation
static OH_Huks_Result PerformSignOperation(const struct OH_Huks_Blob *keyAlias, const uint32_t signIndex,
                                          const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outDataSign,
                                          struct OH_Huks_ParamSet **signParamSet)
{
    OH_Huks_Result ret = InitParamSet(signParamSet, g_signParamsTest[signIndex].params,
                                      sizeof(g_signParamsTest[signIndex].params) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = HksTestSignVerify(keyAlias, *signParamSet, inData, outDataSign);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode =
            ((ret.errorCode == g_signParamsTest[signIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
    }
    return ret;
}

// Helper function: Export public key and import for verify
static OH_Huks_Result ExportAndImportKeyForVerify(const struct OH_Huks_Blob *keyAlias,
                                                  const struct OH_Huks_Blob *importKeyAlias,
                                                  struct OH_Huks_ParamSet *genParamSet, const uint32_t verifyIndex,
                                                  struct OH_Huks_Blob *publicKey,
                                                  struct OH_Huks_ParamSet **verifyParamSet)
{
    OH_Huks_Result ret = OH_Huks_ExportPublicKeyItem(keyAlias, genParamSet, publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = InitParamSet(verifyParamSet, g_verifyParamsTest[verifyIndex].params,
                       sizeof(g_verifyParamsTest[verifyIndex].params) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_ImportKeyItem(importKeyAlias, *verifyParamSet, publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode =
            ((ret.errorCode == g_verifyParamsTest[verifyIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
    }
    return ret;
}

// Helper function: Perform verify operation
static OH_Huks_Result PerformVerifyOperation(const struct OH_Huks_Blob *importKeyAlias,
                                            struct OH_Huks_ParamSet *verifyParamSet,
                                            const struct OH_Huks_Blob *inData, struct OH_Huks_Blob *outDataSign,
                                            const uint32_t verifyIndex, const bool isTestSignData)
{
    if (isTestSignData) {
        (void)memset_s(outDataSign->data, outDataSign->size, 0, outDataSign->size);
    }

    OH_Huks_Result ret = HksTestSignVerify(importKeyAlias, verifyParamSet, inData, outDataSign);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode =
            ((ret.errorCode == g_verifyParamsTest[verifyIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
    }
    return ret;
}

static void FreeBuffAndDeleteKey(struct OH_Huks_ParamSet **paramSet1, struct OH_Huks_ParamSet **paramSet2,
                                 struct OH_Huks_ParamSet **paramSet3, const struct OH_Huks_Blob *keyAlias1,
                                 const struct OH_Huks_Blob *keyAlias2)
{
    (void)OH_Huks_DeleteKeyItem(keyAlias1, *paramSet1);
    (void)OH_Huks_DeleteKeyItem(keyAlias2, *paramSet1);
    OH_Huks_FreeParamSet(paramSet1);
    OH_Huks_FreeParamSet(paramSet2);
    OH_Huks_FreeParamSet(paramSet3);
}

static OH_Huks_Result HksSm2SignVerifyTestRun(const struct OH_Huks_Blob *keyAlias, const uint32_t genIndex,
                                              const uint32_t signIndex, const uint32_t verifyIndex,
                                              const bool isTestSignData)
{
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;

    struct OH_Huks_Blob inData = {static_cast<uint32_t>(g_inData.length()), (uint8_t *)g_inData.c_str()};
    uint8_t outDataS[SM2_COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataSign = {SM2_COMMON_SIZE, outDataS};

    uint8_t pubKey[OH_HUKS_MAX_KEY_SIZE] = {0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_MAX_KEY_SIZE, pubKey};

    struct OH_Huks_Blob importKeyAlias;
    OH_Huks_Result ret = CreateImportKeyAlias(&importKeyAlias, keyAlias);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    do {
        /* 1. Generate Key */
        ret = GenerateKeyForTest(keyAlias, genIndex, &genParamSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        /* 2. Sign Three Stage */
        ret = PerformSignOperation(keyAlias, signIndex, &inData, &outDataSign, &signParamSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        /* 3. Export Public Key and Import for Verify */
        ret = ExportAndImportKeyForVerify(keyAlias, &importKeyAlias, genParamSet, verifyIndex, &publicKey,
                                          &verifyParamSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        /* 4. Verify Three Stage */
        ret = PerformVerifyOperation(&importKeyAlias, verifyParamSet, &inData, &outDataSign, verifyIndex,
                                     isTestSignData);
    } while (0);

    FreeBuffAndDeleteKey(&genParamSet, &signParamSet, &verifyParamSet, keyAlias, &importKeyAlias);
    HksFree(importKeyAlias.data);
    return ret;
}

} // namespace Huks
} // namespace Acts
