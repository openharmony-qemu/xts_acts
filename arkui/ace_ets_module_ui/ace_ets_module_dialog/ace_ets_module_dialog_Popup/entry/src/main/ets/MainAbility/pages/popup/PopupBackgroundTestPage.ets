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

import router from '@ohos.router';

@Entry
@Component
struct PopupBackgroundTestPage {
  @State resultText: string = 'Ready';

  @State showPopupBlurStyleOptsThemeLight: boolean = false;
  @State showPopupBlurStyleOptsThemeDark: boolean = false;
  @State showPopupBlurStyleOptsThemeSystem: boolean = false;
  @State showPopupBlurStyleOptsAdaptiveDefault: boolean = false;
  @State showPopupBlurStyleOptsAdaptiveAverage: boolean = false;
  @State showPopupBlurStyleOptsScale0: boolean = false;
  @State showPopupBlurStyleOptsScale1: boolean = false;
  @State showPopupBlurStyleOptsScale05: boolean = false;
  @State showPopupBlurStyleOptsGrayscale00: boolean = false;
  @State showPopupBlurStyleOptsGrayscale20100: boolean = false;
  @State showPopupBlurStyleOptsPolicyFollows: boolean = false;
  @State showPopupBlurStyleOptsPolicyAlwaysActive: boolean = false;
  @State showPopupBlurStyleOptsPolicyAlwaysInactive: boolean = false;
  @State showPopupBlurStyleOptsInactiveColor: boolean = false;
  @State showPopupBlurStyleOptsAllParams: boolean = false;

  @State showPopupEffectRadius0: boolean = false;
  @State showPopupEffectRadius60: boolean = false;
  @State showPopupEffectSaturation0: boolean = false;
  @State showPopupEffectSaturation10: boolean = false;
  @State showPopupEffectBrightness0: boolean = false;
  @State showPopupEffectBrightness1: boolean = false;
  @State showPopupEffectBrightness2: boolean = false;
  @State showPopupEffectColor: boolean = false;
  @State showPopupEffectAdaptiveDefault: boolean = false;
  @State showPopupEffectAdaptiveAverage: boolean = false;
  @State showPopupEffectGrayscale00: boolean = false;
  @State showPopupEffectGrayscale20100: boolean = false;
  @State showPopupEffectPolicyFollows: boolean = false;
  @State showPopupEffectPolicyAlwaysActive: boolean = false;
  @State showPopupEffectPolicyAlwaysInactive: boolean = false;
  @State showPopupEffectInactiveColor: boolean = false;
  @State showPopupEffectAllParams: boolean = false;

  @State showCustomBlurStyleOptsAllParams: boolean = false;
  @State showCustomEffectAllParams: boolean = false;
  @State showPopupNoBackground: boolean = false;

  @Builder
  customPopupBuilder(closeCallback: () => void) {
    Column() {
      Text('CustomPopup Test')
        .fontSize(9)
        .margin({ top: 4, bottom: 4 })
      Button('Close')
        .id('close_popup')
        .height(28)
        .fontSize(9)
        .onClick(() => {
          closeCallback();
        })
    }
    .width(150)
    .padding(4)
  }

  build() {
    Scroll() {
      Column({ space: 4 }) {
        Text(this.resultText)
          .fontSize(9)
          .id('result_text')
          .maxLines(3)
          .width(190)
          .textAlign(TextAlign.Center)
          .margin({ top: 2 })
        Row() {
          Button('ThemeColorMode')
            .id('btn_theme_color_mode')
            .width('30%').height('10vp').fontSize(9)
            .onClick(() => { this.resultText = 'SYSTEM=0 LIGHT=1 DARK=2'; })

          Button('AdaptiveColor')
            .id('btn_adaptive_color')
            .width('30%').height('10vp').fontSize(9)
            .onClick(() => { this.resultText = 'DEFAULT=0 AVERAGE=1'; })
          Button('BlurActivePolicy')
            .id('btn_blur_policy')
            .width('30%').height('10vp').fontSize(9)
            .onClick(() => { this.resultText = 'FOLLOWS_WINDOW=0 ALWAYS_ACTIVE=1 ALWAYS_INACTIVE=2'; })
        }

        Row() {
          Button('NoBgOpts')
            .id('btn_no_background')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupNoBackground, {
              message: 'Popup without background',
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupNoBackground = false; } }
            })
            .onClick(() => { this.showPopupNoBackground = true; })
          Button('Return=T')
            .id('btn_return_check')
            .width('30%').height('10vp').fontSize(9)
            .onClick(() => { this.resultText = 'bindPopup returns T'; })
        }



        Row() {
          Button('cm=LIGHT')
            .id('btn_blur_opts_light')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsThemeLight, {
              message: 'colorMode=LIGHT',
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.LIGHT },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsThemeLight = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsThemeLight = true; })

          Button('cm=DARK')
            .id('btn_blur_opts_dark')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsThemeDark, {
              message: 'colorMode=DARK',
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.DARK },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsThemeDark = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsThemeDark = true; })

          Button('cm=SYSTEM')
            .id('btn_blur_opts_system')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsThemeSystem, {
              message: 'colorMode=SYSTEM',
              backgroundBlurStyleOptions: { colorMode: ThemeColorMode.SYSTEM },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsThemeSystem = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsThemeSystem = true; })
        }

        Row() {
          Button('ac=DEFAULT')
            .id('btn_blur_opts_adaptive_default')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsAdaptiveDefault, {
              message: 'adaptiveColor=DEFAULT',
              backgroundBlurStyleOptions: { adaptiveColor: AdaptiveColor.DEFAULT },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsAdaptiveDefault = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsAdaptiveDefault = true; })

          Button('ac=AVERAGE')
            .id('btn_blur_opts_adaptive_average')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsAdaptiveAverage, {
              message: 'adaptiveColor=AVERAGE',
              backgroundBlurStyleOptions: { adaptiveColor: AdaptiveColor.AVERAGE },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsAdaptiveAverage = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsAdaptiveAverage = true; })

          Button('scale=0')
            .id('btn_blur_opts_scale_0')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsScale0, {
              message: 'scale=0',
              backgroundBlurStyleOptions: { scale: 0 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsScale0 = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsScale0 = true; })
        }

        Row() {
          Button('scale=1.0')
            .id('btn_blur_opts_scale_1')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsScale1, {
              message: 'scale=1.0',
              backgroundBlurStyleOptions: { scale: 1.0 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsScale1 = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsScale1 = true; })

          Button('scale=0.5')
            .id('btn_blur_opts_scale_05')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsScale05, {
              message: 'scale=0.5',
              backgroundBlurStyleOptions: { scale: 0.5 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsScale05 = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsScale05 = true; })
          Button('gs=[0,0]')
            .id('btn_blur_opts_gray_00')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsGrayscale00, {
              message: 'grayscale=[0,0]',
              backgroundBlurStyleOptions: { blurOptions: { grayscale: [0, 0] } },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsGrayscale00 = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsGrayscale00 = true; })
        }



        Row() {
          Button('gs=[20,100]')
            .id('btn_blur_opts_gray_20100')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsGrayscale20100, {
              message: 'grayscale=[20,100]',
              backgroundBlurStyleOptions: { blurOptions: { grayscale: [20, 100] } },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsGrayscale20100 = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsGrayscale20100 = true; })
          Button('policy=FOL')
            .id('btn_blur_opts_policy_follows')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsPolicyFollows, {
              message: 'policy=FOLLOWS_WINDOW_ACTIVE_STATE',
              backgroundBlurStyleOptions: { policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsPolicyFollows = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsPolicyFollows = true; })

          Button('policy=ACT')
            .id('btn_blur_opts_policy_always')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsPolicyAlwaysActive, {
              message: 'policy=ALWAYS_ACTIVE',
              backgroundBlurStyleOptions: { policy: BlurStyleActivePolicy.ALWAYS_ACTIVE },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsPolicyAlwaysActive = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsPolicyAlwaysActive = true; })
        }

        Row() {
          Button('policy=INA')
            .id('btn_blur_opts_policy_inactive')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsPolicyAlwaysInactive, {
              message: 'policy=ALWAYS_INACTIVE',
              backgroundBlurStyleOptions: { policy: BlurStyleActivePolicy.ALWAYS_INACTIVE },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsPolicyAlwaysInactive = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsPolicyAlwaysInactive = true; })

          Button('inactiveColor=Red')
            .id('btn_blur_opts_inactive_color')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsInactiveColor, {
              message: 'inactiveColor=Red',
              backgroundBlurStyleOptions: { inactiveColor: '#33FF0000' },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsInactiveColor = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsInactiveColor = true; })
          Button('AllBlurOpts')
            .id('btn_blur_opts_all_params')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupBlurStyleOptsAllParams, {
              message: 'All backgroundBlurStyleOptions params',
              backgroundBlurStyleOptions: {
                colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.AVERAGE,
                scale: 0.5, blurOptions: { grayscale: [20, 20] },
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE, inactiveColor: Color.Transparent,
              },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupBlurStyleOptsAllParams = false; } }
            })
            .onClick(() => { this.showPopupBlurStyleOptsAllParams = true; this.resultText = 'BlurStyleOpts'; })
        }


        Row() {
          Button('r=0')
            .id('btn_effect_radius_0')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectRadius0, {
              message: 'radius=0',
              backgroundEffect: { radius: 0 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectRadius0 = false; } }
            })
            .onClick(() => { this.showPopupEffectRadius0 = true; })
          Button('r=60')
            .id('btn_effect_radius_60')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectRadius60, {
              message: 'radius=60',
              backgroundEffect: { radius: 60 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectRadius60 = false; } }
            })
            .onClick(() => { this.showPopupEffectRadius60 = true; })

          Button('sat=0')
            .id('btn_effect_sat_0')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectSaturation0, {
              message: 'saturation=0',
              backgroundEffect: { radius: 60, saturation: 0 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectSaturation0 = false; } }
            })
            .onClick(() => { this.showPopupEffectSaturation0 = true; })
        }

        Row() {
          Button('sat=10')
            .id('btn_effect_sat_10')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectSaturation10, {
              message: 'saturation=10',
              backgroundEffect: { radius: 60, saturation: 10 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectSaturation10 = false; } }
            })
            .onClick(() => { this.showPopupEffectSaturation10 = true; })

          Button('brt=0')
            .id('btn_effect_bright_0')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectBrightness0, {
              message: 'brightness=0',
              backgroundEffect: { radius: 60, brightness: 0 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectBrightness0 = false; } }
            })
            .onClick(() => { this.showPopupEffectBrightness0 = true; })
          Button('brt=1')
            .id('btn_effect_bright_1')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectBrightness1, {
              message: 'brightness=1',
              backgroundEffect: { radius: 60, brightness: 1 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectBrightness1 = false; } }
            })
            .onClick(() => { this.showPopupEffectBrightness1 = true; })
        }

        Row() {
          Button('brt=2')
            .id('btn_effect_bright_2')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectBrightness2, {
              message: 'brightness=2',
              backgroundEffect: { radius: 60, brightness: 2 },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectBrightness2 = false; } }
            })
            .onClick(() => { this.showPopupEffectBrightness2 = true; })
          Button('color=Pink')
            .id('btn_effect_color')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectColor, {
              message: 'color=Color.Pink',
              backgroundEffect: { radius: 60, color: Color.Pink },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectColor = false; } }
            })
            .onClick(() => { this.showPopupEffectColor = true; })

          Button('ac=DEFAULT')
            .id('btn_effect_adaptive_default')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectAdaptiveDefault, {
              message: 'adaptiveColor=DEFAULT',
              backgroundEffect: { radius: 60, adaptiveColor: AdaptiveColor.DEFAULT },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectAdaptiveDefault = false; } }
            })
            .onClick(() => { this.showPopupEffectAdaptiveDefault = true; })
        }

        Row() {
          Button('ac=AVERAGE')
            .id('btn_effect_adaptive_average')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectAdaptiveAverage, {
              message: 'adaptiveColor=AVERAGE',
              backgroundEffect: { radius: 60, adaptiveColor: AdaptiveColor.AVERAGE },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectAdaptiveAverage = false; } }
            })
            .onClick(() => { this.showPopupEffectAdaptiveAverage = true; })

          Button('gs=[0,0]')
            .id('btn_effect_gray_00')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectGrayscale00, {
              message: 'grayscale=[0,0]',
              backgroundEffect: { radius: 60, blurOptions: { grayscale: [0, 0] } },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectGrayscale00 = false; } }
            })
            .onClick(() => { this.showPopupEffectGrayscale00 = true; })
          Button('gs=[20,100]')
            .id('btn_effect_gray_20100')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectGrayscale20100, {
              message: 'grayscale=[20,100]',
              backgroundEffect: { radius: 60, blurOptions: { grayscale: [20, 100] } },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectGrayscale20100 = false; } }
            })
            .onClick(() => { this.showPopupEffectGrayscale20100 = true; })
        }

        Row() {
          Button('policy=FOL')
            .id('btn_effect_policy_follows')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectPolicyFollows, {
              message: 'policy=FOLLOWS_WINDOW_ACTIVE_STATE',
              backgroundEffect: { radius: 60, policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectPolicyFollows = false; } }
            })
            .onClick(() => { this.showPopupEffectPolicyFollows = true; })
          Button('policy=ACT')
            .id('btn_effect_policy_always')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectPolicyAlwaysActive, {
              message: 'policy=ALWAYS_ACTIVE',
              backgroundEffect: { radius: 60, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectPolicyAlwaysActive = false; } }
            })
            .onClick(() => { this.showPopupEffectPolicyAlwaysActive = true; })

          Button('policy=INA')
            .id('btn_effect_policy_inactive')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectPolicyAlwaysInactive, {
              message: 'policy=ALWAYS_INACTIVE',
              backgroundEffect: { radius: 60, policy: BlurStyleActivePolicy.ALWAYS_INACTIVE },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectPolicyAlwaysInactive = false; } }
            })
            .onClick(() => { this.showPopupEffectPolicyAlwaysInactive = true; })
        }

        Row() {
          Button('inactiveColor=Blue')
            .id('btn_effect_inactive_color')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectInactiveColor, {
              message: 'inactiveColor=Blue',
              backgroundEffect: { radius: 60, inactiveColor: '#330000FF' },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectInactiveColor = false; } }
            })
            .onClick(() => { this.showPopupEffectInactiveColor = true; })

          Button('AllEffect')
            .id('btn_effect_all_params')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showPopupEffectAllParams, {
              message: 'All backgroundEffect params',
              backgroundEffect: {
                radius: 60, saturation: 10, brightness: 1, color: '#661A1A1A',
                adaptiveColor: AdaptiveColor.AVERAGE, blurOptions: { grayscale: [20, 20] },
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE, inactiveColor: Color.Transparent,
              },
              onStateChange: (e) => { if (!e.isVisible) { this.showPopupEffectAllParams = false; } }
            })
            .onClick(() => { this.showPopupEffectAllParams = true; this.resultText = 'EffectParams'; })
        }


        Row() {
          Button('Custom+Blur')
            .id('btn_custom_blur_opts')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showCustomBlurStyleOptsAllParams, {
              builder: () => this.customPopupBuilder(() => { this.showCustomBlurStyleOptsAllParams = false; }),
              backgroundBlurStyleOptions: {
                colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.AVERAGE,
                scale: 0.5, blurOptions: { grayscale: [20, 20] },
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE, inactiveColor: Color.Transparent,
              },
              onStateChange: (e) => { if (!e.isVisible) { this.showCustomBlurStyleOptsAllParams = false; } }
            })
            .onClick(() => { this.showCustomBlurStyleOptsAllParams = true; this.resultText = 'CustomBlurStyleOpts'; })
          Button('Custom+Effect')
            .id('btn_custom_effect')
            .width('30%').height('10vp').fontSize(9)
            .bindPopup(this.showCustomEffectAllParams, {
              builder: () => this.customPopupBuilder(() => { this.showCustomEffectAllParams = false; }),
              backgroundEffect: {
                radius: 60, saturation: 10, brightness: 1, color: '#661A1A1A',
                adaptiveColor: AdaptiveColor.AVERAGE, blurOptions: { grayscale: [20, 20] },
                policy: BlurStyleActivePolicy.ALWAYS_ACTIVE, inactiveColor: Color.Transparent,
              },
              onStateChange: (e) => { if (!e.isVisible) { this.showCustomEffectAllParams = false; } }
            })
            .onClick(() => { this.showCustomEffectAllParams = true; this.resultText = 'CustomEffect'; })
        }

      }
      .width(200)
    }
    .width('100%')
    .height('100%')
    .scrollBar(BarState.Auto)
  }
}