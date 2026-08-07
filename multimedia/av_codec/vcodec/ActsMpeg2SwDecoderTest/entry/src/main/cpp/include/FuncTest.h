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

#ifndef ACTS_MPEG2_SW_DECODER_FUNC_TEST_H
#define ACTS_MPEG2_SW_DECODER_FUNC_TEST_H

#include "napi/native_api.h"

constexpr const char* MPEG2_INPUT_FILE_PATH =
    "/data/storage/el2/base/haps/entry_test/files/main@high_level_1920_1080_60.m2v";

napi_value VideoDecodeSyncSwMpeg2Func00100Test(napi_env env, napi_callback_info info);
napi_value VideoDecodeSyncSwMpeg2Func00200Test(napi_env env, napi_callback_info info);
napi_value VideoDecodeSyncSwMpeg2Func00400Test(napi_env env, napi_callback_info info);
napi_value VideoDecodeBlankFrame00100Test(napi_env env, napi_callback_info info);
napi_value VideoDecodeBlankAdd00100Test(napi_env env, napi_callback_info info);

extern void InitMpeg2Test();

#endif // ACTS_MPEG2_SW_DECODER_FUNC_TEST_H
