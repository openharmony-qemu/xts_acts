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
import notifyDragStartRequest from './Drag/notifyDragStartRequest.test';
import PreDrag from './Drag/PreDrag.test';
import enableEdgeAutoScroll from './DragInteractionOptions/enableEdgeAutoScroll.test';
import enableEdgeAutoScroll_false from './DragInteractionOptions/enableEdgeAutoScroll_false.test';
import enableEdgeAutoScroll_true from './DragInteractionOptions/enableEdgeAutoScroll_true.test';
import LongPressRecognizer from './GestureRecognizer/LongPressRecognizer.test';
import PanRecognizer from './GestureRecognizer/PanRecognizer.test';
import PinchRecognizer from './GestureRecognizer/PinchRecognizer.test';
import RotationRecognizer from './GestureRecognizer/RotationRecognizer.test';
import SwipeRecognizer from './GestureRecognizer/SwipeRecognizer.test';
import TapRecognizer from './GestureRecognizer/TapRecognizer.test';
import InteractionEventBindingInfoTest from './InteractionEventBindingInfo/InteractionEventBindingInfo.test';
import UIObserverEventTest from './ListeningEvent/UIObserverEvent.test';
import nextFocus from './nextFocus/nextFocus.test';
import nextFocus2 from './nextFocus2/nextFocus2.test';
import onVisiable from './onVisiable/onVisiable.test';
import panGestureDistanceTest from './PanGesture/panGestureDistance.test';
import panGestureOnOffTest from './PanGesture/panGestureOnOff.test';

export default function testsuite() {

  notifyDragStartRequest(); // 1 pass 1
  PreDrag(); // 1 pass 1
  enableEdgeAutoScroll(); // 1 pass 1
  LongPressRecognizer(); // 1 pass 1
  PanRecognizer(); // 1 pass 1
  PinchRecognizer(); // 1 pass 1
  RotationRecognizer(); // 1 pass 1
  SwipeRecognizer(); // 1 pass 1
  TapRecognizer(); // 1 pass 1
  InteractionEventBindingInfoTest(); // 8 getInteractionEventBindingInfo 接口未交付
  UIObserverEventTest(); // 3 observer.offwillClick 未交付
  nextFocus();  // 1 pass 1
  nextFocus2(); // 1 pass 1
  panGestureDistanceTest(); // 3 getDistanceMap 接口未交付
  panGestureOnOffTest(); // 1 observer.off
  enableEdgeAutoScroll_false(); // 1 pass 1
  enableEdgeAutoScroll_true(); // 1 pass 1
  onVisiable(); // 1 pass 1

}
