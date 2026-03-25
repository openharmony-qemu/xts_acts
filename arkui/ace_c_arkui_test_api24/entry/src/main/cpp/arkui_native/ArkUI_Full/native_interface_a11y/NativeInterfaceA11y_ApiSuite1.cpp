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
#include "NativeInterfaceA11y_Symbols.h"

namespace ArkUICapiTest {

/*
 * 测试接口: 组件信息对象上设置组件标识（C API，声明见配套头 NativeInterfaceA11y_Symbols.h）。
 * 预期效果: 设置组件标识字符串成功。
 * 实际测试: 创建元素句柄，写入标识，断言成功码一致，再释放。
 */
static napi_value TestArkUICapi_007(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    auto elem = NativeA11ySymbols::CreateNativeElem();
    if (((elem)) == nullptr) {
        return nullptr;
    }

    auto rc = NativeA11ySymbols::SetNativeElemComponentId(elem, "xts_capi");
    {
        napi_value napiAssertErr =
            ::ArkUICapiTest::EqFailed(env, (rc), (NativeA11ySymbols::kNativeCallSucceeded));
        if (napiAssertErr != nullptr) {
            NativeA11ySymbols::DisposeNativeElem(elem);
            return napiAssertErr;
        }
    }

    NativeA11ySymbols::DisposeNativeElem(elem);
    return ::ArkUICapiTest::NapiReturnSuccessInt32(env);
}

} // namespace ArkUICapiTest
