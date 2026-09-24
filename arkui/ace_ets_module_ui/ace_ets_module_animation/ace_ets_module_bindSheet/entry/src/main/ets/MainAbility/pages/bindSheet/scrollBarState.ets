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
struct scrollBarState {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State isShow2: boolean = false
  @State isShow3: boolean = false

  @Builder
  myBuilder() {
    Column() {
      Button('close modal')
        .margin(10)
        .onClick(() => {
          this.isShow = false
          this.isShow1 = false
          this.isShow2 = false
          this.isShow3 = false
        })
        .id('close_scrollBarState')

      Column() {
        Column().backgroundColor(Color.Blue).height(200).width('100%')
        Column().backgroundColor(Color.Green).height(200).width('100%')
        Column().backgroundColor(Color.Blue).height(200).width('100%')
        Column().backgroundColor(Color.Green).height(200).width('100%')
        Column().backgroundColor(Color.Blue).height(200).width('100%')
        Column().backgroundColor(Color.Green).height(200).width('100%')
      }
    }
    .width('100%')
  }

  build() {
    Column({ space: 5 }) {
      Button('scrollBarState_Off')
        .height('8%')
        .id('btn_scrollBarState_Off')
        .onClick(() => {
          this.isShow = true
        })
        .bindSheet(this.isShow, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          scrollBarState: BarState.Off,
          preferType: SheetType.BOTTOM,
        })

      Button('scrollBarState_On')
        .height('8%')
        .id('btn_scrollBarState_On')
        .onClick(() => {
          this.isShow1 = true
        })
        .bindSheet(this.isShow1, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          scrollBarState: BarState.On,
          preferType: SheetType.BOTTOM,
        })

      Button('scrollBarState_Auto')
        .height('8%')
        .id('btn_scrollBarState_Auto')
        .onClick(() => {
          this.isShow2 = true
        })
        .bindSheet(this.isShow2, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          scrollBarState: BarState.Auto,
          preferType: SheetType.BOTTOM,
        })

      Button('scrollBarState_undefined')
        .height('8%')
        .id('btn_scrollBarState_undefined')
        .onClick(() => {
          this.isShow3 = true
        })
        .bindSheet(this.isShow3, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          scrollBarState: undefined,
          preferType: SheetType.BOTTOM,
        })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}
