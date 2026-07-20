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
  CustomPopupOptions, AdaptiveColor, BlurStyleActivePolicy, Color,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CustomPopupOptionsBackgroundEffect {
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
  @State handlePopup15: boolean = false;
  @State handlePopup16: boolean = false;

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('CustomPopupOptionsBackgroundEffect router init error: ' + error);
    }
  }

  @Builder
  customPopupBuilder(closeCallback: () => void): void {
    Column() {
      Text('CustomPopupOptions Test')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('Close')
        .id('close_popup')
        .onClick((): void => { closeCallback(); })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }

  @Builder
  buildRow0(): void {
    Row({ space: 5 } as RowOptions) {
      Button('radius_0')
        .id('radius_0')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup1, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup1 = false; });
          },
          backgroundEffect: { radius: 0 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup1 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup1 = !this.handlePopup1; })
      Button('radius_20')
        .id('radius_20')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup2, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup2 = false; });
          },
          backgroundEffect: { radius: 20 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup2 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup2 = !this.handlePopup2; })
    }
  }
  @Builder
  buildRow1(): void {
    Row({ space: 5 } as RowOptions) {
      Button('radius_60')
        .id('radius_60')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup3, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup3 = false; });
          },
          backgroundEffect: { radius: 60 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup3 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup3 = !this.handlePopup3; })
      Button('saturation_0')
        .id('saturation_0')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup4, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup4 = false; });
          },
          backgroundEffect: { radius: 20, saturation: 0 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup4 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup4 = !this.handlePopup4; })
    }
  }
  @Builder
  buildRow2(): void {
    Row({ space: 5 } as RowOptions) {
      Button('saturation_1')
        .id('saturation_1')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup5, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup5 = false; });
          },
          backgroundEffect: { radius: 20, saturation: 1 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup5 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup5 = !this.handlePopup5; })
      Button('saturation_2')
        .id('saturation_2')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup6, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup6 = false; });
          },
          backgroundEffect: { radius: 20, saturation: 2 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup6 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup6 = !this.handlePopup6; })
    }
  }
  @Builder
  buildRow3(): void {
    Row({ space: 5 } as RowOptions) {
      Button('brightness_0')
        .id('brightness_0')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup7, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup7 = false; });
          },
          backgroundEffect: { radius: 20, brightness: 0 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup7 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup7 = !this.handlePopup7; })
      Button('brightness_1')
        .id('brightness_1')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup8, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup8 = false; });
          },
          backgroundEffect: { radius: 20, brightness: 1 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup8 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup8 = !this.handlePopup8; })
    }
  }
  @Builder
  buildRow4(): void {
    Row({ space: 5 } as RowOptions) {
      Button('brightness_2')
        .id('brightness_2')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup9, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup9 = false; });
          },
          backgroundEffect: { radius: 20, brightness: 2 },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup9 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup9 = !this.handlePopup9; })
      Button('color_red')
        .id('color_red')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup10, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup10 = false; });
          },
          backgroundEffect: { radius: 20, color: Color.Red },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup10 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup10 = !this.handlePopup10; })
    }
  }
  @Builder
  buildRow5(): void {
    Row({ space: 5 } as RowOptions) {
      Button('color_string')
        .id('color_string')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup11, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup11 = false; });
          },
          backgroundEffect: { radius: 20, color: '#80FF0000' },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup11 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup11 = !this.handlePopup11; })
      Button('adaptiveColor_DEFAULT')
        .id('adaptiveColor_DEFAULT')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup12, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup12 = false; });
          },
          backgroundEffect: { radius: 20, adaptiveColor: AdaptiveColor.DEFAULT },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup12 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup12 = !this.handlePopup12; })
    }
  }
  @Builder
  buildRow6(): void {
    Row({ space: 5 } as RowOptions) {
      Button('adaptiveColor_AVERAGE')
        .id('adaptiveColor_AVERAGE')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup13, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup13 = false; });
          },
          backgroundEffect: { radius: 60, color: '#80FF0000', adaptiveColor: AdaptiveColor.AVERAGE },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup13 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup13 = !this.handlePopup13; })
      Button('policy_ALWAYS_ACTIVE')
        .id('policy_ALWAYS_ACTIVE')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup14, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup14 = false; });
          },
          backgroundEffect: { radius: 20, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup14 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup14 = !this.handlePopup14; })
    }
  }
  @Builder
  buildRow7(): void {
    Row({ space: 5 } as RowOptions) {
      Button('policy_ALWAYS_INACTIVE_inactiveColor')
        .id('policy_ALWAYS_INACTIVE_inactiveColor')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup15, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup15 = false; });
          },
          backgroundEffect: { radius: 20, policy: BlurStyleActivePolicy.ALWAYS_INACTIVE, inactiveColor: Color.Orange },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup15 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup15 = !this.handlePopup15; })
      Button('combinedOptions')
        .id('combinedOptions')
        .height('5%')
        .width('30%')
        .bindPopup(this.handlePopup16, {
          builder: (): void => {
            this.customPopupBuilder((): void => { this.handlePopup16 = false; });
          },
          backgroundEffect: {
              radius: 60, saturation: 2, brightness: 1, color: '#80FF0000',
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE, inactiveColor: Color.Blue,
            },
          onStateChange: (e): void => { if (!e.isVisible) { this.handlePopup16 = false; } }
        } as CustomPopupOptions)
        .onClick((): void => { this.handlePopup16 = !this.handlePopup16; })
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
