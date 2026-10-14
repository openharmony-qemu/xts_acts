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

#include "common/common.h"
#include <arkui/native_interface.h>
#include <arkui/native_type.h>

namespace ArkUICapiTest {

static napi_value RuntimeCheckModeTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_UI_THREAD, OH_ARKUI_NATIVEMODULE_CHECK_MODE_DISABLED);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_UI_THREAD, OH_ARKUI_NATIVEMODULE_CHECK_MODE_LOG);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_UI_THREAD, OH_ARKUI_NATIVEMODULE_CHECK_MODE_CRASH);
    OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_UI_THREAD, OH_ARKUI_NATIVEMODULE_CHECK_MODE_DISABLED);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_NODE_DISPOSED, OH_ARKUI_NATIVEMODULE_CHECK_MODE_DISABLED);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_NODE_DISPOSED, OH_ARKUI_NATIVEMODULE_CHECK_MODE_LOG);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_NODE_DISPOSED, OH_ARKUI_NATIVEMODULE_CHECK_MODE_CRASH);
    OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_NODE_DISPOSED, OH_ARKUI_NATIVEMODULE_CHECK_MODE_DISABLED);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto invalidCheckType = static_cast<OH_ArkUI_NativeModule_RuntimeCheckType>(PARAM_NEGATIVE_1);
    auto ret = OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        invalidCheckType, OH_ARKUI_NATIVEMODULE_CHECK_MODE_DISABLED);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto invalidMode = static_cast<OH_ArkUI_NativeModule_RuntimeCheckMode>(PARAM_NEGATIVE_1);
    auto ret = OH_ArkUI_NativeModule_SetRuntimeCheckMode(
        OH_ARKUI_NATIVEMODULE_CHECK_TYPE_UI_THREAD, invalidMode);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest009(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_CHECK_MODE_DISABLED, PARAM_0);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest010(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_CHECK_MODE_LOG, PARAM_1);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest011(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_CHECK_MODE_CRASH, PARAM_2);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest012(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_CHECK_TYPE_UI_THREAD, PARAM_0);
    NAPI_END;
}

static napi_value RuntimeCheckModeTest013(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ASSERT_EQ(OH_ARKUI_NATIVEMODULE_CHECK_TYPE_NODE_DISPOSED, PARAM_1);
    NAPI_END;
}

} // namespace ArkUICapiTest
