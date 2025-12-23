/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "OHImageEffectStartTest.h"
#include <cstdint>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_effect/image_effect_errors.h>

#define IMAGE_EFFECT_50F 50.f
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define CASE_INDEX_1 1

napi_value OHImageEffectStart(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create("ImageEdit");
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_50F;
    ImageEffect_ErrorCode OH_ImageEffect_Start(OH_ImageEffect *imageEffect);
    int32_t index;
    int32_t code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_Start(imageEffect);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
