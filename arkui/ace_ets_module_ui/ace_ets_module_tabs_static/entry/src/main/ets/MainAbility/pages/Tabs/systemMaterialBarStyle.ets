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
import uiMaterial from '@ohos.arkui.uiMaterial'
import {
  Entry, 
  Text, 
  Column, 
  Component, 
  Tabs, 
  TabContent, 
  BarPosition, 
  Color, 
  BarMode,
  Divider, 
  Scroll, 
  FloatingTabBarStyle, 
  LayoutSafeAreaType, 
  LayoutSafeAreaEdge
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SystemMaterialTabsBarStylePage {
  @State useNewMaterial: boolean = true;

  build() {
    Scroll() {
      Column() {
        Text('Tabs barFloatingStyle systemMaterial')
        Text('systemMaterial THIN')
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
        .id('tabs_systemMaterial_thin')
        .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
        .barFloatingStyle({
          barWidth: {
            smallBarWidth:100, mediumBarWidth:150, largeBarWidth:200
          },
          barSideMargin: 80,
          barBottomMargin: 50,
          systemMaterial: this.useNewMaterial ? new uiMaterial.ImmersiveMaterial(
            {
              style: uiMaterial.ImmersiveStyle.THIN,
              materialColor: Color.Transparent,
              colorInvert: false,
              applyShadow: false,
              interactive: true,
              lightEffect: { color: Color.White }
            } as uiMaterial.ImmersiveOptions
          ) : undefined} as FloatingTabBarStyle)
        .barHeight(56)
        .barOverlap(true)
        .vertical(false)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .onChange((index: int) => {
          console.info(index.toString());
        })
        .width('100%')
        .height('15%')

        Text('systemMaterial ULTRA_THIN')
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
        .id('tabs_systemMaterial_ultra_thin')
        .barFloatingStyle({
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
            interactive: false,
            colorInvert: true,
            applyShadow: true,
            lightEffect: { color: Color.White }
          } as uiMaterial.ImmersiveOptions)
        } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Text('systemMaterial REGULAR')
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
        .id('tabs_systemMaterial_regular')
        .barFloatingStyle({
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.REGULAR,
            materialColor: undefined,
            applyShadow: undefined,
            colorInvert: undefined,
            interactive: undefined,
            lightEffect: undefined
          } as uiMaterial.ImmersiveOptions)
        } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Text('adaptToHandedness systemMaterial')
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
        .id('tabs_adapt_systemMaterial_true')
        .barFloatingStyle({
          adaptToHandedness: true,
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.THICK,
            applyShadow: true,
            interactive: true,
            colorInvert: false,
            lightEffect: { color: Color.White }
          } as uiMaterial.ImmersiveOptions)
        } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('15%')

        Text('systemMaterial with barWidth')
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
        .id('tabs_systemMaterial_barWidth')
        .barFloatingStyle({
          barWidth: { smallBarWidth: 100, mediumBarWidth: 200, largeBarWidth: 300 },
          systemMaterial: new uiMaterial.ImmersiveMaterial({
            style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
            materialColor: Color.Blue,
            colorInvert: true,
            applyShadow: true,
            interactive: false,
          } as uiMaterial.ImmersiveOptions)
        } as FloatingTabBarStyle)
        .barOverlap(true)
        .width('100%')
        .height('15%')
      }
      .width('100%')
      .backgroundColor('#C0C0C0')
    }
    .height('100%')
    .width('100%')
  }
}