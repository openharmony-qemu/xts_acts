/*
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
import { UIContext, Router, UIObserver } from '@ohos.arkui.UIContext';
import observer from '@ohos.arkui.observer';
import { image } from '@kit.ImageKit';
import { Entry, Component, NavPathStack, Builder, Navigation, Column, Button, ColumnOptions, ClickEvent, NavigationTitleMode, Text, Color,
  NavigationMode, NavDestination, NavPathInfo, BarStyle, Stack, StackOptions, BlurStyle, Row, Image, Margin, Alignment, $r, Resource, NavDestinationInfo
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage } from '@ohos.arkui.stateManagement'
@Component
struct PageOne {
  @Consume('stackA') stackA:NavPathStack;
  build() {
    NavDestination() {
      Text('pageOne')
      Button('back').onClick((e: ClickEvent) => {
        this.stackA.pop();
      })
      .height('5%')
      .id('backId')
    }.title('pageOne')
  }
}

@Entry
@Component
struct NavDestinationUIObserver {
  @Provide({alias: 'stackA' }) stackA: NavPathStack = new NavPathStack();
  @State stackB: NavPathStack = new NavPathStack();
  private obs: UIObserver | null = null;
  @State showText: string = '';

  @Builder
  PageMapA(name: string) {
    if (name === 'pageOne') {
      PageOne()
    } else if (name === 'pageTwo'){
      PageOne()
    } else if (name === 'pageThree'){
      PageOne()
    }
  }

  @Builder
  PageMapB(name: string) {
    if (name === 'pageOne') {
      PageOne()
    }
  }

  navDestinationSwitchCallbackWithUIContext1(info: observer.NavDestinationSwitchInfo) {
    if (info) {
      if (info.context) {
        AppStorage.setOrCreate('showText', 'on');
        console.log(`testTag navDestinationSwitchCallbackWithUIContext1, info: \"from\":${typeof info.from === 'string' ? ('"' + info.from + '"') : JSON.stringify(info.from)},\"to\":${typeof info.to === 'string' ? ('"' + info.to + '"') : JSON.stringify(info.to)}`);
      }
    }
  }

  navDesUpdateCallback1(info: NavDestinationInfo) {
    AppStorage.setOrCreate('showUpdateText', 'on');
    console.log(`testTag navDesUpdateCallback1, info: ${AppStorage.get('showUpdateText')! as string}`);
  }

  aboutToAppear(): void {
    this.obs = this.getUIContext().getUIObserver();
  }

  contextObserverOn(){
    this.obs?.onNavDestinationSwitch(this.navDestinationSwitchCallbackWithUIContext1);
    this.obs?.onNavDestinationUpdate(this.navDesUpdateCallback1);
  }

  contextObserverOff(){
    AppStorage.setOrCreate('showText', 'off');
    AppStorage.setOrCreate('showUpdateText', 'off');
    console.log(`testTag navDesUpdateCallback1, info: ${AppStorage.get('showUpdateText')! as string}`);
    this.obs?.offNavDestinationSwitch(this.navDestinationSwitchCallbackWithUIContext1);
    this.obs?.offNavDestinationUpdate(this.navDesUpdateCallback1);
  }

  build() {
    Column({space:5} as ColumnOptions) {
      Button('contextObserver.on')
        .onClick((e: ClickEvent) => {
          this.contextObserverOn()
        })
        .height('5%')
        .id('onBtn')

      Button('contextObserver.off')
        .onClick((e: ClickEvent) => {
          this.contextObserverOff()
        })
        .height('5%')
        .id('offBtn')

      Text(this.showText).key('showTextKey').height('5%')
      Navigation(this.stackA) {
        Column({space:10} as ColumnOptions){
          Button('MainA push pageOne')
            .onClick((e: ClickEvent) => {
              this.stackA.pushPath(new NavPathInfo('pageOne', 1 ))
            })
            .id('pushId')
        }
      }
      .navDestination(this.PageMapA)
      .title('MainA')
      .titleMode(NavigationTitleMode.Mini)
      .backgroundColor(Color.Pink)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}