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
#include <string>
#include "gtest/gtest.h"
#include "native_avcodec_videodecoder.h"
#include "native_averrors.h"
#include "VideoDecApi11SampleTest.h"
#include "native_avcodec_base.h"
#include "avcodec_codec_name.h"
#include "native_avcapability.h"
#include "native_avformat.h"
#include "native_avdemuxer.h"
#include "native_avsource.h"
#include "native_avmemory.h"
#include <fcntl.h>


#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;
using namespace testing::ext;

namespace OHOS {
namespace Media {
class DecFuncNdkTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
protected:
    const char *ginpDirVc1 = "/data/test/media/test_vc1.avi";
    const char *ginpDirMjpeg = "/data/test/media/1920_1080_30.avi";
    const char *ginpDirMsvideo1 = "/data/test/media/msvideo1_720x480.avi";
};

static OH_AVCapability *g_capVc1 = nullptr;
static OH_AVCapability* g_capMjpeg = nullptr;
static OH_AVCapability* g_capMsvideo1 = nullptr;
static OH_AVCapability* g_capWmv3 = nullptr;
static string g_codecNameVc1 = "";
static string g_codecNameMjpeg = "";
static string g_codecNameMsvideo1 = "";
static string g_codecNameWmv3 = "";
constexpr uint32_t FRAMESIZE60 = 60;
constexpr uint32_t FRAMESIZE30 = 30;
constexpr uint32_t FRAMESIZE98 = 98;
void DecFuncNdkTest::SetUpTestCase()
{
    g_capVc1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VC1, false, SOFTWARE);
    g_codecNameVc1 = OH_AVCapability_GetName(g_capVc1);
    cout << "g_codecNameVc1: " << g_codecNameVc1 << endl;
    g_capMjpeg = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MJPEG, false, SOFTWARE);
    g_codecNameMjpeg = OH_AVCapability_GetName(g_capMjpeg);
    cout << "g_codecNameMjpeg: " << g_codecNameMjpeg << endl;
    g_capMsvideo1 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MSVIDEO1, false, SOFTWARE);
    g_codecNameMsvideo1 = OH_AVCapability_GetName(g_capMsvideo1);
    cout << "g_codecNameMsvideo1: " << g_codecNameMsvideo1 << endl;
    g_capWmv3 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_WMV3, false, SOFTWARE);
    g_codecNameWmv3 = OH_AVCapability_GetName(g_capWmv3);
    cout << "g_codecNameWmv3: " << g_codecNameWmv3 << endl;
}

void DecFuncNdkTest::TearDownTestCase() {}
void DecFuncNdkTest::SetUp() {}
void DecFuncNdkTest::TearDown() {}
} // namespace Media
} // namespace OHOS

namespace {
/**
 * @tc.number    : VIDEO_VC1DEC_FUNCTION_0001
 * @tc.name      : VIDEO_VC1DEC_FUNCTION_0001
 * @tc.desc      : function test
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VC1DEC_FUNCTION_0001, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    const char *file = ginpDirVc1;
    vDecSample->getFormat(file);
    vDecSample->outputYuvFlag = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameVc1));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(0, vDecSample->errCount);
    ASSERT_EQ(FRAMESIZE60, vDecSample->outFrameCount);
}

/**
 * @tc.number    : VIDEO_VC1DEC_FUNCTION_0002
 * @tc.name      : VIDEO_VC1DEC_FUNCTION_0002
 * @tc.desc      : function test
 */
HWTEST_F(DecFuncNdkTest, VIDEO_VC1DEC_FUNCTION_0002, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    const char *file = ginpDirVc1;
    vDecSample->getFormat(file);
    vDecSample->SF_OUTPUT = true;
    vDecSample->outputYuvSurface = true;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecNameVc1));
    vDecSample->WaitForEOS();
    ASSERT_EQ(FRAMESIZE60, vDecSample->outFrameCount);
}

/**
 * @tc.number    : VIDEO_MJPEGDEC_FUNCTION_0003
 * @tc.name      : VIDEO_MJPEGDEC_FUNCTION_0003
 * @tc.desc      : function test
 */
HWTEST_F(DecFuncNdkTest, VIDEO_MJPEGDEC_FUNCTION_0003, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    const char* file = ginpDirMjpeg;
    vDecSample->getFormat(file);
    vDecSample->outputYuvFlag = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameMjpeg));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(0, vDecSample->errCount);
    ASSERT_EQ(FRAMESIZE30, vDecSample->outFrameCount);
}

/**
 * @tc.number    : VIDEO_MJPEGDEC_FUNCTION_0004
 * @tc.name      : VIDEO_MJPEGDEC_FUNCTION_0004
 * @tc.desc      : function test
 */
HWTEST_F(DecFuncNdkTest, VIDEO_MJPEGDEC_FUNCTION_0004, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    const char* file = ginpDirMjpeg;
    vDecSample->getFormat(file);
    vDecSample->SF_OUTPUT = true;
    vDecSample->outputYuvSurface = true;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecNameMjpeg));
    vDecSample->WaitForEOS();
    ASSERT_EQ(FRAMESIZE30, vDecSample->outFrameCount);
}

/**
 * @tc.number    : VIDEO_MSVIDEO1DEC_FUNCTION_0005
 * @tc.name      : VIDEO_MSVIDEO1DEC_FUNCTION_0005
 * @tc.desc      : function test
 */
HWTEST_F(DecFuncNdkTest, VIDEO_MSVIDEO1DEC_FUNCTION_0005, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    const char* file = ginpDirMsvideo1;
    vDecSample->getFormat(file);
    vDecSample->outputYuvFlag = true;
    ASSERT_EQ(AV_ERR_OK, vDecSample->CreateVideoDecoder(g_codecNameMsvideo1));
    ASSERT_EQ(AV_ERR_OK, vDecSample->ConfigureVideoDecoder());
    ASSERT_EQ(AV_ERR_OK, vDecSample->SetVideoDecoderCallback());
    ASSERT_EQ(AV_ERR_OK, vDecSample->StartVideoDecoder());
    vDecSample->WaitForEOS();
    ASSERT_EQ(0, vDecSample->errCount);
    ASSERT_EQ(FRAMESIZE98, vDecSample->outFrameCount);
}

/**
 * @tc.number    : VIDEO_MSVIDEO1DEC_FUNCTION_0006
 * @tc.name      : VIDEO_MSVIDEO1DEC_FUNCTION_0006
 * @tc.desc      : function test
 */
HWTEST_F(DecFuncNdkTest, VIDEO_MSVIDEO1DEC_FUNCTION_0006, TestSize.Level0)
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    const char* file = ginpDirMsvideo1;
    vDecSample->getFormat(file);
    vDecSample->SF_OUTPUT = true;
    vDecSample->outputYuvSurface = true;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    ASSERT_EQ(AV_ERR_OK, vDecSample->RunVideoDec_Surface(g_codecNameMsvideo1));
    vDecSample->WaitForEOS();
    ASSERT_EQ(FRAMESIZE98, vDecSample->outFrameCount);
}
} // namespace