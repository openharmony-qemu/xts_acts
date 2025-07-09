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

import componentSnapshot from '@ohos.arkui.componentSnapshot'
import image from '@ohos.multimedia.image'
import { Entry, Component, Column, Flex, Builder, FlexDirection, FlexAlign, ClickEvent, ItemAlign, Text, Divider, Button, Margin, TextAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
@Entry
@Component
struct OffscreenSnapshotExample {
  @State pixmap?: image.PixelMap = undefined

  @Builder
  RandomBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('Test menu item 1')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(10)
      Text('Test menu item 2')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
    }.width(100)
  }

  build() {
    Column() {
      // Button("click to generate offscreen UI snapshot")
      //   .onClick((e: ClickEvent) => {
      //     componentSnapshot.createFromBuilder(this.RandomBuilder.bind(this))
      //       .then((pixmap: image.PixelMap) => {
      //         this.pixmap = pixmap
      //         // save pixmap to file
      //         // ....
      //       })
      //   })
      //
      // Button("click to generate offscreen UI snapshot").margin({top:20} as Margin).key('crateFrom')
      //   .onClick((e: ClickEvent) => {
      //     componentSnapshot.createFromBuilder(this.RandomBuilder.bind(this),
      //       (error: Error, pixmap: image.PixelMap) => {
      //         this.pixmap = pixmap
      //         // save pixmap to file
      //         // ....
      //       })
      //   })

      Button("click to generate UI snapshot").margin({top:20} as Margin)
        .onClick((e: ClickEvent) => {
          componentSnapshot.get("root", (error: BusinessError<void> | null, pixmap: image.PixelMap | undefined): void => {
            this.pixmap = pixmap
            // save pixmap to file
            // ....
          })
        })

      Button("click to generate UI snapshot").margin({top:20} as Margin)
        .onClick((e: ClickEvent) => {
          componentSnapshot.get("root")
            .then((pixmap: image.PixelMap) => {
              this.pixmap = pixmap
              // save pixmap to file
              // ....
            })
        })


    }.width('80%').margin({ left: 10, top: 5, bottom: 5 } as Margin).height(200)
    .border({ color: '#880606', width: 2 })
  }
}