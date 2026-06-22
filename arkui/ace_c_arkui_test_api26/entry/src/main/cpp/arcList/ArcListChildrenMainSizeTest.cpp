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

namespace ArkUICapiTest {

static auto SetArcChildrenMainSize(ArkUI_NodeHandle arcList, ArkUI_ListChildrenMainSize* object)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_AttributeItem item = {};
    item.object = object;
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_CHILDREN_MAIN_SIZE, &item);
    return ret;
}

static napi_value TestArcListChildrenMainSize001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize001",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = nullptr;
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize002",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Dispose(obj);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize003",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize004(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(obj, PARAM_10);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetDefaultMainSize(obj);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize004",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize004",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_10);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize005(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(obj, PARAM_NEGATIVE_1);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize005",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize006(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(obj, PARAM_0);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize006",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize007(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_Resize(obj, PARAM_10);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize007",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize008(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, PARAM_0, PARAM_0);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, PARAM_0);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize008",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize008",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(ret2, PARAM_0);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize009(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, PARAM_10, PARAM_10);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, PARAM_10);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize009",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize009",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize010(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, PARAM_NEGATIVE_1, PARAM_10);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, PARAM_NEGATIVE_1);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize010",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize010",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

static napi_value TestArcListChildrenMainSize011(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto obj = OH_ArkUI_ListChildrenMainSizeOption_Create();
    auto ret1 = OH_ArkUI_ListChildrenMainSizeOption_UpdateSize(obj, PARAM_10, PARAM_NEGATIVE_1);
    auto ret2 = OH_ArkUI_ListChildrenMainSizeOption_GetMainSize(obj, PARAM_10);
    auto ret = SetArcChildrenMainSize(arcList, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize011",
        "ret = %{public}d, obj = %{public}p", ret, obj);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListChildrenMainSize011",
        "ret1 = %{public}d, ret2 = %{public}f", ret1, ret2);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, INVALID_PARAM);
    ASSERT_EQ(ret2, PARAM_NEGATIVE_1);
    NAPI_END;
}

} // namespace ArkUICapiTest