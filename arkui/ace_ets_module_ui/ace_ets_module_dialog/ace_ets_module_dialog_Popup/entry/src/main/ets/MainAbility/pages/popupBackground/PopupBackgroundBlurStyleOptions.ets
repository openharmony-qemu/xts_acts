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
struct PopupBackgroundBlurStyleOptions {
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

  build() {
    Column() {
      Row() {
        Button('policy_FOLLOWS_WINDOW_ACTIVE_STATE')
          .id('policy_FOLLOWS_WINDOW_ACTIVE_STATE')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup1 = !this.handlePopup1;
          })
          .bindPopup(this.handlePopup1, {
            message: 'Popup policy FOLLOWS_WINDOW_ACTIVE_STATE',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup1 = false; }
            }
          })

        Button('policy_ALWAYS_ACTIVE')
          .id('policy_ALWAYS_ACTIVE')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup2 = !this.handlePopup2;
          })
          .bindPopup(this.handlePopup2, {
            message: 'Popup policy ALWAYS_ACTIVE',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup2 = false; }
            }
          })
      }

      Row() {
        Button('policy_ALWAYS_INACTIVE')
          .id('policy_ALWAYS_INACTIVE')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup3 = !this.handlePopup3;
          })
          .bindPopup(this.handlePopup3, {
            message: 'Popup policy ALWAYS_INACTIVE',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup3 = false; }
            }
          })

        Button('inactiveColor_red')
          .id('inactiveColor_red')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup4 = !this.handlePopup4;
          })
          .bindPopup(this.handlePopup4, {
            message: 'Popup inactiveColor red',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              inactiveColor: Color.Red,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup4 = false; }
            }
          })
      }

      Row() {
        Button('inactiveColor_string')
          .id('inactiveColor_string')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup5 = !this.handlePopup5;
          })
          .bindPopup(this.handlePopup5, {
            message: 'Popup inactiveColor string',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              inactiveColor: '#FFFF0000',
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup5 = false; }
            }
          })

        Button('inactiveColor_number')
          .id('inactiveColor_number')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup6 = !this.handlePopup6;
          })
          .bindPopup(this.handlePopup6, {
            message: 'Popup inactiveColor number',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              inactiveColor: 0xFFFF0000,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup6 = false; }
            }
          })
      }

      Row() {
        Button('colorMode_LIGHT')
          .id('colorMode_LIGHT')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup7 = !this.handlePopup7;
          })
          .bindPopup(this.handlePopup7, {
            message: 'Popup colorMode LIGHT',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              colorMode: ThemeColorMode.LIGHT,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup7 = false; }
            }
          })

        Button('colorMode_DARK')
          .id('colorMode_DARK')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup8 = !this.handlePopup8;
          })
          .bindPopup(this.handlePopup8, {
            message: 'Popup colorMode DARK',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              colorMode: ThemeColorMode.DARK,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup8 = false; }
            }
          })
      }

      Row() {
        Button('adaptiveColor_DEFAULT')
          .id('adaptiveColor_DEFAULT')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup9 = !this.handlePopup9;
          })
          .bindPopup(this.handlePopup9, {
            message: 'Popup adaptiveColor DEFAULT',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              adaptiveColor: AdaptiveColor.DEFAULT,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup9 = false; }
            }
          })

        Button('adaptiveColor_AVERAGE')
          .id('adaptiveColor_AVERAGE')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup10 = !this.handlePopup10;
          })
          .bindPopup(this.handlePopup10, {
            message: 'Popup adaptiveColor AVERAGE',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              adaptiveColor: AdaptiveColor.AVERAGE,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup10 = false; }
            }
          })
      }

      Row() {
        Button('scale_0')
          .id('scale_0')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup11 = !this.handlePopup11;
          })
          .bindPopup(this.handlePopup11, {
            message: 'Popup scale 0',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              scale: 0,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup11 = false; }
            }
          })

        Button('scale_1')
          .id('scale_1')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup12 = !this.handlePopup12;
          })
          .bindPopup(this.handlePopup12, {
            message: 'Popup scale 1',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              scale: 1,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup12 = false; }
            }
          })
      }

      Row() {
        Button('scale_2')
          .id('scale_2')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup13 = !this.handlePopup13;
          })
          .bindPopup(this.handlePopup13, {
            message: 'Popup scale 2',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Thin,
            backgroundBlurStyleOptions: {
              scale: 2,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup13 = false; }
            }
          })

        Button('combinedOptions')
          .id('combinedOptions')
          .height('5%')
          .width('30%')
          .onClick(() => {
            this.handlePopup14 = !this.handlePopup14;
          })
          .bindPopup(this.handlePopup14, {
            message: 'Popup combined options',
            placement: Placement.Bottom,
            backgroundBlurStyle: BlurStyle.Regular,
            backgroundBlurStyleOptions: {
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor: Color.Blue,
              colorMode: ThemeColorMode.LIGHT,
              adaptiveColor: AdaptiveColor.DEFAULT,
              scale: 1.0,
            },
            onStateChange: (e) => {
              if (!e.isVisible) { this.handlePopup14 = false; }
            }
          })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}