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
#ifndef FUNCTEST_H
#define FUNCTEST_H
#include <string>
#include <multimedia/player_framework/native_avcapability.h>
#include <napi/native_api.h>

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len);

void OHPrintf(const char* fmt, ...);

namespace OHOS {
namespace Media {

class HevcSwdecFuncNdkTest {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
    void Release();
    int32_t Stop();

public:
    static const char* const INP_DIR_1080_30;
};
} // namespace Media
} // namespace OHOS

typedef struct OH_AVCapability OH_AVCapability;

extern OH_AVCapability *g_capHevc;
extern std::string g_codecNameHevc;

napi_value VideoDecodeSyncSs265Func0010Test(napi_env env, napi_callback_info info);
napi_value VideoDecodeSyncSs265Func0020Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265BlankFrame0010Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0010Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0020Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0030Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0040Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0050Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0060Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0070Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0080Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265Speed0090Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265SurfExpired0010Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265SetMaxInputSize0010Test(napi_env env, napi_callback_info info);
napi_value VideoSwdecH265GetCropSize0010Test(napi_env env, napi_callback_info info);
#endif //FUNCTEST_H
