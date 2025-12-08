/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_interface.h>
#include <arkui/native_interface_accessibility.h>
#include <ace/xcomponent/native_interface_xcomponent.h>

namespace ArkUICapiTest {

static napi_value AccessibilityProviderCreateTest(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_AccessibilityProvider* provider = OH_ArkUI_AccessibilityProvider_Create(nullptr);
    ASSERT_OBJ(provider, nullptr);
    NAPI_END;
} 

static napi_value EmbeddedComponentOptionTest(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto ec_option = OH_ArkUI_EmbeddedComponentOption_Create();
    ASSERT_OBJ_NE(ec_option, nullptr);
    NAPI_END;
}
    
static napi_value AccessibilityValueCreateTest(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto ret = OH_ArkUI_AccessibilityValue_Create();
    ASSERT_OBJ_NE(ret, nullptr);
    NAPI_END;
}

static napi_value AccessibilityStateCreateTest(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    auto statePrt = OH_ArkUI_AccessibilityState_Create();
    ASSERT_OBJ_NE(statePrt, nullptr);
    NAPI_END;
}

static napi_value CreateAccessibilityEventInfoTest(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_AccessibilityEventInfo *eventInfo = OH_ArkUI_CreateAccessibilityEventInfo();
    ASSERT_OBJ_NE(eventInfo, nullptr);
    NAPI_END;
}

static napi_value CreateAccessibilityElementInfoTest(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    ArkUI_AccessibilityElementInfo* elementInfo = OH_ArkUI_CreateAccessibilityElementInfo();
    ASSERT_OBJ_NE(elementInfo, nullptr);
    NAPI_END;
}

} // namespace ArkUICapiTest