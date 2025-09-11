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

namespace ArkUICapiTest {

static napi_value TestInvalidateAttributes(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto ret1 =OH_ArkUI_NativeModule_InvalidateAttributes(column);
    auto ret2 =OH_ArkUI_NativeModule_InvalidateAttributes(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_NativeModule_InvalidateAttributes ret1=%{public}d", ret1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "kkk OH_ArkUI_NativeModule_InvalidateAttributes ret2=%{public}d", ret2);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

} // namespace ArkUICapiTest