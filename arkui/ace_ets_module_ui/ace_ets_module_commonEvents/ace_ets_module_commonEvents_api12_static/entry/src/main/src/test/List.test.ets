'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import APIPreDragStatusTest from './DragController/APIPreDragStatusTest.test';
import addGestureApplyGesture from './AddGestureApplyGestureTest3.test';
import ShortcutKeyTABTest from './keyboardShortcutTest/ShortcutKeyTABTest.test';
import ShortcutKeyDPADUPTest from './keyboardShortcutTest/ShortcutKeyDPADUPTest.test';
import ShortcutKeyDPADDOWNTest from './keyboardShortcutTest/ShortcutKeyDPADDOWNTest.test';
import ShortcutKeyDPADLEFTTest from './keyboardShortcutTest/ShortcutKeyDPADLEFTTest.test';
import ShortcutKeyDPADRIGHTTest from './keyboardShortcutTest/ShortcutKeyDPADRIGHTTest.test';
import TapGestureHandlerTest from './GestureHandler/TapGesture.test';
import PanGestureHandlerTest from './GestureHandler/PanGesture.test';

import PinchGestureHandlerTest from './GestureHandler/PinchGesture.test';
import RotationGestureHandlerTest from './GestureHandler/RotationGesture.test';
import LongPressGestureHandlerTest from './GestureHandler/LongPressGesture.test';
import DragInteractionOptionsTest from './DragController/DragInteractionOptions.test';
import SourceToolTest from './GestureHandler/SourceTool.test';
import initializeModifierTest from './AttributeUpdater/initializeModifier.test';
import addParallelGestureTest1 from './GestureHandler/addParallelGestureTest1.test';

import getModifierKeyStateTest from './onKeyEventTest/getModifierKeyState.test';
import clearGestureTest from './GestureHandler/clearGesture.test';
import TapGestureBasicClickTest from './TapGesture/TapGestureBasicClickTest.test';
import TapGestureBasicDoubleClickTest from './TapGesture/TapGestureBasicDoubleClickTest.test';
import LongPressGestureLongClickTest from './LongPressGesture/LongPressGestureLongClickTest.test';
import TapGestureBasicClickMouseTest from './TapGesture/TapGestureBasicClickMouseTest.test';
import TapGestureBasicDoubleClickMouseTest from './TapGesture/TapGestureBasicDoubleClickMouseTest.test';
import LongPressGestureLongClickMouseTest from './LongPressGesture/LongPressGestureLongClickMouseTest.test';
import PanGestureExample01Test from './PanGesture/PanGestureExample01Test.test';
import PanGestureExample02Test from './PanGesture/PanGestureExample02Test.test';

import PanGestureExample03Test from './PanGesture/PanGestureExample03Test.test';

import RotationGestureBasic01Test from './RotationGesture/RotationGestureBasic01Test.test';
import RotationGestureBasic02Test from './RotationGesture/RotationGestureBasic02Test.test';
import PinchGestureBasic01Test from './PinchGesture/PinchGestureBasic01Test.test';
import PinchGestureBasic02Test from './PinchGesture/PinchGestureBasic02Test.test';
import PanGestureExampleTemplateTest from './PanGesture/PanGestureExampleTemplateTest.test';
import TapGestureTemplateTest from './TapGesture/TapGestureTemplateTest.test';
import LongPressGestureTemplateTest from './LongPressGesture/LongPressGestureTemplateTest.test';

import onAttachTest from './onAttachTest/onAttach.test';
import GestureRecognizerState from './GestureRecognizer/GestureRecognizerState.test';
import APIshouldBuiltInRecognizerParallelWith from './APIshouldBuiltInRecognizerParallelWithTest3.test';
import typeNodeGestureTest from './PanGesture/Gesture.test';

import btnMonoLongPress from './customGestureTest/btnMonoLongPress.test'
import btnMonoTouch from './customGestureTest/btnMonoTouch.test'

import gestureDefine1 from './customGestureTest/gestureClick.test'
import gestureDefine2 from './customGestureTest/buttonDragStart.test'
import gestureDefine3 from './customGestureTest/dragIsSystem.test'
import gestureDefine4 from './customGestureTest/clickIsSystem.test'

import gestureDefine10 from './GestureRecognizer/GestureRecognizerIsValid.test'


export default function testsuite() {
  APIPreDragStatusTest(); // 6 pass 6
  APIshouldBuiltInRecognizerParallelWith(); // 4 pass 4
  addGestureApplyGesture(); // 1 pass 1
  ShortcutKeyTABTest(); // 1 pass 1
  ShortcutKeyDPADUPTest(); // 1 pass 1
  ShortcutKeyDPADDOWNTest(); // 1 pass 1
  ShortcutKeyDPADLEFTTest(); // 1 pass 1
  ShortcutKeyDPADRIGHTTest(); // 1 pass 1
  TapGestureHandlerTest(); // 1 pass 1
  PanGestureHandlerTest(); // 1 pass 1
  PinchGestureHandlerTest(); // 1 pass 1
  RotationGestureHandlerTest(); // 1 pass 1
  LongPressGestureHandlerTest(); // 1 pass 1
  DragInteractionOptionsTest(); // 2 pass 2
  SourceToolTest(); // 5 pass 5
  addParallelGestureTest1(); // 1 pass 1
  clearGestureTest(); // 1 pass 1

  getModifierKeyStateTest(); // 2 pass 2
  TapGestureBasicClickTest(); // 1 pass 1
  TapGestureBasicDoubleClickTest(); // 1 pass 1
  LongPressGestureLongClickTest(); // 1 pass 1
  TapGestureBasicClickMouseTest(); // 1 pass 1
  TapGestureBasicDoubleClickMouseTest(); // 1 pass 1
  LongPressGestureLongClickMouseTest(); // 1 pass 1
  PanGestureExample01Test(); // 1 pass 1
  PanGestureExample02Test(); // 1 pass 1
  PanGestureExample03Test(); // 1
  RotationGestureBasic01Test(); // 1 pass 1
  RotationGestureBasic02Test(); // 1 pass 1
  PinchGestureBasic01Test(); // 1  expect true, actualValue is false PanGesture
  PinchGestureBasic02Test(); // 1 expect true, actualValue is false PanGesture
  PanGestureExampleTemplateTest(); // 1 pass 1
  TapGestureTemplateTest(); // 1 expect true, actualValue is false TapGesture
  LongPressGestureTemplateTest(); // 1 pass 1


  onAttachTest(); // 2 pass 2
  GestureRecognizerState(); // 1 pass 1
  typeNodeGestureTest(); // 1 pass 1
  btnMonoLongPress(); // 1 pass 1
  btnMonoTouch(); // 1 pass 1
  gestureDefine1(); //  1 pass 1
  gestureDefine2(); // 1 pass 1
  gestureDefine3(); // 1 pass 1
  gestureDefine4(); // 1 pass 1
  gestureDefine10(); // 1 pass 1

  initializeModifierTest(); // 2 pass 2

}