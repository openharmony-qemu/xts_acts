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
#include <arkui/ui_info_collection.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

namespace ArkUICapiTest {

static void OnImageCollection(ArkUI_ErrorCode errorCode,
    OH_ArkUI_NativeModule_ImageCollection* collection, void* userData)
{
    (void)errorCode;
    (void)collection;
    (void)userData;
}

static napi_value GetImagesByNodeIdAsyncTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto errorCode = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(context, nullptr, PARAM_5, nullptr, nullptr);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_CALLBACK_INVALID);
    NAPI_END;
}

static napi_value GetImagesByNodeIdAsyncTest002(napi_env env, napi_callback_info info)
{
    auto errorCode = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(nullptr, nullptr, PARAM_5, OnImageCollection, nullptr);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_UI_CONTEXT_INVALID);
    NAPI_END;
}

static napi_value GetImagesByNodeIdAsyncTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto errorCode = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(context, nullptr, 21, OnImageCollection, nullptr);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    NAPI_END;
}

static napi_value GetImagesByNodeIdAsyncTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto errorCode = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(context, nullptr, PARAM_20, OnImageCollection, nullptr);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value GetImagesByNodeIdAsyncTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto errorCode = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(context, nullptr, PARAM_0, OnImageCollection, nullptr);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    NAPI_END;
}

static napi_value GetImagesByNodeIdAsyncTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto errorCode =
        OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(context, nullptr, PARAM_NEGATIVE_1, OnImageCollection, nullptr);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_PARAM_OUT_OF_RANGE);
    NAPI_END;
}

static napi_value GetImagesByNodeIdAsyncTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    auto errorCode = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(context, nullptr, PARAM_1, OnImageCollection, nullptr);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value GetImagesByNodeIdAsyncTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto context = OH_ArkUI_GetContextByNode(column);
    ASSERT_EQ(context != nullptr, true);
    const int32_t* nodeIds = 0;
    void* userData = 0;
    auto errorCode = OH_ArkUI_NativeModule_GetImagesByNodeIdAsync(nullptr, nodeIds, PARAM_1, OnImageCollection, userData);
    ASSERT_EQ(errorCode, ARKUI_ERROR_CODE_UI_CONTEXT_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest
