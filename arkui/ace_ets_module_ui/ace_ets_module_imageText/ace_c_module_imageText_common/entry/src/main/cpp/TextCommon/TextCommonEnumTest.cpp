/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value TextEnumTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_ON_TEXT_SELECTION_CHANGE TextEnumTest_001 result=%{public}d",
        NODE_TEXT_ON_TEXT_SELECTION_CHANGE);
    ASSERT_EQ(PARAM_1002, NODE_TEXT_ON_TEXT_SELECTION_CHANGE);
    NAPI_END;
}

static napi_value TextEnumTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_ON_COPY TextEnumTest_002 result=%{public}d",
        NODE_TEXT_ON_COPY);
    ASSERT_EQ(PARAM_1003, NODE_TEXT_ON_COPY);
    NAPI_END;
}

static napi_value TextEnumTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_ON_WILL_COPY TextEnumTest_003 result=%{public}d",
        NODE_TEXT_ON_WILL_COPY);
    ASSERT_EQ(PARAM_1004, NODE_TEXT_ON_WILL_COPY);
    NAPI_END;
}

static napi_value TextEnumTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION TextEnumTest_004 result=%{public}d",
        NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION);
    ASSERT_EQ(PARAM_1047, NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION);
    NAPI_END;
}

static napi_value TextEnumTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_CONTROLLER TextEnumTest_005 result=%{public}d",
        NODE_TEXT_CONTROLLER);
    ASSERT_EQ(PARAM_1054, NODE_TEXT_CONTROLLER);
    NAPI_END;
}

static napi_value TextEnumTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION TextEnumTest_006 result=%{public}d",
        NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION);
    ASSERT_EQ(PARAM_22028, NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION);
    NAPI_END;
}

static napi_value TextEnumTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING TextEnumTest_007 result=%{public}d",
        NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING);
    ASSERT_EQ(PARAM_22029, NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING);
    NAPI_END;
}

static napi_value TextEnumTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING TextEnumTest_008 result=%{public}d",
        OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING);
    ASSERT_EQ(PARAM_8, OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING);
    NAPI_END;
}
}