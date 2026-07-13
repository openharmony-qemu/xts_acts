/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import AreaChangeErrorCodeTest from './onAreaChange/AreaChangeErrorCodeTest.test'
import ScrollWithMouseTest from "./scroll/scrollWithMouseTest.test";
import AutoAdjustMarginTest from "./scroll/autoAdjustMarginTest.test";
import ScrollBarHeightTest from "./scroll/scrollBarHeightTest.test";
import ListBackBehaviorTest from "./list/listBackBehaviorTest.test";
import ListEnableEditModeTest from "./list/listEnableEditModeTest.test";
import ListEditModeOptionsTest from "./list/listEditModeOptionsTest.test";
import GridEnableEditModeTest from "./grid/gridEnableEditModeTest.test";
import GridEditModeOptionsTest from "./grid/gridEditModeOptionsTest.test";
import RegisterCommonAreaApproximateChangeEventTest from './onAreaChange/RegisterCommonAreaApproximateChangeEventTest.test'
import UnregisterCommonAreaApproximateChangeEventTest from './onAreaChange/UnregisterCommonAreaApproximateChangeEventTest.test'
import OrphanCharOptimizationTest from './orphanCharOptimization/orphanCharOptimizationTest.test'
import GestureInterceptTest from './gestureIntercept/GestureInterceptTest.test'
import gestureErrorCodeTest from './gestureIntercept/GestureErrorCodeTest.test'
import passThroughTest from './passThrough/PassThroughTest.test'
import GetSizeLimitationTest from './getSizeLimitation/GetSizeLimitationTest.test'
import InspectorLabelTest from './inspectorLabel/InspectorLabelTest.test'
import AccessibilityFocusIdTest from './accessibilityFocusId/AccessibilityFocusIdTest.test'
import hoveredTest from './hovered/hovered.test'
import shouldRecognizerParallelWith from "./shouldRecognizerParallelWith/shouldRecognizerParallelWith.test"
import ArcListSpaceTest from './arcList/ArcListSpaceTest.test'
import ArcListCachedCountTest from './arcList/ArcListCachedCountTest.test'
import ArcListScrollToIndexTest from './arcList/ArcListScrollToIndexTest.test'
import ArcListFlingSpeedLimitTest from './arcList/ArcListFlingSpeedLimitTest.test'
import ArcListFrictionTest from './arcList/ArcListFrictionTest.test'
import ArcListFadingEdgeTest from './arcList/ArcListFadingEdgeTest.test'
import ArcListEnableScrollInteractionTest from './arcList/ArcListEnableScrollInteractionTest.test'
import ArcListScrollBarTest from './arcList/ArcListScrollBarTest.test'
import ArcListScrollBarWidthTest from './arcList/ArcListScrollBarWidthTest.test'
import ArcListScrollBarColorTest from './arcList/ArcListScrollBarColorTest.test'
import ArcListSetHeaderTest from './arcList/ArcListSetHeaderTest.test'
import ArcListChildrenMainSizeTest from './arcList/ArcListChildrenMainSizeTest.test'
import ArcListChainAnimationTest from './arcList/ArcListChainAnimationTest.test'
import ArcListItemSwipeActionTest from './arcList/ArcListItemSwipeActionTest.test'
import ArcListItemAutoScaleTest from './arcList/ArcListItemAutoScaleTest.test'
import ArcListDigitalCrownSensitivityTest from './arcList/ArcListDigitalCrownSensitivityTest.test'
import ArcScrollBarDisplayModeTest from './arcList/ArcScrollBarDisplayModeTest.test'
import ArcScrollBarBindScrollableTest from './arcList/ArcScrollBarBindScrollableTest.test'
import ArcListEventCallbackTest from './arcList/ArcListEventCallbackTest.test'
import ArcSwiperAttributeTest from './arcSwiper/ArcSwiperAttributeTest.test'
import ArcSwiperMethodTest from './arcSwiper/ArcSwiperMethodTest.test'
import ArcSwiperEventCallbackTest from './arcSwiper/ArcSwiperEventCallbackTest.test'
import ArcAlphabetIndexerAttributeTest from './arcAlphabetIndexer/ArcAlphabetIndexerAttributeTest.test'
import ArcAlphabetIndexerEventCallbackTest from './arcAlphabetIndexer/ArcAlphabetIndexerEventCallbackTest.test'

export default function testsuite() {
  RegisterCommonAreaApproximateChangeEventTest();
  UnregisterCommonAreaApproximateChangeEventTest();
  AreaChangeErrorCodeTest();
  ScrollWithMouseTest();
  AutoAdjustMarginTest();
  ScrollBarHeightTest();
  ListBackBehaviorTest();
  ListEnableEditModeTest();
  ListEditModeOptionsTest();
  GridEnableEditModeTest();
  GridEditModeOptionsTest();
  OrphanCharOptimizationTest();
  passThroughTest();
  gestureErrorCodeTest();
  GestureInterceptTest();
  GetSizeLimitationTest();
  InspectorLabelTest();
  AccessibilityFocusIdTest();
  hoveredTest();
  shouldRecognizerParallelWith();
  ArcListSpaceTest()
  ArcListCachedCountTest()
  ArcListScrollToIndexTest()
  ArcListFlingSpeedLimitTest()
  ArcListFrictionTest()
  ArcListFadingEdgeTest()
  ArcListEnableScrollInteractionTest()
  ArcListScrollBarTest()
  ArcListScrollBarWidthTest()
  ArcListScrollBarColorTest()
  ArcListSetHeaderTest()
  ArcListChildrenMainSizeTest()
  ArcListChainAnimationTest()
  ArcListItemSwipeActionTest()
  ArcListItemAutoScaleTest()
  ArcListDigitalCrownSensitivityTest()
  ArcScrollBarDisplayModeTest()
  ArcScrollBarBindScrollableTest()
  ArcSwiperAttributeTest()
  ArcSwiperMethodTest()
  ArcAlphabetIndexerAttributeTest()
  ArcListEventCallbackTest()
  ArcSwiperEventCallbackTest()
  ArcAlphabetIndexerEventCallbackTest()
}