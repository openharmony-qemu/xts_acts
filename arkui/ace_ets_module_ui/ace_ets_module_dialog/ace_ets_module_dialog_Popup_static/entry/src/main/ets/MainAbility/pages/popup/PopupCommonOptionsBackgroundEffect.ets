'use static'
/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import {
  Entry, Component, Column, Row, Button, Text, FlexAlign, ColumnOptions, RowOptions,
  wrapBuilder, Color, PopupCommonOptions, AdaptiveColor, BlurStyleActivePolicy,
} from '@ohos.arkui.component';
import { ComponentContent } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, PromptAction } from '@ohos.arkui.UIContext';

@Builder
function buildPopupText(): void {
  Column() {
    Text('Popup Content')
      .fontSize(20)
      .margin({ top: 20, bottom: 20 })
    Button('Close')
      .id('close_popup')
      .onClick((): void => {
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
struct PopupCommonOptionsBackgroundEffect {
  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('PopupCommonOptionsBackgroundEffect router init error: ' + error);
    }
  }

  openPopupWithOptions(buttonId: string, popupOptions: PopupCommonOptions): void {
    let context = this.getUIContext();
    let promptActionInstance = context.getPromptAction();
    let contentNode = new ComponentContent<Object>(context, wrapBuilder(buildPopupText));
    AppStorage.setOrCreate<PromptAction>('popupPromptAction', promptActionInstance);
    AppStorage.setOrCreate<ComponentContent<Object>>('popupContent', contentNode);
    promptActionInstance.openPopup(contentNode, { id: buttonId }, popupOptions);
  }

  @Builder
  buildRow0(): void {
    Row({ space: 5 } as RowOptions) {
      Button('radius_0')
        .id('radius_0')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions('radius_0', { backgroundEffect: { radius: 0 } } as PopupCommonOptions);
        })
      Button('radius_20')
        .id('radius_20')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions('radius_20', { backgroundEffect: { radius: 20 } } as PopupCommonOptions);
        })
    }
  }
  @Builder
  buildRow1(): void {
    Row({ space: 5 } as RowOptions) {
      Button('radius_60')
        .id('radius_60')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions('radius_60', { backgroundEffect: { radius: 60 } } as PopupCommonOptions);
        })
      Button('saturation_0')
        .id('saturation_0')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'saturation_0',
            { backgroundEffect: { radius: 20, saturation: 0 } } as PopupCommonOptions,
          );
        })
    }
  }
  @Builder
  buildRow2(): void {
    Row({ space: 5 } as RowOptions) {
      Button('saturation_1')
        .id('saturation_1')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'saturation_1',
            { backgroundEffect: { radius: 20, saturation: 1 } } as PopupCommonOptions,
          );
        })
      Button('saturation_2')
        .id('saturation_2')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'saturation_2',
            { backgroundEffect: { radius: 20, saturation: 2 } } as PopupCommonOptions,
          );
        })
    }
  }
  @Builder
  buildRow3(): void {
    Row({ space: 5 } as RowOptions) {
      Button('brightness_0')
        .id('brightness_0')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'brightness_0',
            { backgroundEffect: { radius: 20, brightness: 0 } } as PopupCommonOptions,
          );
        })
      Button('brightness_1')
        .id('brightness_1')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'brightness_1',
            { backgroundEffect: { radius: 20, brightness: 1 } } as PopupCommonOptions,
          );
        })
    }
  }
  @Builder
  buildRow4(): void {
    Row({ space: 5 } as RowOptions) {
      Button('brightness_2')
        .id('brightness_2')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'brightness_2',
            { backgroundEffect: { radius: 20, brightness: 2 } } as PopupCommonOptions,
          );
        })
      Button('color_red')
        .id('color_red')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'color_red',
            { backgroundEffect: { radius: 20, color: Color.Red } } as PopupCommonOptions,
          );
        })
    }
  }
  @Builder
  buildRow5(): void {
    Row({ space: 5 } as RowOptions) {
      Button('color_string')
        .id('color_string')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'color_string',
            { backgroundEffect: { radius: 20, color: '#80FF0000' } } as PopupCommonOptions,
          );
        })
      Button('adaptiveColor_DEFAULT')
        .id('adaptiveColor_DEFAULT')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'adaptiveColor_DEFAULT',
            {
              backgroundEffect: {
                radius: 20, adaptiveColor: AdaptiveColor.DEFAULT,
              },
            } as PopupCommonOptions,
          );
        })
    }
  }
  @Builder
  buildRow6(): void {
    Row({ space: 5 } as RowOptions) {
      Button('adaptiveColor_AVERAGE')
        .id('adaptiveColor_AVERAGE')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'adaptiveColor_AVERAGE',
            {
              backgroundEffect: {
                radius: 60, color: '#80FF0000',
                adaptiveColor: AdaptiveColor.AVERAGE,
              },
            } as PopupCommonOptions,
          );
        })
      Button('policy_ALWAYS_ACTIVE')
        .id('policy_ALWAYS_ACTIVE')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'policy_ALWAYS_ACTIVE',
            {
              backgroundEffect: {
                radius: 20, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              },
            } as PopupCommonOptions,
          );
        })
    }
  }
  @Builder
  buildRow7(): void {
    Row({ space: 5 } as RowOptions) {
      Button('policy_ALWAYS_INACTIVE_inactiveColor')
        .id('policy_ALWAYS_INACTIVE_inactiveColor')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'policy_ALWAYS_INACTIVE_inactiveColor',
            {
              backgroundEffect: {
                radius: 20,
                policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
                inactiveColor: Color.Orange,
              },
            } as PopupCommonOptions,
          );
        })
      Button('combinedOptions')
        .id('combinedOptions')
        .height('5%')
        .width('30%')
        .onClick((): void => {
          this.openPopupWithOptions(
            'combinedOptions',
            {
              backgroundEffect: {
                radius: 60, saturation: 2, brightness: 1, color: '#80FF0000',
                adaptiveColor: AdaptiveColor.DEFAULT,
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
                inactiveColor: Color.Blue,
              },
            } as PopupCommonOptions,
          );
        })
    }
  }

  build(): void {
    Column({ space: 5 } as ColumnOptions) {
      this.buildRow0()
      this.buildRow1()
      this.buildRow2()
      this.buildRow3()
      this.buildRow4()
      this.buildRow5()
      this.buildRow6()
      this.buildRow7()
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}
