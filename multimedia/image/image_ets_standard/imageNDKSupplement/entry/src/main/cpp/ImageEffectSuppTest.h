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

#ifndef OHIMAGEEFFECTNDK_IMAGEEFFECTSUPP_H
#define OHIMAGEEFFECTNDK_IMAGEEFFECTSUPP_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value savePixelMapForPath(napi_env env, napi_callback_info info);
napi_value creatOutPixeMapForPath(napi_env env, napi_callback_info info);
napi_value OHImageEffectCreateSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectAddFilterSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectInsertFilterSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectRemoveFilterSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectReplaceFilterSupp(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif