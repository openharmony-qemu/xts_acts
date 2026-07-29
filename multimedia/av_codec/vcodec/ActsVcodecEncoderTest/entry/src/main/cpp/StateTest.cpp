/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <iostream>
#include <atomic>
#include <fstream>
#include <mutex>
#include <queue>
#include <string>
#include <thread>

#include "videoenc_sample.h"
#include "avcodec_codec_name.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "include/OhosCommonTest.h"
#include <napi/native_api.h>
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

VEncNdkSample *vEncSample = NULL;
OH_AVCapability *cap = nullptr;
bool g_createCodecSuccess = false;

static int InitCapAndEncoder(void)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr) {
        vEncSample = new VEncNdkSample();
        const char *codeName = OH_AVCapability_GetName(cap);
        cout << "codecname: " << codeName << endl;
        int32_t ret = vEncSample->CreateVideoEncoder(codeName);
        if (ret != AV_ERR_OK) { return -1; }
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return -1; }
        ret = vEncSample->ConfigureVideoEncoder();
        if (ret != AV_ERR_OK) { return -1; }
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        g_createCodecSuccess = true;
    } else {
        cout << "can not get Capability" << endl;
    }
    return 0;
}

static void TestSetUp(void)
{
    InitCapAndEncoder();
}

void TestTearDownState(void)
{
    if (cap != nullptr) {
        vEncSample->Release();
        delete vEncSample;
        vEncSample = nullptr;
    }
}

static void TestSetUpTestCase(void) {}

static void TestTearDownTestCase(void) {}

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value VideoEncodeState0100Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Flush();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0101Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0200Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0300Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0400Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0500Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0600Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0700Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0800Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState0900Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1000Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1100Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1200Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1300Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->ConfigureVideoEncoder();
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1400Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->ConfigureVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1500Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1600Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->StartVideoEncoder();
        vEncSample->WaitForEOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1700Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1800Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "flush ok" << endl;
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "start ok" << endl;
        ret = vEncSample->state_EOS();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState1900Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2000Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2100Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->ConfigureVideoEncoder();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2200Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "set callback" << endl;
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2300Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2400Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2500Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2600Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->ConfigureVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2700Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2800Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState2900Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->ConfigureVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3000Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3100Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Start();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Stop();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Flush();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3200Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Start();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->ConfigureVideoEncoder();
        if (ret != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->SetVideoEncoderCallback();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3300Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Reset();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = vEncSample->ConfigureVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3400Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        int32_t ret = vEncSample->Release();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3500Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        vEncSample->outputCallbackFlush = true;
        vEncSample->SURF_INPUT = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3600Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        vEncSample->outputCallbackStop = true;
        vEncSample->SURF_INPUT = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3700Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        vEncSample->inputCallbackFlush = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3800Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        vEncSample->inputCallbackStop = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState3900Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        vEncSample->outputCallbackFlush = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState4000Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        vEncSample->outputCallbackStop = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeState4100Test(napi_env env, napi_callback_info info)
{
    if(InitCapAndEncoder() == -1) { return CreateIntInt32Result(env, -1); }
    if (cap != nullptr) {
        vEncSample->outputCallbackStop = true;
        int32_t ret = vEncSample->StartVideoEncoder();
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        TestTearDownState();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

void InitStateTest()
{
    TestSetUpTestCase();
}