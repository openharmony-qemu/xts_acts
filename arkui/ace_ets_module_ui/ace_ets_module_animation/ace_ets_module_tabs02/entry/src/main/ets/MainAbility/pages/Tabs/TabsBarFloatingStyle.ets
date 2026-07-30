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
struct TabsBarFloatingStylePage {
  build() {
    Scroll() {
      Column({ space: 5 }) {
        Text('Tabs barFloatingStyle Tests')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Text('Basic Floating Style')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_basic_floating')
        .barFloatingStyle({})
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Full Parameters')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_full_params')
        .barFloatingStyle({
          barSideMargin: 20,
          barBottomMargin: 30,
          maskColor: '#80FFFFFF',
          maskHeight: 50,
          adaptToHandedness: false
        })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Only barSideMargin')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_only_barSideMargin')
        .barFloatingStyle({ barSideMargin: 40 })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Only barBottomMargin')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_only_barBottomMargin')
        .barFloatingStyle({ barBottomMargin: 50 })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Only maskColor')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_only_maskColor')
        .barFloatingStyle({ maskColor: '#FF000000' })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Only maskHeight')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_only_maskHeight')
        .barFloatingStyle({ maskHeight: 80 })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('adaptToHandedness true')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_adaptToHandedness_true')
        .barFloatingStyle({ adaptToHandedness: true })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('adaptToHandedness false')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_adaptToHandedness_false')
        .barFloatingStyle({ adaptToHandedness: false })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Null Value')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_null')
        .barFloatingStyle(null)
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Undefined Value')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_undefined')
        .barFloatingStyle(undefined)
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('barWidth smallBarWidth')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_barWidth_small')
        .barFloatingStyle({ barWidth: { smallBarWidth: 150 } })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('barWidth mediumBarWidth')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_barWidth_medium')
        .barFloatingStyle({ barWidth: { mediumBarWidth: 200 } })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('barWidth largeBarWidth')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_barWidth_large')
        .barFloatingStyle({ barWidth: { largeBarWidth: 300 } })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('barWidth all params')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_barWidth_all')
        .barFloatingStyle({ barWidth: { smallBarWidth: 100, mediumBarWidth: 200, largeBarWidth: 300 } })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('No barOverlap')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_no_barOverlap')
        .barFloatingStyle({ barSideMargin: 20 })
        .barOverlap(false)
        .width('100%')
        .height('15%')

        Divider()

        Text('Wrong barPosition Start')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_wrong_barPosition')
        .barFloatingStyle({ barSideMargin: 20 })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Vertical true')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_vertical_true')
        .barFloatingStyle({ barSideMargin: 20 })
        .barOverlap(true)
        .vertical(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Zero Values')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_zero_values')
        .barFloatingStyle({
          barSideMargin: 0,
          barBottomMargin: 0,
          maskHeight: 0
        })
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Divider()

        Text('Large Values')
          .fontSize(12)
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue)
          }.tabBar('Blue')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Green)
          }.tabBar('Green')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Orange)
          }.tabBar('Orange')
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Pink)
          }.tabBar('Pink')
        }
        .id('tabs_large_values')
        .barFloatingStyle({
          barSideMargin: 100,
          barBottomMargin: 100,
          maskHeight: 200
        })
        .barOverlap(true)
        .width('100%')
        .height('15%')
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#C0C0C0')
    }
    .height('100%')
    .width('100%')
  }
}