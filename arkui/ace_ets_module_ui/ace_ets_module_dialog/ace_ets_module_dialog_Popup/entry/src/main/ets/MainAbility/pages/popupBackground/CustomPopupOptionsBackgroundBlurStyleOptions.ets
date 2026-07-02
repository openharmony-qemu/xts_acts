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
        Button('policy_FOLLOWS_WINDOW_ACTIVE_STATE')
          .id('policy_FOLLOWS_WINDOW_ACTIVE_STATE')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup1, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup1 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup1 = false; } }
          })
          .onClick(() => { this.handlePopup1 = !this.handlePopup1; })

        Button('policy_ALWAYS_ACTIVE')
          .id('policy_ALWAYS_ACTIVE')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup2, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup2 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup2 = false; } }
          })
          .onClick(() => { this.handlePopup2 = !this.handlePopup2; })
      }

      Row() {
        Button('policy_ALWAYS_INACTIVE')
          .id('policy_ALWAYS_INACTIVE')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup3, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup3 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup3 = false; } }
          })
          .onClick(() => { this.handlePopup3 = !this.handlePopup3; })

        Button('inactiveColor_Color.Red')
          .id('inactiveColor_red')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup4, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup4 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              inactiveColor: Color.Red,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup4 = false; } }
          })
          .onClick(() => { this.handlePopup4 = !this.handlePopup4; })
      }

      Row() {
        Button('inactiveColor_string')
          .id('inactiveColor_string')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup5, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup5 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              inactiveColor: '#FFFF0000',
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup5 = false; } }
          })
          .onClick(() => { this.handlePopup5 = !this.handlePopup5; })

        Button('inactiveColor_number')
          .id('inactiveColor_number')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup6, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup6 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              inactiveColor: 0xFFFF0000,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup6 = false; } }
          })
          .onClick(() => { this.handlePopup6 = !this.handlePopup6; })
      }

      Row() {
        Button('colorMode_LIGHT')
          .id('colorMode_LIGHT')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup7, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup7 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              colorMode: ThemeColorMode.LIGHT,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup7 = false; } }
          })
          .onClick(() => { this.handlePopup7 = !this.handlePopup7; })

        Button('colorMode_DARK')
          .id('colorMode_DARK')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup8, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup8 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              colorMode: ThemeColorMode.DARK,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup8 = false; } }
          })
          .onClick(() => { this.handlePopup8 = !this.handlePopup8; })
      }

      Row() {
        Button('adaptiveColor_DEFAULT')
          .id('adaptiveColor_DEFAULT')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup9, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup9 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              adaptiveColor: AdaptiveColor.DEFAULT,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup9 = false; } }
          })
          .onClick(() => { this.handlePopup9 = !this.handlePopup9; })

        Button('adaptiveColor_AVERAGE')
          .id('adaptiveColor_AVERAGE')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup10, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup10 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              adaptiveColor: AdaptiveColor.AVERAGE,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup10 = false; } }
          })
          .onClick(() => { this.handlePopup10 = !this.handlePopup10; })
      }

      Row() {
        Button('scale_0')
          .id('scale_0')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup11, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup11 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              scale: 0,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup11 = false; } }
          })
          .onClick(() => { this.handlePopup11 = !this.handlePopup11; })

        Button('scale_1')
          .id('scale_1')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup12, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup12 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              scale: 1,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup12 = false; } }
          })
          .onClick(() => { this.handlePopup12 = !this.handlePopup12; })
      }

      Row() {
        Button('scale_2')
          .id('scale_2')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup13, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup13 = false; }),
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              scale: 2,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup13 = false; } }
          })
          .onClick(() => { this.handlePopup13 = !this.handlePopup13; })

        Button('combinedOptions')
          .id('combinedOptions')
          .height('5%')
          .width('30%')
          .bindPopup(this.handlePopup14, {
            builder: () => this.customPopupBuilder(() => { this.handlePopup14 = false; }),
            backgroundBlurStyle: BlurStyle.Regular,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor: Color.Blue,
              colorMode: ThemeColorMode.LIGHT,
              adaptiveColor: AdaptiveColor.DEFAULT,
              scale: 1.0,
            },
            onStateChange: (e) => { if (!e.isVisible) { this.handlePopup14 = false; } }
          })
          .onClick(() => { this.handlePopup14 = !this.handlePopup14; })
      }

    }
    .justifyContent(FlexAlign.Start)
    .height('100%')
    .width('100%')
  }
}