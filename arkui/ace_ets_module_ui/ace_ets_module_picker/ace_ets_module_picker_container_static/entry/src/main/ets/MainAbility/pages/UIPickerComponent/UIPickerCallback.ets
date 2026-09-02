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
  Column,
  Component,
  Row,
  Color,
  Text,
  TextAlign,
  UIPickerComponent,
  ForEach,
  UIPickerComponentOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct UIPickerCallback {
  private fontSize: Double = 20.0;
  private monthArray: string[] = [] as string[];
  @State onChangeIndex: string = 'init';
  @State onScrollStopIndex: string = 'init';

  aboutToAppear(): void {
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Column(undefined) {
      Row() {
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('uipicker_callback_onchange')
        .height('30%')
        .onChange((selectedIndex: Int) => {
          console.info('UIPickerComponent:onChange selectedIndex: ' + selectedIndex);
          this.onChangeIndex = selectedIndex.toString();
        })
      }
      Text('onChangeIndex:' + this.onChangeIndex)
        .id('text_callback_onchange_index')
        .fontSize(12)

      Row() {
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('uipicker_callback_onscrollstop')
        .height('30%')
        .onScrollStop((selectedIndex: Int) => {
          console.info('UIPickerComponent:onScrollStop selectedIndex: ' + selectedIndex);
          this.onScrollStopIndex = selectedIndex.toString();
        })
      }
      Text('onScrollStopIndex:' + this.onScrollStopIndex)
        .id('text_callback_onscrollstop_index')
        .fontSize(12)

      Row() {
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('uipicker_callback_onchange_undefined')
        .height('20%')
        .onChange(undefined)
      }
      Text('onChangeUndefined:rendered')
        .id('text_callback_onchange_undefined')
        .fontSize(12)

      Row() {
        UIPickerComponent() {
          ForEach(this.monthArray, (item: string) => {
            Text(item)
              .fontSize(this.fontSize)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
          })
        }
        .width('15%')
        .id('uipicker_callback_onscrollstop_undefined')
        .height('20%')
        .onScrollStop(undefined)
      }
      Text('onScrollStopUndefined:rendered')
        .id('text_callback_onscrollstop_undefined')
        .fontSize(12)
    }.width('100%').height('100%')
  }
}
