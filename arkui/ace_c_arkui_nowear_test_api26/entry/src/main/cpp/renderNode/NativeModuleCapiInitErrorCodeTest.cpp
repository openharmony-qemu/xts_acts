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
#include <arkui/native_node.h>
#include <arkui/native_render.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value TestGetChildMountPolicyInitError001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle uninitializedNode;
    OH_ArkUI_NodeMountPolicy policy;
    auto ret = OH_ArkUI_NativeModule_GetChildMountPolicy(uninitializedNode, &policy);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "NativeModuleCapiInitError", "TestGetChildMountPolicyInitError001 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    
    NAPI_END;
}

static napi_value TestGetRenderNodeChildrenCountInitError001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle uninitializedNode;
    int32_t count = 0;
    auto ret = OH_ArkUI_RenderNodeUtils_GetRenderNodeChildrenCount(uninitializedNode, &count);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "NativeModuleCapiInitError", "TestGetRenderNodeChildrenCountInitError001 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    
    NAPI_END;
}

static napi_value TestGetRenderNodeAtInitError001(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle uninitializedNode;
    ArkUI_RenderNodeHandle renderNode;
    auto ret = OH_ArkUI_RenderNodeUtils_GetRenderNodeAt(uninitializedNode, 0, &renderNode);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "NativeModuleCapiInitError", "TestGetRenderNodeAtInitError001 ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_CAPI_INIT_ERROR);
    
    NAPI_END;
}

}