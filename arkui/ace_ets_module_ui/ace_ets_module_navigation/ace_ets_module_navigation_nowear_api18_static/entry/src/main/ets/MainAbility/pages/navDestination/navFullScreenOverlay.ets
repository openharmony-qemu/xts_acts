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
import { Entry, Text, Column, Component, Button, ClickEvent, ComponentV2, NavPathStack, Navigation,
  NavigationTitleMode, NavigationSystemTransitionType, NavDestinationMode, NavDestination, Scroll,
  Row, RowOptions, Color, ColumnOptions, NavPathInfo, ScrollEffectOptions, NavigationTitleOptions,
  NavigationMenuItem, NavigationCommonTitle, NavDestinationCommonTitle, Dimension, FontWeight, NavigationMode,
  ForEach, $r, ScrollEffectType, BarStyle,
  ReuseObject
} from '@ohos.arkui.component'
import { State, Provider, Param, Require, Local, Consumer, Consume } from '@ohos.arkui.stateManagement'

@Entry
@ComponentV2
struct navDestinationFullScreenOverlayPage {
  @Provider('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'fullOverTrue') {
      fullOverTrue()
    } else if (name == 'fullOverFalse') {
      fullOverFalse()
    } else if (name == 'fullOverUndefined') {
      fullOverUndefined()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'} as ColumnOptions) {
        Button('push fullOverTrue').id('fullOverTrue_1').onClick(() => {
          this.pageInfos.pushPath(new NavPathInfo('fullOverTrue',null))
        }).height('10%')
        Button('push fullOverFalse').id('fullOverFalse_1').onClick(() => {
          this.pageInfos.pushPath(new NavPathInfo('fullOverFalse',null))
        }).height('10%')
        Button('push fullOverUndefined').id('fullOverUndefined_1').onClick(() => {
          this.pageInfos.pushPath(new NavPathInfo('fullOverUndefined',null))
        }).height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .id('navigation_full_width')
    .title('Title_fullScreenOverlay')
    .titleMode(NavigationTitleMode.Mini)
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
  }
}

@ComponentV2
struct fullOverTrue {
  @Consumer('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @Local info: string = '';
  build() {
    NavDestination() {
      Button('push fullOverFalse').id('fullOverFalse').onClick(() => {
        this.pageInfos.pushPath(new NavPathInfo('fullOverFalse',null))
      }).height('10%')
    }
    .id('navDestination_full_true')
    .title('fullScreenOverlay_true')
    .fullScreenOverlay(true)
  }
}

@ComponentV2
struct fullOverFalse {
  @Consumer('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  build() {
    NavDestination() {
      Button('push fullOverUndefined').id('fullOverUndefined').onClick(() => {
        this.pageInfos.pushPath(new NavPathInfo('fullOverUndefined',null))
      }).height('10%')
    }
    .id('navDestination_full_false')
    .title('fullScreenOverlay_false')
    .fullScreenOverlay(false)
  }
}

@ComponentV2
struct fullOverUndefined {
  @Consumer('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  build() {
    NavDestination() {
      Text('fullScreenOverlay: undefined')
    }
    .id('navDestination_full_undefined')
    .title('fullScreenOverlay_undefined')
    .fullScreenOverlay(undefined)
  }
}