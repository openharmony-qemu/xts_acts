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
import { Entry, ComponentV2,Text, Button, Scroll,
  Column, Row, TextInput, FlexAlign, Padding, Local, TextAlign } from '@kit.ArkUI';
import { ResourceStr } from '@ohos.arkui.component';

@Entry
@ComponentV2
struct SwipeRefresherV2ContentIsLoading {
  @Local isLoading: boolean = false;
  @Local contentText: ResourceStr = 'Loading...';

  build(): void {
    Scroll() {
      Column() {
        Text('SwipeRefresherV2 Test Page')
          .fontSize(12)
          .textAlign(TextAlign.Center)

        SwipeRefresherV2({
          isLoading: this.isLoading,
          content: this.contentText
        })
          .id('swipeRefresherV2_component')
          .width('100%')
          .height(100)

        Column() {
          Text('isLoading Property Test')
            .fontSize(12)

          Row() {
            Button('Set isLoading = true')
              .id('isLoading_true_button')
              .onClick(() => {
                this.isLoading = true;
              })
              .height(20)

            Button('Set isLoading = false')
              .id('isLoading_false_button')
              .onClick(() => {
                this.isLoading = false;
              })
              .height(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)

          Text('content Property Test')
            .fontSize(12)

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