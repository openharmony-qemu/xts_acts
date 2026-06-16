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

namespace ArkUICapiTest {

static napi_value TestArcScrollBarBindScrollableSet001(napi_env env, napi_callback_info info)
{
    NAPI_START(scrollBar, ARKUI_NODE_SCROLL_BAR);
    auto scrollable = nodeAPI->createNode(ARKUI_NODE_ARC_LIST);
    ArkUI_AttributeItem item = {.object = scrollable};
    auto ret = nodeAPI->setAttribute(scrollBar, NODE_ARC_SCROLL_BAR_BIND_SCROLLABLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcScrollBarBindScrollableSet002(napi_env env, napi_callback_info info)
{
    NAPI_START(scrollBar, ARKUI_NODE_SCROLL_BAR);
    auto scrollable = nodeAPI->createNode(ARKUI_NODE_SCROLL);
    ArkUI_AttributeItem item = {.object = scrollable};
    auto ret = nodeAPI->setAttribute(scrollBar, NODE_ARC_SCROLL_BAR_BIND_SCROLLABLE, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcScrollBarBindScrollableGet001(napi_env env, napi_callback_info info)
{
    NAPI_START(scrollBar, ARKUI_NODE_SCROLL_BAR);
    auto scrollable = nodeAPI->createNode(ARKUI_NODE_ARC_LIST);
    ArkUI_AttributeItem item = {.object = scrollable};
    nodeAPI->setAttribute(scrollBar, NODE_ARC_SCROLL_BAR_BIND_SCROLLABLE, &item);
    auto result = nodeAPI->getAttribute(scrollBar, NODE_ARC_SCROLL_BAR_BIND_SCROLLABLE);
    ASSERT_NE(result, nullptr);
    NAPI_END;
}

static napi_value TestArcScrollBarBindScrollableGet002(napi_env env, napi_callback_info info)
{
    NAPI_START(scrollBar, ARKUI_NODE_SCROLL_BAR);
    auto result = nodeAPI->getAttribute(scrollBar, NODE_ARC_SCROLL_BAR_BIND_SCROLLABLE);
    ASSERT_EQ(result, nullptr);
    NAPI_END;
}

} // namespace ArkUICapiTest