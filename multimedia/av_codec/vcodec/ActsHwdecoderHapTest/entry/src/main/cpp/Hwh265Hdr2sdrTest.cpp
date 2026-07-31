/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <string>
#include "VideoDecApi11Sample.h"
#include "include/CommonTool.h"

#define MAX_THREAD 16

using namespace std;

class HwdecHdr2SdrNdkTest {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
};

namespace {
static OH_AVCapability* cap_hevc = nullptr;
static string g_codecNameAVC = "";
static string g_codecNameHEVC = "";
OH_AVCodec* vdec_ = NULL;
OH_AVFormat* format;
constexpr int32_t DEFAULT_WIDTH = 1920;
constexpr int32_t DEFAULT_HEIGHT = 1080;
} // namespace

void HwdecHdr2SdrNdkTest::SetUpTestCase()
{
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHEVC: " << g_codecNameHEVC << endl;
}
void HwdecHdr2SdrNdkTest::TearDownTestCase() {}

void HwdecHdr2SdrNdkTest::SetUp(void) {}

void HwdecHdr2SdrNdkTest::TearDown()
{
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    if (vdec_ != NULL) {
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
}

namespace {
struct Hdr2SdrTestGuard {
    ~Hdr2SdrTestGuard()
    {
        if (format != nullptr) {
            OH_AVFormat_Destroy(format);
            format = nullptr;
        }
        if (vdec_ != NULL) {
            OH_VideoDecoder_Destroy(vdec_);
            vdec_ = nullptr;
        }
    }
};
} // namespace

/**
 * @tc.name   HEVC_HW_HDR2SDR_FUNC_002
 * @tc.number HEVC_HW_HDR2SDR_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int HevcHwHdr2sdrFunc002Test()
{
    if (cap_hevc) {
        Hdr2SdrTestGuard guard;
        if (!access("/system/lib64/libav_codec_hevc_parser.z.so", 0)) {
            vdec_ = OH_VideoDecoder_CreateByName(g_codecNameHEVC.c_str());
            if (vdec_ == nullptr) { return -1; }
            format = OH_AVFormat_Create();
            if (format == nullptr) { return -1; }
            if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE, OH_COLORSPACE_BT709_LIMIT)) {
                return -1;
            }
            if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA)) {
                return -1;
            }
            if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_INVALID_VAL) { return -1; }
        } else {
            vdec_ = OH_VideoDecoder_CreateByName(g_codecNameHEVC.c_str());
            if (vdec_ == nullptr) { return -1; }
            format = OH_AVFormat_Create();
            if (format == nullptr) { return -1; }
            if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT)) { return -1; }
            if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH)) { return -1; }
            if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE, OH_COLORSPACE_BT709_LIMIT)) {
                return -1;
            }
            if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA)) {
                return -1;
            }
            if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_UNSUPPORT) { return -1; }
        }
    }
    return 0;
}

void InitHwdecHdr2sdrTest()
{
}