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

#include "include/HuksAgreeEcdhTest.h"
#include <huks/native_huks_api.h>
#include  <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>
#include <cstring>

namespace Acts {
namespace Huks {

// Test data and constants
static const std::string g_inData =
    "Hks_ECDH_Agree_Test_000000000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";
static const uint32_t ECDH_COMMON_SIZE = 1024;
static const uint32_t MAX_BLOB_SIZE = 1024 * 1024; // 1MB，合理的上限

static struct OH_Huks_Blob g_keyAlias01001 = {static_cast<uint32_t>(strlen("HksECDHAgreeKeyAliasTest001_1")),
                                              (uint8_t *)"HksECDHAgreeKeyAliasTest001_1"};
static struct OH_Huks_Blob g_keyAlias02001 = {static_cast<uint32_t>(strlen("HksECDHAgreeKeyAliasTest001_2")),
                                              (uint8_t *)"HksECDHAgreeKeyAliasTest001_2"};
static struct OH_Huks_Blob g_keyAliasFinal1001 = {static_cast<uint32_t>(strlen("HksECDHAgreeKeyAliasTest001_1_final")),
                                                  (uint8_t *)"HksECDHAgreeKeyAliasTest001_1_final"};
static struct OH_Huks_Blob g_keyAliasFinal2001 = {static_cast<uint32_t>(strlen("HksECDHAgreeKeyAliasTest001_2_final")),
                                                  (uint8_t *)"HksECDHAgreeKeyAliasTest001_2_final"};
static struct OH_Huks_Param g_genParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams01Init001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECDH},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams01Finish001[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_IS_KEY_ALIAS, .boolParam = true},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_KEY_ALIAS, .blob = g_keyAliasFinal1001},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams02Init001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECDH},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams02Finish001[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_IS_KEY_ALIAS, .boolParam = true},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_KEY_ALIAS, .blob = g_keyAliasFinal2001},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

// Helper functions
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

static OH_Huks_Result MallocAndCheckBlobData(struct OH_Huks_Blob *blob, const uint32_t blobSize)
{
    OH_Huks_Result ret;
    ret.errorCode = (int32_t)OH_HUKS_SUCCESS;
    
    // G.MEM.01：内存申请前，必须对申请内存大小进行合法性校验
    if (blobSize == 0 || blobSize > MAX_BLOB_SIZE) {
        ret.errorCode = (int32_t)OH_HUKS_ERR_CODE_INVALID_SIZE;
        return ret;
    }
    
    blob->data = (uint8_t *)malloc(blobSize);
    if (blob->data == nullptr) {
        ret.errorCode = (int32_t)OH_HUKS_ERR_CODE_INTERNAL_ERROR;
    }
    return ret;
}

static void HksFree(void *ptr)
{
    if (ptr != nullptr) {
        free(ptr);
    }
}

static OH_Huks_Result HksEcdhAgreeFinish(const struct OH_Huks_Blob *keyAlias, const struct OH_Huks_Blob *publicKey,
                                         const struct OH_Huks_ParamSet *initParamSet,
                                         const struct OH_Huks_ParamSet *finishParamSet, struct OH_Huks_Blob *outData)
{
    struct OH_Huks_Blob inData = {static_cast<uint32_t>(g_inData.length()), (uint8_t *)g_inData.c_str()};

    uint8_t handleU[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), handleU};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, initParamSet, &handle, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    uint8_t outDataU[ECDH_COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataUpdate = {ECDH_COMMON_SIZE, outDataU};
    ret = OH_Huks_UpdateSession(&handle, initParamSet, publicKey, &outDataUpdate);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_FinishSession(&handle, finishParamSet, &inData, outData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

static OH_Huks_Result HksEcdhAgreeExport(const struct OH_Huks_Blob *keyAlias1, const struct OH_Huks_Blob *keyAlias2,
                                         struct OH_Huks_Blob *publicKey1, struct OH_Huks_Blob *publicKey2,
                                         const struct OH_Huks_ParamSet *genParamSet)
{
    OH_Huks_Result ret = OH_Huks_ExportPublicKeyItem(keyAlias1, genParamSet, publicKey1);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_ExportPublicKeyItem(keyAlias2, genParamSet, publicKey2);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

static void HksEcdhAgreeFreeParamSet(struct OH_Huks_ParamSet *paramSet1, struct OH_Huks_ParamSet *paramSet2,
                                     struct OH_Huks_ParamSet *paramSet3, struct OH_Huks_ParamSet *paramSet4,
                                     struct OH_Huks_ParamSet *paramSet5)
{
    OH_Huks_FreeParamSet(&paramSet1);
    OH_Huks_FreeParamSet(&paramSet2);
    OH_Huks_FreeParamSet(&paramSet3);
    OH_Huks_FreeParamSet(&paramSet4);
    OH_Huks_FreeParamSet(&paramSet5);
}

static void HksEcdhAgreeFreeBlob(struct OH_Huks_Blob *blob1, struct OH_Huks_Blob *blob2, struct OH_Huks_Blob *blob3,
                                 struct OH_Huks_Blob *blob4)
{
    HksFree(blob1->data);
    HksFree(blob2->data);
    HksFree(blob3->data);
    HksFree(blob4->data);
}

/**
 * @tc.name   SecurityHuksNapiAgreeEcdh0100
 * @tc.number Security_HUKS_NAPI_Agree_ECDH_0100
 * @tc.desc   alg-ECDH, pur-AGREE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SecurityHuksNapiAgreeEcdh0100()
{
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *initParamSet01 = nullptr;
    struct OH_Huks_ParamSet *finishParamSet01 = nullptr;
    struct OH_Huks_ParamSet *initParamSet02 = nullptr;
    struct OH_Huks_ParamSet *finishParamSet02 = nullptr;
    
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) return -1;
    
    ret = InitParamSet(&initParamSet01, g_agreeParams01Init001, sizeof(g_agreeParams01Init001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeParamSet(genParamSet, nullptr, nullptr, nullptr, nullptr);
        return -1;
    }
    
    ret = InitParamSet(&finishParamSet01, g_agreeParams01Finish001,
                       sizeof(g_agreeParams01Finish001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, nullptr, nullptr, nullptr);
        return -1;
    }
    
    ret = InitParamSet(&initParamSet02, g_agreeParams02Init001, sizeof(g_agreeParams02Init001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, nullptr, nullptr);
        return -1;
    }
    
    ret = InitParamSet(&finishParamSet02, g_agreeParams02Finish001,
                       sizeof(g_agreeParams02Finish001) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, nullptr);
        return -1;
    }

    OH_Huks_Result ret1 = OH_Huks_GenerateKeyItem(&g_keyAlias01001, genParamSet, nullptr);
    if (ret1.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }
    
    ret1 = OH_Huks_GenerateKeyItem(&g_keyAlias02001, genParamSet, nullptr);
    if (ret1.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }

    struct OH_Huks_Blob publicKey01 = {.size = OH_HUKS_ECC_KEY_SIZE_256, .data = nullptr};
    struct OH_Huks_Blob publicKey02 = {.size = OH_HUKS_ECC_KEY_SIZE_256, .data = nullptr};
    ret = MallocAndCheckBlobData(&publicKey01, publicKey01.size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }
    
    ret = MallocAndCheckBlobData(&publicKey02, publicKey02.size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksFree(publicKey01.data);
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }
    
    ret = HksEcdhAgreeExport(&g_keyAlias01001, &g_keyAlias02001, &publicKey01, &publicKey02, genParamSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeBlob(&publicKey01, &publicKey02, nullptr, nullptr);
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }

    struct OH_Huks_Blob outData01 = {.size = ECDH_COMMON_SIZE, .data = nullptr};
    struct OH_Huks_Blob outData02 = {.size = ECDH_COMMON_SIZE, .data = nullptr};
    ret = MallocAndCheckBlobData(&outData01, outData01.size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeBlob(&publicKey01, &publicKey02, nullptr, nullptr);
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }
    
    ret = MallocAndCheckBlobData(&outData02, outData02.size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksFree(outData01.data);
        HksEcdhAgreeFreeBlob(&publicKey01, &publicKey02, nullptr, nullptr);
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }
    
    ret = HksEcdhAgreeFinish(&g_keyAlias01001, &publicKey02, initParamSet01, finishParamSet01, &outData01);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeBlob(&publicKey01, &publicKey02, &outData01, &outData02);
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }
    
    ret = HksEcdhAgreeFinish(&g_keyAlias02001, &publicKey01, initParamSet02, finishParamSet02, &outData02);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksEcdhAgreeFreeBlob(&publicKey01, &publicKey02, &outData01, &outData02);
        OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
        OH_Huks_DeleteKeyItem(&g_keyAliasFinal1001, finishParamSet01);
        HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
        return -1;
    }

    // Clean up
    OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
    OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
    OH_Huks_DeleteKeyItem(&g_keyAliasFinal1001, finishParamSet01);
    OH_Huks_DeleteKeyItem(&g_keyAliasFinal2001, finishParamSet02);
    HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
    HksEcdhAgreeFreeBlob(&publicKey01, &publicKey02, &outData01, &outData02);

    return 0;
}

} // namespace Huks
} // namespace Acts
