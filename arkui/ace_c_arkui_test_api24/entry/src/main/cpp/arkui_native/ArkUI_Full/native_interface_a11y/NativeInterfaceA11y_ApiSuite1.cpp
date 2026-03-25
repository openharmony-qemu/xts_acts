/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "../../../common/common.h"
#include <arkui/native_interface_accessibility.h>

namespace ArkUICapiTest {

/*
 * 测试接口: 元素信息 SetComponentIdentifier（见 arkui 对应 C 头声明）
 * 预期效果: 无障碍元素设置组件标识成功。
 * 实际测试: 创建元素信息对象，设置 identifier，断言 SUCCESS，再销毁。
 */
static napi_value TestArkUICapi_007(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto *a11yElem = OH_ArkUI_CreateAccessibilityElementInfo();
    if (((a11yElem)) == nullptr) {
        return nullptr;
    }

    auto rc = OH_ArkUI_AccessibilityElementInfoSetComponentIdentifier(a11yElem, "xts_capi");
    {
        napi_value __napi_assert_tmp = ::ArkUICapiTest::EqFailed(env, (rc), (ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL));
        if (__napi_assert_tmp != nullptr) {
            return __napi_assert_tmp;
        }
    }

    OH_ArkUI_DestoryAccessibilityElementInfo(a11yElem);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
