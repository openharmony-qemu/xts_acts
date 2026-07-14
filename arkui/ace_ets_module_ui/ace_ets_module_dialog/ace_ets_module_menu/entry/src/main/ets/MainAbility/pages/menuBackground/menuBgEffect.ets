/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct menuBgEffectTest {
  selectOptions: SelectOption[] = [
    { value: 'Option1' },
    { value: 'Option2' },
    { value: 'Option3' },
    { value: 'Option4' },
    { value: 'Option5' }
  ];

  build() {
    Scroll() {
      Column() {

        Row() {
          Select(this.selectOptions)
            .value('AllProps')
            .id('select_all_props')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({
              radius: 60,
              saturation: 40,
              brightness: 1,
              color: Color.Orange,
              adaptiveColor: AdaptiveColor.AVERAGE,
              blurOptions: { grayscale: [20, 20] },
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor: '#330000FF'
            })

          Select(this.selectOptions)
            .value('RadiusOnly')
            .id('select_radius_only')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60 })

          Select(this.selectOptions)
            .value('Radius0')
            .id('select_radius_0')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 0 })
        }

        Row() {
          Select(this.selectOptions)
            .value('Sat40')
            .id('select_saturation')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, saturation: 40 })

          Select(this.selectOptions)
            .value('Bright0.5')
            .id('select_brightness')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, brightness: 0.5 })

          Select(this.selectOptions)
            .value('ColorOrange')
            .id('select_color')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, color: '#FFA500' })
        }


        Row() {
          Select(this.selectOptions)
            .value('AdpDefault')
            .id('select_adaptive_default')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, adaptiveColor: AdaptiveColor.DEFAULT })

          Select(this.selectOptions)
            .value('AdpAverage')
            .id('select_adaptive_average')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, adaptiveColor: AdaptiveColor.AVERAGE })

          Select(this.selectOptions)
            .value('BlurOpts')
            .id('select_blur_opts')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, blurOptions: { grayscale: [20, 20] } })
        }

        Row() {
          Select(this.selectOptions)
            .value('FollowsWin')
            .id('select_follows_window')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE })

          Select(this.selectOptions)
            .value('AlwaysAct')
            .id('select_always_active')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE })

          Select(this.selectOptions)
            .value('AlwaysInact')
            .id('select_always_inactive')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60, policy: BlurStyleActivePolicy.ALWAYS_INACTIVE })
        }


        Row() {
          Select(this.selectOptions)
            .value('InactiveClr')
            .id('select_inactive_color')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({
              radius: 60,
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              inactiveColor: '#FF0000'
            })

          Select(this.selectOptions)
            .value('Radius100')
            .id('select_radius_100')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 100 })

          Select(this.selectOptions)
            .value('Undefined')
            .id('select_undefined')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect(undefined)
        }


        Row() {
          Select(this.selectOptions)
            .value('Null')
            .id('select_null')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect(null)

          Select(this.selectOptions)
            .value('Standalone')
            .id('select_standalone')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundEffect({ radius: 60, policy: BlurStyleActivePolicy.ALWAYS_ACTIVE })

          Select(this.selectOptions)
            .value('ChainTest')
            .id('select_chain')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundEffect({ radius: 60 })
            .selected(0)
            .fontColor(Color.Blue)
        }

      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
