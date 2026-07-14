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
struct menuBgBlurStyleOptsTest {
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
            .menuBackgroundBlurStyleOptions({
              colorMode: ThemeColorMode.DARK,
              adaptiveColor: AdaptiveColor.AVERAGE,
              scale: 0.1,
              blurOptions: { grayscale: [20, 20] },
              policy: BlurStyleActivePolicy.ALWAYS_ACTIVE,
              inactiveColor: '#330000FF'
            })

          Select(this.selectOptions)
            .value('Light')
            .id('select_light')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundBlurStyleOptions({ colorMode: ThemeColorMode.LIGHT })

          Select(this.selectOptions)
            .value('Dark')
            .id('select_dark')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundBlurStyleOptions({ colorMode: ThemeColorMode.DARK })
        }

        Row() {
          Select(this.selectOptions)
            .value('AdpDefault')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .id('select_adaptive_default')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundBlurStyleOptions({ adaptiveColor: AdaptiveColor.DEFAULT })

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
            .menuBackgroundBlurStyleOptions({ adaptiveColor: AdaptiveColor.AVERAGE })

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
            .menuBackgroundBlurStyleOptions({ policy: BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE })
        }

        Row() {
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
            .menuBackgroundBlurStyleOptions({ policy: BlurStyleActivePolicy.ALWAYS_ACTIVE })

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
            .menuBackgroundBlurStyleOptions({ policy: BlurStyleActivePolicy.ALWAYS_INACTIVE })

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
            .menuBackgroundBlurStyleOptions({
              policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
              inactiveColor: '#FF0000'
            })
        }

        Row() {
          Select(this.selectOptions)
            .value('Scale0.5')
            .id('select_scale')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundBlurStyleOptions({ scale: 0.5 })

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
            .menuBackgroundBlurStyleOptions({ blurOptions: { grayscale: [20, 20] } })

          Select(this.selectOptions)
            .value('EmptyObj')
            .id('select_empty_obj')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyle(BlurStyle.COMPONENT_THICK)
            .menuBackgroundBlurStyleOptions({})
        }
        
        Row() {
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
            .menuBackgroundBlurStyleOptions(undefined)

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
            .menuBackgroundBlurStyleOptions(null)
        }

        Text('Standalone and Chaining Tests')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
          .id('section_chain')

        Row() {
          Select(this.selectOptions)
            .value('Standalone')
            .id('select_standalone')
            .font({
              size:10
            })
            .controlSize(ControlSize.SMALL)
            .width('30%')
            .height('5%')
            .menuBackgroundBlurStyleOptions({ policy: BlurStyleActivePolicy.ALWAYS_ACTIVE })

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
            .menuBackgroundBlurStyleOptions({ policy: BlurStyleActivePolicy.ALWAYS_ACTIVE })
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
