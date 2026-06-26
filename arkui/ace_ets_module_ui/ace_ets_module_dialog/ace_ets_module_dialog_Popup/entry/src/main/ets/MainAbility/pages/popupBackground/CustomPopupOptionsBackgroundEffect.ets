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

  @Builder
  customPopupBuilder(closeCallback: () => void) {
    Column() {
      Text('CustomPopupOptions Test')
        .fontSize(20)
        .margin({ top: 20, bottom: 20 })
      Button('Close')
        .id('close_popup')
        .onClick(() => {
          closeCallback();
        })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }

  build() {
    Column({ space: 5 }) {
      Row() {
        Button('radius_0')
          .id('radius_0')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup1, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup1 = false; }),
            backgroundEffect: { radius: 0 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup1 = false; } }
          })
          .onClick(() => { this.handlePopup1 = !this.handlePopup1; })

        Button('radius_20')
          .id('radius_20')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup2, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup2 = false; }),
            backgroundEffect: { radius: 20 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup2 = false; } }
          })
          .onClick(() => { this.handlePopup2 = !this.handlePopup2; })
      }

      Row() {
        Button('radius_60')
          .id('radius_60')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup3, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup3 = false; }),
            backgroundEffect: { radius: 60 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup3 = false; } }
          })
          .onClick(() => { this.handlePopup3 = !this.handlePopup3; })

        Button('saturation_0')
          .id('saturation_0')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup4, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup4 = false; }),
            backgroundEffect: { radius: 20, saturation: 0 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup4 = false; } }
          })
          .onClick(() => { this.handlePopup4 = !this.handlePopup4; })
      }

      Row() {
        Button('saturation_1')
          .id('saturation_1')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup5, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup5 = false; }),
            backgroundEffect: { radius: 20, saturation: 1 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup5 = false; } }
          })
          .onClick(() => { this.handlePopup5 = !this.handlePopup5; })

        Button('saturation_2')
          .id('saturation_2')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup6, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup6 = false; }),
            backgroundEffect: { radius: 20, saturation: 2 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup6 = false; } }
          })
          .onClick(() => { this.handlePopup6 = !this.handlePopup6; })
      }

      Row() {
        Button('brightness_0')
          .id('brightness_0')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup7, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup7 = false; }),
            backgroundEffect: { radius: 20, brightness: 0 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup7 = false; } }
          })
          .onClick(() => { this.handlePopup7 = !this.handlePopup7; })

        Button('brightness_1')
          .id('brightness_1')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup8, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup8 = false; }),
            backgroundEffect: { radius: 20, brightness: 1 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup8 = false; } }
          })
          .onClick(() => { this.handlePopup8 = !this.handlePopup8; })
      }

      Row() {
        Button('brightness_2')
          .id('brightness_2')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup9, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup9 = false; }),
            backgroundEffect: { radius: 20, brightness: 2 },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup9 = false; } }
          })
          .onClick(() => { this.handlePopup9 = !this.handlePopup9; })

        Button('color_red')
          .id('color_red')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup10, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup10 = false; }),
            backgroundEffect: { radius: 20, color: Color.Red },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup10 = false; } }
          })
          .onClick(() => { this.handlePopup10 = !this.handlePopup10; })
      }

      Row() {
        Button('color_string')
          .id('color_string')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup11, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup11 = false; }),
            backgroundEffect: { radius: 20, color: '#80FF0000' },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup11 = false; } }
          })
          .onClick(() => { this.handlePopup11 = !this.handlePopup11; })

        Button('adaptiveColor_DEFAULT')
          .id('adaptiveColor_DEFAULT')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup12, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup12 = false; }),
            backgroundEffect: { radius: 20, adaptiveColor: AdaptiveColor.DEFAULT },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup12 = false; } }
          })
          .onClick(() => { this.handlePopup12 = !this.handlePopup12; })
      }

      Row() {
        Button('adaptiveColor_AVERAGE')
          .id('adaptiveColor_AVERAGE')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup13, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup13 = false; }),
            backgroundEffect: { radius: 60, color: '#80FF0000', adaptiveColor: AdaptiveColor.AVERAGE },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup13 = false; } }
          })
          .onClick(() => { this.handlePopup13 = !this.handlePopup13; })

        Button('policy_ALWAYS_ACTIVE')
          .id('policy_ALWAYS_ACTIVE')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup14, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup14 = false; }),
            backgroundEffect: { radius: 20, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup14 = false; } }
          })
          .onClick(() => { this.handlePopup14 = !this.handlePopup14; })
      }

      Row() {
        Button('policy_ALWAYS_INACTIVE_inactiveColor')
          .id('policy_ALWAYS_INACTIVE_inactiveColor')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup15, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup15 = false; }),
            backgroundEffect: { radius: 20, policy: BlurStyleActivePolicy.ALWAYS_INACTIVE, inactiveColor: Color.Orange },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup15 = false; } }
          })
          .onClick(() => { this.handlePopup15 = !this.handlePopup15; })

        Button('combinedOptions')
          .id('combinedOptions')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup16, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup16 = false; }),
            backgroundEffect: {
              radius: 60,
              saturation: 2,
              brightness: 1,
              color: '#80FF0000',
              adaptiveColor: AdaptiveColor.DEFAULT,
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor: Color.Blue,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup16 = false; } }
          })
          .onClick(() => { this.handlePopup16 = !this.handlePopup16; })
      }
    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}