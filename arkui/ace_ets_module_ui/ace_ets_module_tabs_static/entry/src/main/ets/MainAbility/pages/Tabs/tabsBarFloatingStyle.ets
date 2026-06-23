'use static';
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

import {
  Entry, Text, Column, Component, Tabs, TabContent, BarPosition, Color,
  Divider, Scroll, FloatingTabBarStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct TabsBarFloatingStylePage {
  build() {
    Scroll() {
      Column() {
        Text('Tabs barFloatingStyle Tests')
          .fontSize(14)

        Text('Basic Floating Style')
          .fontSize(10)
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
        }
        .id('tabs_basic_floating')
        .barFloatingStyle({} as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('10%')

        Text('Full Parameters')
          .fontSize(10)
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
        }
        .id('tabs_full_params')
        .barFloatingStyle({
          barSideMargin: 20,
          barBottomMargin: 30,
          maskColor: '#80FFFFFF',
          maskHeight: 50,
          adaptToHandedness: false
        } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('10%')

        Text('barFloatingStyle undefined')
          .fontSize(10)
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
        }
        .id('tabs_barFloatingStyle_undefined')
        .barFloatingStyle({
          barWidth: undefined,
          barSideMargin: undefined,
          barBottomMargin: undefined,
          maskColor: undefined,
          maskHeight: undefined,
          adaptToHandedness: undefined,
          systemMaterial: undefined
        } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('10%')

        Text('adaptToHandedness true')
          .fontSize(10)
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
        }
        .id('tabs_adaptToHandedness_true')
        .barFloatingStyle({ adaptToHandedness: true } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('10%')

        Text('adaptToHandedness false')
          .fontSize(10)
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
        }
        .id('tabs_adaptToHandedness_false')
        .barFloatingStyle({ adaptToHandedness: false } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('10%')

        Text('barWidth params')
          .fontSize(10)
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
        }
        .id('tabs_barWidth_all')
        .barFloatingStyle({
          barWidth: {
            smallBarWidth: 100,
            mediumBarWidth: 200,
            largeBarWidth: 300
          }
        } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('10%')

        Text('barWidth undefined')
          .fontSize(10)
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
        }
        .id('tabs_barWidth_undefined')
        .barFloatingStyle({
          barWidth: {
            smallBarWidth: undefined,
            mediumBarWidth: undefined,
            largeBarWidth: undefined
          }
        } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('10%')
      }
      .width('100%')
      .padding(5)
      .backgroundColor('#C0C0C0')
    }
    .height('100%')
    .width('100%')
  }
}