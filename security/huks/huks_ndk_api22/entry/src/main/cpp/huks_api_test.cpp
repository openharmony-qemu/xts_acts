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

#include "huks_api_test.h"
#include "testcase_utils.h"
#include "huks/native_huks_api.h"
#include "huks/native_huks_type.h"
#include "huks/native_huks_param.h"
#include "huks/native_huks_external_crypto_api.h"
#include <cstring>

napi_value OHHuksNativeApi22Type0100(napi_env env, napi_callback_info info)
{
    int res = TEST_FAIL;
    if ((OH_HUKS_EXT_CRYPTO_TAG_UKEY_PIN == (OH_HUKS_TAG_TYPE_BYTES | 200001)) &
        (OH_HUKS_EXT_CRYPTO_TAG_ABILITY_NAME == (OH_HUKS_TAG_TYPE_BYTES | 200002)) &
        (OH_HUKS_EXT_CRYPTO_TAG_EXTRA_DATA == (OH_HUKS_TAG_TYPE_BYTES | 200003)) &
        (OH_HUKS_EXT_CRYPTO_TAG_UID == (OH_HUKS_TAG_TYPE_INT | 200004)) &
        (OH_HUKS_EXT_CRYPTO_TAG_PURPOSE == (OH_HUKS_TAG_TYPE_INT | 200005)) &
        (OH_HUKS_EXT_CRYPTO_TAG_TIMEOUT == (OH_HUKS_TAG_TYPE_UINT | 200006))) {
        res = TEST_SUCC;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Type0200(napi_env env, napi_callback_info info)
{
    int res = TEST_FAIL;
    if ((OH_HUKS_EXT_CRYPTO_PIN_NO_AUTH == 0) & (OH_HUKS_EXT_CRYPTO_PIN_AUTH_SUCCEEDED == 1) &
        (OH_HUKS_EXT_CRYPTO_PIN_LOCKED == 2)) {
        res = TEST_SUCC;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}


static int CheckHuksParamMembers(void)
{
    uint8_t blobData[] = {0x68, 0x75, 0x6B, 0x73};
    struct OH_Huks_Blob blob = {sizeof(blobData), blobData};
    const uint32_t int32Tag = OH_HUKS_TAG_TYPE_INT | 201;
    const uint32_t uint64Tag = OH_HUKS_TAG_TYPE_ULONG | 202;

    struct OH_Huks_Param boolParam = {
        .tag = OH_HUKS_TAG_ALL_USERS,
        .boolParam = true,
    };
    struct OH_Huks_Param int32Param = {
        .tag = int32Tag,
        .int32Param = -123456789,
    };
    struct OH_Huks_Param uint32Param = {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_RSA,
    };
    struct OH_Huks_Param uint64Param = {
        .tag = uint64Tag,
        .uint64Param = 0x123456789ABCDEF0ULL,
    };
    struct OH_Huks_Param blobParam = {
        .tag = OH_HUKS_TAG_NONCE,
        .blob = blob,
    };

    return (boolParam.tag == OH_HUKS_TAG_ALL_USERS && boolParam.boolParam) &&
        (int32Param.tag == int32Tag && int32Param.int32Param == -123456789) &&
        (uint32Param.tag == OH_HUKS_TAG_ALGORITHM &&
            uint32Param.uint32Param == static_cast<uint32_t>(OH_HUKS_ALG_RSA)) &&
        (uint64Param.tag == uint64Tag && uint64Param.uint64Param == 0x123456789ABCDEF0ULL) &&
        (blobParam.tag == OH_HUKS_TAG_NONCE && blobParam.blob.size == sizeof(blobData) &&
            blobParam.blob.data == blobData) ? TEST_SUCC : TEST_FAIL;
}

napi_value OHHuksNativeApi22Struct0100(napi_env env, napi_callback_info info)
{
    int res = CheckHuksParamMembers();
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

static int CheckExternalCryptoParamMembers(void)
{
    uint8_t blobData[] = {0x65, 0x78, 0x74, 0x22};
    struct OH_Huks_Blob blob = {sizeof(blobData), blobData};
    const uint32_t boolTag = OH_HUKS_TAG_TYPE_BOOL | 200007;
    const uint32_t uint64Tag = OH_HUKS_TAG_TYPE_ULONG | 200008;

    struct OH_Huks_ExternalCryptoParam boolParam = {
        .tag = boolTag,
        .boolParam = true,
    };
    struct OH_Huks_ExternalCryptoParam int32Param = {
        .tag = OH_HUKS_EXT_CRYPTO_TAG_UID,
        .int32Param = -123456,
    };
    struct OH_Huks_ExternalCryptoParam uint32Param = {
        .tag = OH_HUKS_EXT_CRYPTO_TAG_TIMEOUT,
        .uint32Param = 123456,
    };
    struct OH_Huks_ExternalCryptoParam uint64Param = {
        .tag = uint64Tag,
        .uint64Param = 0xFEDCBA9876543210ULL,
    };
    struct OH_Huks_ExternalCryptoParam blobParam = {
        .tag = OH_HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
        .blob = blob,
    };

    return (boolParam.tag == boolTag && boolParam.boolParam) &&
        (int32Param.tag == OH_HUKS_EXT_CRYPTO_TAG_UID && int32Param.int32Param == -123456) &&
        (uint32Param.tag == OH_HUKS_EXT_CRYPTO_TAG_TIMEOUT && uint32Param.uint32Param == 123456) &&
        (uint64Param.tag == uint64Tag && uint64Param.uint64Param == 0xFEDCBA9876543210ULL) &&
        (blobParam.tag == OH_HUKS_EXT_CRYPTO_TAG_ABILITY_NAME &&
            blobParam.blob.size == sizeof(blobData) && blobParam.blob.data == blobData) ? TEST_SUCC : TEST_FAIL;
}

napi_value OHHuksNativeApi22Struct0200(napi_env env, napi_callback_info info)
{
    int res = CheckExternalCryptoParamMembers();
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22KeyAlg0100(napi_env env, napi_callback_info info)
{
    static const struct {
        enum OH_Huks_KeyAlg alg;
        uint32_t value;
    } keyAlgs[] = {
        {OH_HUKS_ALG_RSA, 1},
        {OH_HUKS_ALG_ECC, 2},
        {OH_HUKS_ALG_DSA, 3},
        {OH_HUKS_ALG_AES, 20},
        {OH_HUKS_ALG_HMAC, 50},
        {OH_HUKS_ALG_HKDF, 51},
        {OH_HUKS_ALG_PBKDF2, 52},
        {OH_HUKS_ALG_ECDH, 100},
        {OH_HUKS_ALG_X25519, 101},
        {OH_HUKS_ALG_ED25519, 102},
        {OH_HUKS_ALG_DH, 103},
        {OH_HUKS_ALG_SM2, 150},
        {OH_HUKS_ALG_SM3, 151},
        {OH_HUKS_ALG_SM4, 152},
        {OH_HUKS_ALG_DES, 160},
        {OH_HUKS_ALG_3DES, 161},
        {OH_HUKS_ALG_CMAC, 162},
    };
    int res = TEST_SUCC;
    for (size_t i = 0; i < sizeof(keyAlgs) / sizeof(keyAlgs[0]); ++i) {
        if (static_cast<uint32_t>(keyAlgs[i].alg) != keyAlgs[i].value) {
            res = TEST_FAIL;
            break;
        }
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value OHHuksNativeApi22Utils0100(napi_env env, napi_callback_info info)
{
    int res = TEST_SUCC;
    struct OH_Huks_Blob g_abilityName = {
        (uint32_t)strlen("testAbility"),
        (uint8_t *)"testAbility"
    };
    struct OH_Huks_Blob g_uid = {
        (uint32_t)strlen("12345678"),
        (uint8_t *)"12345678"
    };
    struct OH_Huks_ExternalCryptoParam params[] = {
        {
            .tag = OH_HUKS_EXT_CRYPTO_TAG_ABILITY_NAME,
            .blob = g_abilityName
        },
        {
            .tag = OH_HUKS_EXT_CRYPTO_TAG_UID,
            .blob = g_uid
        },
    };
    struct OH_Huks_ExternalCryptoParamSet *paramSet = nullptr;
    struct OH_Huks_ExternalCryptoParam *paramGot = nullptr;
    OH_Huks_Result ohResult = OH_Huks_InitExternalCryptoParamSet(&paramSet);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_AddExternalCryptoParams(paramSet, params, 2);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeExternalCryptoParamSet(&paramSet);
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_BuildExternalCryptoParamSet(&paramSet);
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        res = TEST_FAIL;
    }
    ohResult = OH_Huks_GetExternalCryptoParam(paramSet, OH_HUKS_EXT_CRYPTO_TAG_UID, &paramGot);
    if (ohResult.errorCode != OH_HUKS_SUCCESS || paramGot == nullptr) {
        res = TEST_FAIL;
    }
    if (ohResult.errorCode != OH_HUKS_SUCCESS) {
        OH_Huks_FreeExternalCryptoParamSet(&paramSet);
        res = TEST_FAIL;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}