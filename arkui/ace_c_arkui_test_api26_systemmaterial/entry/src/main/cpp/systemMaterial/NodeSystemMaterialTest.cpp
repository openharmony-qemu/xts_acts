/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "systemMaterial/MaterialHelpers.h"
#include "systemMaterial/MaterialTestDecl.h"

namespace ArkUICapiTest {

napi_value TestNodeSystemMaterialAttrId001(napi_env env, napi_callback_info info)
{
    (void)info;
    constexpr ArkUI_NodeAttributeType kExpectedAttrId = NODE_SYSTEM_MATERIAL;
    ASSERT_EQ(NODE_SYSTEM_MATERIAL, kExpectedAttrId);
    NAPI_END;
}

napi_value TestNodeSetSystemMaterial001(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!OH_ArkUI_NativeModule_GetSystemMaterialSupported()) {
        NAPI_END;
    }
    auto *nodeAPI = GetNodeApi();
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto handle = CreateMaterial(ARKUI_IMMERSIVE_STYLE_REGULAR);
    ASSERT_NOTNULL(handle);
    ArkUI_AttributeItem item = {.object = handle};
    auto ret = nodeAPI->setAttribute(column, NODE_SYSTEM_MATERIAL, &item);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR &&
        ret != ARKUI_ERROR_CODE_ATTRIBUTE_OR_EVENT_NOT_SUPPORTED) {
        ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    }
    DestroyMaterial(handle);
    NAPI_END;
}

} // namespace ArkUICapiTest
