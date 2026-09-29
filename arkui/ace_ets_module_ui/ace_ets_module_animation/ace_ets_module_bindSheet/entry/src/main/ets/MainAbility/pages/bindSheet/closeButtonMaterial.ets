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
struct closeButtonMaterial {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State isShow2: boolean = false
  @State isShow3: boolean = false
  @State isShow5: boolean = false

  @State myCloseIconMaterial: SystemUiMaterial | undefined = new uiMaterial.ImmersiveMaterial({
    style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
  })
  @State myCloseIconMaterialThin: SystemUiMaterial | undefined = new uiMaterial.ImmersiveMaterial({
    style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
    colorInvert: true,
  })
  @State mySEMI: SystemUiMaterial | undefined =
    new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
  
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
          
          this.isShow5 = false
        })
        .id('close_closeButtonMaterial')
    }
    .width('100%')
  }

  build() {
    Column({ space: 5 }) {
      Button('closeButtonMaterial_ULTRA_THICK')
        .height('8%')
        .id('btn_closeButtonMaterial_ULTRA_THICK')
        .onClick(() => {
          this.isShow = true
        })
        .bindSheet(this.isShow, this.myBuilder(), {
          height: 400,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          closeButtonMaterial: this.myCloseIconMaterial,
          title: { title: 'title', subtitle: 'subtitle' },
          preferType: SheetType.BOTTOM,
        })

      Button('closeButtonMaterial_ULTRA_THIN')
        .height('8%')
        .id('btn_closeButtonMaterial_ULTRA_THIN')
        .onClick(() => {
          this.isShow1 = true
        })
        .bindSheet(this.isShow1, this.myBuilder(), {
          height: 400,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          closeButtonMaterial: this.myCloseIconMaterialThin,
          title: { title: 'title', subtitle: 'subtitle' },
          preferType: SheetType.BOTTOM,
        })

      Button('closeButtonMaterial_undefined')
        .height('8%')
        .id('btn_closeButtonMaterial_undefined')
        .onClick(() => {
          this.isShow2 = true
        })
        .bindSheet(this.isShow2, this.myBuilder(), {
          height: 400,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          closeButtonMaterial: undefined,
          title: { title: 'title', subtitle: 'subtitle' },
          preferType: SheetType.BOTTOM,
        })

      Button('closeButtonMaterial_SEMI')
        .height('8%')
        .id('btn_closeButtonMaterial_SEMI')
        .onClick(() => {
          this.isShow3 = true
        })
        .bindSheet(this.isShow3, this.myBuilder(), {
          height: 400,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          closeButtonMaterial: this.mySEMI,
          title: { title: 'title', subtitle: 'subtitle' },
          preferType: SheetType.BOTTOM,
        })

     

      Button('closeButtonMaterial_empty')
        .height('8%')
        .id('btn_closeButtonMaterial_empty')
        .onClick(() => {
          this.isShow5 = true
        })
        .bindSheet(this.isShow5, this.myBuilder(), {
          height: 400,
          backgroundColor: Color.Transparent,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          }),
          closeButtonMaterial: uiMaterial.Material.empty,
          title: { title: 'title', subtitle: 'subtitle' },
          preferType: SheetType.BOTTOM,
        })
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}
