'use static';
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
import {
  Entry,
  Component,
  Column,
  Scroll,
  Text,
  Row,
  Button,
  Color,
  Margin,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext'
import { RawInputEventType } from '@kit.ArkUI'

@Entry
@Component
struct EnableEventPassthroughExample {
  @State enableState: string = 'none'
  @State touchEventTypeValue: string = 'none'
  @State mouseEventTypeValue: string = 'none'

  build() {
    Column() {
      Scroll() {
        Column() {
          Text('\n\nEnableEventPassthrough Test')
            .width('90%')
            .textAlign(TextAlign.Center)

          Text('State: ' + this.enableState)
            .key('stateText')
            .width('90%')
            .textAlign(TextAlign.Center)
            .fontSize(20)

          Text('TouchType: ' + this.touchEventTypeValue)
            .key('touchTypeText')
            .width('90%')
            .textAlign(TextAlign.Center)
            .fontSize(20)

          Text('MouseType: ' + this.mouseEventTypeValue)
            .key('mouseTypeText')
            .width('90%')
            .textAlign(TextAlign.Center)
            .fontSize(20)

          Row() {
            Button('enable')
              .id('enableBtn')
              .onClick(() => {
                let context = this.getUIContext();
                context.enableEventPassthrough(true, RawInputEventType.TOUCH);
                this.enableState = 'enable';
                this.touchEventTypeValue = String(RawInputEventType.TOUCH);
              })
            Button('disable')
              .id('disableBtn')
              .onClick(() => {
                let context1 = this.getUIContext();
                context1.enableEventPassthrough(false, RawInputEventType.MOUSE);
                this.enableState = 'disable';
                this.mouseEventTypeValue = String(RawInputEventType.MOUSE);
              })
          }
        }.width('100%')
      }
    }.height('80%')
    .width('100%')
    .backgroundColor(Color.White)
  }
}