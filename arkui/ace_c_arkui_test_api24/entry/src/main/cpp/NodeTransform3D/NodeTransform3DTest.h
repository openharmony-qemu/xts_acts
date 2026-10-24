/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef NODE_TRANSFORM_3D_TEST_H
#define NODE_TRANSFORM_3D_TEST_H

#include <napi/native_api.h>

namespace ArkUICapiTest {

napi_value NodeTransform3D_SetGet001(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_Reset002(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_InvalidSize003(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_NullParam004(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_IdentityMatrix005(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_RotationMatrix006(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_ScaleMatrix007(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_TranslationMatrix008(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_GetDefault009(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_UpdateMatrix010(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_ZeroMatrix011(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_NegativeValues012(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_PerpectiveMatrix013(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_DifferentNodeTypes014(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_LargeValues015(napi_env env, napi_callback_info info);
napi_value NodeTransform3D_AllElementsVerify016(napi_env env, napi_callback_info info);

} // namespace ArkUICapiTest

#endif // NODE_TRANSFORM_3D_TEST_H
