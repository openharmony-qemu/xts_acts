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

#include "include/HuksMiscTest.h"
#include <huks/native_huks_api.h>
#include  <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <cstddef>

namespace Acts {
namespace Huks {

/**
 * @tc.name   SecurityHuksNapiMisc0100
 * @tc.number Security_HUKS_NAPI_Misc_0100
 * @tc.desc   misc test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiMisc0100()
{
    // Verify digest constants
    if ((uint32_t)OH_HUKS_DIGEST_NONE != 0) return -1;
    if ((uint32_t)OH_HUKS_DIGEST_MD5 != 1) return -1;
    if ((uint32_t)OH_HUKS_DIGEST_SM3 != 2) return -1;
    if ((uint32_t)OH_HUKS_DIGEST_SHA1 != 10) return -1;
    if ((uint32_t)OH_HUKS_DIGEST_SHA224 != 11) return -1;
    if ((uint32_t)OH_HUKS_DIGEST_SHA256 != 12) return -1;
    if ((uint32_t)OH_HUKS_DIGEST_SHA384 != 13) return -1;
    if ((uint32_t)OH_HUKS_DIGEST_SHA512 != 14) return -1;
    
    // Verify padding constants
    if ((uint32_t)OH_HUKS_PADDING_NONE != 0) return -1;
    if ((uint32_t)OH_HUKS_PADDING_OAEP != 1) return -1;
    if ((uint32_t)OH_HUKS_PADDING_PSS != 2) return -1;
    if ((uint32_t)OH_HUKS_PADDING_PKCS1_V1_5 != 3) return -1;
    if ((uint32_t)OH_HUKS_PADDING_PKCS5 != 4) return -1;
    if ((uint32_t)OH_HUKS_PADDING_PKCS7 != 5) return -1;
    
    // Verify mode constants
    if ((uint32_t)OH_HUKS_MODE_ECB != 1) return -1;
    if ((uint32_t)OH_HUKS_MODE_CBC != 2) return -1;
    if ((uint32_t)OH_HUKS_MODE_CTR != 3) return -1;
    if ((uint32_t)OH_HUKS_MODE_OFB != 4) return -1;
    if ((uint32_t)OH_HUKS_MODE_CCM != 31) return -1;
    if ((uint32_t)OH_HUKS_MODE_GCM != 32) return -1;
    
    // Verify key purpose constants
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_ENCRYPT != 1) return -1;
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_DECRYPT != 2) return -1;
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_SIGN != 4) return -1;
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_VERIFY != 8) return -1;
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_DERIVE != 16) return -1;
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_WRAP != 32) return -1;
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_UNWRAP != 64) return -1;
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_MAC != 128) return -1;
    if ((uint32_t)OH_HUKS_KEY_PURPOSE_AGREE != 256) return -1;
    
    // Verify RSA key size constants
    if ((uint32_t)OH_HUKS_RSA_KEY_SIZE_512 != 512) return -1;
    if ((uint32_t)OH_HUKS_RSA_KEY_SIZE_768 != 768) return -1;
    if ((uint32_t)OH_HUKS_RSA_KEY_SIZE_1024 != 1024) return -1;
    if ((uint32_t)OH_HUKS_RSA_KEY_SIZE_2048 != 2048) return -1;
    if ((uint32_t)OH_HUKS_RSA_KEY_SIZE_3072 != 3072) return -1;
    if ((uint32_t)OH_HUKS_RSA_KEY_SIZE_4096 != 4096) return -1;
    
    // Verify ECC key size constants
    if ((uint32_t)OH_HUKS_ECC_KEY_SIZE_224 != 224) return -1;
    if ((uint32_t)OH_HUKS_ECC_KEY_SIZE_256 != 256) return -1;
    if ((uint32_t)OH_HUKS_ECC_KEY_SIZE_384 != 384) return -1;
    if ((uint32_t)OH_HUKS_ECC_KEY_SIZE_521 != 521) return -1;
    
    // Verify AES key size constants
    if ((uint32_t)OH_HUKS_AES_KEY_SIZE_128 != 128) return -1;
    if ((uint32_t)OH_HUKS_AES_KEY_SIZE_192 != 192) return -1;
    if ((uint32_t)OH_HUKS_AES_KEY_SIZE_256 != 256) return -1;
    if ((uint32_t)OH_HUKS_AES_KEY_SIZE_512 != 512) return -1;
    
    // Verify DH key size constants
    if ((uint32_t)OH_HUKS_DH_KEY_SIZE_2048 != 2048) return -1;
    if ((uint32_t)OH_HUKS_DH_KEY_SIZE_3072 != 3072) return -1;
    if ((uint32_t)OH_HUKS_DH_KEY_SIZE_4096 != 4096) return -1;
    
    // Verify SM2/SM4 key size constants
    if ((uint32_t)OH_HUKS_SM2_KEY_SIZE_256 != 256) return -1;
    if ((uint32_t)OH_HUKS_SM4_KEY_SIZE_128 != 128) return -1;
    
    // Verify algorithm constants
    if ((uint32_t)OH_HUKS_ALG_RSA != 1) return -1;
    if ((uint32_t)OH_HUKS_ALG_ECC != 2) return -1;
    if ((uint32_t)OH_HUKS_ALG_DSA != 3) return -1;
    if ((uint32_t)OH_HUKS_ALG_AES != 20) return -1;
    if ((uint32_t)OH_HUKS_ALG_HMAC != 50) return -1;
    if ((uint32_t)OH_HUKS_ALG_HKDF != 51) return -1;
    if ((uint32_t)OH_HUKS_ALG_PBKDF2 != 52) return -1;
    if ((uint32_t)OH_HUKS_ALG_ECDH != 100) return -1;
    if ((uint32_t)OH_HUKS_ALG_X25519 != 101) return -1;
    if ((uint32_t)OH_HUKS_ALG_ED25519 != 102) return -1;
    if ((uint32_t)OH_HUKS_ALG_DH != 103) return -1;
    if ((uint32_t)OH_HUKS_ALG_SM2 != 150) return -1;
    if ((uint32_t)OH_HUKS_ALG_SM3 != 151) return -1;
    if ((uint32_t)OH_HUKS_ALG_SM4 != 152) return -1;
    
    // Verify unwrap suite constants
    if ((uint32_t)OH_HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING != 1) return -1;
    if ((uint32_t)OH_HUKS_UNWRAP_SUITE_ECDH_AES_256_GCM_NOPADDING != 2) return -1;
    
    // Verify key generate type constants
    if ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_DEFAULT != 0) return -1;
    if ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_DERIVE != 1) return -1;
    if ((uint32_t)OH_HUKS_KEY_GENERATE_TYPE_AGREE != 2) return -1;
    
    // Verify key flag constants
    if ((uint32_t)OH_HUKS_KEY_FLAG_IMPORT_KEY != 1) return -1;
    if ((uint32_t)OH_HUKS_KEY_FLAG_GENERATE_KEY != 2) return -1;
    if ((uint32_t)OH_HUKS_KEY_FLAG_AGREE_KEY != 3) return -1;
    if ((uint32_t)OH_HUKS_KEY_FLAG_DERIVE_KEY != 4) return -1;
    
    // Verify storage constants
    if ((uint32_t)OH_HUKS_STORAGE_TEMP != 0) return -1;
    if ((uint32_t)OH_HUKS_STORAGE_PERSISTENT != 1) return -1;
    
    // Verify key type constants
    if ((uint32_t)OH_HUKS_KEY_TYPE_PUBLIC_KEY != 0) return -1;
    if ((uint32_t)OH_HUKS_KEY_TYPE_PRIVATE_KEY != 1) return -1;
    if ((uint32_t)OH_HUKS_KEY_TYPE_KEY_PAIR != 2) return -1;
    
    // Verify error code constants
    if ((uint32_t)OH_HUKS_SUCCESS != 0) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_PERMISSION_FAIL != 201) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT != 401) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_NOT_SUPPORTED_API != 801) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED != 12000001) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_MISSING_CRYPTO_ALG_ARGUMENT != 12000002) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT != 12000003) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_FILE_OPERATION_FAIL != 12000004) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_COMMUNICATION_FAIL != 12000005) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_CRYPTO_FAIL != 12000006) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_PERMANENTLY_INVALIDATED != 12000007) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_VERIFY_FAILED != 12000008) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_KEY_AUTH_TIME_OUT != 12000009) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_SESSION_LIMIT != 12000010) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_ITEM_NOT_EXIST != 12000011) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_INTERNAL_ERROR != 12000012) return -1;
    if ((uint32_t)OH_HUKS_ERR_CODE_CREDENTIAL_NOT_EXIST != 12000013) return -1;
    
    // Verify tag type constants
    if ((uint32_t)OH_HUKS_TAG_TYPE_INVALID != (0 << 28)) return -1;
    if ((uint32_t)OH_HUKS_TAG_TYPE_INT != (1 << 28)) return -1;
    if ((uint32_t)OH_HUKS_TAG_TYPE_UINT != (2 << 28)) return -1;
    if ((uint32_t)OH_HUKS_TAG_TYPE_ULONG != (3 << 28)) return -1;
    if ((uint32_t)OH_HUKS_TAG_TYPE_BOOL != (4 << 28)) return -1;
    if ((uint32_t)OH_HUKS_TAG_TYPE_BYTES != (5 << 28)) return -1;
    
    // Verify user auth type constants
    if ((uint32_t)OH_HUKS_USER_AUTH_TYPE_FINGERPRINT != (1 << 0)) return -1;
    if ((uint32_t)OH_HUKS_USER_AUTH_TYPE_FACE != (1 << 1)) return -1;
    if ((uint32_t)OH_HUKS_USER_AUTH_TYPE_PIN != (1 << 2)) return -1;
    
    // Verify auth access invalid constants
    if ((uint32_t)OH_HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD != (1 << 0)) return -1;
    if ((uint32_t)OH_HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL != (1 << 1)) return -1;
    
    // Verify challenge type constants
    if ((uint32_t)OH_HUKS_CHALLENGE_TYPE_NORMAL != 0) return -1;
    if ((uint32_t)OH_HUKS_CHALLENGE_TYPE_CUSTOM != 1) return -1;
    if ((uint32_t)OH_HUKS_CHALLENGE_TYPE_NONE != 2) return -1;
    
    // Verify challenge pos constants
    if ((uint32_t)OH_HUKS_CHALLENGE_POS_0 != 0) return -1;
    if ((uint32_t)OH_HUKS_CHALLENGE_POS_1 != 1) return -1;
    if ((uint32_t)OH_HUKS_CHALLENGE_POS_2 != 2) return -1;
    if ((uint32_t)OH_HUKS_CHALLENGE_POS_3 != 3) return -1;
    
    // Verify secure sign constants
    if ((uint32_t)OH_HUKS_SECURE_SIGN_WITH_AUTHINFO != 1) return -1;
    
    // Verify tag constants
    if ((uint32_t)OH_HUKS_TAG_ALGORITHM != (OH_HUKS_TAG_TYPE_UINT | 1)) return -1;
    if ((uint32_t)OH_HUKS_TAG_PURPOSE != (OH_HUKS_TAG_TYPE_UINT | 2)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_SIZE != (OH_HUKS_TAG_TYPE_UINT | 3)) return -1;
    if ((uint32_t)OH_HUKS_TAG_DIGEST != (OH_HUKS_TAG_TYPE_UINT | 4)) return -1;
    if ((uint32_t)OH_HUKS_TAG_PADDING != (OH_HUKS_TAG_TYPE_UINT | 5)) return -1;
    if ((uint32_t)OH_HUKS_TAG_BLOCK_MODE != (OH_HUKS_TAG_TYPE_UINT | 6)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_TYPE != (OH_HUKS_TAG_TYPE_UINT | 7)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ASSOCIATED_DATA != (OH_HUKS_TAG_TYPE_BYTES | 8)) return -1;
    if ((uint32_t)OH_HUKS_TAG_NONCE != (OH_HUKS_TAG_TYPE_BYTES | 9)) return -1;
    if ((uint32_t)OH_HUKS_TAG_IV != (OH_HUKS_TAG_TYPE_BYTES | 10)) return -1;
    if ((uint32_t)OH_HUKS_TAG_INFO != (OH_HUKS_TAG_TYPE_BYTES | 11)) return -1;
    if ((uint32_t)OH_HUKS_TAG_SALT != (OH_HUKS_TAG_TYPE_BYTES | 12)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ITERATION != (OH_HUKS_TAG_TYPE_UINT | 14)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_GENERATE_TYPE != (OH_HUKS_TAG_TYPE_UINT | 15)) return -1;
    if ((uint32_t)OH_HUKS_TAG_AGREE_ALG != (OH_HUKS_TAG_TYPE_UINT | 19)) return -1;
    if ((uint32_t)OH_HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS != (OH_HUKS_TAG_TYPE_BOOL | 20)) return -1;
    if ((uint32_t)OH_HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS != (OH_HUKS_TAG_TYPE_BYTES | 21)) return -1;
    if ((uint32_t)OH_HUKS_TAG_AGREE_PUBLIC_KEY != (OH_HUKS_TAG_TYPE_BYTES | 22)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_ALIAS != (OH_HUKS_TAG_TYPE_BYTES | 23)) return -1;
    if ((uint32_t)OH_HUKS_TAG_DERIVE_KEY_SIZE != (OH_HUKS_TAG_TYPE_UINT | 24)) return -1;
    if ((uint32_t)OH_HUKS_TAG_IMPORT_KEY_TYPE != (OH_HUKS_TAG_TYPE_UINT | 25)) return -1;
    if ((uint32_t)OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE != (OH_HUKS_TAG_TYPE_UINT | 26)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ALL_USERS != (OH_HUKS_TAG_TYPE_BOOL | 301)) return -1;
    if ((uint32_t)OH_HUKS_TAG_USER_ID != (OH_HUKS_TAG_TYPE_UINT | 302)) return -1;
    if ((uint32_t)OH_HUKS_TAG_NO_AUTH_REQUIRED != (OH_HUKS_TAG_TYPE_BOOL | 303)) return -1;
    if ((uint32_t)OH_HUKS_TAG_USER_AUTH_TYPE != (OH_HUKS_TAG_TYPE_UINT | 304)) return -1;
    if ((uint32_t)OH_HUKS_TAG_AUTH_TIMEOUT != (OH_HUKS_TAG_TYPE_UINT | 305)) return -1;
    if ((uint32_t)OH_HUKS_TAG_AUTH_TOKEN != (OH_HUKS_TAG_TYPE_BYTES | 306)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_AUTH_ACCESS_TYPE != (OH_HUKS_TAG_TYPE_UINT | 307)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_SECURE_SIGN_TYPE != (OH_HUKS_TAG_TYPE_UINT | 308)) return -1;
    if ((uint32_t)OH_HUKS_TAG_CHALLENGE_TYPE != (OH_HUKS_TAG_TYPE_UINT | 309)) return -1;
    if ((uint32_t)OH_HUKS_TAG_CHALLENGE_POS != (OH_HUKS_TAG_TYPE_UINT | 310)) return -1;
    
    // Verify attestation tag constants
    if ((uint32_t)OH_HUKS_TAG_ATTESTATION_CHALLENGE != (OH_HUKS_TAG_TYPE_BYTES | 501)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ATTESTATION_APPLICATION_ID != (OH_HUKS_TAG_TYPE_BYTES | 502)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_ALIAS != (OH_HUKS_TAG_TYPE_BYTES | 511)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO != (OH_HUKS_TAG_TYPE_BYTES | 514)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ATTESTATION_ID_VERSION_INFO != (OH_HUKS_TAG_TYPE_BYTES | 515)) return -1;
    
    // Verify key management tag constants
    if ((uint32_t)OH_HUKS_TAG_IS_KEY_ALIAS != (OH_HUKS_TAG_TYPE_BOOL | 1001)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_STORAGE_FLAG != (OH_HUKS_TAG_TYPE_UINT | 1002)) return -1;
    if ((uint32_t)OH_HUKS_TAG_IS_ALLOWED_WRAP != (OH_HUKS_TAG_TYPE_BOOL | 1003)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_WRAP_TYPE != (OH_HUKS_TAG_TYPE_UINT | 1004)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_AUTH_ID != (OH_HUKS_TAG_TYPE_BYTES | 1005)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_ROLE != (OH_HUKS_TAG_TYPE_UINT | 1006)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_FLAG != (OH_HUKS_TAG_TYPE_UINT | 1007)) return -1;
    if ((uint32_t)OH_HUKS_TAG_IS_ASYNCHRONIZED != (OH_HUKS_TAG_TYPE_UINT | 1008)) return -1;
    if ((uint32_t)OH_HUKS_TAG_KEY_DOMAIN != (OH_HUKS_TAG_TYPE_UINT | 1011)) return -1;
    if ((uint32_t)OH_HUKS_TAG_SYMMETRIC_KEY_DATA != (OH_HUKS_TAG_TYPE_BYTES | 20001)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA != (OH_HUKS_TAG_TYPE_BYTES | 20002)) return -1;
    if ((uint32_t)OH_HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA != (OH_HUKS_TAG_TYPE_BYTES | 20003)) return -1;
    
    // Verify struct sizes
    struct OH_Huks_Result result;
    if (sizeof(result.errorCode) != sizeof(int32_t)) return -1;
    if (sizeof(result.errorMsg) != sizeof(const char *)) return -1;
    if (sizeof(result.data) != sizeof(uint8_t *)) return -1;
    
    struct OH_Huks_Blob blob;
    if (sizeof(blob.size) != sizeof(uint32_t)) return -1;
    if (sizeof(blob.data) != sizeof(uint8_t *)) return -1;
    
    struct OH_Huks_Param param;
    if (sizeof(param.tag) != sizeof(uint32_t)) return -1;
    if (sizeof(param.boolParam) != sizeof(bool)) return -1;
    if (sizeof(param.int32Param) != sizeof(int32_t)) return -1;
    if (sizeof(param.uint32Param) != sizeof(uint32_t)) return -1;
    if (sizeof(param.uint64Param) != sizeof(uint64_t)) return -1;
    if (sizeof(param.blob) != sizeof(struct OH_Huks_Blob)) return -1;
    
    struct OH_Huks_ParamSet paramset;
    if (sizeof(paramset.paramSetSize) != sizeof(uint32_t)) return -1;
    if (sizeof(paramset.paramsCnt) != sizeof(uint32_t)) return -1;
    if (sizeof(paramset.params[0]) != sizeof(struct OH_Huks_Param)) return -1;
    
    struct OH_Huks_CertChain certChain;
    if (sizeof(certChain.certs) != sizeof(struct OH_Huks_Blob *)) return -1;
    if (sizeof(certChain.certsCount) != sizeof(uint32_t)) return -1;
    
    struct OH_Huks_KeyInfo keyInfo;
    if (sizeof(keyInfo.alias) != sizeof(struct OH_Huks_Blob)) return -1;
    if (sizeof(keyInfo.paramSet) != sizeof(struct OH_Huks_ParamSet *)) return -1;
    
    struct OH_Huks_PubKeyInfo pubKeyInfo;
    if (sizeof(pubKeyInfo.keyAlg) != sizeof(OH_Huks_KeyAlg)) return -1;
    if (sizeof(pubKeyInfo.keySize) != sizeof(uint32_t)) return -1;
    if (sizeof(pubKeyInfo.nOrXSize) != sizeof(uint32_t)) return -1;
    if (sizeof(pubKeyInfo.eOrYSize) != sizeof(uint32_t)) return -1;
    if (sizeof(pubKeyInfo.placeHolder) != sizeof(uint32_t)) return -1;
    
    struct OH_Huks_KeyMaterialRsa keyMaterialRsa;
    if (sizeof(keyMaterialRsa.keyAlg) != sizeof(OH_Huks_KeyAlg)) return -1;
    if (sizeof(keyMaterialRsa.keySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialRsa.nSize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialRsa.eSize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialRsa.dSize) != sizeof(uint32_t)) return -1;
    
    struct OH_Huks_KeyMaterialEcc keyMaterialEcc;
    if (sizeof(keyMaterialEcc.keyAlg) != sizeof(OH_Huks_KeyAlg)) return -1;
    if (sizeof(keyMaterialEcc.keySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialEcc.xSize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialEcc.ySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialEcc.zSize) != sizeof(uint32_t)) return -1;
    
    struct OH_Huks_KeyMaterialDsa keyMaterialDsa;
    if (sizeof(keyMaterialDsa.keyAlg) != sizeof(OH_Huks_KeyAlg)) return -1;
    if (sizeof(keyMaterialDsa.keySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialDsa.xSize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialDsa.ySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialDsa.pSize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialDsa.qSize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialDsa.gSize) != sizeof(uint32_t)) return -1;
    
    struct OH_Huks_KeyMaterialDh keyMaterialDh;
    if (sizeof(keyMaterialDh.keyAlg) != sizeof(OH_Huks_KeyAlg)) return -1;
    if (sizeof(keyMaterialDh.keySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialDh.pubKeySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialDh.priKeySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterialDh.reserved) != sizeof(uint32_t)) return -1;
    
    struct OH_Huks_KeyMaterial25519 keyMaterial25519;
    if (sizeof(keyMaterial25519.keyAlg) != sizeof(OH_Huks_KeyAlg)) return -1;
    if (sizeof(keyMaterial25519.keySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterial25519.pubKeySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterial25519.priKeySize) != sizeof(uint32_t)) return -1;
    if (sizeof(keyMaterial25519.reserved) != sizeof(uint32_t)) return -1;
    
    return 0;
}

} // namespace Huks
} // namespace Acts
