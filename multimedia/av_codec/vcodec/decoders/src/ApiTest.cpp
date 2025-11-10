/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <iostream>
#include <cstdio>

#include <atomic>
#include <fstream>
#include <thread>
#include <mutex>
#include <queue>
#include <string>

#include "gtest/gtest.h"
#include "VideoDecApi11SampleTest.h"
#include "native_avcodec_videodecoder.h"
#include "native_avformat.h"
#include "native_averrors.h"
#include "native_avcodec_base.h"
#include "native_avcapability.h"

#include "native_avdemuxer.h"
#include "native_avsource.h"
#include "native_avmemory.h"
#include <fcntl.h>

#ifdef SUPPORT_DRM
#include "native_mediakeysession.h"
#include "native_mediakeysystem.h"
#endif

#define PIXFORMAT_NUM 3

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;
namespace OHOS {
namespace Media {
class DecApiNdkTest : public testing::Test {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);
};

uint32_t g_pixelFormatNum = 0;
const int32_t *g_pixelFormat = nullptr;
OH_AVCodec *vdec_ = NULL;
OH_AVCapability *cap = nullptr;
const string CODEC_NAME = "OH.Media.Codec.Decoder.Video.VC1";
VDecAPI11Signal *signal_;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
OH_AVFormat *format;
static int g_fd = -1;
static OH_AVMemory *memory = nullptr;
static OH_AVSource *source = nullptr;
static OH_AVDemuxer *demuxer = nullptr;
static OH_AVFormat *sourceFormat = nullptr;
static OH_AVFormat *trackFormat = nullptr;
static OH_AVBuffer *avBuffer = nullptr;
static int32_t g_trackCount;

static int64_t GetFileSize(const char *fileName)
{
    int64_t fileSize = 0;
    if (fileName != nullptr) {
        struct stat fileStatus {};
        if (stat(fileName, &fileStatus) == 0) {
            fileSize = static_cast<int64_t>(fileStatus.st_size);
        }
    }
    return fileSize;
}
static void GetFormat(const char *fileName)
{
    int trackType = 0;
    g_fd = open(fileName, O_RDONLY);
    int64_t size = GetFileSize(fileName);
    cout << fileName << "-------" << g_fd << "-------" << size << endl;
    source = OH_AVSource_CreateWithFD(g_fd, 0, size);
    ASSERT_NE(source, nullptr);
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    ASSERT_NE(demuxer, nullptr);
    sourceFormat = OH_AVSource_GetSourceFormat(source);
    ASSERT_NE(sourceFormat, nullptr);
    ASSERT_TRUE(OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount));
    cout << "g_trackCount----" << g_trackCount << endl;
    for (int32_t index = 0; index < g_trackCount; index++) {
        ASSERT_EQ(AV_ERR_OK, OH_AVDemuxer_SelectTrackByID(demuxer, index));
    }
    for (int32_t index = 0; index < g_trackCount; index++) {
        trackFormat = OH_AVSource_GetTrackFormat(source, index);
        ASSERT_NE(trackFormat, nullptr);
        ASSERT_TRUE(OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &trackType));
        if (trackType == MEDIA_TYPE_VID) {
            break;
        }
    }
    close(g_fd);
    g_fd = -1;
}

static bool CheckPixelFormat(int32_t pixformat)
{
    if (pixformat == AV_PIXEL_FORMAT_YUVI420 ||
        pixformat == AV_PIXEL_FORMAT_NV12 ||
        pixformat == AV_PIXEL_FORMAT_NV21) {
        return true;
    } else {
        return false;
    }
}

static bool CheckProfile(int32_t profile)
{
    if (profile == VC1_PROFILE_SIMPLE ||
        profile == VC1_PROFILE_MAIN ||
        profile == VC1_PROFILE_ADVANCED) {
        return true;
    } else {
        return false;
    }
}

static bool CheckLevelsForProfile(int32_t profile, int32_t level)
{
    if (profile == VC1_PROFILE_SIMPLE) {
        if (level == VC1_LEVEL_LOW ||
            level == VC1_LEVEL_MEDIUM) {
            return true;
        } else {
            return false;
        }
    } else if (profile == VC1_PROFILE_MAIN) {
        if (level == VC1_LEVEL_LOW ||
            level == VC1_LEVEL_MEDIUM ||
            level == VC1_LEVEL_HIGH) {
            return true;
        } else {
            return false;
        }
    } else if (profile == VC1_PROFILE_ADVANCED) {
        if (level == VC1_LEVEL_L0 ||
            level == VC1_LEVEL_L1 ||
            level == VC1_LEVEL_L2 ||
            level == VC1_LEVEL_L3 ||
            level == VC1_LEVEL_L4) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

void DecApiNdkTest::SetUpTestCase()
{
    const char *file = "/data/test/media/test_vc1.avi";
    GetFormat(file);
}
void DecApiNdkTest::TearDownTestCase()
{
    if (trackFormat != nullptr) {
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
}
void DecApiNdkTest::SetUp()
{
    signal_ = new VDecAPI11Signal();
}
void DecApiNdkTest::TearDown()
{
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    if (signal_) {
        delete signal_;
        signal_ = nullptr;
    }
    if (vdec_ != NULL) {
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }

    if (sourceFormat != nullptr) {
        OH_AVFormat_Destroy(sourceFormat);
        sourceFormat = nullptr;
    }

    if (memory != nullptr) {
        OH_AVMemory_Destroy(memory);
        memory = nullptr;
    }
    if (source != nullptr) {
        OH_AVSource_Destroy(source);
        source = nullptr;
    }
    if (demuxer != nullptr) {
        OH_AVDemuxer_Destroy(demuxer);
        demuxer = nullptr;
    }
    if (avBuffer != nullptr) {
        OH_AVBuffer_Destroy(avBuffer);
        avBuffer = nullptr;
    }
    if (g_fd > 0) {
        close(g_fd);
        g_fd = -1;
    }
}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.number    : VIDEO_VC1DEC_CAP_API_0001
 * @tc.name      : VIDEO_VC1DEC_CAP_API_0001
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0001, TestSize.Level2)
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false);
    if (cap != nullptr) {
        string codec_name = OH_AVCapability_GetName(cap);
        ASSERT_EQ(CODEC_NAME, codec_name);
    }
}


/**
 * @tc.number    : VIDEO_VC1DEC_CAP_API_0002
 * @tc.name      : VIDEO_VC1DEC_CAP_API_0002
 * @tc.desc      : function test
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0002, TestSize.Level1)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (cap != nullptr) {
        ASSERT_NE(cap, nullptr);
        ASSERT_EQ(64, OH_AVCapability_GetMaxSupportedInstances(cap));
    }

}

/**
 * @tc.number    : VIDEO_VC1DEC_CAP_API_0003
 * @tc.name      : VIDEO_VC1DEC_CAP_API_0003
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0003, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    memset_s(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoWidthRange(capability, &range);
        ASSERT_EQ(AV_ERR_OK, ret);
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        ASSERT_EQ(range.minVal, 176);
        ASSERT_EQ(range.maxVal, 2048);
    }
}

/**
 * @tc.number    : VIDEO_VC1DEC_CAP_API_0004
 * @tc.name      : VIDEO_VC1DEC_CAP_API_0004
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0004, TestSize.Level2)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
         OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &g_pixelFormat, &g_pixelFormatNum);
        ASSERT_NE(nullptr, g_pixelFormat);
        ASSERT_EQ(g_pixelFormatNum, 3);
        ASSERT_EQ(AV_ERR_OK, ret);
        for (int i = 0; i < g_pixelFormatNum; i++) {
            vdec_ = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
            ASSERT_NE(nullptr, vdec_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            EXPECT_GE(g_pixelFormat[i], 0);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, g_pixelFormat[i]);
            EXPECT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
            OH_AVFormat_Destroy(format);
            OH_VideoDecoder_Destroy(vdec_);
            format = nullptr;
            vdec_ = nullptr;
           }
    }
}

/**
 * @tc.number    : VIDEO_VC1DEC_CAP_API_0005
 * @tc.name      : VIDEO_VC1DEC_CAP_API_0005
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0005, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *g_pixelFormat = nullptr;
    uint32_t g_pixelFormatNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &g_pixelFormat, &g_pixelFormatNum);
        ASSERT_NE(nullptr, g_pixelFormat);
        ASSERT_EQ(g_pixelFormatNum, PIXFORMAT_NUM);
        ASSERT_EQ(AV_ERR_OK, ret);
        for (int i = 0; i < g_pixelFormatNum; i++) {
            ASSERT_EQ(true, CheckPixelFormat(g_pixelFormat[i]));
            vdec_ = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
            ASSERT_NE(nullptr, vdec_);
            format = OH_AVFormat_Create();
            ASSERT_NE(nullptr, format);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            EXPECT_GE(g_pixelFormat[i], 0);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, g_pixelFormat[i]);
            EXPECT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
            OH_AVFormat_Destroy(format);
            OH_VideoDecoder_Destroy(vdec_);
        }
        vdec_ = OH_VideoDecoder_CreateByName(CODEC_NAME.c_str());
        ASSERT_NE(nullptr, vdec_);
        format = OH_AVFormat_Create();
        ASSERT_NE(nullptr, format);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV21 + AV_PIXEL_FORMAT_NV21);
        ASSERT_NE(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    }

}


/**
 * @tc.number    : VIDEO_VC1DEC_CAP_API_0006
 * @tc.name      : VIDEO_VC1DEC_CAP_API_0006
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0006, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(profileNum, 3);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            ASSERT_EQ(CheckProfile(profiles[i]), true);
        }
    }

}

/**
 * @tc.number    : VIDEO_VC1DEC_CAP_API_0007
 * @tc.name      : VIDEO_VC1DEC_CAP_API_0007
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0007, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(profileNum, 3);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            cout << "profiles[" << i << "] = " << profiles[i] << endl;
            ASSERT_EQ(CheckProfile(profiles[i]), true);
            ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
            ASSERT_EQ(AV_ERR_OK, ret);
            ASSERT_NE(nullptr, levels);
            EXPECT_GT(levelNum, 0);
            for (int j = 0; j < levelNum; j++) {
                cout << "level is " << levels[j] << endl;
                ASSERT_EQ(CheckLevelsForProfile(profiles[i], levels[j]), true);
            }
        }
    }
}

/**
 * @tc.number    : VIDEO_VC1DEC_CAP_API_0008
 * @tc.name      : VIDEO_VC1DEC_CAP_API_0008
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_VC1DEC_CAP_API_0008, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(profileNum, 3);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            ASSERT_EQ(profiles[i], i);
            ret = OH_AVCapability_GetSupportedLevelsForProfile(
                capability, profiles[i], &levels, &levelNum);
            ASSERT_EQ(AV_ERR_OK, ret);
            ASSERT_NE(nullptr, levels);
            for (int j = 0; j < levelNum; j++) {
                ASSERT_EQ(true, OH_AVCapability_AreProfileAndLevelSupported(capability, profiles[i], levels[j]));
            }
        }
    }

}

/**
 * @tc.number    : VIDEO_MSVIDEO1DEC_CAP_API_0009
 * @tc.name      : VIDEO_MSVIDEO1DEC_CAP_API_0009
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_MSVIDEO1DEC_CAP_API_0009, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_MSVIDEO1, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(profileNum, 0);
    }
}

/**
 * @tc.number    : VIDEO_MSVIDEO1DEC_CAP_API_0010
 * @tc.name      : VIDEO_MSVIDEO1DEC_CAP_API_0010
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_MSVIDEO1DEC_CAP_API_0010, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(2, profileNum);
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            EXPECT_GE(profiles[i], 0);
        }
    }

}

/**
 * @tc.number    : VIDEO_MSVIDEO1DEC_CAP_API_0011
 * @tc.name      : VIDEO_MSVIDEO1DEC_CAP_API_0011
 * @tc.desc      : api test
 */
HWTEST_F(DecApiNdkTest, VIDEO_MSVIDEO1DEC_CAP_API_0011, TestSize.Level1)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false, SOFTWARE);
    if (capability != nullptr) {
        ASSERT_NE(nullptr, capability);
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        ASSERT_EQ(AV_ERR_OK, ret);
        ASSERT_EQ(2, profileNum);
        const int32_t* levels = nullptr;
        uint32_t levelNum = 0;
        ASSERT_NE(nullptr, profiles);
        for (int i = 0; i < profileNum; i++) {
            EXPECT_GE(profiles[i], 0);
            ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
            ASSERT_EQ(AV_ERR_OK, ret);
            ASSERT_NE(nullptr, levels);
            EXPECT_GT(levelNum, 0);
            for (int j = 0; j < levelNum; j++) {
                EXPECT_GE(levels[j], 0);
            }
        }
    }

}
} // namespace