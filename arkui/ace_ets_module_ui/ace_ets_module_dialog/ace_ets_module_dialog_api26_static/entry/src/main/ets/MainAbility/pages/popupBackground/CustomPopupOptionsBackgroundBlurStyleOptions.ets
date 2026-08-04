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
  Entry, Component, Column, Row, Button, Text, Placement, Color, AdaptiveColor,
  BlurStyle, BlurStyleActivePolicy, ThemeColorMode, FlexAlign, ColumnOptions, RowOptions,
  PopupOptions, CustomPopupOptions, PopupCommonOptions, BackgroundBlurStyleOptions,
  ResourceColor, Builder,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, PromptAction } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CustomPopupOptionsBackgroundBlurStyleOptions {
  @State handlePopup1: boolean = false;
  @State handlePopup2: boolean = false;
  @State handlePopup3: boolean = false;
  @State handlePopup4: boolean = false;
  @State handlePopup5: boolean = false;
  @State handlePopup6: boolean = false;
  @State handlePopup7: boolean = false;
  @State handlePopup8: boolean = false;
  @State handlePopup9: boolean = false;
  @State handlePopup10: boolean = false;
  @State handlePopup11: boolean = false;
  @State handlePopup12: boolean = false;
  @State handlePopup13: boolean = false;
  @State handlePopup14: boolean = false;

  aboutToAppear(): void {
    AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
  }

  @Builder
  customPopupBuilder(closeCallback: () => void): void {
    Column() {
      Text('CustomPopupOptions Test').fontSize(20).margin({ top: 20, bottom: 20 })
      Button('Close_popup').id('close_popup_btn').onClick((): void => { closeCallback(); })
    }.width('100%').padding(20).backgroundColor(Color.White)
  }
  @Builder
  buildRow0(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts1: BackgroundBlurStyleOptions = { policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE };
      let popupOpts1: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup1 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts1,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup1 = false; } }
      };
      Button('policy_FOLLOWS_WINDOW_ACTIVE_STATE').id('policy_FOLLOWS_WINDOW_ACTIVE_STATE').height('5%').width('30%')
        .bindPopup(this.handlePopup1, popupOpts1)
        .onClick((): void => { this.handlePopup1 = !this.handlePopup1; })
      let blurOpts2: BackgroundBlurStyleOptions = { policy: BlurStyleActivePolicy.ALWAYS_ACTIVE };
      let popupOpts2: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup2 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts2,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup2 = false; } }
      };
      Button('policy_ALWAYS_ACTIVE').id('policy_ALWAYS_ACTIVE').height('5%').width('30%')
        .bindPopup(this.handlePopup2, popupOpts2)
        .onClick((): void => { this.handlePopup2 = !this.handlePopup2; })
    }
  }
  @Builder
  buildRow1(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts3: BackgroundBlurStyleOptions = { policy: BlurStyleActivePolicy.ALWAYS_INACTIVE };
      let popupOpts3: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup3 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts3,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup3 = false; } }
      };
      Button('policy_ALWAYS_INACTIVE').id('policy_ALWAYS_INACTIVE').height('5%').width('30%')
        .bindPopup(this.handlePopup3, popupOpts3)
        .onClick((): void => { this.handlePopup3 = !this.handlePopup3; })
      let blurOpts4: BackgroundBlurStyleOptions = {
        policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        inactiveColor: Color.Red
      };
      let popupOpts4: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup4 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts4,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup4 = false; } }
      };
      Button('inactiveColor_red').id('inactiveColor_red').height('5%').width('30%')
        .bindPopup(this.handlePopup4, popupOpts4)
        .onClick((): void => { this.handlePopup4 = !this.handlePopup4; })
    }
  }
  @Builder
  buildRow2(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts5: BackgroundBlurStyleOptions = {
        policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        inactiveColor: '#FFFF0000'
      };
      let popupOpts5: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup5 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts5,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup5 = false; } }
      };
      Button('inactiveColor_string').id('inactiveColor_string').height('5%').width('30%')
        .bindPopup(this.handlePopup5, popupOpts5)
        .onClick((): void => { this.handlePopup5 = !this.handlePopup5; })
      let blurOpts6: BackgroundBlurStyleOptions = {
        policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        inactiveColor: -65536 as int
      };
      let popupOpts6: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup6 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts6,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup6 = false; } }
      };
      Button('inactiveColor_number').id('inactiveColor_number').height('5%').width('30%')
        .bindPopup(this.handlePopup6, popupOpts6)
        .onClick((): void => { this.handlePopup6 = !this.handlePopup6; })
    }
  }
  @Builder
  buildRow3(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts7: BackgroundBlurStyleOptions = { colorMode: ThemeColorMode.LIGHT };
      let popupOpts7: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup7 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts7,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup7 = false; } }
      };
      Button('colorMode_LIGHT').id('colorMode_LIGHT').height('5%').width('30%')
        .bindPopup(this.handlePopup7, popupOpts7)
        .onClick((): void => { this.handlePopup7 = !this.handlePopup7; })
      let blurOpts8: BackgroundBlurStyleOptions = { colorMode: ThemeColorMode.DARK };
      let popupOpts8: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup8 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts8,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup8 = false; } }
      };
      Button('colorMode_DARK').id('colorMode_DARK').height('5%').width('30%')
        .bindPopup(this.handlePopup8, popupOpts8)
        .onClick((): void => { this.handlePopup8 = !this.handlePopup8; })
    }
  }
  @Builder
  buildRow4(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts9: BackgroundBlurStyleOptions = { adaptiveColor: AdaptiveColor.DEFAULT };
      let popupOpts9: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup9 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts9,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup9 = false; } }
      };
      Button('adaptiveColor_DEFAULT').id('adaptiveColor_DEFAULT').height('5%').width('30%')
        .bindPopup(this.handlePopup9, popupOpts9)
        .onClick((): void => { this.handlePopup9 = !this.handlePopup9; })
      let blurOpts10: BackgroundBlurStyleOptions = { adaptiveColor: AdaptiveColor.AVERAGE };
      let popupOpts10: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup10 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts10,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup10 = false; } }
      };
      Button('adaptiveColor_AVERAGE').id('adaptiveColor_AVERAGE').height('5%').width('30%')
        .bindPopup(this.handlePopup10, popupOpts10)
        .onClick((): void => { this.handlePopup10 = !this.handlePopup10; })
    }
  }
  @Builder
  buildRow5(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts11: BackgroundBlurStyleOptions = { scale: 0.0 };
      let popupOpts11: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup11 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts11,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup11 = false; } }
      };
      Button('scale_0').id('scale_0').height('5%').width('30%')
        .bindPopup(this.handlePopup11, popupOpts11)
        .onClick((): void => { this.handlePopup11 = !this.handlePopup11; })
      let blurOpts12: BackgroundBlurStyleOptions = { scale: 1.0 };
      let popupOpts12: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup12 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts12,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup12 = false; } }
      };
      Button('scale_1').id('scale_1').height('5%').width('30%')
        .bindPopup(this.handlePopup12, popupOpts12)
        .onClick((): void => { this.handlePopup12 = !this.handlePopup12; })
    }
  }
  @Builder
  buildRow6(): void {
    Row({ space: 5 } as RowOptions) {
      let blurOpts13: BackgroundBlurStyleOptions = { scale: 2.0 };
      let popupOpts13: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup13 = false; }); },
        backgroundBlurStyle: BlurStyle.Thin,
        backgroundBlurStyleOptions: blurOpts13,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup13 = false; } }
      };
      Button('scale_2').id('scale_2').height('5%').width('30%')
        .bindPopup(this.handlePopup13, popupOpts13)
        .onClick((): void => { this.handlePopup13 = !this.handlePopup13; })
      let blurOpts14: BackgroundBlurStyleOptions = {
        policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
        inactiveColor: Color.Blue,
        colorMode: ThemeColorMode.LIGHT,
        adaptiveColor: AdaptiveColor.DEFAULT,
        scale: 1.0
      };
      let popupOpts14: CustomPopupOptions = {
        builder: (): void => { this.customPopupBuilder((): void => { this.handlePopup14 = false; }); },
        backgroundBlurStyle: BlurStyle.Regular,
        backgroundBlurStyleOptions: blurOpts14,
        onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup14 = false; } }
      };
      Button('combinedOptions').id('combinedOptions').height('5%').width('30%')
        .bindPopup(this.handlePopup14, popupOpts14)
        .onClick((): void => { this.handlePopup14 = !this.handlePopup14; })
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
