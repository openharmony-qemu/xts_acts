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
import AxisEvent from './AxisEvent/AxisEvent.test';
import RollAngle from './RollAngle/RollAngle.test';
import ResponseRegionTest from './ResponseRegionTest/ResponseRegion.test';
import SourceTypeTest from './SourceTypeTest/SourceType.test';
import AxisEventTest from './AxisEventTest/AxisEvent.test';
import DragEventTest from './DragEventTest/DragEvent.test';
import CommonTest from './CommonTest/Common.test';
import CommonUndefinedTest from './CommonMethodTest/commonUndefined.test';
import CommonAttrsModifierUndefinedTest from './CommonMethodTest/commonAttrsModifierUndefined.test';
import OnChildTouchTestUndefinedTest from './CommonMethodTest/onChildTouchTestUndefined.test';
import NextFocusUndefinedTest from './CommonMethodTest/nextFocusUndefined.test';
import DragEventUndefinedTest from './CommonMethodTest/dragEventUndefined.test';
import DragEventAttrsModifierUndefinedTest from './CommonMethodTest/dragEventAttrsModifierUndefined.test';
import OnMouseUndefinedTest from './CommonMethodTest/onMouseUndefined.test';
import OnMouseAttrsModifierUndefinedTest from './CommonMethodTest/onMouseAttrsModifierUndefined.test';
import clickEffectUndefined from './CommonMethodTest/clickEffectUndefined.test';
import dragControlUndefined from './CommonMethodTest/dragControlUndefined.test';
import clickEffectModifierUndefined from './CommonMethodTest/clickEffectModifierUndefined.test';
import dragControlModifierUndefined from './CommonMethodTest/dragControlModifierUndefined.test';
import onBlurUndefinedTest from './CommonMethodTest/onBlurUndefined.test';
import tabIndexUndefinedTest from './CommonMethodTest/tabIndexUndefined.test';
import onBlurModifierUndefinedTest from './CommonMethodTest/onBlurModifierUndefined.test';
import tabIndexModifierUndefinedTest from './CommonMethodTest/tabIndexModifierUndefined.test';
export default function testsuite() {
  AxisEvent(); //11.28master pass
  RollAngle(); //11.28master pass
  ResponseRegionTest();
  SourceTypeTest();
  AxisEventTest();
  DragEventTest();
  CommonTest();
  CommonUndefinedTest();
  CommonAttrsModifierUndefinedTest();
  OnChildTouchTestUndefinedTest();
  NextFocusUndefinedTest();
  DragEventUndefinedTest();
  DragEventAttrsModifierUndefinedTest();
  OnMouseUndefinedTest();
  OnMouseAttrsModifierUndefinedTest();
  clickEffectUndefined();
  dragControlUndefined();
  clickEffectModifierUndefined();
  dragControlModifierUndefined();
  onBlurUndefinedTest();
  tabIndexUndefinedTest();
  onBlurModifierUndefinedTest();
  tabIndexModifierUndefinedTest();
}
