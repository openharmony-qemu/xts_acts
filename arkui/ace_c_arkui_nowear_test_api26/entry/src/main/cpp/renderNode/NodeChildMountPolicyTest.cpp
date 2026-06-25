/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include "../manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node.h>
#include <hilog/log.h>
 
namespace ArkUICapiTest {
 
// ========== OH_ArkUI_NativeModule_SetChildMountPolicy Tests ==========
 
static napi_value TestSetChildMountPolicy_001(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    OH_ArkUI_NodeMountPolicy policy = OH_ARKUI_NODE_MOUNT_POLICY_SINGLE_IF_RENDER_NODE;
    auto ret = OH_ArkUI_NativeModule_SetChildMountPolicy(node, policy);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestSetChildMountPolicy_001 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
 
static napi_value TestSetChildMountPolicy_002(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    OH_ArkUI_NodeMountPolicy policy = OH_ARKUI_NODE_MOUNT_POLICY_MIXED;
    auto ret = OH_ArkUI_NativeModule_SetChildMountPolicy(node, policy);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestSetChildMountPolicy_002 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
 
static napi_value TestSetChildMountPolicy_003(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NodeMountPolicy policy = OH_ARKUI_NODE_MOUNT_POLICY_MIXED;
    auto ret = OH_ArkUI_NativeModule_SetChildMountPolicy(nullptr, policy);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestSetChildMountPolicy_003 nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
 
static napi_value TestSetChildMountPolicy_004(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_SetChildMountPolicy(node, static_cast<OH_ArkUI_NodeMountPolicy>(3));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestSetChildMountPolicy_004 nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
 
// ========== OH_ArkUI_NativeModule_GetChildMountPolicy Tests ==========
 
static napi_value TestGetChildMountPolicy_001(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    OH_ArkUI_NodeMountPolicy setPolicy = OH_ARKUI_NODE_MOUNT_POLICY_SINGLE_IF_RENDER_NODE;
    auto ret1 = OH_ArkUI_NativeModule_SetChildMountPolicy(node, setPolicy);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    OH_ArkUI_NodeMountPolicy getPolicy = OH_ARKUI_NODE_MOUNT_POLICY_SINGLE_IF_RENDER_NODE;
    auto ret2 = OH_ArkUI_NativeModule_GetChildMountPolicy(node, &getPolicy);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetChildMountPolicy_001 ret=%{public}d, policy=%{public}d", ret2, getPolicy);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(getPolicy, OH_ARKUI_NODE_MOUNT_POLICY_SINGLE_IF_RENDER_NODE);
    NAPI_END;
}
 
static napi_value TestGetChildMountPolicy_002(napi_env env, napi_callback_info info)
{
    OH_ArkUI_NodeMountPolicy policy = OH_ARKUI_NODE_MOUNT_POLICY_SINGLE_IF_RENDER_NODE;
    auto ret = OH_ArkUI_NativeModule_GetChildMountPolicy(nullptr, &policy);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetChildMountPolicy_002 nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
 
static napi_value TestGetChildMountPolicy_003(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_NativeModule_GetChildMountPolicy(node, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetChildMountPolicy_003 nullptr param ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
 
static napi_value TestGetChildMountPolicy_004(napi_env env, napi_callback_info info)
{
    NAPI_START(node, ARKUI_NODE_CUSTOM);
    auto ret1 = OH_ArkUI_NativeModule_SetChildMountPolicy(node, OH_ARKUI_NODE_MOUNT_POLICY_MIXED);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "NodeChildMountPolicy", "TestGetChildMountPolicy_004 ret1=%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_NodeMountPolicy policy;
    auto ret2 = OH_ArkUI_NativeModule_GetChildMountPolicy(node, &policy);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "NodeChildMountPolicy", "TestGetChildMountPolicy_004 ret2=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(policy, OH_ARKUI_NODE_MOUNT_POLICY_MIXED);
    NAPI_END;
}
 
// ========== OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt Tests ==========
 
static napi_value TestInsertRenderNodeAt_001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, rsNodeRoot, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_001 ret2=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestInsertRenderNodeAt_002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto child = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(child != nullptr, true);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(nullptr, child, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_002 nullptr parent ret=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(child);
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestInsertRenderNodeAt_003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_003 nullptr child ret=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestInsertRenderNodeAt_004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto child = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(child != nullptr, true);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, child, -1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_004 negative index ret=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(child);
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestInsertRenderNodeAt_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto renderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto ret = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(Text, renderNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_005 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NOT_CUSTOM_NODE);
    
    NAPI_END;
}
 
static napi_value TestInsertRenderNodeAt_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    
    ArkUI_RenderNodeHandle parent = OH_ArkUI_RenderNodeUtils_CreateNode();
    ArkUI_RenderNodeHandle child = OH_ArkUI_RenderNodeUtils_CreateNode();
    OH_ArkUI_RenderNodeUtils_AddChild(parent, child);
    auto ret = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(Custom, child, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_006 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_RENDER_PARENT_EXISTED);
    
    NAPI_END;
}
 
static napi_value TestInsertRenderNodeAt_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
 
    ArkUI_NodeHandle node = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle host = nodeAPI->createNode(ARKUI_NODE_CUSTOM);
    ArkUI_NodeHandle adoptedNode = nodeAPI->createNode(ARKUI_NODE_TEXT);
    auto ret1 = OH_ArkUI_NativeModule_SetChildMountPolicy(node, OH_ARKUI_NODE_MOUNT_POLICY_MIXED);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_007 ret1=%{public}d", ret1);
    auto ret2 = OH_ArkUI_NativeModule_AdoptChild(host, adoptedNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_007 ret2=%{public}d", ret2);
    ArkUI_RenderNodeHandle adopted = nullptr;
    auto ret3 = OH_ArkUI_RenderNodeUtils_GetRenderNode(adoptedNode, &adopted);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_007 ret3=%{public}d", ret3);
    auto ret4 = OH_ArkUI_NativeModule_RemoveAdoptedChild(host, adoptedNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_007 ret4=%{public}d", ret4);
    auto ret5 = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(node, adopted, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_007 ret5=%{public}d", ret5);
    ASSERT_EQ(ret5, ARKUI_ERROR_CODE_RENDER_HAS_INVALID_FRAME_NODE);
    
    NAPI_END;
}
 
static napi_value TestInsertRenderNodeAt_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto renderNode = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto ret1 = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(Custom, renderNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_008 ret1=%{public}d", ret1);
    auto ret2 = OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(Custom, renderNode, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestInsertRenderNodeAt_008 ret2=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_CHILD_EXISTED);
    NAPI_END;
}
 
// ========== OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount Tests ==========
 
static napi_value TestGetRenderNodeChildrenCount_001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    OH_ArkUI_NativeModule_SetChildMountPolicy(custom, OH_ArkUI_NodeMountPolicy::OH_ARKUI_NODE_MOUNT_POLICY_MIXED);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto child1 = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto child2 = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(child1 != nullptr, true);
    ASSERT_EQ(child2 != nullptr, true);
    
    OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, child1, 0);
    OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, child2, 1);
    
    int32_t count = 0;
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount(custom, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeChildrenCount_001 ret=%{public}d, count=%{public}u", ret2, count);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(child1);
    OH_ArkUI_RenderNodeUtils_DisposeNode(child2);
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestGetRenderNodeChildrenCount_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    int32_t count = -1;
    auto ret1 = OH_ArkUI_NativeModule_SetChildMountPolicy(Custom, OH_ARKUI_NODE_MOUNT_POLICY_MIXED);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeChildrenCount_002 ret1=%{public}d", ret1);
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount(Custom, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeChildrenCount_002 ret2=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(count, 0);
    NAPI_END;
}
 
static napi_value TestGetRenderNodeChildrenCount_003(napi_env env, napi_callback_info info)
{
    int32_t count = 0;
    auto ret = OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount(nullptr, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeChildrenCount_003 nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
 
static napi_value TestGetRenderNodeChildrenCount_004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount(custom, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeChildrenCount_004 nullptr param ret=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
// ========== OH_ArkUI_RenderNodeUtils_GetRenderNodeAt Tests ==========
 
static napi_value TestGetRenderNodeAt_001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    OH_ArkUI_NativeModule_SetChildMountPolicy(custom, OH_ArkUI_NodeMountPolicy::OH_ARKUI_NODE_MOUNT_POLICY_MIXED);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto child1 = OH_ArkUI_RenderNodeUtils_CreateNode();
    auto child2 = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(child1 != nullptr, true);
    ASSERT_EQ(child2 != nullptr, true);
    
    OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, child1, 0);
    OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, child2, 1);
    
    ArkUI_RenderNodeHandle retrievedChild = nullptr;
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetRenderNodeAt(custom, 0, &retrievedChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeAt_001 ret=%{public}d, child=%{public}p", ret2, retrievedChild);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(child1);
    OH_ArkUI_RenderNodeUtils_DisposeNode(child2);
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestGetRenderNodeAt_002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    ArkUI_RenderNodeHandle retrievedChild = nullptr;
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetRenderNodeAt(nullptr, 0, &retrievedChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeAt_002 nullptr parent ret=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestGetRenderNodeAt_003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetRenderNodeAt(custom, 0, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeAt_003 nullptr param ret=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestGetRenderNodeAt_004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto child = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(child != nullptr, true);
    OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, child, 0);
    
    ArkUI_RenderNodeHandle retrievedChild = nullptr;
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetRenderNodeAt(custom, -1, &retrievedChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeAt_004 negative index ret=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(child);
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
static napi_value TestGetRenderNodeAt_005(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    auto rsNodeRoot = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(rsNodeRoot != nullptr, true);
    auto ret1 = OH_ArkUI_RenderNodeUtils_AddRenderNode(custom, rsNodeRoot);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    
    auto child = OH_ArkUI_RenderNodeUtils_CreateNode();
    ASSERT_EQ(child != nullptr, true);
    OH_ArkUI_RenderNodeUtils_InsertRenderNodeAt(custom, child, 0);
    
    ArkUI_RenderNodeHandle retrievedChild = nullptr;
    auto ret2 = OH_ArkUI_RenderNodeUtils_GetRenderNodeAt(custom, 100, &retrievedChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeAt_005 out of range ret=%{public}d", ret2);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);

    auto ret3 = OH_ArkUI_RenderNodeUtils_GetRenderNodeAt(custom, 10000000000, &retrievedChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeAt_005 out of range ret3=%{public}d", ret3);
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    auto ret4 = OH_ArkUI_RenderNodeUtils_GetRenderNodeAt(custom, 10000000001, &retrievedChild);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeChildMountPolicy",
        "TestGetRenderNodeAt_005 out of range ret4=%{public}d", ret4);
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    
    OH_ArkUI_RenderNodeUtils_DisposeNode(child);
    OH_ArkUI_RenderNodeUtils_DisposeNode(rsNodeRoot);
    NAPI_END;
}
 
}