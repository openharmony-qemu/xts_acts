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

@Entry
@Component
struct SelectMenuBackground {
  @State blurMode: string = 'default';
  @State effectMode: string = 'default';
  private options: SelectOption[] = [
    { value: 'OptionA' },
    { value: 'OptionB' },
    { value: 'OptionC' }
  ];

  private blurOptions(): BackgroundBlurStyleOptions | undefined {
    if (this.blurMode === 'empty') {
      return undefined;
    }
    if (this.blurMode === 'blue') {
      return {
        colorMode: ThemeColorMode.DARK,
        scale: 0.5,
        adaptiveColor: AdaptiveColor.DEFAULT,
        blurOptions: { grayscale: [50, 50] },
        policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
        inactiveColor: Color.Blue
      };
    }
    if (this.blurMode === 'policy_inactive') {
      return {
        policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
        inactiveColor: Color.Gray
      };
    }
    return {};
  }

  private effectOptions(): BackgroundEffectOptions | undefined {
    if (this.effectMode === 'empty') {
      return undefined;
    }
    if (this.effectMode === 'purple') {
      return {
        radius: 20,
        saturation: 1.2,
        brightness: 1.0,
        color: '#AA80FF',
        adaptiveColor: AdaptiveColor.DEFAULT
      };
    }
    if (this.effectMode === 'green') {
      return {
        radius: 10,
        saturation: 0.8,
        brightness: 1.1,
        color: '#66CC66'
      };
    }
    return { radius: 5 };
  }

  build() {
    Scroll() {
      Column() {
        Text('Select menuBackground*').fontWeight(FontWeight.Bold)
        Text('blur=' + this.blurMode + ' effect=' + this.effectMode)
          .id('select_bg_mode_label')
        Select(this.options)
          .id('select_menu_blur').height('9%').width('90%').margin({top:'1%'})
          .value('SelectBlur')
          .menuBackgroundBlurStyleOptions(this.blurOptions())
        Select(this.options)
          .id('select_menu_effect').height('9%').width('90%').margin({top:'1%'})
          .value('SelectEffect')
          .menuBackgroundEffect(this.effectOptions())
        Select(this.options)
          .id('select_menu_both').height('9%').width('90%').margin({top:'1%'})
          .value('SelectBoth')
          .menuBackgroundBlurStyleOptions(this.blurOptions())
          .menuBackgroundEffect(this.effectOptions())
        Row({ space: 8 }) {
          Button('blur default').id('btn_blur_default').height('90%').onClick(() => {
            this.blurMode = 'default';
          })
          Button('blur blue').id('btn_blur_blue').height('90%').onClick(() => {
            this.blurMode = 'blue';
          })
          Button('blur empty').id('btn_blur_empty').height('90%').onClick(() => {
            this.blurMode = 'empty';
          })
        }.height('9%').width('90%').margin({top:'1%'})
        Row({ space: 8 }) {
          Button('blur inactive').id('btn_blur_inactive').height('90%').onClick(() => {
            this.blurMode = 'policy_inactive';
          })
          Button('effect purple').id('btn_effect_purple').height('90%').onClick(() => {
            this.effectMode = 'purple';
          })
          Button('effect green').id('btn_effect_green').height('90%').onClick(() => {
            this.effectMode = 'green';
          })
        }.height('9%').width('90%').margin({top:'1%'})
        Row({ space: 8 }) {
          Button('effect default').id('btn_effect_default').height('90%').onClick(() => {
            this.effectMode = 'default';
          })
          Button('effect empty').id('btn_effect_empty').height('90%').onClick(() => {
            this.effectMode = 'empty';
          })
        }.height('9%').width('90%').margin({top:'1%'})
      }
      .width('100%')
      .padding('1%')
      .height('90%')
    }
    .width('100%')
    .height('100%')
  }
}
