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

#ifndef PTS_API_TEST_H
#define PTS_API_TEST_H

#include "napi/native_api.h"

namespace OHOS {
namespace Media {

namespace PtsApiTest {
void SetUpTestCase(void);
void TearDown();
}

napi_value VIDEO_HW_ENCODE_PTS_FUNC_001(napi_env env, napi_callback_info info);
napi_value VIDEO_HW_ENCODE_PTS_FUNC_002(napi_env env, napi_callback_info info);
napi_value VIDEO_HW_ENCODE_PTS_FUNC_003(napi_env env, napi_callback_info info);
napi_value VIDEO_HW_ENCODE_PTS_FUNC_004(napi_env env, napi_callback_info info);
napi_value VIDEO_HW_ENCODE_PTS_FUNC_005(napi_env env, napi_callback_info info);
napi_value VIDEO_HW_ENCODE_PTS_FUNC_006(napi_env env, napi_callback_info info);

} // namespace Media
} // namespace OHOS

#endif //PTS_API_TEST_H
