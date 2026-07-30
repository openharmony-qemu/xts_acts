'use static';
/**
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
  Entry, Component, Column, Row, Button, Text, Color, AdaptiveColor, BlurStyle,
  BlurStyleActivePolicy, ThemeColorMode, FlexAlign, ColumnOptions, RowOptions,
  wrapBuilder, PopupCommonOptions, BackgroundBlurStyleOptions, ResourceColor, Builder,
} from '@ohos.arkui.component';
import { ComponentContent } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router, PromptAction } from '@ohos.arkui.UIContext';

@Builder
function buildPopupText(): void {
  Column() {
    Text('Popup Content').fontSize(20).margin({ top: 20, bottom: 20 })
    Button('Close_popup').id('close_popup_btn').onClick((): void => {
      let promptAction = AppStorage.get<PromptAction>('popupPromptAction');
      let content = AppStorage.get<ComponentContent<Object>>('popupContent');
      if (promptAction !== undefined && content !== undefined) {
        promptAction.closePopup(content);
      }
    })
  }.width('100%').padding(20).backgroundColor(Color.White)
}

@Entry
@Component
struct PopupCommonOptionsBackgroundBlurStyleOptions {
  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
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
      let blurOpts1: BackgroundBlurStyleOptions = { policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE };
      let popupOpts1: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts1
      };
      Button('policy_FOLLOWS_WINDOW_ACTIVE_STATE').id('policy_FOLLOWS_WINDOW_ACTIVE_STATE').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('policy_FOLLOWS_WINDOW_ACTIVE_STATE', popupOpts1); })
      let blurOpts2: BackgroundBlurStyleOptions = { policy: BlurStyleActivePolicy.ALWAYS_ACTIVE };
      let popupOpts2: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts2
      };
      Button('policy_ALWAYS_ACTIVE').id('policy_ALWAYS_ACTIVE').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('policy_ALWAYS_ACTIVE', popupOpts2); })
    }
  }
  @Builder
  buildRow1(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts3: BackgroundBlurStyleOptions = { policy: BlurStyleActivePolicy.ALWAYS_INACTIVE };
      let popupOpts3: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts3
      };
      Button('policy_ALWAYS_INACTIVE').id('policy_ALWAYS_INACTIVE').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('policy_ALWAYS_INACTIVE', popupOpts3); })
      let blurOpts4: BackgroundBlurStyleOptions = {
        policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        inactiveColor: Color.Red
      };
      let popupOpts4: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts4
      };
      Button('inactiveColor_red').id('inactiveColor_red').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('inactiveColor_red', popupOpts4); })
    }
  }
  @Builder
  buildRow2(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts5: BackgroundBlurStyleOptions = {
        policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        inactiveColor: '#FFFF0000'
      };
      let popupOpts5: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts5
      };
      Button('inactiveColor_string').id('inactiveColor_string').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('inactiveColor_string', popupOpts5); })
      let blurOpts6: BackgroundBlurStyleOptions = {
        policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        inactiveColor: -65536 as int
      };
      let popupOpts6: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts6
      };
      Button('inactiveColor_number').id('inactiveColor_number').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('inactiveColor_number', popupOpts6); })
    }
  }
  @Builder
  buildRow3(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts7: BackgroundBlurStyleOptions = { colorMode: ThemeColorMode.LIGHT };
      let popupOpts7: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts7
      };
      Button('colorMode_LIGHT').id('colorMode_LIGHT').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('colorMode_LIGHT', popupOpts7); })
      let blurOpts8: BackgroundBlurStyleOptions = { colorMode: ThemeColorMode.DARK };
      let popupOpts8: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts8
      };
      Button('colorMode_DARK').id('colorMode_DARK').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('colorMode_DARK', popupOpts8); })
    }
  }
  @Builder
  buildRow4(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts9: BackgroundBlurStyleOptions = { adaptiveColor: AdaptiveColor.DEFAULT };
      let popupOpts9: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts9
      };
      Button('adaptiveColor_DEFAULT').id('adaptiveColor_DEFAULT').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('adaptiveColor_DEFAULT', popupOpts9); })
      let blurOpts10: BackgroundBlurStyleOptions = { adaptiveColor: AdaptiveColor.AVERAGE };
      let popupOpts10: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts10
      };
      Button('adaptiveColor_AVERAGE').id('adaptiveColor_AVERAGE').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('adaptiveColor_AVERAGE', popupOpts10); })
    }
  }
  @Builder
  buildRow5(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts11: BackgroundBlurStyleOptions = { scale: 0.0 };
      let popupOpts11: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts11
      };
      Button('scale_0').id('scale_0').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('scale_0', popupOpts11); })
      let blurOpts12: BackgroundBlurStyleOptions = { scale: 1.0 };
      let popupOpts12: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts12
      };
      Button('scale_1').id('scale_1').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('scale_1', popupOpts12); })
    }
  }
  @Builder
  buildRow6(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts13: BackgroundBlurStyleOptions = { scale: 2.0 };
      let popupOpts13: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts13
      };
      Button('scale_2').id('scale_2').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('scale_2', popupOpts13); })
      let blurOpts14: BackgroundBlurStyleOptions = {
        policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
        inactiveColor: Color.Blue,
        colorMode: ThemeColorMode.LIGHT,
        adaptiveColor: AdaptiveColor.DEFAULT,
        scale: 1.0
      };
      let popupOpts14: PopupCommonOptions = {
        backgroundBlurStyle: BlurStyle.Regular,
        backgroundBlurStyleOptions: blurOpts14
      };
      Button('combinedOptions').id('combinedOptions').height('5%').width('30%')
        .onClick((): void => { this.openPopupWithOptions('combinedOptions', popupOpts14); })
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
    }
    .justifyContent(FlexAlign.Start).height('100%').width('100%')
  }
}
