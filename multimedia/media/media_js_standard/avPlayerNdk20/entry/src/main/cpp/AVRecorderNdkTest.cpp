/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing fpermissions and
 * limitations under the License.
 */

#include "GLES3/gl32.h"
#include "napi/native_api.h"
#include "native_image/native_image.h"
#include "native_window/external_window.h"
#include <arpa/nameser.h>
#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <iostream>
#include <js_native_api.h>
#include <multimedia/player_framework/avplayer.h>
#include <multimedia/player_framework/avplayer_base.h>
#include <multimedia/player_framework/avrecorder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <string>
#include <sys/stat.h>
#include <thread>
#include <typeinfo>
#include <unistd.h>
#include <vector>

void OnStateChange(OH_AVRecorder *recorder, OH_AVRecorder_State state, OH_AVRecorder_StateChangeReason reason,
                   void *userData){};
void OnError(OH_AVRecorder *recorder, int32_t errorCode, const char *errorMsg, void *userData){};
void OnUri(OH_AVRecorder *recorder, OH_MediaAsset *asset, void *userData){};

static napi_value OH_AVRecorder_Prepare0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder_Config *config;
    OH_AVErrCode errcode = OH_AVRecorder_Prepare(nullptr, config);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_GetAVRecorderConfig0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder_Config *config;
    OH_AVErrCode errcode = OH_AVRecorder_GetAVRecorderConfig(nullptr, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_GetInputSurface0101(napi_env env, napi_callback_info info)
{
    OHNativeWindow *window;
    OH_AVErrCode errcode = OH_AVRecorder_GetInputSurface(nullptr, &window);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_UpdateRotation0100(napi_env env, napi_callback_info info)
{
    int32_t rotation = 0;
    OH_AVErrCode errcode = OH_AVRecorder_UpdateRotation(nullptr, rotation);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Start0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Start(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Pause0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Pause(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Resume0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Resume(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Stop0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Stop(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Reset0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Reset(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_Release0100(napi_env env, napi_callback_info info)
{
    OH_AVErrCode errcode = OH_AVRecorder_Release(nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_GetAvailableEncoder0100(napi_env env, napi_callback_info info)
{
    int32_t *length = 0;
    OH_AVErrCode errcode = OH_AVRecorder_GetAvailableEncoder(nullptr, nullptr, length);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetStateCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetStateCallback(Recorder, OnStateChange, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetStateCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetStateCallback(nullptr, nullptr, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetErrorCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetErrorCallback(Recorder, OnError, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetErrorCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetErrorCallback(nullptr, nullptr, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetUriCallback0100(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetUriCallback(Recorder, OnUri, nullptr);
    int32_t res = 1;
    if (errcode == AV_ERR_OK) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetUriCallback0101(napi_env env, napi_callback_info info)
{
    OH_AVRecorder *Recorder = OH_AVRecorder_Create();
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetUriCallback(nullptr, nullptr, userData);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_VAL) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

static napi_value OH_AVRecorder_SetWillMuteWhenInterrupted0100(napi_env env, napi_callback_info info)
{
    bool muteWhenInterrupted = true;
    void *userData;
    OH_AVErrCode errcode = OH_AVRecorder_SetWillMuteWhenInterrupted(nullptr, muteWhenInterrupted);
    int32_t res = 1;
    if (errcode == AV_ERR_INVALID_STATE) {
        res = 0;
    }
    napi_value retValue;
    napi_create_int32(env, res, &retValue);
    return retValue;
}

napi_property_descriptor desc[] = {
    {"OH_AVRecorder_Prepare0100", nullptr, OH_AVRecorder_Prepare0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_GetAVRecorderConfig0100", nullptr, OH_AVRecorder_GetAVRecorderConfig0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_GetInputSurface0101", nullptr, OH_AVRecorder_GetInputSurface0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_UpdateRotation0100", nullptr, OH_AVRecorder_UpdateRotation0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_Start0100", nullptr, OH_AVRecorder_Start0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Pause0100", nullptr, OH_AVRecorder_Pause0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Resume0100", nullptr, OH_AVRecorder_Resume0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Stop0100", nullptr, OH_AVRecorder_Stop0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Reset0100", nullptr, OH_AVRecorder_Reset0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_Release0100", nullptr, OH_AVRecorder_Release0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OH_AVRecorder_GetAvailableEncoder0100", nullptr, OH_AVRecorder_GetAvailableEncoder0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetStateCallback0100", nullptr, OH_AVRecorder_SetStateCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetStateCallback0101", nullptr, OH_AVRecorder_SetStateCallback0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetErrorCallback0100", nullptr, OH_AVRecorder_SetErrorCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetErrorCallback0101", nullptr, OH_AVRecorder_SetErrorCallback0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetUriCallback0100", nullptr, OH_AVRecorder_SetUriCallback0100, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetUriCallback0101", nullptr, OH_AVRecorder_SetUriCallback0101, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OH_AVRecorder_SetWillMuteWhenInterrupted0100", nullptr, OH_AVRecorder_SetWillMuteWhenInterrupted0100, nullptr,
     nullptr, nullptr, napi_default, nullptr},

};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "avrecorderndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
