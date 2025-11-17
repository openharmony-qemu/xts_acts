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
// import { AtomicServiceNavigation, BackgroundTheme, GradientAlpha, MixMode, TitleBarType } from '@ohos.atomicservice.AtomicServiceNavigation';
import { Entry, Component, Builder, Column, Button, Text, Row, Color, ClickEvent, ResourceStr, NavPathStack } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct AtomicServiceNavigationTest {
  @State message: ResourceStr = 'Navigation Title';
  childNavStack: NavPathStack = new NavPathStack();
  @State clickTime: number = 0;
  @State pageIndex: number = 1;

  @Builder
  pageMap(name: string) {

  }

  @Builder
  navigationContent() {
    Column() {
      Text('this is navigationContent')
    }
      .width('100%')
      .height('100%')
  }

  @Builder
  insertComp() {
    Row() {
      Text('This is menus area')
        .fontColor(Color.Red)
        .width(140)
        .height('100%')
      Button('点击修改')
        .padding(10)
        .onClick((e: ClickEvent) => {
          console.log(`[mzf] clicked`)
        })
    }
    .height('100%')
  }

  @Builder
  sideBarContentBuilder() {
    Text('This is sideBar content area')
      .fontSize(20)
  }

  build() {
    Column() {
      Button('page1').onClick((e: ClickEvent) => {
        this.pageIndex = 1;
      })
      Button('page2').onClick((e: ClickEvent) => {
        this.pageIndex = 2;
      })
      Button('page3').onClick((e: ClickEvent) => {
        this.pageIndex = 3;
      })
      Button('page4').onClick((e: ClickEvent) => {
        this.pageIndex = 4;
      })
      if (this.pageIndex === 1) {
        // AtomicServiceNavigation({
        //   title: 'My Navigation',
        //   titleOptions: {
        //     titleIcon: $r('app.media.icon'),
        //     backgroundColor: 'yellow',
        //     barStyle: BarStyle.STANDARD,
        //     titleBarType: TitleBarType.DRAWER
        //   },
        //   menus: () => { this.insertComp() },
        //   sideBarContent: () => { this.sideBarContentBuilder() },
        //   sideBarOptions: {
        //     sideBarBackground: 'rgba(255, 0, 0, 1)',
        //     sideBarIcon: $r('app.media.icon'),
        //     onChange: (show: boolean) => { console.log(`show status is ${show}`); }
        //   },
        //   gradientBackground: {
        //     primaryColor: '#FF0000',
        //     secondaryColor: '#00FF00',
        //     mixMode: MixMode.AVERAGE,
        //     alpha: GradientAlpha.OPACITY_20,
        //     backgroundTheme: BackgroundTheme.DARK
        //   },
        //   mode: NavigationMode.Stack,
        //   stateChangeCallback: () => { console.log('state changed'); },
        //   modeChangeCallback: () => { console.log('mode changed'); },
        //   minContentWidth: 200,
        //   hideTitleBar: false,
        //   navBarWidth: 360,
        //   navBarWidthRange: [240, 400]
        // })
        //   .height('50%')
      } else if (this.pageIndex === 2) {
        // AtomicServiceNavigation({
        //   title: 'My Navigation',
        //   titleOptions: {
        //     titleIcon: $r('app.media.icon'),
        //     backgroundColor: 'yellow',
        //     barStyle: BarStyle.STANDARD,
        //     titleBarType: TitleBarType.SQUARED_ICON
        //   },
        //   menus: () => { this.insertComp() },
        //   sideBarContent: () => { this.sideBarContentBuilder() },
        //   sideBarOptions: {
        //     sideBarBackground: 'rgba(255, 0, 0, 1)',
        //     sideBarIcon: $r('app.media.icon'),
        //     onChange: (show: boolean) => { console.log(`show status is ${show}`); }
        //   },
        //   gradientBackground: {
        //     primaryColor: '#FF0000',
        //     secondaryColor: '#00FF00',
        //     mixMode: MixMode.CROSS,
        //     alpha: GradientAlpha.OPACITY_60,
        //     backgroundTheme: BackgroundTheme.LIGHT
        //   },
        //   mode: NavigationMode.Stack,
        //   stateChangeCallback: () => { console.log('state changed'); },
        //   modeChangeCallback: () => { console.log('mode changed'); },
        //   minContentWidth: 200,
        //   hideTitleBar: false,
        //   navBarWidth: 360,
        //   navBarWidthRange: [240, 400]
        // })
        //   .height('50%')
      } else if (this.pageIndex === 3) {
        // AtomicServiceNavigation({
        //   title: 'My Navigation',
        //   titleOptions: {
        //     titleIcon: $r('app.media.icon'),
        //     backgroundColor: 'yellow',
        //     barStyle: BarStyle.STANDARD,
        //     titleBarType: TitleBarType.ROUND_ICON,
        //     isBlurEnabled: false
        //   },
        //   menus: () => { this.insertComp() },
        //   sideBarContent: () => { this.sideBarContentBuilder() },
        //   sideBarOptions: {
        //     sideBarBackground: 'rgba(255, 0, 0, 1)',
        //     sideBarIcon: $r('app.media.icon'),
        //     onChange: (show: boolean) => { console.log(`show status is ${show}`); }
        //   },
        //   gradientBackground: {
        //     primaryColor: '#FF0000',
        //     secondaryColor: '#00FF00',
        //     mixMode: MixMode.TOWARDS,
        //     alpha: GradientAlpha.OPACITY_80,
        //     backgroundTheme: BackgroundTheme.DEFAULT
        //   },
        //   mode: NavigationMode.Stack,
        //   stateChangeCallback: () => { console.log('state changed'); },
        //   modeChangeCallback: () => { console.log('mode changed'); },
        //   minContentWidth: 200,
        //   hideTitleBar: false,
        //   navBarWidth: 360,
        //   navBarWidthRange: [240, 400]
        // })
        //   .height('50%')
      } else {
        // AtomicServiceNavigation({
        //   navPathStack: this.childNavStack,
        //   navDestinationBuilder: this.pageMap,
        //   navigationContent: () => {
        //     this.navigationContent()
        //   },
        //   title: 'My Navigation',
        //   titleOptions: {
        //     titleIcon: $r('app.media.icon'),
        //     backgroundColor: 'yellow',
        //     barStyle: BarStyle.STANDARD,
        //     titleBarType: TitleBarType.DRAWER
        //   },
        //   menus: () => { this.insertComp() },
        //   sideBarContent: () => { this.sideBarContentBuilder() },
        //   sideBarOptions: {
        //     sideBarBackground: 'rgba(255, 0, 0, 1)',
        //     sideBarIcon: $r('app.media.icon'),
        //     onChange: (show: boolean) => { console.log(`show status is ${show}`); }
        //   },
        //   gradientBackground: {
        //     primaryColor: '#FF0000',
        //     secondaryColor: '#00FF00',
        //     mixMode: MixMode.AVERAGE,
        //     alpha: GradientAlpha.OPACITY_100,
        //     backgroundTheme: BackgroundTheme.DARK
        //   },
        //   mode: NavigationMode.Stack,
        //   stateChangeCallback: () => { console.log('state changed'); },
        //   modeChangeCallback: () => { console.log('mode changed'); },
        //   minContentWidth: 200,
        //   hideTitleBar: false,
        //   navBarWidth: 360,
        //   navBarWidthRange: [240, 400]
        // })
        //   .height('50%')
      }
    }
    .width('100%')
  }

}