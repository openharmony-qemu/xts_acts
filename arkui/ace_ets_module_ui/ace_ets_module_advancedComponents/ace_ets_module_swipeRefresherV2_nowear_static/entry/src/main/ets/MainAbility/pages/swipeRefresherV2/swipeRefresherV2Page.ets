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

import { SwipeRefresherV2 } from '@ohos.arkui.advanced.SwipeRefresherV2';
import { Entry, ComponentV2, Text, Button, Scroll, Column, Row, TextInput, FlexAlign, Padding, Local, TextAlign } from '@kit.ArkUI';

@Entry
@ComponentV2
struct swipeRefresherV2Page {
  @Local isLoading: boolean = false;
  @Local contentText: string = 'Loading...';

  build(): void {
    Scroll() {
      Column() {
        Text('SwipeRefresherV2 Test Page')
          .fontSize(20)
          .fontWeight(500)
          .margin({ top: 20, bottom: 20 })
          .width('100%')
          .textAlign(TextAlign.Center)

        SwipeRefresherV2({
          isLoading: this.isLoading,
          content: this.contentText
        })
          .id('swipeRefresherV2_component')
          .width('100%')
          .height(200)

        Column() {
          Text('isLoading Property Test')
            .fontSize(16)
            .margin({ top: 30, bottom: 10 })

          Row() {
            Button('Set isLoading = true')
              .id('isLoading_true_button')
              .onClick(() => {
                this.isLoading = true;
              })
              .margin({ right: 10 })

            Button('Set isLoading = false')
              .id('isLoading_false_button')
              .onClick(() => {
                this.isLoading = false;
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)

          Text('content Property Test')
            .fontSize(16)
            .margin({ top: 30, bottom: 10 })

          TextInput({ placeholder: 'Enter custom loading text', text: this.contentText })
            .id('content_input')
            .width('80%')
            .height(40)
            .onChange((value: string) => {
              this.contentText = value;
            })
        }
        .width('100%')
        .padding(20)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}