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

#include "NativeInterfaceA11y_bridge.h"
#include <arkui/native_interface_accessibility.h>

namespace ArkUICapiTest {
namespace NativeElemTestBridge {

namespace {
using ElemPtr = decltype(OH_ArkUI_CreateAccessibilityElementInfo());
} // namespace

void *CreateElem()
{
    return OH_ArkUI_CreateAccessibilityElementInfo();
}

int32_t SetComponentId(void *elem, const char *componentId)
{
    return OH_ArkUI_AccessibilityElementInfoSetComponentIdentifier(static_cast<ElemPtr>(elem), componentId);
}

void DisposeElem(void *elem)
{
    OH_ArkUI_DestoryAccessibilityElementInfo(static_cast<ElemPtr>(elem));
}

int32_t ExpectedSuccessCode()
{
    return ARKUI_ACCESSIBILITY_NATIVE_RESULT_SUCCESSFUL;
}

} // namespace NativeElemTestBridge
} // namespace ArkUICapiTest
