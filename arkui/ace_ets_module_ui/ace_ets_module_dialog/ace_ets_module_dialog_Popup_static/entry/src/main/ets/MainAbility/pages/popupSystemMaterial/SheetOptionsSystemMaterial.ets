/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  Text,
  FlexAlign,
  ColumnOptions,
  RowOptions,
  SheetSize,
  SheetOptions,
  $$,
  Color
} from '@ohos.arkui.component';
import { uiMaterial } from '@kit.ArkUI';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SheetOptionsSystemMaterial {
  @State isShowSheetUndefined: boolean = false;
  @State isShowSheetHdsThick: boolean = false;
  @State isShowSheetSemiTransparent: boolean = false;
  @State isShowSheetImmersiveThick: boolean = false;
  @State isShowSheetImmersiveUltraThin: boolean = false;
  @State isShowSheetNone: boolean = false;

  aboutToAppear(): void {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('SheetOptionsSystemMaterial aboutToAppear error ' + error);
    }
  }

  closeAllSheets(): void {
    this.isShowSheetUndefined = false;
    this.isShowSheetHdsThick = false;
    this.isShowSheetSemiTransparent = false;
    this.isShowSheetImmersiveThick = false;
    this.isShowSheetImmersiveUltraThin = false;
    this.isShowSheetNone = false;
  }

  @Builder
  sheetBuilder(): void {
    Column() {
      Text('Sheet Content')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('Close Sheet')
        .onClick(() => {
          this.closeAllSheets();
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  @Builder
  buildFirstRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('undefined')
        .id('undefined')
        .height('8%')
        .onClick(() => {
          this.isShowSheetUndefined = true;
        })
        .bindSheet($$(this.isShowSheetUndefined), this.sheetBuilder, {
          height: SheetSize.MEDIUM,
          systemMaterial: undefined
        } as SheetOptions)

      Button('hdsMaterial THICK')
        .id('hds_thick')
        .height('8%')
        .onClick(() => {
          this.isShowSheetHdsThick = true;
        })
        .bindSheet($$(this.isShowSheetHdsThick), this.sheetBuilder, {
          height: SheetSize.MEDIUM,
          systemMaterial: undefined
        } as SheetOptions)
    }
  }

  @Builder
  buildSecondRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('SEMI_TRANSPARENT')
        .id('semi_transparent')
        .height('8%')
        .onClick(() => {
          this.isShowSheetSemiTransparent = true;
        })
        .bindSheet($$(this.isShowSheetSemiTransparent), this.sheetBuilder, {
          height: SheetSize.MEDIUM,
          systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
        } as SheetOptions)

      Button('Immersive THICK')
        .id('immersive_thick')
        .height('8%')
        .onClick(() => {
          this.isShowSheetImmersiveThick = true;
        })
        .bindSheet($$(this.isShowSheetImmersiveThick), this.sheetBuilder, {
          height: SheetSize.MEDIUM,
          systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK })
        } as SheetOptions)
    }
  }

  @Builder
  buildThirdRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('Immersive ULTRA_THIN')
        .id('immersive_ultra_thin')
        .height('8%')
        .onClick(() => {
          this.isShowSheetImmersiveUltraThin = true;
        })
        .bindSheet($$(this.isShowSheetImmersiveUltraThin), this.sheetBuilder, {
          height: SheetSize.MEDIUM,
          systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
        } as SheetOptions)

      Button('NONE')
        .id('none')
        .height('8%')
        .onClick(() => {
          this.isShowSheetNone = true;
        })
        .bindSheet($$(this.isShowSheetNone), this.sheetBuilder, {
          height: SheetSize.MEDIUM,
          systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE })
        } as SheetOptions)
    }
  }

  build(): void {
    Column({ space: 5 } as ColumnOptions) {
      this.buildFirstRow()
      this.buildSecondRow()
      this.buildThirdRow()
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}
