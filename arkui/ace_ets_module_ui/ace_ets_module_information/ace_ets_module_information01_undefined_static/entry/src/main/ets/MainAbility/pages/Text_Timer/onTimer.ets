'use static';
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
import {
  Builder,
  Stack,
  Entry,
  Component,
  Column,
  Row,
  TextTimer,
  TextTimerController,
  Color,
  Button,
  FontWeight,
  Margin,
  ShadowOptions,
  FontStyle,
  $rawfile,
  Text,
  ColumnOptions,
  HorizontalAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TextTimerExample {
  textTimerController: TextTimerController = new TextTimerController();
  @State change: boolean | undefined = true;
  @State text: String = ''
  @State flag: boolean = true

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Row() {
        Button('start').onClick(() => {
          this.textTimerController.start();
        }).margin({ top: 5 } as Margin)
          .id('start')
        Button('pause').onClick(() => {
          this.textTimerController.pause();
        }).margin({ top: 5 } as Margin)
          .id('pause')
        Button('reset').onClick(() => {
          this.textTimerController.reset();
        }).margin({ top: 5 } as Margin)
      }

      Text(this.text)
        .id('TestText')

      Button('切换 onTimer → ' + (this.change === false ? 'undefined' : 'true'))
        .height('5%')
        .onClick(() => {
          this.change = !this.change
          this.flag != this.flag
        }).margin({ top: 5 } as Margin)
        .id('changeButton')

      TextTimer({ controller: this.textTimerController })
        .onTimer(this.change ? (utc: Long, elapsedTime: Long) => {
          if (this.flag) {
            this.text += '1'
            this.flag = !this.flag
          }
        } : undefined)
        .id('TestText_timerOnTimer')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}