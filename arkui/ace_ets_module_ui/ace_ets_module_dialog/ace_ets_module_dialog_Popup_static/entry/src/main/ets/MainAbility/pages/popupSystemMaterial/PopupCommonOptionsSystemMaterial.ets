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
  Text,
  FlexAlign,
  ColumnOptions,
  RowOptions,
  wrapBuilder,
  Color,
  PopupCommonOptions
} from '@ohos.arkui.component';
import { ComponentContent, uiMaterial, SystemUiMaterial } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, PromptAction } from '@ohos.arkui.UIContext';

@Builder
function buildPopupText(): void {
  Column() {
    Text('Popup Content')
      .fontSize(20)
      .margin({ top: 20, bottom: 20 })
    Button('Close')
      .onClick(() => {
        let promptAction = AppStorage.get<PromptAction>('popupPromptAction');
        let content = AppStorage.get<ComponentContent<Object>>('popupContent');
        if (promptAction !== undefined && content !== undefined) {
          promptAction.closePopup(content);
        }
      })
  }
  .width('100%')
  .padding(20)
  .backgroundColor(Color.White)
}

@Entry
@Component
struct PopupCommonOptionsSystemMaterial {
  aboutToAppear(): void {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('PopupCommonOptionsSystemMaterial aboutToAppear error ' + error);
    }
  }

  openPopupWithMaterial(buttonId: string, systemMaterial: SystemUiMaterial | undefined): void {
    let context = this.getUIContext();
    let promptActionInstance = context.getPromptAction();
    let contentNode = new ComponentContent<Object>(context, wrapBuilder(buildPopupText));
    AppStorage.setOrCreate<PromptAction>('popupPromptAction', promptActionInstance);
    AppStorage.setOrCreate<ComponentContent<Object>>('popupContent', contentNode);
    let popupOptions: PopupCommonOptions = { systemMaterial: systemMaterial };
    promptActionInstance.openPopup(contentNode, { id: buttonId }, popupOptions);
  }

  @Builder
  buildFirstRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('undefined')
        .id('undefined')
        .height('8%')
        .onClick(() => {
          this.openPopupWithMaterial('undefined', undefined);
        })

      Button('hdsMaterial THICK')
        .id('hds_thick')
        .height('8%')
        .onClick(() => {
          let material: SystemUiMaterial | undefined = undefined;
          this.openPopupWithMaterial('hds_thick', material);
        })
    }
  }

  @Builder
  buildSecondRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('SEMI_TRANSPARENT')
        .id('semi_transparent')
        .height('8%')
        .onClick(() => {
          this.openPopupWithMaterial(
            'semi_transparent',
            new uiMaterial.Material({ type: uiMaterial.MaterialType.SEMI_TRANSPARENT })
          );
        })

      Button('Immersive THICK')
        .id('immersive_thick')
        .height('8%')
        .onClick(() => {
          this.openPopupWithMaterial(
            'immersive_thick',
            new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.THICK })
          );
        })
    }
  }

  @Builder
  buildThirdRow(): void {
    Row({ space: 5 } as RowOptions) {
      Button('Immersive ULTRA_THIN')
        .id('immersive_ultra_thin')
        .height('8%')
        .onClick(() => {
          this.openPopupWithMaterial(
            'immersive_ultra_thin',
            new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN })
          );
        })

      Button('NONE')
        .id('none')
        .height('8%')
        .onClick(() => {
          this.openPopupWithMaterial(
            'none',
            new uiMaterial.Material({ type: uiMaterial.MaterialType.NONE })
          );
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
