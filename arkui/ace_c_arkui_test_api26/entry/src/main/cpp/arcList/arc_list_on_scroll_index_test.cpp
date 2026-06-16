/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
#include <atomic>

namespace ArkUICapiTest {

static std::atomic<bool> g_onScrollIndexCalled(false);
static int32_t g_scrollIndex = PARAM_NEGATIVE_1;

static void OnScrollIndexHandler(ArkUI_NodeEvent* event)
{
    g_onScrollIndexCalled = true;
    auto result = OH_ArkUI_NodeEvent_GetNumberValue(event);
    if (result != nullptr) {
        g_scrollIndex = result[PARAM_0].i32;
    }
}

static napi_value TestArcListOnScrollIndex001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto ret = nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_SCROLL_INDEX, PARAM_1, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    nodeAPI->setNodeEventReceiver(arcList, OnScrollIndexHandler);
    g_onScrollIndexCalled = false;
    g_scrollIndex = PARAM_NEGATIVE_1;
    NAPI_END;
}

static napi_value TestArcListOnScrollIndex002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto ret = nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_SCROLL_INDEX, PARAM_1, nullptr);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value GetOnScrollIndexResult(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_object(env, &result);
    napi_value called, index;
    napi_create_boolean(env, g_onScrollIndexCalled.load(), &called);
    napi_create_int32(env, g_scrollIndex, &index);
    napi_set_named_property(env, result, "called", called);
    napi_set_named_property(env, result, "index", index);
    return result;
}

static napi_value ResetOnScrollIndexFlag(napi_env env, napi_callback_info info)
{
    g_onScrollIndexCalled = false;
    g_scrollIndex = PARAM_NEGATIVE_1;
    napi_value result;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

} // namespace ArkUICapiTest