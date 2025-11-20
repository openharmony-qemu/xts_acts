/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import dragAdaptationTest from './DragController/dragAdaptationTest.test';
import touchJsunit from './onTouchTest/TouchJsunit.test';
import appearJsunit from './onAppearTest/AppearJsunit.test';
import areaChangeJsunit from './onAreaChangeTest/AreaChangeJsunit.test';
import ShortcutKeyTest from './keyboardShortcutTest/ShortcutKey.test'
import aboutToAppearTest from './onAppearTest/ComAttr_aboutToAppear.test';

import onGestureTest from './onGestureJudgeBeginTest/onGestureTest.test';
import touchPoint from './DragController/touchPoint_Auto.test';
import previewOptions from './DragController/touchPoint_Disable.test';
import DragActionJsunit from './DragController/DragActionJsSuit.test';
import dragPreviewJsSuit from './DragController/dragPreviewJsSuit.test';
import dragPreviewOptionsJsSuit from './DragController/dragPreviewOptionsJsSuit.test';
import GestureTagJsSuit from './TapGestureTest/GestureTagJsSuit.test';
import freezeInactive from './freezeTest/freezeInactive.test'
import GesturePanGesture from './onGestureJudgeBeginTest/GesturePanGesture.test'
import OnClick1 from './OnClickTest/OnClick1.test'
import OnClick2 from './OnClickTest/OnClick2.test'
import OnClick3 from './OnClickTest/OnClick3.test'
import SwipeGesture1 from './SwipeGestureTest/SwipeGesture1.test'
import SwipeGesture2 from './SwipeGestureTest/SwipeGesture2.test'
import SwipeGesture3 from './SwipeGestureTest/SwipeGesture3.test'
import TapGesture1 from './TapGestureTest/TapGesture1.test'
import TapGesture2 from './TapGestureTest/TapGesture2.test'
import TapGesture3 from './TapGestureTest/TapGesture3.test'
import OnTouch1 from './onTouchTest/OnTouch1.test'
import OnTouch2 from './onTouchTest/OnTouch2.test'
import OnTouch3 from './onTouchTest/OnTouch3.test'
import GestureClick from './onGestureJudgeBeginTest/GestureClick.test'
import GestureContiune from './onGestureJudgeBeginTest/GestureContiune.test'
import GestureDrag from './onGestureJudgeBeginTest/GestureDrag.test'
import GestureIsSystemGesture from './onGestureJudgeBeginTest/GestureIsSystemGesture.test'
import GesturePinchGesture from './onGestureJudgeBeginTest/GesturePinchGesture.test'
import GestureReject from './onGestureJudgeBeginTest/GestureReject.test'
import GestureRotationGesture from './onGestureJudgeBeginTest/GestureRotationGesture.test'
import GestureSwipeGesture from './onGestureJudgeBeginTest/GestureSwipeGesture.test'
import GestureTap from './onGestureJudgeBeginTest/GestureTap.test'
import GestureTapGesture from './onGestureJudgeBeginTest/GestureTapGesture.test'
import PanGesture1 from './PanGestureTest/PanGesture1.test'
import PanGesture2 from './PanGestureTest/PanGesture2.test'
import PanGesture3 from './PanGestureTest/PanGesture3.test'
import GestureLongPressGesture from './onGestureJudgeBeginTest/GestureLongPressGesture.test'
import LongPressGesture1 from './LongPressGestureTest/LongPressGesture1.test'
import LongPressGesture2 from './LongPressGestureTest/LongPressGesture2.test'
import LongPressGesture3 from './LongPressGestureTest/LongPressGesture3.test'

import enumsLineCapStyleJsunit from './enumTest/EnmusLineCapStyleJsunit.test';
import enmusItemAlignJsunit from './enumTest/EnmusItemAlignJsunit.test';
import dragEventJsunit from './DragController/DragEventJsunit.test';
import GestureModeJsunit from './onGestureJudgeBeginTest/GestureModeJsunit.test';
import PanDirectionJsunit from './PanGestureTest/PanDirectionJsunit.test';
import subscribedAbstractPropertyJsunit from './Abstract/SubscribedAbstractPropertyJsunit.test';
import subscribaleAbstractJsunit from './Abstract/SubscribaleAbstractJsunit.test';

import uiAppearanceALWAYS_DARKJsunit from './onAppearTest/uiAppearance.test.ets';
import gestureParallelJsunit from './GestureGroupTest/gesture.test.ets';
import gestureSetDirectionJsunit from './PanGestureTest/gesture.test';
import lazyForEachOnDataAddJsunit from './lazyForeachTest/lazyForEach.test';
import PanGestureEventJsunit from './PanGestureTest/PanGestureEventJsunit.test.ets';
import gestureEnabledJsunit from './PanGestureTest/gestureEnabledJsunit.test.ets'
import PanGesture3Jsunit from './PanGestureTest/PanGestureJsunit.test.ets';
import longPressGestureJsUnit from './LongPressGestureTest/LongPressGesture.test.ets';
import tapGestureTest from './TapGestureTest/TapGesture.test.ets';
import priorityGestureJsunit from './TapGestureTest/PriorityGestureJsunit.test.ets';
import parallelGestureJsunit from './TapGestureTest/ParallelGestureJsunit.test.ets';
import motionPathJsunit from './MotionPathJsunit.test.ets';

export default function testsuite() {
  dragAdaptationTest() // pass 1
  SwipeGesture1() // pass 3
  SwipeGesture2() // pass 2
  SwipeGesture3() // pass 2
  TapGesture1() // pass 2
  TapGesture2() // pass 2
  TapGesture3() // pass 2
  OnTouch1() // pass 2
  OnTouch2() // pass 2
  OnTouch3() // pass 2
  GestureClick() // pass 1
  GestureContiune() // pass 1
  GestureDrag() // pass 1
  GesturePinchGesture() // pass 1
  GestureReject() // pass 1
  GestureRotationGesture() // pass 1
  GestureSwipeGesture() // pass 1
  GestureTap() // pass 1
  GestureTapGesture() // pass 1
  PanGesture1() // pass 2
  PanGesture2() // pass 2
  PanGesture3() // pass 2
  LongPressGesture1() // pass 2
  LongPressGesture2() // pass 2
  LongPressGesture3() // pass 2
  GestureLongPressGesture() // pass 2
  dragEventJsunit() // pass 5
  enumsLineCapStyleJsunit() // pass 1
  enmusItemAlignJsunit() // pass 1
  GestureModeJsunit() // pass 1
  PanDirectionJsunit() // pass 1
  subscribedAbstractPropertyJsunit() // pass 1
  gestureParallelJsunit() // pass 1
  gestureSetDirectionJsunit() // pass 3
  lazyForEachOnDataAddJsunit() // pass 4
  PanGestureEventJsunit() // pass 3
  gestureEnabledJsunit() // pass 4

  PanGesture3Jsunit() // pass 2
  tapGestureTest() // 1 pass
  longPressGestureJsUnit() // pass 2
  priorityGestureJsunit() // 1 pass
  parallelGestureJsunit() // 1 pass
  motionPathJsunit() // 3 pass
  touchJsunit() // 1 pass
  appearJsunit() // 1 pass
  areaChangeJsunit() // 1 pass
  ShortcutKeyTest() // 7 pass 4 JSON.stringify()
  aboutToAppearTest() // 2 pass 1 ， 第一个弹窗会闪退找不到close
  onGestureTest() // pass 1
  touchPoint() // fail 2 JSON.stringify()
  previewOptions() // fail 1 JSON.stringify()
  DragActionJsunit() // pass 1
  dragPreviewJsSuit() // pass 1
  GestureTagJsSuit() // pass 1
  freezeInactive() // pass 1
  GesturePanGesture() // pass 1
  OnClick1() // pass 2
  OnClick2() // pass 2
  OnClick3() // pass 2
  GestureIsSystemGesture() // 1 pass
  dragPreviewOptionsJsSuit() // 1 pass
}