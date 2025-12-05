/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "ImageEffectSuppTest.h"
#include "OHEffectBufferInfoSetTimestampTest.h"
#include "OHEffectBufferInfoGetTimestampTest.h"
#include "OHEffectBufferInfoSetTextureIdTest.h"
#include "OHEffectBufferInfoGetTextureIdTest.h"

#define DESCRIPTOR(jsmethod, method)                                                                                   \
    { jsmethod, nullptr, method, nullptr, nullptr, nullptr, napi_default, nullptr }

napi_property_descriptor desc1[] = {
    DESCRIPTOR("OHImageEffectCreateSupp", OHImageEffectCreateSupp),
    DESCRIPTOR("OHImageEffectAddFilterSupp", OHImageEffectAddFilterSupp),
    DESCRIPTOR("OHImageEffectInsertFilterSupp", OHImageEffectInsertFilterSupp),
    DESCRIPTOR("OHImageEffectRemoveFilterSupp", OHImageEffectRemoveFilterSupp),
    DESCRIPTOR("OHImageEffectReplaceFilterSupp", OHImageEffectReplaceFilterSupp),
    DESCRIPTOR("OHEffectBufferInfoSetTimestampTest", OHEffectBufferInfoSetTimestampTest),
    DESCRIPTOR("OHEffectBufferInfoGetTimestampTest", OHEffectBufferInfoGetTimestampTest),
    DESCRIPTOR("OHEffectBufferInfoSetTextureIdTest", OHEffectBufferInfoSetTextureIdTest),
    DESCRIPTOR("OHEffectBufferInfoGetTextureIdTest", OHEffectBufferInfoGetTextureIdTest),


};

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    size_t mergedLength =
        sizeof(desc1) / sizeof(desc1[0]) ;
    napi_property_descriptor mergedArray[mergedLength];
    for (size_t i = 0; i < sizeof(desc1) / sizeof(desc1[0]); ++i) {
        mergedArray[i] = desc1[i];
    }
    napi_define_properties(env, exports, mergedLength, mergedArray);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "imageEffect",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}