/**
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
import DragControllerTest from './DragControllerTest/DragController.test';
import CommonEventGlobalDisplayTest from './CommonEventGlobalDisplayTest/CommonEventGlobalDisplay.test';
import CommonDragEventTest from './CommonDragEventTest/CommonDragEvent.test';
import CommonKeyEventTest from './CommonKeyEventTest/CommonKeyEvent.test';
import GestureStaticSuiteTest from './GestureStaticSuite/GestureStaticSuite.test';
import UIContextGestureTest from './UIContextGestureTest/UIContextGesture.test';
import UIContextUIObserverApiTest from './UIContextUIObserverApiTest/UIContextUIObserverApi.test';

export default function testsuite() {
  DragControllerTest();
  CommonEventGlobalDisplayTest();
  CommonDragEventTest();
  CommonKeyEventTest();
  GestureStaticSuiteTest();
  UIContextGestureTest();
  UIContextUIObserverApiTest();
}