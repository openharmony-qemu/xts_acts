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

#include "napi/native_api.h"
#include <cstdint>
#include <js_native_api_types.h>
#include "AbilityKit/ability_runtime/application_context.h"
#include "AudioTest.h"
#include <cstdint>
#include "napi/native_api.h"
#include "ohaudio/native_audiocapturer.h"
#include "ohaudio/native_audiorenderer.h"
#include "ohaudio/native_audiostream_base.h"
#include "ohaudio/native_audiostreambuilder.h"
#include "ohaudio/native_audio_routing_manager.h"
#include "ohaudio/native_audio_device_base.h"
#include "ohaudio/native_audio_session_manager.h"
#include "ohaudio/native_audio_volume_manager.h"
#include "ohaudio/native_audio_stream_manager.h"
#include "AudioResourceManagerTest.h"

namespace {
const uint32_t MAX_NAME_LENGTH = 1024;
}

OH_AudioStreamBuilder *CreateCapturerBuilder()
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}

napi_value AudioCaptureStartInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_Start(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCapturePauseInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_Pause(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}