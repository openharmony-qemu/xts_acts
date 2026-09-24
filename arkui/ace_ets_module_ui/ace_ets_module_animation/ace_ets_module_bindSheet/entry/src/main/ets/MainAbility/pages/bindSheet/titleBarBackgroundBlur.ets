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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct titleBarBackgroundBlur {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State isShow2: boolean = false
  @State isShow3: boolean = false
  @State isShow4: boolean = false
  @State isShow5: boolean = false

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
          this.isShow4 = false
          this.isShow5 = false
        })
        .id('close_titleBarBackgroundBlur')

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
    Column({ space: 5 }) {
      Button('titleBarBackgroundBlur_NONE')
        .height('8%')
        .id('btn_titleBarBackgroundBlur_NONE')
        .onClick(() => {
          this.isShow = true
        })
        .bindSheet(this.isShow, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          title: { title: 'title' },
          titleBarBackgroundBlur: {
            blurStyle: SheetTitleBarBackgroundBlur.NONE,
          },
          preferType: SheetType.BOTTOM,
        })

      Button('titleBarBackgroundBlur_GRADIENT')
        .height('8%')
        .id('btn_titleBarBackgroundBlur_GRADIENT')
        .onClick(() => {
          this.isShow1 = true
        })
        .bindSheet(this.isShow1, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          title: { title: 'title' },
          titleBarBackgroundBlur: {
            blurStyle: SheetTitleBarBackgroundBlur.GRADIENT,
          },
          preferType: SheetType.BOTTOM,
        })

      Button('titleBarBackgroundBlur_maskExtraHeight')
        .height('8%')
        .id('btn_titleBarBackgroundBlur_maskExtraHeight')
        .onClick(() => {
          this.isShow2 = true
        })
        .bindSheet(this.isShow2, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          title: { title: 'title' },
          titleBarBackgroundBlur: {
            blurStyle: SheetTitleBarBackgroundBlur.GRADIENT,
            maskExtraHeight: LengthMetrics.vp(100),
          },
          preferType: SheetType.BOTTOM,
        })

      Button('titleBarBackgroundBlur_maskColor')
        .height('8%')
        .id('btn_titleBarBackgroundBlur_maskColor')
        .onClick(() => {
          this.isShow3 = true
        })
        .bindSheet(this.isShow3, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          title: { title: 'title' },
          titleBarBackgroundBlur: {
            blurStyle: SheetTitleBarBackgroundBlur.GRADIENT,
            maskColor: Color.Gray,
          },
          preferType: SheetType.BOTTOM,
        })

      Button('titleBarBackgroundBlur_effectiveDistance')
        .height('8%')
        .id('btn_titleBarBackgroundBlur_effectiveDistance')
        .onClick(() => {
          this.isShow4 = true
        })
        .bindSheet(this.isShow4, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          title: { title: 'title' },
          titleBarBackgroundBlur: {
            blurStyle: SheetTitleBarBackgroundBlur.GRADIENT,
            effectiveDistance: LengthMetrics.vp(100),
          },
          preferType: SheetType.BOTTOM,
        })

      Button('titleBarBackgroundBlur_undefined')
        .height('8%')
        .id('btn_titleBarBackgroundBlur_undefined')
        .onClick(() => {
          this.isShow5 = true
        })
        .bindSheet(this.isShow5, this.myBuilder(), {
          height: 600,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          title: { title: 'title' },
          titleBarBackgroundBlur: undefined,
          preferType: SheetType.BOTTOM,
        })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}
