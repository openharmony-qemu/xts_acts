/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "onAreaChange/AreaChangeErrorCodeTest.cpp"
#include "gestureIntercept/GestureErrorCodeTest.cpp"
#include "scroll/scrollWithMouseTest.cpp"
#include "scroll/autoAdjustMarginTest.cpp"
#include "scroll/scrollBarHeightTest.cpp"
#include "list/listBackBehaviorTest.cpp"
#include "list/listEnableEditModeTest.cpp"
#include "list/listEditModeOptionsTest.cpp"
#include "grid/gridEnableEditModeTest.cpp"
#include "grid/gridEditModeOptionsTest.cpp"
#include "inspectorLabel/InspectorLabelTest.cpp"
#include "accessibilityFocusId/AccessibilityFocusIdTest.cpp"
#include "hovered/HoveredTest.cpp"
#include "arcList/ArcListDigitalCrownSensitivityTest.cpp"
#include "arcList/ArcListSpaceTest.cpp"
#include "arcList/ArcListCachedCountTest.cpp"
#include "arcList/ArcListScrollToIndexTest.cpp"
#include "arcList/ArcListChainAnimationTest.cpp"
#include "arcList/ArcListChildrenMainSizeTest.cpp"
#include "arcList/ArcListSetHeaderTest.cpp"
#include "arcList/ArcListScrollBarTest.cpp"
#include "arcList/ArcListScrollBarColorTest.cpp"
#include "arcList/ArcListScrollBarWidthTest.cpp"
#include "arcList/ArcListEnableScrollInteractionTest.cpp"
#include "arcList/ArcListFadingEdgeTest.cpp"
#include "arcList/ArcListFrictionTest.cpp"
#include "arcList/ArcListFlingSpeedLimitTest.cpp"
#include "arcList/ArcListItemAutoScaleTest.cpp"
#include "arcList/ArcListItemSwipeActionTest.cpp"
#include "arcList/ArcScrollBarBindScrollableTest.cpp"
#include "arcList/ArcScrollBarDisplayModeTest.cpp"

namespace ArkUICapiTest {
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Init", "env or exports is null");
        return nullptr;
    }

    napi_property_descriptor desc[] = {
        {"AreaChangeErrorCode001", nullptr, AreaChangeErrorCode001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AreaChangeErrorCode002", nullptr, AreaChangeErrorCode002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptErrorCode001", nullptr, GestureInterceptErrorCode001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptErrorCode002", nullptr, GestureInterceptErrorCode002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptErrorCode003", nullptr, GestureInterceptErrorCode003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptErrorCode004", nullptr, GestureInterceptErrorCode004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GestureInterceptNullTest001", nullptr, GestureInterceptNullTest001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ScrollWithMouseTest_001", nullptr, ScrollWithMouseTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollWithMouseTest_002", nullptr, ScrollWithMouseTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollWithMouseTest_003", nullptr, ScrollWithMouseTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollWithMouseTest_004", nullptr, ScrollWithMouseTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AutoAdjustMarginTest_001", nullptr, AutoAdjustMarginTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AutoAdjustMarginTest_002", nullptr, AutoAdjustMarginTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AutoAdjustMarginTest_003", nullptr, AutoAdjustMarginTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AutoAdjustMarginTest_004", nullptr, AutoAdjustMarginTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollBarHeightTest_001", nullptr, ScrollBarHeightTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollBarHeightTest_002", nullptr, ScrollBarHeightTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollBarHeightTest_003", nullptr, ScrollBarHeightTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollBarHeightTest_004", nullptr, ScrollBarHeightTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ScrollAlignmentStartTest_001", nullptr, ScrollAlignmentStartTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListBackBehaviorTest_001", nullptr, ListBackBehaviorTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListBackBehaviorTest_002", nullptr, ListBackBehaviorTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListBackBehaviorTest_003", nullptr, ListBackBehaviorTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListBackBehaviorTest_004", nullptr, ListBackBehaviorTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEnableEditModeTest_001", nullptr, ListEnableEditModeTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEnableEditModeTest_002", nullptr, ListEnableEditModeTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEnableEditModeTest_003", nullptr, ListEnableEditModeTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEnableEditModeTest_004", nullptr, ListEnableEditModeTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEditModeOptionsTest_001", nullptr, ListEditModeOptionsTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEditModeOptionsTest_002", nullptr, ListEditModeOptionsTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEditModeOptionsTest_003", nullptr, ListEditModeOptionsTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEditModeOptionsTest_004", nullptr, ListEditModeOptionsTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListEditModeChangeTest_001", nullptr, ListEditModeChangeTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListItemSelectTest_001", nullptr, ListItemSelectTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEnableEditModeTest_001", nullptr, GridEnableEditModeTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEnableEditModeTest_002", nullptr, GridEnableEditModeTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEnableEditModeTest_003", nullptr, GridEnableEditModeTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEnableEditModeTest_004", nullptr, GridEnableEditModeTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEditModeOptionsTest_001", nullptr, GridEditModeOptionsTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEditModeOptionsTest_002", nullptr, GridEditModeOptionsTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEditModeOptionsTest_003", nullptr, GridEditModeOptionsTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEditModeOptionsTest_004", nullptr, GridEditModeOptionsTest_004, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"GridEditModeChangeTest_001", nullptr, GridEditModeChangeTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InspectorLabelTest_001", nullptr, InspectorLabelTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InspectorLabelTest_002", nullptr, InspectorLabelTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InspectorLabelTest_003", nullptr, InspectorLabelTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AccessibilityNextFocusIdTest_001", nullptr, AccessibilityNextFocusIdTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AccessibilityNextFocusIdTest_002", nullptr, AccessibilityNextFocusIdTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AccessibilityDefaultFocusTest_001", nullptr, AccessibilityDefaultFocusTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AccessibilityDefaultFocusTest_002", nullptr, AccessibilityDefaultFocusTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Hovered_UI_STATE_HOVERED", nullptr, Hovered_UI_STATE_HOVERED, nullptr, nullptr, nullptr,
         napi_default, nullptr},

        {"testArcListCachedCount001", nullptr, TestArcListCachedCount001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListCachedCount002", nullptr, TestArcListCachedCount002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListCachedCount003", nullptr, TestArcListCachedCount003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListCachedCount004", nullptr, TestArcListCachedCount004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListCachedCount005", nullptr, TestArcListCachedCount005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChainAnimation001", nullptr, TestArcListChainAnimation001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChainAnimation002", nullptr, TestArcListChainAnimation002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChainAnimation003", nullptr, TestArcListChainAnimation003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize001", nullptr, TestArcListChildrenMainSize001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize002", nullptr, TestArcListChildrenMainSize002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize003", nullptr, TestArcListChildrenMainSize003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize004", nullptr, TestArcListChildrenMainSize004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize005", nullptr, TestArcListChildrenMainSize005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize006", nullptr, TestArcListChildrenMainSize006, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize007", nullptr, TestArcListChildrenMainSize007, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize008", nullptr, TestArcListChildrenMainSize008, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize009", nullptr, TestArcListChildrenMainSize009, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize010", nullptr, TestArcListChildrenMainSize010, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSize011", nullptr, TestArcListChildrenMainSize011, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListDigitalCrownSensitivity001", nullptr, TestArcListDigitalCrownSensitivity001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListDigitalCrownSensitivity002", nullptr, TestArcListDigitalCrownSensitivity002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListDigitalCrownSensitivity003", nullptr, TestArcListDigitalCrownSensitivity003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListDigitalCrownSensitivity004", nullptr, TestArcListDigitalCrownSensitivity004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListEnableScrollInteraction001", nullptr, TestArcListEnableScrollInteraction001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListEnableScrollInteraction002", nullptr, TestArcListEnableScrollInteraction002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListEnableScrollInteraction003", nullptr, TestArcListEnableScrollInteraction003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFadingEdge001", nullptr, TestArcListFadingEdge001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFadingEdge002", nullptr, TestArcListFadingEdge002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFadingEdge003", nullptr, TestArcListFadingEdge003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFlingSpeedLimit001", nullptr, TestArcListFlingSpeedLimit001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFlingSpeedLimit002", nullptr, TestArcListFlingSpeedLimit002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFlingSpeedLimit003", nullptr, TestArcListFlingSpeedLimit003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFlingSpeedLimit004", nullptr, TestArcListFlingSpeedLimit004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFriction001", nullptr, TestArcListFriction001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFriction002", nullptr, TestArcListFriction002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFriction003", nullptr, TestArcListFriction003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFriction004", nullptr, TestArcListFriction004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemAutoScale001", nullptr, TestArcListItemAutoScale001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemAutoScale002", nullptr, TestArcListItemAutoScale002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemAutoScale003", nullptr, TestArcListItemAutoScale003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemSwipeAction001", nullptr, TestArcListItemSwipeAction001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemSwipeAction002", nullptr, TestArcListItemSwipeAction002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemSwipeAction003", nullptr, TestArcListItemSwipeAction003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemSwipeAction004", nullptr, TestArcListItemSwipeAction004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBar001", nullptr, TestArcListScrollBar001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBar002", nullptr, TestArcListScrollBar002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBar003", nullptr, TestArcListScrollBar003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBar004", nullptr, TestArcListScrollBar004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarWidth001", nullptr, TestArcListScrollBarWidth001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarWidth002", nullptr, TestArcListScrollBarWidth002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarWidth003", nullptr, TestArcListScrollBarWidth003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarWidth004", nullptr, TestArcListScrollBarWidth004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarColor001", nullptr, TestArcListScrollBarColor001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarColor002", nullptr, TestArcListScrollBarColor002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarColor003", nullptr, TestArcListScrollBarColor003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollToIndex001", nullptr, TestArcListScrollToIndex001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollToIndex002", nullptr, TestArcListScrollToIndex002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollToIndex003", nullptr, TestArcListScrollToIndex003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpace001", nullptr, TestArcListSpace001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpace002", nullptr, TestArcListSpace002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpace003", nullptr, TestArcListSpace003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpace004", nullptr, TestArcListSpace004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpace005", nullptr, TestArcListSpace005, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSetHeader001", nullptr, TestArcListSetHeader001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSetHeader002", nullptr, TestArcListSetHeader002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSetHeader003", nullptr, TestArcListSetHeader003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarBindScrollable001", nullptr, TestArcScrollBarBindScrollable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarBindScrollable002", nullptr, TestArcScrollBarBindScrollable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarBindScrollable003", nullptr, TestArcScrollBarBindScrollable003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarDisplayMode001", nullptr, TestArcScrollBarDisplayMode001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarDisplayMode002", nullptr, TestArcScrollBarDisplayMode002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarDisplayMode003", nullptr, TestArcScrollBarDisplayMode003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarDisplayMode004", nullptr, TestArcScrollBarDisplayMode004, nullptr, nullptr, nullptr, napi_default, nullptr},
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