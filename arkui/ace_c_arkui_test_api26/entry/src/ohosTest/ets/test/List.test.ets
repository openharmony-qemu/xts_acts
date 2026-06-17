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
import ListBackBehaviorTest from "./list/listBackBehaviorTest.test";
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
import arcListSpaceTest from './arcList/ArcListSpaceTest.test'
import arcListCachedCountTest from './arcList/ArcListCachedCountTest.test'
import arcListScrollToIndexTest from './arcList/ArcListScrollToIndexTest.test'
import arcListFlingSpeedLimitTest from './arcList/ArcListFlingSpeedLimitTest.test'
import arcListFrictionTest from './arcList/ArcListFrictionTest.test'
import arcListFadingEdgeTest from './arcList/ArcListFadingEdgeTest.test'
import arcListEnableScrollInteractionTest from './arcList/ArcListEnableScrollInteractionTest.test'
import arcListScrollBarTest from './arcList/ArcListScrollBarTest.test'
import arcListScrollBarWidthTest from './arcList/ArcListScrollBarWidthTest.test'
import arcListScrollBarColorTest from './arcList/ArcListScrollBarColorTest.test'
import arcListSetHeaderTest from './arcList/ArcListSetHeaderTest.test'
import arcListChildrenMainSizeTest from './arcList/ArcListChildrenMainSizeTest.test'
import arcListChainAnimationTest from './arcList/ArcListChainAnimationTest.test'
import arcListItemSwipeActionTest from './arcList/ArcListItemSwipeActionTest.test'
import arcListItemAutoScaleTest from './arcList/ArcListItemAutoScaleTest.test'
import arcListDigitalCrownSensitivityTest from './arcList/ArcListDigitalCrownSensitivityTest.test'
import arcScrollBarDisplayModeTest from './arcList/ArcScrollBarDisplayModeTest.test'
import arcScrollBarBindScrollableTest from './arcList/ArcScrollBarBindScrollableTest.test'
import ArcListEventCallbackTest from './arcList/ArcListEventCallbackTest.test'

export default function testsuite() {
  RegisterCommonAreaApproximateChangeEventTest();
  UnregisterCommonAreaApproximateChangeEventTest();
  AreaChangeErrorCodeTest();
  ScrollWithMouseTest();
  AutoAdjustMarginTest();
  ListBackBehaviorTest();
  OrphanCharOptimizationTest();
  passThroughTest();
  gestureErrorCodeTest();
  GestureInterceptTest();
  GetSizeLimitationTest();
  InspectorLabelTest();
  AccessibilityFocusIdTest();
  hoveredTest();
  shouldRecognizerParallelWith();
  arcListSpaceTest()
  arcListCachedCountTest()
  arcListScrollToIndexTest()
  arcListFlingSpeedLimitTest()
  arcListFrictionTest()
  arcListFadingEdgeTest()
  arcListEnableScrollInteractionTest()
  arcListScrollBarTest()
  arcListScrollBarWidthTest()
  arcListScrollBarColorTest()
  arcListSetHeaderTest()
  arcListChildrenMainSizeTest()
  arcListChainAnimationTest()
  arcListItemSwipeActionTest()
  arcListItemAutoScaleTest()
  arcListDigitalCrownSensitivityTest()
  arcScrollBarDisplayModeTest()
  arcScrollBarBindScrollableTest()
  ArcListEventCallbackTest()
}