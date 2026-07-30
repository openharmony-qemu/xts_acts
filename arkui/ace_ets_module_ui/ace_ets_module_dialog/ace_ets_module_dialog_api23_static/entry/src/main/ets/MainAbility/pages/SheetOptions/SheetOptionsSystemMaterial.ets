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

import { uiMaterial, Entry, Component, Column ,ColumnOptions, Text, FontWeight,
  Row, FlexAlign, HorizontalAlign, Color, State, Divider, Button, CustomDialogController,
  CustomDialog, DialogAlignment, ComponentContent, UIContext,SheetSize,$$} from '@kit.ArkUI';

@Entry
@Component
struct SheetOptionsSystemMaterial {
  @State isShowSheetUndefined: boolean = false;
  @State isShowSheetHdsThick: boolean = false;
  @State isShowSheetSemiTransparent: boolean = false;
  @State isShowSheetImmersiveThick: boolean = false;
  @State isShowSheetImmersiveUltraThin: boolean = false;
  @State isShowSheetNone: boolean = false;
  
  @Builder
  sheetBuilder() {
    Column() {
      Text('Sheet Content')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('Close Sheet')
        .onClick(() => {
          this.isShowSheetUndefined = false;
          this.isShowSheetHdsThick = false;
          this.isShowSheetSemiTransparent = false;
          this.isShowSheetImmersiveThick = false;
          this.isShowSheetImmersiveUltraThin = false;
          this.isShowSheetNone = false;
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      Row() {
        Button('undefined')
          .id('undefined')
          .height('8%')
          .onClick(() => {
            this.isShowSheetUndefined = true;
          })
          .bindSheet($$(this.isShowSheetUndefined), this.sheetBuilder, {
            height: SheetSize.MEDIUM,
            systemMaterial: undefined
          })

        Button('hdsMaterial THICK')
          .id('hds_thick')
          .height('8%')
          .onClick(() => {
            this.isShowSheetHdsThick = true;
          })
          .bindSheet($$(this.isShowSheetHdsThick), this.sheetBuilder, {
            height: SheetSize.MEDIUM,
            systemMaterial: undefined
          })
      }

      Row() {
        Button('SEMI_TRANSPARENT')
          .id('semi_transparent')
          .height('8%')
          .onClick(() => {
            this.isShowSheetSemiTransparent = true;
          })
          .bindSheet($$(this.isShowSheetSemiTransparent), this.sheetBuilder, {
            height: SheetSize.MEDIUM,
            systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
          })

        Button('Immersive THICK')
          .id('immersive_thick')
          .height('8%')
          .onClick(() => {
            this.isShowSheetImmersiveThick = true;
          })
          .bindSheet($$(this.isShowSheetImmersiveThick), this.sheetBuilder, {
            height: SheetSize.MEDIUM,
            systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK })
          })
      }

      Row() {
        Button('Immersive ULTRA_THIN')
          .id('immersive_ultra_thin')
          .height('8%')
          .onClick(() => {
            this.isShowSheetImmersiveUltraThin = true;
          })
          .bindSheet($$(this.isShowSheetImmersiveUltraThin), this.sheetBuilder, {
            height: SheetSize.MEDIUM,
            systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
          })

        Button('NONE')
          .id('none')
          .height('8%')
          .onClick(() => {
            this.isShowSheetNone = true;
          })
          .bindSheet($$(this.isShowSheetNone), this.sheetBuilder, {
            height: SheetSize.MEDIUM,
            systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE })
          })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}