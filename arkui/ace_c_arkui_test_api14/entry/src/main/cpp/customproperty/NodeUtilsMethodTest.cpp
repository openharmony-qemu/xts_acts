/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "../manager/plugin_manager.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>

namespace ArkUICapiTest {

static napi_value TestMethodReturnValue001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(nullptr);
    ASSERT_OBJ(pageNode, nullptr);
    bool ret1 = OH_ArkUI_NodeUtils_IsCreatedByNDK(column);
    ASSERT_EQ(ret1, true);
    bool ret2 = OH_ArkUI_NodeUtils_IsCreatedByNDK(nullptr);
    ASSERT_EQ(ret2, false);
    NAPI_END;
}

} // namespace ArkUICapiTest