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

import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct titleBarHoverMode {
  @State isShow: boolean = false
  @State mySheetTitleBarHoverMode: SheetTitleBarHoverMode | undefined = undefined
  @State myTitle: SheetTitleOptions | undefined = { title: 'title', subtitle: 'subtitle' }
  @State myPreferType: SheetType = SheetType.BOTTOM
  @State myDragBar: boolean = false

  @Builder
  myBuilder() {
    Column() {
      Button('titleBarHoverMode_STANDARD')
        .margin(10)
        .id('btn_titleBarHoverMode_STANDARD')
        .onClick(() => {
          this.mySheetTitleBarHoverMode = SheetTitleBarHoverMode.STANDARD
          this.myTitle = { title: 'title', subtitle: 'subtitle' }
          this.myPreferType = SheetType.BOTTOM
          this.myDragBar = false
        })

      Button('titleBarHoverMode_STACK')
        .margin(10)
        .id('btn_titleBarHoverMode_STACK')
        .onClick(() => {
          this.mySheetTitleBarHoverMode = SheetTitleBarHoverMode.STACK
          this.myTitle = { title: 'title', subtitle: 'subtitle' }
          this.myPreferType = SheetType.BOTTOM
          this.myDragBar = false
        })

      Button('titleBarHoverMode_undefined')
        .margin(10)
        .id('btn_titleBarHoverMode_undefined')
        .onClick(() => {
          this.mySheetTitleBarHoverMode = undefined
          this.myTitle = { title: 'title', subtitle: 'subtitle' }
          this.myPreferType = SheetType.BOTTOM
          this.myDragBar = false
        })

      Button('titleBarHoverMode_withCustomTitle')
        .margin(10)
        .id('btn_titleBarHoverMode_withCustomTitle')
        .onClick(() => {
          this.mySheetTitleBarHoverMode = SheetTitleBarHoverMode.STACK
          this.myTitle = { title: 'title' }
          this.myPreferType = SheetType.SIDE
          this.myDragBar = true
        })

      Button('close modal')
        .margin(10)
        .onClick(() => {
          this.isShow = false
        })
        .id('close_titleBarHoverMode')

      Column() {
        Column().backgroundColor(Color.Orange).height(200).width('100%')
        Column().backgroundColor(Color.Pink).height(200).width('100%')
        Column().backgroundColor(Color.Orange).height(200).width('100%')
        Column().backgroundColor(Color.Pink).height(200).width('100%')
      }
    }
    .width('100%')
  }

  build() {
    Stack() {
      Column() {
        Button('open Sheet')
          .fontSize(20)
          .margin(10)
          .id('btn_open_titleBarHoverMode')
          .onClick(() => {
            this.isShow = true
          })
          .bindSheet($$this.isShow, this.myBuilder(), {
            height: 600,
            detents: [SheetSize.MEDIUM, SheetSize.LARGE],
            backgroundColor: Color.Transparent,
            systemMaterial: new uiMaterial.ImmersiveMaterial({
              style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            }),
            title: this.myTitle,
            titleBarHoverMode: this.mySheetTitleBarHoverMode,
            preferType: this.myPreferType,
            dragBar: this.myDragBar,
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
    }
  }
}
