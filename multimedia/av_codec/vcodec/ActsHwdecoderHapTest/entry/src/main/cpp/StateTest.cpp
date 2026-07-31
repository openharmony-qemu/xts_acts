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
#include <multimedia/player_framework/native_avcapability.h>
#include <mutex>
#include <queue>
#include <string>
#include <thread>
#include "include/CommonTool.h"

#include "VideoDecNdkSample.h"
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
OH_AVCapability* cap = nullptr;
VDecNdkSample* vDecSample = nullptr;
} // namespace

static bool TestSetUp(void)
{
    vDecSample = new VDecNdkSample();
    if (vDecSample == nullptr) {
        return false;
    }
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (cap == nullptr) {
        delete vDecSample;
        vDecSample = nullptr;
        return false;
    }
    string codeName = OH_AVCapability_GetName(cap);
    cout << "codeName: " << codeName << endl;
    if (vDecSample->CreateVideoDecoder(codeName) != AV_ERR_OK) {
        delete vDecSample;
        vDecSample = nullptr;
        return false;
    }
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        vDecSample->Release();
        delete vDecSample;
        vDecSample = nullptr;
        return false;
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        vDecSample->Release();
        delete vDecSample;
        vDecSample = nullptr;
        return false;
    }
    vDecSample->inpDir = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
    return true;
}
static void TestTearDownState(void)
{
    if (vDecSample != nullptr) {
        vDecSample->Release();
        delete vDecSample;
        vDecSample = nullptr;
    }
}
struct StateTestGuard {
    bool ok = false;
    StateTestGuard() { ok = TestSetUp(); }
    ~StateTestGuard() { TestTearDownState(); }
};

static void TestSetUpTestCase(void) {}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0100
 * @tc.number VIDEO_HWDEC_STATE_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0100Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Flush();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->SetVideoDecoderCallback();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0101
 * @tc.number VIDEO_HWDEC_STATE_0101
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0101Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0200
 * @tc.number VIDEO_HWDEC_STATE_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0200Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0300
 * @tc.number VIDEO_HWDEC_STATE_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0300Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0400
 * @tc.number VIDEO_HWDEC_STATE_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0400Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0500
 * @tc.number VIDEO_HWDEC_STATE_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0500Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->SetVideoDecoderCallback();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0600
 * @tc.number VIDEO_HWDEC_STATE_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0600Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->afterEosDestroyCodec = false;
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0700
 * @tc.number VIDEO_HWDEC_STATE_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0700Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0800
 * @tc.number VIDEO_HWDEC_STATE_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0800Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    if (ret != AV_ERR_OK) { return -1; }
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_0900
 * @tc.number VIDEO_HWDEC_STATE_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState0900Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1000
 * @tc.number VIDEO_HWDEC_STATE_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1000Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1100
 * @tc.number VIDEO_HWDEC_STATE_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1100Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1200
 * @tc.number VIDEO_HWDEC_STATE_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1200Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1300
 * @tc.number VIDEO_HWDEC_STATE_1300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1300Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->ConfigureVideoDecoder();
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1400
 * @tc.number VIDEO_HWDEC_STATE_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1400Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->ConfigureVideoDecoder();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1500
 * @tc.number VIDEO_HWDEC_STATE_1500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1500Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1600
 * @tc.number VIDEO_HWDEC_STATE_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1600Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    if (vDecSample->errCount != 0) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1700
 * @tc.number VIDEO_HWDEC_STATE_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1700Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1800
 * @tc.number VIDEO_HWDEC_STATE_1800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1800Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->StateEos();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_1900
 * @tc.number VIDEO_HWDEC_STATE_1900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState1900Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2000
 * @tc.number VIDEO_HWDEC_STATE_2000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2000Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2100
 * @tc.number VIDEO_HWDEC_STATE_2100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2100Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->ConfigureVideoDecoder();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->SetVideoDecoderCallback();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2200
 * @tc.number VIDEO_HWDEC_STATE_2200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2200Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    cout << "set callback" << endl;
    ret = vDecSample->SetVideoDecoderCallback();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2300
 * @tc.number VIDEO_HWDEC_STATE_2300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2300Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2400
 * @tc.number VIDEO_HWDEC_STATE_2400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2400Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2500
 * @tc.number VIDEO_HWDEC_STATE_2500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2500Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->SetVideoDecoderCallback();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2600
 * @tc.number VIDEO_HWDEC_STATE_2600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2600Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->ConfigureVideoDecoder();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2700
 * @tc.number VIDEO_HWDEC_STATE_2700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2700Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2800
 * @tc.number VIDEO_HWDEC_STATE_2800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2800Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->SetVideoDecoderCallback();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_2900
 * @tc.number VIDEO_HWDEC_STATE_2900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState2900Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->ConfigureVideoDecoder();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3000
 * @tc.number VIDEO_HWDEC_STATE_3000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState3000Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3100
 * @tc.number VIDEO_HWDEC_STATE_3100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState3100Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Start();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->Stop();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->Flush();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->SetVideoDecoderCallback();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3200
 * @tc.number VIDEO_HWDEC_STATE_3200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState3200Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Start();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->ConfigureVideoDecoder();
    if (ret != AV_ERR_INVALID_STATE) { return -1; }
    ret = vDecSample->SetVideoDecoderCallback();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3300
 * @tc.number VIDEO_HWDEC_STATE_3300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState3300Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Reset();
    if (ret != AV_ERR_OK) { return -1; }
    ret = vDecSample->ConfigureVideoDecoder();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3400
 * @tc.number VIDEO_HWDEC_STATE_3400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecState3400Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    int32_t ret = vDecSample->Release();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3500
 * @tc.number VIDEO_HWDEC_STATE_3500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecState3500Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->inputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3600
 * @tc.number VIDEO_HWDEC_STATE_3600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecState3600Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->inputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    if (ret != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3700
 * @tc.number VIDEO_HWDEC_STATE_3700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecState3700Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->outputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    if (ret != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3800
 * @tc.number VIDEO_HWDEC_STATE_3800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecState3800Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->outputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    if (ret != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_3900
 * @tc.number VIDEO_HWDEC_STATE_3900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecState3900Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->sfOutput = true;
    vDecSample->inputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->WaitForEOS();
    if (ret != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4000
 * @tc.number VIDEO_HWDEC_STATE_4000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecState4000Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->sfOutput = true;
    vDecSample->inputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    if (ret != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4100
 * @tc.number VIDEO_HWDEC_STATE_4100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecState4100Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->sfOutput = true;
    vDecSample->outputCallbackFlush = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    if (ret != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_STATE_4200
 * @tc.number VIDEO_HWDEC_STATE_4200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecState4200Test()
{
    StateTestGuard guard;
    if (!guard.ok) { return -1; }
    vDecSample->sfOutput = true;
    vDecSample->outputCallbackStop = true;
    int32_t ret = vDecSample->StartVideoDecoder();
    vDecSample->afterEosDestroyCodec = false;
    if (ret != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    return 0;
}

void InitStateTest()
{
    TestSetUpTestCase();
}
