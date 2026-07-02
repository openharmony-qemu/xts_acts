'use static';
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


import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  FlexAlign,
  ColumnOptions,
  RowOptions,
  PopupOptions
} from '@ohos.arkui.component';
import { uiMaterial } from '@kit.ArkUI';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct PopupOptionsSystemMaterial {
  @State isShowPopupUndefined: boolean = false;
  @State isShowPopupHdsThick: boolean = false;
  @State isShowPopupSemiTransparent: boolean = false;
  @State isShowPopupImmersiveThick: boolean = false;
  @State isShowPopupImmersiveUltraThin: boolean = false;
  @State isShowPopupNone: boolean = false;

  aboutToAppear(): void {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('PopupOptionsSystemMaterial aboutToAppear error ' + error);
    }
  }

  @Builder
  buildFirstRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('undefined')
        .id('undefined')
        .height('8%')
        .bindPopup(this.isShowPopupUndefined, {
          message: 'PopupOptions Undefined Test',
          systemMaterial: undefined,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.isShowPopupUndefined = false;
            }
          }
        } as PopupOptions)
        .onClick(() => {
          this.isShowPopupUndefined = !this.isShowPopupUndefined;
        })

      Button('hdsMaterial THICK')
        .id('hds_thick')
        .height('8%')
        .bindPopup(this.isShowPopupHdsThick, {
          message: 'PopupOptions HDS THICK Test',
          systemMaterial: undefined,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.isShowPopupHdsThick = false;
            }
          }
        } as PopupOptions)
        .onClick(() => {
          this.isShowPopupHdsThick = !this.isShowPopupHdsThick;
        })
    }
  }

  @Builder
  buildSecondRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('SEMI_TRANSPARENT')
        .id('semi_transparent')
        .height('8%')
        .bindPopup(this.isShowPopupSemiTransparent, {
          message: 'PopupOptions SEMI_TRANSPARENT Test',
          systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT }),
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.isShowPopupSemiTransparent = false;
            }
          }
        } as PopupOptions)
        .onClick(() => {
          this.isShowPopupSemiTransparent = !this.isShowPopupSemiTransparent;
        })

      Button('Immersive THICK')
        .id('immersive_thick')
        .height('8%')
        .bindPopup(this.isShowPopupImmersiveThick, {
          message: 'PopupOptions Immersive THICK Test',
          systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK }),
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.isShowPopupImmersiveThick = false;
            }
          }
        } as PopupOptions)
        .onClick(() => {
          this.isShowPopupImmersiveThick = !this.isShowPopupImmersiveThick;
        })
    }
  }

  @Builder
  buildThirdRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('Immersive ULTRA_THIN')
        .id('immersive_ultra_thin')
        .height('8%')
        .bindPopup(this.isShowPopupImmersiveUltraThin, {
          message: 'PopupOptions Immersive ULTRA_THIN Test',
          systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN }),
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.isShowPopupImmersiveUltraThin = false;
            }
          }
        } as PopupOptions)
        .onClick(() => {
          this.isShowPopupImmersiveUltraThin = !this.isShowPopupImmersiveUltraThin;
        })

      Button('NONE')
        .id('none')
        .height('8%')
        .bindPopup(this.isShowPopupNone, {
          message: 'PopupOptions NONE Test',
          systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE }),
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.isShowPopupNone = false;
            }
          }
        } as PopupOptions)
        .onClick(() => {
          this.isShowPopupNone = !this.isShowPopupNone;
        })
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
