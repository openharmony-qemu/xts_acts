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

import getWithUniqueId from './ComponentSnapshotByUniqueId/getWithUniqueId.test';
import keyEventDispatchTest from './keyEventDispatchTest/keyEventDispatchone.test';
import keyEventDispatchTest2 from './keyEventDispatchTest/keyEventDispatchtwo.test';
import keyEventDispatchTest3 from './keyEventDispatchTest/keyEventDispatchthree.test';
import keyEventDispatchTest4 from './keyEventDispatchTest/keyEventDispatchfour.test';
import keyEventDispatchTest5 from './keyEventDispatchTest/keyEventDispatchfive.test';
import keyEventDispatchTest6 from './keyEventDispatchTest/keyEventDispatchsix.test';
import onKeyEventDispatchTest from './keyEventDispatchTest/onKeyEventDispatchone.test';
import onKeyEventDispatchTest3 from './keyEventDispatchTest/onkeyEventDispatchthree.test';
import onkeyEventDispatchTest4 from './keyEventDispatchTest/onkeyEventDispatchfour.test';
import onkeyEventDispatchTest6 from './keyEventDispatchTest/onkeyEventDispatchsix.test';
import onkeyEventDispatchTest7 from './keyEventDispatchTest/onkeyEventDispatchseven.test';
import onkeyEventDispatchTest8 from './keyEventDispatchTest/onkeyEventDispatcheight.test';
import GetChangedPointerId from './GetChangedPointerId/GetChangedPointerId.test';
import componentSnapshot from './componentSnapshot/componentSnapshot.test';
import longpressGestureTest from './isFingerCountLimited/LongPressGesture.test';
import panGestureTest from './isFingerCountLimited/PanGesture.test';
import pinchGestureTest from './isFingerCountLimited/PinchGesture.test';
import rotationGestureTest from './isFingerCountLimited/RotationGesture.test';
import swipeGestureTest from './isFingerCountLimited/SwipeGesture.test';
import tapGestureTest from './isFingerCountLimited/TapGesture.test';
import SnapshotOptions_region from './SnapshotOptions_region/SnapshotOptions_region.test';
import setKeyProcessingModeTest from './setKeyProcessingModeTest/setKeyProcessingModeTest.test';
import mouseEventTest from './EventItem/Mouse.test';
import touchEventTest from './EventItem/Touch.test';
import tapGestureEventTest from './EventItem/TapGesture.test';
import swipeGestureEventTest from './EventItem/SwipeGesture.test';
import longPressEventTest from './EventItem/LongPressGesture.test';
import panGestureEventTest from './EventItem/PanGesture.test';
import pinchGestureEventTest from './EventItem/PinchGesture.test';
import rotationGestureEventTest from './EventItem/RotationGesture.test';
import dataLoadingTest from './startDataLoading/dataLoadingTest.test';
import DragPreviewOptions from './DragPreviewOptions/DragPreviewOptions.test';
import EventTarget_id from './EventTarget_id/EventTarget_id.test';

export default function testsuite() {
  getWithUniqueId(); // 4 pass 4
  keyEventDispatchTest(); // 1 pass 1
  keyEventDispatchTest2(); // 1 pass 1
  keyEventDispatchTest3(); // 1 pass 1
  keyEventDispatchTest4(); // 1 pass 1
  keyEventDispatchTest5(); // 1 pass 1
  keyEventDispatchTest6(); // 1 pass 1
  onKeyEventDispatchTest(); // 1 pass 1
  onKeyEventDispatchTest3(); // 1 pass 1
  onkeyEventDispatchTest4(); // 1 pass 1
  onkeyEventDispatchTest6(); // 1 pass 1
  onkeyEventDispatchTest7(); // 1 pass 1
  onkeyEventDispatchTest8(); // 1 pass 1 接口返回类型变更 expect disfalse equals disundefined
  GetChangedPointerId(); // 1 pass 1
  componentSnapshot(); // 1 pass 1
  longpressGestureTest(); // 2 pass 2
  panGestureTest(); // 2 pass 2
  pinchGestureTest(); // 2 pass 2
  rotationGestureTest(); // 2 pass 2
  swipeGestureTest(); // 2 pass 2
  tapGestureTest(); // 2 pass 2
  SnapshotOptions_region(); // 4 getComponentSnapshot()
  setKeyProcessingModeTest(); // 3 pass 1
  mouseEventTest(); // 1 pass 1
  touchEventTest(); // 1 pass 1
  tapGestureEventTest(); // 1 pass 1
  swipeGestureEventTest(); // 1 pass 1
  longPressEventTest(); // 1 pass 1
  panGestureEventTest(); // 1 pass 1
  pinchGestureEventTest(); // 1 pass 1
  rotationGestureEventTest(); // 1 pass 1
  dataLoadingTest(); // 3 pass 1 有注释
  DragPreviewOptions(); // 1 pass 1
  EventTarget_id(); // 2 pass 2
}