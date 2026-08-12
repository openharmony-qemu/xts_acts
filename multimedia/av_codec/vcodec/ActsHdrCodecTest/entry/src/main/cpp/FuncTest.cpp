/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

#include <atomic>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <mutex>
#include <queue>
#include <string>
#include <thread>
#include <unistd.h>

#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include "HdrCodecNdkSample.h"
#include "include/FuncTest.h"

using namespace std;
using namespace OHOS::Media;

namespace {
OH_AVCapability* cap_hevc = nullptr;
constexpr int32_t REPEAT_COUNT = 5;
constexpr int32_t DEFAULT_WIDTH_1080P = 1920;
constexpr int32_t DEFAULT_HEIGHT_1080P = 1080;
constexpr const char* HDR_PQ_VIVID_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/pq_vivid.h265";
constexpr const char* HDR_HLG_VIVID_4K_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/hlg_vivid_4k.h265";
constexpr const char* HDR_HLG_VIVID_1080P_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/hlg_vivid_1080p.h265";

static void TestSetUpTestCase()
{
    cap_hevc = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true);
}
} // namespace

/**
 * @tc.name   HDR_FUNC_0010
 * @tc.number HDR_FUNC_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int HdrFunc0010Test()
{
    if (!access("/system/lib64/media/", 0) && (cap_hevc) &&
        OH_AVCapability_AreProfileAndLevelSupported(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_62)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = HDR_PQ_VIVID_INPUT_FILE_PATH;
        if (sample->CreateCodec() != AV_ERR_OK) { return -1; }
        if (sample->Configure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
        if (!sample->timedOut && sample->errorCount != 0) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   HDR_FUNC_0020
 * @tc.number HDR_FUNC_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int HdrFunc0020Test()
{
    if (!access("/system/lib64/media/", 0) && (cap_hevc) &&
        OH_AVCapability_AreProfileAndLevelSupported(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_62)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = HDR_HLG_VIVID_4K_INPUT_FILE_PATH;
        if (sample->CreateCodec() != AV_ERR_OK) { return -1; }
        if (sample->Configure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
        if (!sample->timedOut && sample->errorCount != 0) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   HDR_FUNC_0030
 * @tc.number HDR_FUNC_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int HdrFunc0030Test()
{
    if (!access("/system/lib64/media/", 0) && (cap_hevc) &&
        OH_AVCapability_AreProfileAndLevelSupported(cap_hevc, HEVC_PROFILE_MAIN, HEVC_LEVEL_62)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        sample->INP_DIR = HDR_PQ_VIVID_INPUT_FILE_PATH;
        if (sample->CreateCodec() != AV_ERR_OK) { return -1; }
        if (sample->Configure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
    }
    return 0;
}

/**
 * @tc.name   HDR_FUNC_0040
 * @tc.number HDR_FUNC_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int HdrFunc0040Test()
{
    if (!access("/system/lib64/media/", 0) && (cap_hevc) &&
        OH_AVCapability_AreProfileAndLevelSupported(cap_hevc, HEVC_PROFILE_MAIN, HEVC_LEVEL_62)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        sample->INP_DIR = HDR_HLG_VIVID_4K_INPUT_FILE_PATH;
        if (sample->CreateCodec() != AV_ERR_OK) { return -1; }
        if (sample->Configure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
    }
    return 0;
}

/**
 * @tc.name   HDR_FUNC_0050
 * @tc.number HDR_FUNC_0050
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int HdrFunc0050Test()
{
    if (!access("/system/lib64/media/", 0) && (cap_hevc) &&
        OH_AVCapability_AreProfileAndLevelSupported(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_62)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = HDR_HLG_VIVID_4K_INPUT_FILE_PATH;
        sample->REPEAT_START_STOP_BEFORE_EOS = REPEAT_COUNT;
        if (sample->CreateCodec() != AV_ERR_OK) { return -1; }
        if (sample->Configure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
        if (!sample->timedOut && sample->errorCount != 0) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   HDR_FUNC_0060
 * @tc.number HDR_FUNC_0060
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int HdrFunc0060Test()
{
    if (!access("/system/lib64/media/", 0) && (cap_hevc) &&
        OH_AVCapability_AreProfileAndLevelSupported(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_62)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = HDR_HLG_VIVID_4K_INPUT_FILE_PATH;
        sample->REPEAT_START_FLUSH_STOP_BEFORE_EOS = REPEAT_COUNT;
        if (sample->CreateCodec() != AV_ERR_OK) { return -1; }
        if (sample->Configure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
        if (!sample->timedOut && sample->errorCount != 0) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   HDR_FUNC_0070
 * @tc.number HDR_FUNC_0070
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int HdrFunc0070Test()
{
    if (!access("/system/lib64/media/", 0) && (cap_hevc) &&
        OH_AVCapability_AreProfileAndLevelSupported(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_62)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = HDR_HLG_VIVID_4K_INPUT_FILE_PATH;
        sample->REPEAT_START_FLUSH_BEFORE_EOS = REPEAT_COUNT;
        if (sample->CreateCodec() != AV_ERR_OK) { return -1; }
        if (sample->Configure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
        if (!sample->timedOut && sample->errorCount != 0) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   HDR_FUNC_0080
 * @tc.number HDR_FUNC_0080
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int HdrFunc0080Test()
{
    if (!access("/system/lib64/media/", 0) && (cap_hevc) &&
        OH_AVCapability_AreProfileAndLevelSupported(cap_hevc, HEVC_PROFILE_MAIN_10, HEVC_LEVEL_62)) {
        shared_ptr<HDRCodecNdkSample> sample = make_shared<HDRCodecNdkSample>();
        sample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        sample->INP_DIR = HDR_HLG_VIVID_4K_INPUT_FILE_PATH;
        if (sample->CreateCodec() != AV_ERR_OK) { return -1; }
        if (sample->Configure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
        sample->errorCount = 0;
        sample->timedOut = false;
        sample->DEFAULT_WIDTH = DEFAULT_WIDTH_1080P;
        sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT_1080P;
        sample->INP_DIR = HDR_HLG_VIVID_1080P_INPUT_FILE_PATH;
        if (sample->ReConfigure() != AV_ERR_OK) { return -1; }
        if (sample->Start() != AV_ERR_OK) { return -1; }
        sample->WaitForEos();
    }
    return 0;
}

void InitFuncTest()
{
    TestSetUpTestCase();
}
