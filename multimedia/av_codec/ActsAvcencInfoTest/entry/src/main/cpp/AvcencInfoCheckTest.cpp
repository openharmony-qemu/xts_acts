/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 */
#include "AvcencInfoCheckTest.h"
#include "multimedia/player_framework/native_averrors.h"
#include "multimedia/player_framework/native_avcodec_audiocodec.h"
#include "multimedia/player_framework/native_cencinfo.h"
#include "multimedia/player_framework/native_avbuffer.h"
#include "multimedia/player_framework/native_avmemory.h"

namespace OHOS {
    namespace CencInfoUT {
        /**
         * @tc.name   CencInfo_Create_001
         * @tc.number CencInfo_Create_001
         * @tc.desc   Create a cencInfo object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_Create_001()
        {
            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            return (cencInfo != nullptr) ? 0 : -1;
        }
        /**
         * @tc.name   CencInfo_Destroy_001
         * @tc.number CencInfo_Destroy_001
         * @tc.desc   Destroy a cencInfo object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_Destroy_001()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;
            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_Destroy_002
         * @tc.number CencInfo_Destroy_002
         * @tc.desc   Destroy a cencInfo null object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_Destroy_002()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            errNo = OH_AVCencInfo_Destroy(nullptr);
            return (errNo == AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetAlgorithm_001
         * @tc.number CencInfo_SetAlgorithm_001
         * @tc.desc   Set Algorithm
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetAlgorithm_001()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;
            errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_UNENCRYPTED);
            if (errNo != AV_ERR_OK)
            {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }
            errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_CTR);
            if (errNo != AV_ERR_OK)
            {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }
            errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_WV);
            if (errNo != AV_ERR_OK)
            {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }
            errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_CBC);
            if (errNo != AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }
            errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_SM4_CBC);
            if (errNo != AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }
            errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_SM4_CTR);
            if (errNo != AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }
            OH_AVCencInfo_Destroy(cencInfo);
            return 0;
        }

        /**
         * @tc.name   CencInfo_SetAlgorithm_002
         * @tc.number CencInfo_SetAlgorithm_002
         * @tc.desc   Set cencInfo null object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetAlgorithm_002()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            errNo = OH_AVCencInfo_SetAlgorithm(nullptr, DRM_ALG_CENC_SM4_CTR);
            return (errNo == AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetKeyIdAndIv_001
         * @tc.number CencInfo_SetKeyIdAndIv_001
         * @tc.desc   Set keyId and iv
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_001()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t keyIdLen = DRM_KEY_ID_SIZE;
            uint8_t keyId[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
            uint32_t ivLen = DRM_KEY_IV_SIZE;
            uint8_t iv[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen, iv, ivLen);
            if (errNo != AV_ERR_OK)
                return -1;

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetKeyIdAndIv_002
         * @tc.number CencInfo_SetKeyIdAndIv_002
         * @tc.desc   Set cencInfo null object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_002()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t keyIdLen = DRM_KEY_ID_SIZE;
            uint8_t keyId[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
            uint32_t ivLen = DRM_KEY_IV_SIZE;
            uint8_t iv[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
            errNo = OH_AVCencInfo_SetKeyIdAndIv(nullptr, keyId, keyIdLen, iv, ivLen);
            return (errNo == AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetKeyIdAndIv_003
         * @tc.number CencInfo_SetKeyIdAndIv_003
         * @tc.desc   Set the null keyId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_003()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t keyIdLen = DRM_KEY_ID_SIZE;
            uint32_t ivLen = DRM_KEY_IV_SIZE;
            uint8_t iv[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, nullptr, keyIdLen, iv, ivLen);
            if (errNo == AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetKeyIdAndIv_004
         * @tc.number CencInfo_SetKeyIdAndIv_004
         * @tc.desc   Set an invalid keyIdLen
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_004()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t keyIdLen = DRM_KEY_ID_SIZE;
            uint8_t keyId[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
            uint32_t ivLen = DRM_KEY_IV_SIZE;
            uint8_t iv[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen + 1, iv, ivLen);
            if (errNo == AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetKeyIdAndIv_005
         * @tc.number CencInfo_SetKeyIdAndIv_005
         * @tc.desc   Set the null iv
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_005()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t keyIdLen = DRM_KEY_ID_SIZE;
            uint8_t keyId[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
            uint32_t ivLen = DRM_KEY_IV_SIZE;

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen, nullptr, ivLen);
            if (errNo == AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetKeyIdAndIv_006
         * @tc.number CencInfo_SetKeyIdAndIv_006
         * @tc.desc   Set an invalid ivLen
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetKeyIdAndIv_006()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t keyIdLen = DRM_KEY_ID_SIZE;
            uint8_t keyId[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};
            uint32_t ivLen = DRM_KEY_IV_SIZE;
            uint8_t iv[] = {
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
                0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01};

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, keyIdLen, iv, ivLen + 1);
            if (errNo == AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetSubsampleInfo_001
         * @tc.number CencInfo_SetSubsampleInfo_001
         * @tc.desc   Set subsample info
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetSubsampleInfo_001()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t encryptedBlockCount = 0;
            uint32_t skippedBlockCount = 0;
            uint32_t firstEncryptedOffset = 0;
            uint32_t subsampleCount = 1;
            DrmSubsample subsamples[1] = {{0x10, 0x16}};

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetSubsampleInfo(cencInfo, encryptedBlockCount,
                skippedBlockCount, firstEncryptedOffset,
                                                   subsampleCount, subsamples);
            if (errNo != AV_ERR_OK)
                return -1;

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetSubsampleInfo_002
         * @tc.number CencInfo_SetSubsampleInfo_002
         * @tc.desc   Set cencInfo null object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetSubsampleInfo_002()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t encryptedBlockCount = 0;
            uint32_t skippedBlockCount = 0;
            uint32_t firstEncryptedOffset = 0;
            uint32_t subsampleCount = 1;
            DrmSubsample subsamples[1] = {{0x10, 0x16}};

            errNo = OH_AVCencInfo_SetSubsampleInfo(nullptr, encryptedBlockCount, skippedBlockCount,
                firstEncryptedOffset, subsampleCount, subsamples);
            return (errNo == AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetSubsampleInfo_003
         * @tc.number CencInfo_SetSubsampleInfo_003
         * @tc.desc   Set an invalid subsampleCount
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetSubsampleInfo_003()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t encryptedBlockCount = 0;
            uint32_t skippedBlockCount = 0;
            uint32_t firstEncryptedOffset = 0;
            uint32_t subsampleCount = DRM_KEY_MAX_SUB_SAMPLE_NUM;
            DrmSubsample subsamples[1] = {{0x10, 0x16}};

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetSubsampleInfo(cencInfo, encryptedBlockCount,
                skippedBlockCount, firstEncryptedOffset, subsampleCount + 1, subsamples);
            if (errNo == AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetSubsampleInfo_004
         * @tc.number CencInfo_SetSubsampleInfo_004
         * @tc.desc   Set the null subsamples
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetSubsampleInfo_004()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint32_t encryptedBlockCount = 0;
            uint32_t skippedBlockCount = 0;
            uint32_t firstEncryptedOffset = 0;
            uint32_t subsampleCount = 1;

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetSubsampleInfo(cencInfo, encryptedBlockCount, skippedBlockCount,
                firstEncryptedOffset, subsampleCount, nullptr);
            if (errNo == AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetMode_001
         * @tc.number CencInfo_SetMode_001
         * @tc.desc   Set mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetMode_001()
        {
            OH_AVErrCode errNo = AV_ERR_OK;

            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetMode(cencInfo, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET);
            if (errNo != AV_ERR_OK)
                return -1;

            errNo = OH_AVCencInfo_SetMode(cencInfo, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_NOT_SET);
            if (errNo != AV_ERR_OK)
                return -1;

            errNo = OH_AVCencInfo_SetMode(cencInfo,
                static_cast<enum DrmCencInfoMode>(DRM_CENC_INFO_KEY_IV_SUBSAMPLES_NOT_SET + 1));
            if (errNo != AV_ERR_OK)
                return -1;

            errNo = OH_AVCencInfo_Destroy(cencInfo);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetMode_002
         * @tc.number CencInfo_SetMode_002
         * @tc.desc   Set cencInfo null object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetMode_002()
        {
            OH_AVErrCode errNo = AV_ERR_OK;

            errNo = OH_AVCencInfo_SetMode(nullptr, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET);
            return (errNo == AV_ERR_OK) ? -1 : 0;
        }
        /**
         * @tc.name   CencInfo_SetAVBuffer_001
         * @tc.number CencInfo_SetAVBuffer_001
         * @tc.desc   Set avBuffer
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        static int InitCencInfoForSetAVBuffer(OH_AVCencInfo *cencInfo)
        {   
            constexpr uint32_t ENCRYPTED_BLOCK_COUNT = 2;
            constexpr uint32_t SKIPPED_BLOCK_COUNT = 1;
            constexpr uint32_t FIRST_ENCRYPTED_OFFSET = 0x08;
            constexpr uint32_t SUBSAMPLE_COUNT = 2;
            uint8_t keyId[DRM_KEY_ID_SIZE] = {
                0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10
            };
            uint8_t iv[DRM_KEY_IV_SIZE] = {
                0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18,
                0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20
            };
            DrmSubsample subsamples[2] = {{0x10, 0x16}, {0x20, 0x26}};

            if (OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_CTR) != AV_ERR_OK) {
                return -1;
            }
            if (OH_AVCencInfo_SetKeyIdAndIv(
                cencInfo, keyId, DRM_KEY_ID_SIZE, iv, DRM_KEY_IV_SIZE) != AV_ERR_OK) {
                return -1;
            }
            if (OH_AVCencInfo_SetSubsampleInfo(
                cencInfo,
                ENCRYPTED_BLOCK_COUNT,
                SKIPPED_BLOCK_COUNT,
                FIRST_ENCRYPTED_OFFSET,
                SUBSAMPLE_COUNT,
                subsamples) != AV_ERR_OK) {
                return -1;
            }
            if (OH_AVCencInfo_SetMode(
                cencInfo, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET) != AV_ERR_OK) {
                return -1;
            }
            return 0;
        }
                int CencInfoCapiTestCase::TestCencInfo_SetAVBuffer_001()
        {
            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr) {
                return -1;
            }

            if (InitCencInfoForSetAVBuffer(cencInfo) != 0) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            OH_AVBuffer *buffer = OH_AVBuffer_Create(DRM_KEY_ID_SIZE);
            if (buffer == nullptr) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            int ret = OH_AVCencInfo_SetAVBuffer(cencInfo, buffer);

            OH_AVBuffer_Destroy(buffer);
            OH_AVCencInfo_Destroy(cencInfo);
            return (ret == AV_ERR_OK) ? 0 : -1;
        }
        /**
         * @tc.name   CencInfo_SetAVBuffer_002
         * @tc.number CencInfo_SetAVBuffer_002
         * @tc.desc   Set cencInfo null object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetAVBuffer_002()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            uint8_t keyId[DRM_KEY_ID_SIZE] = {0x01};
            uint8_t iv[DRM_KEY_IV_SIZE] = {0x01};

            OH_AVBuffer *buffer = nullptr;
            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            buffer = OH_AVBuffer_Create(DRM_KEY_ID_SIZE);
            if (cencInfo == nullptr || buffer == nullptr) {
                OH_AVBuffer_Destroy(buffer);
                return -1;
            }
            OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_CTR);
            OH_AVCencInfo_SetKeyIdAndIv(cencInfo, keyId, DRM_KEY_ID_SIZE, iv, DRM_KEY_IV_SIZE);
            OH_AVCencInfo_SetMode(cencInfo, DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET);
            errNo = OH_AVCencInfo_SetAVBuffer(cencInfo, buffer);
            OH_AVCencInfo_Destroy(cencInfo);
            OH_AVBuffer_Destroy(buffer);
            return (errNo != AV_ERR_OK) ? -1 : 0;
        }

        /**
         * @tc.name   CencInfo_SetAVBuffer_003
         * @tc.number CencInfo_SetAVBuffer_003
         * @tc.desc   Set buffer null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        int CencInfoCapiTestCase::TestCencInfo_SetAVBuffer_003()
        {
            OH_AVErrCode errNo = AV_ERR_OK;
            OH_AVCencInfo *cencInfo = OH_AVCencInfo_Create();
            if (cencInfo == nullptr)
                return -1;

            errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_AES_CTR);
            if (errNo != AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }
            errNo = OH_AVCencInfo_SetAlgorithm(cencInfo, DRM_ALG_CENC_SM4_CTR);
            if (errNo != AV_ERR_OK) {
                OH_AVCencInfo_Destroy(cencInfo);
                return -1;
            }

            OH_AVCencInfo_Destroy(cencInfo);
            return 0;
        }

    }
}