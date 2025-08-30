/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Stack,
  Tabs,
  TabContent,
  Image,
  BlurStyle,
  ThemeColorMode,
  AdaptiveColor,
  BlurStyleActivePolicy,
  Color,
  Button,
  Swiper,
  ForEach,
  ClickEvent,
  Margin,
  SwiperController,
  TextAlign,
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct barBackgroundTabsExample {
  build() {
    Column() {
      
      Stack() {
        Image($r('app.media.icon'))
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }.tabBar('green')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#007DFF')
          }.tabBar('blue')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#FFBF00')
          }.tabBar('yellow')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#E67C92')
          }.tabBar('pink')
        }
        .id('tabs_bar_back_style')
        .barBackgroundBlurStyle(BlurStyle.COMPONENT_THICK,
          { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 })
      }
      .width('90%')
      .height('40%')
      .margin(5)

      
      Stack() {
        Image($r('app.media.icon'))
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }.tabBar('green')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#007DFF')
          }.tabBar('blue')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#FFBF00')
          }.tabBar('yellow')

          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#E67C92')
          }.tabBar('pink')
        }
        .id('tabs_bar_back_effect')
        .barBackgroundEffect({
          
          radius: 20, 
          saturation: 15, 
          blurOptions: { grayscale: [20, 20] }, 
          brightness: 0.6, 
          color: '#8044a4b5', 
          adaptiveColor: AdaptiveColor.DEFAULT, 
          inactiveColor: $r('app.color.color_red'),
          policy: BlurStyleActivePolicy.ALWAYS_ACTIVE
        })
      }
      .width('90%')
      .height('40%')
    }
  }
}