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
#include <arkui/native_node.h>
#include <arkui/native_interface_accessibility.h>
#include <climits>
#include <cstdint>

namespace ArkUICapiTest {

static napi_value BindExportTreeTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value BindExportTreeTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value BindExportTreeTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(owner1, ARKUI_NODE_COLUMN);
    auto owner2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(owner2 != nullptr, true);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner1, PARAM_1, exportedRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_BindExportTree(owner2, PARAM_2, exportedRoot);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value BindExportTreeTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot1 != nullptr, true);
    auto exportedRoot2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot2 != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_2, exportedRoot2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value BindExportTreeTest005(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_0, exportedRoot);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value BindExportTreeTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret = OH_ArkUI_Accessibility_BindExportTree(nullptr, PARAM_1, exportedRoot);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value BindExportTreeTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value BindExportTreeTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret = OH_ArkUI_Accessibility_BindExportTree(owner, INT64_MAX, exportedRoot);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value BindExportTreeTest009(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_NEGATIVE_1, exportedRoot);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value BindExportTreeTest010(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret = OH_ArkUI_Accessibility_BindExportTree(nullptr, PARAM_1, nullptr);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UnbindExportTreeTest001(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_1);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnbindExportTreeTest002(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnbindExportTreeTest003(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_1);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_1);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnbindExportTreeTest004(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_1);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnbindExportTreeTest005(napi_env env, napi_callback_info info)
{
    auto ret = OH_ArkUI_Accessibility_UnbindExportTree(nullptr, PARAM_1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value UnbindExportTreeTest006(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot1 != nullptr, true);
    auto exportedRoot2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot2 != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_2, exportedRoot2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_1);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_2);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnbindExportTreeTest007(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_0, exportedRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_0);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnbindExportTreeTest008(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_Accessibility_UnbindExportTree(owner, INT64_MAX);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnbindExportTreeTest009(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto ret = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_NEGATIVE_1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value UnbindExportTreeTest010(napi_env env, napi_callback_info info)
{
    NAPI_START(owner, ARKUI_NODE_COLUMN);
    auto exportedRoot = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ASSERT_EQ(exportedRoot != nullptr, true);
    auto ret1 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret2 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_1);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret3 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret4 = OH_ArkUI_Accessibility_UnbindExportTree(owner, PARAM_1);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_NO_ERROR);
    auto ret5 = OH_ArkUI_Accessibility_BindExportTree(owner, PARAM_1, exportedRoot);
    ASSERT_EQ(ret5, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

} // namespace ArkUICapiTest
