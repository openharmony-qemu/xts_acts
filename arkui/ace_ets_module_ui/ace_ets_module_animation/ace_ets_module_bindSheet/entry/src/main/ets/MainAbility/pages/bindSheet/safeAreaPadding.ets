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

@Entry
@Component
struct safeAreaPadding {
  @State isShow: boolean = false
  @State mySheetTitleBarHoverMode: SheetTitleBarHoverMode | undefined = undefined
  @State myTitle: SheetTitleOptions | undefined = { title: 'title', subtitle: 'subtitle' }
  @State myPreferType: SheetType = SheetType.BOTTOM
  @State myDragBar: boolean = false
  @State strategyApplied: boolean = false

  aboutToAppear(): void {
    console.info("safeAreaPadding aboutToAppear start")
  }

  @Builder
  myBuilder() {
    Column() {
      Button('safeAreaPadding_SAFE_AREA_PADDING')
        .margin(10)
        .id('btn_safeAreaPadding_SAFE_AREA_PADDING')
        .onClick(() => {
          this.mySheetTitleBarHoverMode = SheetTitleBarHoverMode.SAFE_AREA_PADDING
          this.myTitle = { title: 'title', subtitle: 'subtitle' }
          this.myPreferType = SheetType.BOTTOM
          this.myDragBar = false
        })

      Button('safeAreaPadding_strategyApplied')
        .margin(10)
        .id('btn_safeAreaPadding_strategyApplied')
        .onClick(() => {
          this.getUIContext()?.applyDefaultImmersiveStrategy(
            ImmersiveStrategy.BIND_SHEET_EXPAND_SAFE_AREA)
          this.strategyApplied = true
          this.mySheetTitleBarHoverMode = undefined
          this.myTitle = { title: 'title', subtitle: 'subtitle' }
          this.myPreferType = SheetType.BOTTOM
          this.myDragBar = false
        })

      Button('safeAreaPadding_strategyWithExplicitStandard')
        .margin(10)
        .id('btn_safeAreaPadding_strategyWithExplicitStandard')
        .onClick(() => {
          this.getUIContext()?.applyDefaultImmersiveStrategy(
            ImmersiveStrategy.BIND_SHEET_EXPAND_SAFE_AREA)
          this.strategyApplied = true
          this.mySheetTitleBarHoverMode = SheetTitleBarHoverMode.STANDARD
          this.myTitle = { title: 'title', subtitle: 'subtitle' }
          this.myPreferType = SheetType.BOTTOM
          this.myDragBar = false
        })

      Button('safeAreaPadding_strategyWithExplicitStack')
        .margin(10)
        .id('btn_safeAreaPadding_strategyWithExplicitStack')
        .onClick(() => {
          this.getUIContext()?.applyDefaultImmersiveStrategy(
            ImmersiveStrategy.BIND_SHEET_EXPAND_SAFE_AREA)
          this.strategyApplied = true
          this.mySheetTitleBarHoverMode = SheetTitleBarHoverMode.STACK
          this.myTitle = { title: 'title', subtitle: 'subtitle' }
          this.myPreferType = SheetType.BOTTOM
          this.myDragBar = false
        })

      Button('close modal')
        .margin(10)
        .onClick(() => {
          this.isShow = false
        })
        .id('close_safeAreaPadding')

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
          .id('btn_open_safeAreaPadding')
          .onClick(() => {
            this.isShow = true
          })
          .bindSheet($$this.isShow, this.myBuilder(), {
            height: 600,
            detents: [SheetSize.MEDIUM, SheetSize.LARGE],
            backgroundColor: Color.Transparent,
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
