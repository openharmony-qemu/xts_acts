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
#include "list/listBackBehaviorTest.cpp"
#include "inspectorLabel/InspectorLabelTest.cpp"
#include "accessibilityFocusId/AccessibilityFocusIdTest.cpp"
#include "hovered/HoveredTest.cpp"
#include "arcList/arc_list_digital_crown_sensitivity_test.cpp"
#include "arcList/arc_list_space_test.cpp"
#include "arcList/arc_list_cached_count_test.cpp"
#include "arcList/arc_list_scroll_to_index_test.cpp"
#include "arcList/arc_list_chain_animation_test.cpp"
#include "arcList/arc_list_children_main_size_test.cpp"
#include "arcList/arc_list_set_header_test.cpp"
#include "arcList/arc_list_scroll_bar_test.cpp"
#include "arcList/arc_list_scroll_bar_color_test.cpp"
#include "arcList/arc_list_scroll_bar_width_test.cpp"
#include "arcList/arc_list_enable_scroll_interaction_test.cpp"
#include "arcList/arc_list_fading_edge_test.cpp"
#include "arcList/arc_list_friction_test.cpp"
#include "arcList/arc_list_fling_speed_limit_test.cpp"
#include "arcList/arc_list_item_auto_scale_test.cpp"
#include "arcList/arc_list_item_swipe_action_test.cpp"
#include "arcList/arc_scroll_bar_bind_scrollable_test.cpp"
#include "arcList/arc_scroll_bar_display_mode_test.cpp"
#include "arcList/arc_list_on_scroll_index_test.cpp"
#include "arcList/arc_list_on_reach_start_test.cpp"
#include "arcList/arc_list_on_reach_end_test.cpp"
#include "arcList/arc_list_on_scroll_start_test.cpp"
#include "arcList/arc_list_on_scroll_stop_test.cpp"
#include "arcList/arc_list_on_will_scroll_test.cpp"
#include "arcList/arc_list_on_did_scroll_test.cpp"

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
        {"ListBackBehaviorTest_001", nullptr, ListBackBehaviorTest_001, nullptr, nullptr, nullptr,
         napi_default, nullptr},	 
        {"ListBackBehaviorTest_002", nullptr, ListBackBehaviorTest_002, nullptr, nullptr, nullptr,
         napi_default, nullptr},	 
        {"ListBackBehaviorTest_003", nullptr, ListBackBehaviorTest_003, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"ListBackBehaviorTest_004", nullptr, ListBackBehaviorTest_004, nullptr, nullptr, nullptr,
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

        // ArcList Digital Crown Sensitivity tests
        {"testArcListDigitalCrownSensitivitySet001", nullptr, TestArcListDigitalCrownSensitivitySet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListDigitalCrownSensitivitySet002", nullptr, TestArcListDigitalCrownSensitivitySet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListDigitalCrownSensitivitySet003", nullptr, TestArcListDigitalCrownSensitivitySet003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListDigitalCrownSensitivityGet001", nullptr, TestArcListDigitalCrownSensitivityGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListDigitalCrownSensitivityGet002", nullptr, TestArcListDigitalCrownSensitivityGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Space tests
        {"testArcListSpaceSet001", nullptr, TestArcListSpaceSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpaceSet002", nullptr, TestArcListSpaceSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpaceSet003", nullptr, TestArcListSpaceSet003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpaceSet004", nullptr, TestArcListSpaceSet004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpaceGet001", nullptr, TestArcListSpaceGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSpaceGet002", nullptr, TestArcListSpaceGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Cached Count tests
        {"testArcListCachedCountSet001", nullptr, TestArcListCachedCountSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListCachedCountSet002", nullptr, TestArcListCachedCountSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListCachedCountSet003", nullptr, TestArcListCachedCountSet003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListCachedCountGet001", nullptr, TestArcListCachedCountGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListCachedCountGet002", nullptr, TestArcListCachedCountGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Scroll To Index tests
        {"testArcListScrollToIndex001", nullptr, TestArcListScrollToIndex001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollToIndex002", nullptr, TestArcListScrollToIndex002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollToIndex003", nullptr, TestArcListScrollToIndex003, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Chain Animation tests
        {"testArcListChainAnimationSet001", nullptr, TestArcListChainAnimationSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChainAnimationSet002", nullptr, TestArcListChainAnimationSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChainAnimationGet001", nullptr, TestArcListChainAnimationGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChainAnimationGet002", nullptr, TestArcListChainAnimationGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Children Main Size tests
        {"testArcListChildrenMainSizeSet001", nullptr, TestArcListChildrenMainSizeSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSizeSet002", nullptr, TestArcListChildrenMainSizeSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListChildrenMainSizeGet001", nullptr, TestArcListChildrenMainSizeGet001, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Set Header tests
        {"testArcListSetHeaderSet001", nullptr, TestArcListSetHeaderSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSetHeaderSet002", nullptr, TestArcListSetHeaderSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSetHeaderGet001", nullptr, TestArcListSetHeaderGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListSetHeaderGet002", nullptr, TestArcListSetHeaderGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Scroll Bar tests
        {"testArcListScrollBarSet001", nullptr, TestArcListScrollBarSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarSet002", nullptr, TestArcListScrollBarSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarGet001", nullptr, TestArcListScrollBarGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarGet002", nullptr, TestArcListScrollBarGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Scroll Bar Color tests
        {"testArcListScrollBarColorSet001", nullptr, TestArcListScrollBarColorSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarColorSet002", nullptr, TestArcListScrollBarColorSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarColorGet001", nullptr, TestArcListScrollBarColorGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarColorGet002", nullptr, TestArcListScrollBarColorGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Scroll Bar Width tests
        {"testArcListScrollBarWidthSet001", nullptr, TestArcListScrollBarWidthSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarWidthSet002", nullptr, TestArcListScrollBarWidthSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarWidthSet003", nullptr, TestArcListScrollBarWidthSet003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarWidthGet001", nullptr, TestArcListScrollBarWidthGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListScrollBarWidthGet002", nullptr, TestArcListScrollBarWidthGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Enable Scroll Interaction tests
        {"testArcListEnableScrollInteractionSet001", nullptr, TestArcListEnableScrollInteractionSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListEnableScrollInteractionSet002", nullptr, TestArcListEnableScrollInteractionSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListEnableScrollInteractionGet001", nullptr, TestArcListEnableScrollInteractionGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListEnableScrollInteractionGet002", nullptr, TestArcListEnableScrollInteractionGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Fading Edge tests
        {"testArcListFadingEdgeSet001", nullptr, TestArcListFadingEdgeSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFadingEdgeSet002", nullptr, TestArcListFadingEdgeSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFadingEdgeGet001", nullptr, TestArcListFadingEdgeGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFadingEdgeGet002", nullptr, TestArcListFadingEdgeGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Friction tests
        {"testArcListFrictionSet001", nullptr, TestArcListFrictionSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFrictionSet002", nullptr, TestArcListFrictionSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFrictionSet003", nullptr, TestArcListFrictionSet003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFrictionGet001", nullptr, TestArcListFrictionGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFrictionGet002", nullptr, TestArcListFrictionGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Fling Speed Limit tests
        {"testArcListFlingSpeedLimitSet001", nullptr, TestArcListFlingSpeedLimitSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFlingSpeedLimitSet002", nullptr, TestArcListFlingSpeedLimitSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFlingSpeedLimitSet003", nullptr, TestArcListFlingSpeedLimitSet003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFlingSpeedLimitGet001", nullptr, TestArcListFlingSpeedLimitGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListFlingSpeedLimitGet002", nullptr, TestArcListFlingSpeedLimitGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Item Auto Scale tests
        {"testArcListItemAutoScaleSet001", nullptr, TestArcListItemAutoScaleSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemAutoScaleSet002", nullptr, TestArcListItemAutoScaleSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemAutoScaleGet001", nullptr, TestArcListItemAutoScaleGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemAutoScaleGet002", nullptr, TestArcListItemAutoScaleGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList Item Swipe Action tests
        {"testArcListItemSwipeActionSet001", nullptr, TestArcListItemSwipeActionSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemSwipeActionSet002", nullptr, TestArcListItemSwipeActionSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemSwipeActionGet001", nullptr, TestArcListItemSwipeActionGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListItemSwipeActionGet002", nullptr, TestArcListItemSwipeActionGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // Arc Scroll Bar Bind Scrollable tests
        {"testArcScrollBarBindScrollableSet001", nullptr, TestArcScrollBarBindScrollableSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarBindScrollableSet002", nullptr, TestArcScrollBarBindScrollableSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarBindScrollableGet001", nullptr, TestArcScrollBarBindScrollableGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarBindScrollableGet002", nullptr, TestArcScrollBarBindScrollableGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // Arc Scroll Bar Display Mode tests
        {"testArcScrollBarDisplayModeSet001", nullptr, TestArcScrollBarDisplayModeSet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarDisplayModeSet002", nullptr, TestArcScrollBarDisplayModeSet002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarDisplayModeSet003", nullptr, TestArcScrollBarDisplayModeSet003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarDisplayModeGet001", nullptr, TestArcScrollBarDisplayModeGet001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcScrollBarDisplayModeGet002", nullptr, TestArcScrollBarDisplayModeGet002, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList On Scroll Index tests
        {"testArcListOnScrollIndex001", nullptr, TestArcListOnScrollIndex001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListOnScrollIndex002", nullptr, TestArcListOnScrollIndex002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOnScrollIndexResult", nullptr, GetOnScrollIndexResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetOnScrollIndexFlag", nullptr, ResetOnScrollIndexFlag, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList On Reach Start tests
        {"testArcListOnReachStart001", nullptr, TestArcListOnReachStart001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListOnReachStart002", nullptr, TestArcListOnReachStart002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOnReachStartResult", nullptr, GetOnReachStartResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetOnReachStartFlag", nullptr, ResetOnReachStartFlag, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList On Reach End tests
        {"testArcListOnReachEnd001", nullptr, TestArcListOnReachEnd001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListOnReachEnd002", nullptr, TestArcListOnReachEnd002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOnReachEndResult", nullptr, GetOnReachEndResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetOnReachEndFlag", nullptr, ResetOnReachEndFlag, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList On Scroll Start tests
        {"testArcListOnScrollStart001", nullptr, TestArcListOnScrollStart001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListOnScrollStart002", nullptr, TestArcListOnScrollStart002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOnScrollStartResult", nullptr, GetOnScrollStartResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetOnScrollStartFlag", nullptr, ResetOnScrollStartFlag, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList On Scroll Stop tests
        {"testArcListOnScrollStop001", nullptr, TestArcListOnScrollStop001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListOnScrollStop002", nullptr, TestArcListOnScrollStop002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOnScrollStopResult", nullptr, GetOnScrollStopResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetOnScrollStopFlag", nullptr, ResetOnScrollStopFlag, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList On Will Scroll tests
        {"testArcListOnWillScroll001", nullptr, TestArcListOnWillScroll001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListOnWillScroll002", nullptr, TestArcListOnWillScroll002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOnWillScrollResult", nullptr, GetOnWillScrollResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetOnWillScrollFlag", nullptr, ResetOnWillScrollFlag, nullptr, nullptr, nullptr, napi_default, nullptr},

        // ArcList On Did Scroll tests
        {"testArcListOnDidScroll001", nullptr, TestArcListOnDidScroll001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"testArcListOnDidScroll002", nullptr, TestArcListOnDidScroll002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getOnDidScrollResult", nullptr, GetOnDidScrollResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetOnDidScrollFlag", nullptr, ResetOnDidScrollFlag, nullptr, nullptr, nullptr, napi_default, nullptr},
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