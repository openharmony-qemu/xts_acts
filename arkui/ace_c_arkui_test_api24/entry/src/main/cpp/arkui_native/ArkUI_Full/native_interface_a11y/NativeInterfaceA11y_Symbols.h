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

#ifndef NATIVE_INTERFACE_A11Y_SYMBOLS_H
#define NATIVE_INTERFACE_A11Y_SYMBOLS_H

#include <arkui/native_interface_accessibility.h>

namespace ArkUICapiTest {
namespace NativeA11ySymbols {

using NativeElemHandle = decltype(OH_ArkUI_CreateAccessibilityElementInfo());

inline NativeElemHandle CreateNativeElem()
{
    return OH_ArkUI_CreateAccessibilityElementInfo();
}

inline int32_t SetNativeElemComponentId(NativeElemHandle elem, const char *id)
{
    return OH_ArkUI_AccessibilityElementInfoSetComponentIdentifier(elem, id);
}

inline void DisposeNativeElem(NativeElemHandle elem)
{
    OH_ArkUI_DestoryAccessibilityElementInfo(elem);
}

constexpr int32_t kNativeCallSucceeded = ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL;

} // namespace NativeA11ySymbols
} // namespace ArkUICapiTest

#endif // NATIVE_INTERFACE_A11Y_SYMBOLS_H
