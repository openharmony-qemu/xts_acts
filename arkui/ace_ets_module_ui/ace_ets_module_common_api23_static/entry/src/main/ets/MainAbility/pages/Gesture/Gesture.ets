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

'use static'

import {
  Entry,
  Component,
  Column,
  Text
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GesturePage {
  private readonly boxSelectGestureValue: number = 8;
  private readonly webScrollGestureValue: number = 9;
  private readonly textFieldSelectGestureValue: number = 10;
  private readonly contextMenuHoverGestureValue: number = 11;
  private readonly distanceThresholdValue: number = 6;
  private readonly allowableMovementValue: number = 8;

  private getAllowableMovementValue(): number {
    return 10;
  }

  aboutToAppear(): void {
    const snapshot = `boxSelectGestureValue=${this.boxSelectGestureValue};webScrollGestureValue=${this.webScrollGestureValue};` +
      `textFieldSelectGestureValue=${this.textFieldSelectGestureValue};` +
      `contextMenuHoverGestureValue=${this.contextMenuHoverGestureValue};distanceThresholdValue=${this.distanceThresholdValue};` +
      `allowableMovementValue=${this.allowableMovementValue};getAllowableMovementValue=${this.getAllowableMovementValue()}`;
    AppStorage.setOrCreate<string>('GesturePageState', snapshot);
  }

  build() {
    Column() {
      Text(`BOX_SELECT_GESTURE=${this.boxSelectGestureValue}`).id('gestureTypeBoxSelectCase').key('gestureTypeBoxSelectCase')
      Text(`WEB_SCROLL_GESTURE=${this.webScrollGestureValue}`).id('gestureTypeWebScrollCase').key('gestureTypeWebScrollCase')
      Text(`TEXT_FIELD_SELECT_GESTURE=${this.textFieldSelectGestureValue}`).id('gestureTypeTextFieldSelectCase').key('gestureTypeTextFieldSelectCase')
      Text(`CONTEXT_MENU_HOVER_GESTURE=${this.contextMenuHoverGestureValue}`).id('gestureTypeContextMenuHoverCase').key('gestureTypeContextMenuHoverCase')
      Text(`distanceThreshold=${this.distanceThresholdValue}`).id('tapGestureDistanceThresholdCase').key('tapGestureDistanceThresholdCase')
      Text(`allowableMovement=${this.allowableMovementValue}`).id('longPressAllowableMovementCase').key('longPressAllowableMovementCase')
      Text(`getAllowableMovement=${this.getAllowableMovementValue()}`).id('longPressGetAllowableMovementCase').key('longPressGetAllowableMovementCase')
    }.width('100%').height('100%')
  }
}
