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
#include "../common/common.h"
#include "../manager/PluginManagerTest.h"

#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>

#define PARAM_1002030 1002030

namespace ArkUICapiTest {

static napi_value ScrollStateTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ScrollStateTest_001 result=%{public}d", NODE_SCROLL_STATE);
    ASSERT_EQ(NODE_SCROLL_STATE, PARAM_1002030);
    NAPI_END;
}

static napi_value ScrollStateTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);

    auto item = nodeAPI->getAttribute(scroll, NODE_SCROLL_STATE);
    ASSERT_EQ(item != nullptr, true);
    ASSERT_EQ(item->value[PARAM_0].i32, ARKUI_SCROLL_STATE_IDLE);
    NAPI_END;
}

static napi_value ScrollStateTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ScrollStateTest_003 idle=%{public}d scroll=%{public}d fling=%{public}d", ARKUI_SCROLL_STATE_IDLE,
        ARKUI_SCROLL_STATE_SCROLL, ARKUI_SCROLL_STATE_FLING);
    ASSERT_EQ(ARKUI_SCROLL_STATE_IDLE, PARAM_0);
    ASSERT_EQ(ARKUI_SCROLL_STATE_SCROLL, PARAM_1);
    ASSERT_EQ(ARKUI_SCROLL_STATE_FLING, PARAM_2);
    NAPI_END;
}
}
