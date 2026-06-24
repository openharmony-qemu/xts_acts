'use static'
/**
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
import uiMaterial from '@ohos.arkui.uiMaterial';
import { Entry, Text, Column, Component, Button, ClickEvent, ComponentV2, NavPathStack, Navigation,
  NavigationTitleMode, NavigationSystemTransitionType, NavDestinationMode, NavDestination, Scroll,
  Row, RowOptions, Color, ColumnOptions, NavPathInfo, ScrollEffectOptions, NavigationTitleOptions,
  NavigationMenuItem, NavigationCommonTitle, NavDestinationCommonTitle, Dimension, FontWeight, NavigationMode,
  ForEach, $r, ScrollEffectType, BarStyle
} from '@ohos.arkui.component'
import { State, Provider, Param, Require, Local, Consumer, Consume } from '@ohos.arkui.stateManagement'

@Component
struct TestComponent {
  private arr: int[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i);
    }
  }

  build() {
    Scroll() {
      Column(undefined) {
        ForEach(this.arr, (item: int) => {
          Column(undefined) {
            Text(item.toString())
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor((item % 2 == 0) ? '#ff000000' : '#ffffffff')
          }.width('100%')
          .height('30%')
          .backgroundColor((item % 2 == 0) ? '#ffffffff' : '#ff000000')
        }, (item: int) => item.toString())
      }
    }
  }
}

@Component
struct MyDest {
  build() {
    NavDestination() {
      TestComponent().width('100%').height('100%')
    }.width('100%').height('100%')
    .title('', {
      systemMaterial: new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
        materialColor: '#FFFF9900',
        colorInvert: true,
        applyShadow: true,
        interactive: true,
        lightEffect: { color: Color.Pink} as uiMaterial.LightEffectOptions
      } as uiMaterial.ImmersiveOptions)
    } as NavigationTitleOptions)
  }
}

@Entry
@Component
struct NavigationTitleMaterialDemo {
  private stack: NavPathStack = new NavPathStack();
  @State titleMode: NavigationTitleMode = NavigationTitleMode.Free;

  @Builder
  MyMap(name: string) {
    MyDest()
  }

  build() {
    Column() {
      Text('systemMaterial ULTRA_THIN').fontSize(10)
      Navigation(this.stack) {
        Column() {
          TestComponent()
            .width('100%')
        }.width('100%').height('100%')
      }
      .id('navigation_systemMaterial_1')
      .width('100%')
      .height('30%')
      .mode(NavigationMode.Stack)
      .navDestination(this.MyMap)
      .title('', {
        barStyle: BarStyle.STACK,
        scrollEffectOptions: {
          scrollEffectType: ScrollEffectType.COMMON_BLUR
        } as ScrollEffectOptions,
        systemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
          materialColor: '#FFFF9900',
          colorInvert: true,
          applyShadow: true,
          interactive: true,
          lightEffect: { color: Color.Pink} as uiMaterial.LightEffectOptions
        } as uiMaterial.ImmersiveOptions)
      } as NavigationTitleOptions)
      .menus([
        {
          value: 'menu1',
          icon: $r('app.media.background')
        },
        {
          value: 'menu2',
          icon: $r('app.media.foreground')
        }
      ])
      .titleMode(this.titleMode)

      Text('systemMaterial THIN').fontSize(10)
      Navigation(this.stack) {
        Column() {
          TestComponent()
            .width('100%')
        }.width('100%').height('100%')
      }
      .width('100%')
      .height('25%')
      .mode(NavigationMode.Stack)
      .navDestination(this.MyMap)
      .title('', {
        barStyle: BarStyle.STACK,
        scrollEffectOptions: {
          scrollEffectType: ScrollEffectType.GRADUAL_BLUR
        } as ScrollEffectOptions,
        systemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: '#80FF0000',
          colorInvert: false,
          applyShadow: false,
          interactive: false,
          lightEffect: { color: Color.White } as uiMaterial.LightEffectOptions
        } as uiMaterial.ImmersiveOptions)
      } as NavigationTitleOptions)
      .menus([
        {
          value: 'menu1',
          icon: $r('app.media.background')
        },
        {
          value: 'menu2',
          icon: $r('app.media.foreground')
        }
      ])
      .titleMode(this.titleMode)

      Text('systemMaterial REGULAR').fontSize(10)
      Navigation(this.stack) {
        Column() {
          TestComponent()
            .width('100%')
        }.width('100%').height('100%')
      }
      .width('100%')
      .height('25%')
      .mode(NavigationMode.Stack)
      .navDestination(this.MyMap)
      .title('', {
        barStyle: BarStyle.STACK,
        systemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.REGULAR,
          materialColor: undefined,
          colorInvert: undefined,
          applyShadow: undefined,
          interactive: undefined,
          lightEffect: undefined
        } as uiMaterial.ImmersiveOptions)
      } as NavigationTitleOptions)
    }
    .width('100%')
    .height('100%')
  }
}