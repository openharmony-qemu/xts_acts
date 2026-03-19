'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { Entry, Component, Column, Text } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import uiExtension from '@ohos.arkui.uiExtension';

@Entry
@Component
struct EventFlagIndex {
  @State eventNone: string = '' + uiExtension.EventFlag.EVENT_NONE;
  @State eventPanGestureLeft: string = '' + uiExtension.EventFlag.EVENT_PAN_GESTURE_LEFT;
  @State eventPanGestureRight: string = '' + uiExtension.EventFlag.EVENT_PAN_GESTURE_RIGHT;
  @State eventPanGestureUp: string = '' + uiExtension.EventFlag.EVENT_PAN_GESTURE_UP;
  @State eventPanGestureDown: string = '' + uiExtension.EventFlag.EVENT_PAN_GESTURE_DOWN;
  @State eventClick: string = '' + uiExtension.EventFlag.EVENT_CLICK;
  @State eventLongPress: string = '' + uiExtension.EventFlag.EVENT_LONG_PRESS;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('EventFlagIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Text(this.eventNone).key('eventNoneValue');
      Text(this.eventPanGestureLeft).key('eventPanGestureLeftValue');
      Text(this.eventPanGestureRight).key('eventPanGestureRightValue');
      Text(this.eventPanGestureUp).key('eventPanGestureUpValue');
      Text(this.eventPanGestureDown).key('eventPanGestureDownValue');
      Text(this.eventClick).key('eventClickValue');
      Text(this.eventLongPress).key('eventLongPressValue');
    }
    .width('100%')
    .height('100%');
  }
}
