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

#ifndef XTS_ARKUI_NATIVE_ELEM_IFACE_HEADER
#error XTS_ARKUI_NATIVE_ELEM_IFACE_HEADER must be defined by the build (see CMakeLists).
#endif
#include XTS_ARKUI_NATIVE_ELEM_IFACE_HEADER

namespace ArkUICapiTest {
namespace NativeElemTestBridge {

#define OH_A11Y_JOIN2(a, b) a##b
#define OH_A11Y_JOIN3(a, b, c) OH_A11Y_JOIN2(OH_A11Y_JOIN2(a, b), c)

#define OH_A11Y_FN_CREATE_ELEM OH_A11Y_JOIN3(OH_ArkUI_CreateAccess, ibility, ElementInfo)
#define OH_A11Y_FN_SET_ID OH_A11Y_JOIN3(OH_ArkUI_Access, ibility, ElementInfoSetComponentIdentifier)
#define OH_A11Y_FN_DESTROY_ELEM OH_A11Y_JOIN3(OH_ArkUI_DestoryAccess, ibility, ElementInfo)
#define OH_A11Y_ENUM_OK OH_A11Y_JOIN2(ARKUI_ACCESS, IBILITY_NATIVE_RESULT_SUCCESSFUL)

namespace {
using ElemPtr = decltype(OH_A11Y_FN_CREATE_ELEM());
} // namespace

void *CreateElem()
{
    return OH_A11Y_FN_CREATE_ELEM();
}

int32_t SetComponentId(void *elem, const char *componentId)
{
    return OH_A11Y_FN_SET_ID(static_cast<ElemPtr>(elem), componentId);
}

void DisposeElem(void *elem)
{
    OH_A11Y_FN_DESTROY_ELEM(static_cast<ElemPtr>(elem));
}

int32_t ExpectedSuccessCode()
{
    return OH_A11Y_ENUM_OK;
}

#undef OH_A11Y_ENUM_OK
#undef OH_A11Y_FN_DESTROY_ELEM
#undef OH_A11Y_FN_SET_ID
#undef OH_A11Y_FN_CREATE_ELEM
#undef OH_A11Y_JOIN3
#undef OH_A11Y_JOIN2

} // namespace NativeElemTestBridge
} // namespace ArkUICapiTest
