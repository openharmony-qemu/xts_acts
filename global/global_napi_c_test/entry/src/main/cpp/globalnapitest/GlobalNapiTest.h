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

#ifndef GLOBAL_NAPI_TEST_GLOBALNAPITEST_H
#define GLOBAL_NAPI_TEST_GLOBALNAPITEST_H
#include "napi/native_api.h"
#include "rawfile/raw_file_manager.h"
#include "rawfile/raw_file.h"
#include "rawfile/raw_dir.h"
#include "hilog/log.h"
#include <cstdint>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <vector>
#include <resourcemanager/ohresmgr.h>
#include <string>
#include <sstream>

namespace GlobalNapiTest {
const int SUBLEN = 100;
const int PARAMETER = 401;
const int NOT_FOUND = 9001001;

napi_value GetResourceManager(napi_env env, napi_callback_info info);
napi_value GetMediaBase640100(napi_env env, napi_callback_info info);
napi_value GetMediaBase640200(napi_env env, napi_callback_info info);
napi_value GetMediaBase640300(napi_env env, napi_callback_info info);
napi_value GetMediaBase64Data0100(napi_env env, napi_callback_info info);
napi_value GetMediaBase64Data0200(napi_env env, napi_callback_info info);
napi_value GetMediaBase64Data0300(napi_env env, napi_callback_info info);
}

#endif //GLOBAL_NAPI_TEST_GLOBALNAPITEST_H
