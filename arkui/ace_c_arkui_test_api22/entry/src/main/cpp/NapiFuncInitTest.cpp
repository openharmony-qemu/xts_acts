/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "common/common.h"
#include "swiper/NodeSwiperItemFillpolocyTest.cpp"
#include "image/ImageDrawableErrorTest.cpp"
#include "drag/DragReturnNullTest.cpp"
#include "InteractiveFramework/NativeGestureBooleanTest.cpp"
#include "InteractiveFramework/UiInputEventBooleanTest.cpp"
#include "InteractiveFramework/NativeNodeExtentedBooleanTest.cpp"
#include "InteractiveFramework/LongPressGestureTest.h"
#include "grid/GridAttrsTest.h"
#include "Text/TextMenuItemIdTest.cpp"
#include "swiper/SwiperParamTest.cpp"
#include "image/EnumTest.cpp"
#include "Text/EnumTest.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"testNodeSwiperItemFillpolocy001", nullptr, NodeSwiperItemFillpolocyTest, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"testImageDrawable001", nullptr, TestImageDrawable001, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testImageDrawable002", nullptr, TestImageDrawable002, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testImageDrawable003", nullptr, TestImageDrawable003, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"testImageDrawable004", nullptr, TestImageDrawable004, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"Nullptr_OH_ArkUI_CreateDragActionWithContext", nullptr, Nullptr_OH_ArkUI_CreateDragActionWithContext, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_GestureInterruptInfo_GetGestureEvent", nullptr, Nullptr_OH_ArkUI_GestureInterruptInfo_GetGestureEvent, nullptr, nullptr,
         nullptr, napi_default, nullptr},        
        {"Nullptr_OH_ArkUI_CreateDragActionWithNode", nullptr, Nullptr_OH_ArkUI_CreateDragActionWithNode, nullptr, nullptr,
         nullptr, napi_default, nullptr},        
        {"Nullptr_OH_ArkUI_GestureInterruptInfo_GetRecognizer", nullptr, Nullptr_OH_ArkUI_GestureInterruptInfo_GetRecognizer, nullptr, nullptr,
         nullptr, napi_default, nullptr},        
        {"Nullptr_OH_ArkUI_GestureEvent_GetRawInputEvent", nullptr, Nullptr_OH_ArkUI_GestureEvent_GetRawInputEvent, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_TouchRecognizer_GetNodeHandle", nullptr, Nullptr_OH_ArkUI_TouchRecognizer_GetNodeHandle, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_GestureInterrupter_GetUserData", nullptr, Nullptr_OH_ArkUI_GestureInterrupter_GetUserData, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_NodeEvent_GetNodeHandle", nullptr, Nullptr_OH_ArkUI_GestureInterrupter_GetUserData, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_NodeEvent_GetInputEvent", nullptr, Nullptr_OH_ArkUI_NodeEvent_GetInputEvent, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_NodeEvent_GetNodeComponentEvent", nullptr, Nullptr_OH_ArkUI_NodeEvent_GetNodeComponentEvent, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_NodeEvent_GetStringAsyncEvent", nullptr, Nullptr_OH_ArkUI_NodeEvent_GetStringAsyncEvent, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_NodeEvent_GetUserData", nullptr, Nullptr_OH_ArkUI_NodeEvent_GetUserData, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_CreateSnapshotOptions", nullptr, Nullptr_OH_ArkUI_CreateSnapshotOptions, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_VisibleAreaEventOptions_Create", nullptr, Nullptr_OH_ArkUI_VisibleAreaEventOptions_Create, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_UIInputEvent_GetCoastingAxisEvent", nullptr, Nullptr_OH_ArkUI_UIInputEvent_GetCoastingAxisEvent, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_CreateDragPreviewOption", nullptr, Nullptr_OH_ArkUI_CreateDragPreviewOption, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetUserData", nullptr, Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetUserData, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer", nullptr, Nullptr_OH_ArkUI_ParallelInnerGestureEvent_GetCurrentRecognizer, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"False_OH_ArkUI_GestureInterruptInfo_GetSystemFlag", nullptr, False_OH_ArkUI_GestureInterruptInfo_GetSystemFlag, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"True_OH_ArkUI_GestureInterruptInfo_GetSystemFlag", nullptr, True_OH_ArkUI_GestureInterruptInfo_GetSystemFlag, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"True_OH_ArkUI_GetGestureRecognizerEnabled", nullptr, True_OH_ArkUI_GetGestureRecognizerEnabled, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"False_OH_ArkUI_GetGestureRecognizerEnabled", nullptr, False_OH_ArkUI_GetGestureRecognizerEnabled, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"True_OH_ArkUI_IsBuiltInGesture", nullptr, True_OH_ArkUI_IsBuiltInGesture, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"False_OH_ArkUI_IsBuiltInGesture", nullptr, False_OH_ArkUI_IsBuiltInGesture, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"True_OH_ArkUI_IsGestureRecognizerValid", nullptr, True_OH_ArkUI_IsGestureRecognizerValid, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"False_OH_ArkUI_IsGestureRecognizerValid", nullptr, False_OH_ArkUI_IsGestureRecognizerValid, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"True_OH_ArkUI_HoverEvent_IsHovered", nullptr, True_OH_ArkUI_HoverEvent_IsHovered, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"True_OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport", nullptr, True_OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"False_OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport", nullptr, False_OH_ArkUI_VisibleAreaEventOptions_GetMeasureFromViewport, nullptr, nullptr,
         nullptr, napi_default, nullptr},
         {"SetAllowableMovement", nullptr, LongPressGestureTest::SetAllowableMovement, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"SetAllowableMovement_Invalid", nullptr, LongPressGestureTest::SetAllowableMovement_Invalid, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"SetAllowableMovement_notSup", nullptr, LongPressGestureTest::SetAllowableMovement_notSup, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"GetAllowableMovement_Invalid", nullptr, LongPressGestureTest::GetAllowableMovement_Invalid, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"GetAllowableMovement", nullptr, LongPressGestureTest::GetAllowableMovement, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"SetMeasureFromViewport", nullptr, LongPressGestureTest::SetMeasureFromViewport, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"SetMeasureFromViewport_Invalid", nullptr, LongPressGestureTest::SetMeasureFromViewport_Invalid, nullptr, nullptr, nullptr,
            napi_default, nullptr},         
        {"testGridItemAlignment001", nullptr, TestGridItemAlignment001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridItemAlignment002", nullptr, TestGridItemAlignment002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridItemAlignment003", nullptr, TestGridItemAlignment003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridItemStyle001", nullptr, TestGridItemStyle001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridItemStyle002", nullptr, TestGridItemStyle002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridItemStyle003", nullptr, TestGridItemStyle003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridLayoutOptions001", nullptr, TestGridLayoutOptions001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridLayoutOptions002", nullptr, TestGridLayoutOptions002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridLayoutOptions003", nullptr, TestGridLayoutOptions003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testGridLayoutOptions004", nullptr, TestGridLayoutOptions004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TestRegisterGetRectByIndexCallback001", nullptr, TestRegisterGetRectByIndexCallback001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestRegisterGetIrregularSizeByIndexCallback001", nullptr, TestRegisterGetIrregularSizeByIndexCallback001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TextMenuItemId_001", nullptr, TextMenuItemId_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextMenuItemId_002", nullptr, TextMenuItemId_002, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_003", nullptr, TextMenuItemId_003, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_004", nullptr, TextMenuItemId_004, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_005", nullptr, TextMenuItemId_005, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_006", nullptr, TextMenuItemId_006, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_007", nullptr, TextMenuItemId_007, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_008", nullptr, TextMenuItemId_008, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_009", nullptr, TextMenuItemId_009, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_010", nullptr, TextMenuItemId_010, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_011", nullptr, TextMenuItemId_011, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextMenuItemId_012", nullptr, TextMenuItemId_012, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_013", nullptr, TextMenuItemId_013, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_014", nullptr, TextMenuItemId_014, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_015", nullptr, TextMenuItemId_015, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_016", nullptr, TextMenuItemId_016, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_017", nullptr, TextMenuItemId_017, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_018", nullptr, TextMenuItemId_018, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_019", nullptr, TextMenuItemId_019, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_020", nullptr, TextMenuItemId_020, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_021", nullptr, TextMenuItemId_021, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"TextMenuItemId_022", nullptr, TextMenuItemId_022, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_023", nullptr, TextMenuItemId_023, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_024", nullptr, TextMenuItemId_024, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_025", nullptr, TextMenuItemId_025, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_026", nullptr, TextMenuItemId_026, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_027", nullptr, TextMenuItemId_027, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_028", nullptr, TextMenuItemId_028, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_029", nullptr, TextMenuItemId_029, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_030", nullptr, TextMenuItemId_030, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_031", nullptr, TextMenuItemId_031, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_032", nullptr, TextMenuItemId_032, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_033", nullptr, TextMenuItemId_033, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"TextMenuItemId_034", nullptr, TextMenuItemId_034, nullptr, nullptr, nullptr,
        napi_default, nullptr},
        {"testSwiperParam001", nullptr, SwiperParamTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testSwiperParam002", nullptr, SwiperFontWeightEnumeratedTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testSwiperParam003", nullptr, SwiperSelectedFontEnumeratedTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testSwiperParam004", nullptr, SetMaxDisplayCountParamTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"testSwiperParam005", nullptr, SetShowBackgroundTest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"enum_GetEventType_Image", nullptr, Enum_Image_OH_ArkUI_NodeEvent_GetEventType, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"enum_GetEventType_Text", nullptr, Enum_Text_OH_ArkUI_NodeEvent_GetEventType, nullptr, nullptr, nullptr,
         napi_default, nullptr},
    };
    if (napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "napi_define_properties failed");
        return nullptr;
    }
    return exports;
}
EXTERN_C_END

static napi_module nativefuncModule = {.nm_version = 1,
                                       .nm_flags = 0,
                                       .nm_filename = nullptr,
                                       .nm_register_func = Init,
                                       .nm_modname = "nativefunc",
                                       .nm_priv = ((void *)0),
                                       .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&nativefuncModule); }
} // namespace ArkUICapiTest