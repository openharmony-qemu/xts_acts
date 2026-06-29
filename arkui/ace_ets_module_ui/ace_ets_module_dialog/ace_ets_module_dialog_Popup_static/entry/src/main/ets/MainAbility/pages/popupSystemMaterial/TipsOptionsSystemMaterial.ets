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
  FlexAlign,
  ColumnOptions,
  RowOptions
} from '@ohos.arkui.component';
import { uiMaterial } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TipsOptionsSystemMaterial {
  aboutToAppear(): void {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('TipsOptionsSystemMaterial aboutToAppear error ' + error);
    }
  }

  @Builder
  buildFirstRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('undefined')
        .id('undefined')
        .height('8%')
        .bindTips('TipsOptions Undefined Test', {
          appearingTime: 100,
          disappearingTime: 100,
          systemMaterial: undefined
        })

      Button('hdsMaterial THICK')
        .id('hds_thick')
        .height('8%')
        .bindTips('TipsOptions HDS THICK Test', {
          appearingTime: 100,
          disappearingTime: 100,
          systemMaterial: undefined
        })
    }
  }

  @Builder
  buildSecondRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('SEMI_TRANSPARENT')
        .id('semi_transparent')
        .height('8%')
        .bindTips('TipsOptions SEMI_TRANSPARENT Test', {
          appearingTime: 100,
          disappearingTime: 100,
          systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
        })

      Button('Immersive THICK')
        .id('immersive_thick')
        .height('8%')
        .bindTips('TipsOptions Immersive THICK Test', {
          appearingTime: 100,
          disappearingTime: 100,
          systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK })
        })
    }
  }

  @Builder
  buildThirdRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('Immersive ULTRA_THIN')
        .id('immersive_ultra_thin')
        .height('8%')
        .bindTips('TipsOptions Immersive ULTRA_THIN Test', {
          appearingTime: 100,
          disappearingTime: 100,
          systemMaterial: new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
        })

      Button('NONE')
        .id('none')
        .height('8%')
        .bindTips('TipsOptions NONE Test', {
          appearingTime: 100,
          disappearingTime: 100,
          systemMaterial: new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE })
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
