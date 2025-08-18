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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,animateTo,AnimateParam,Search,TextAlign,Axis,NavDestinationInfo,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Date
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  Prop,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext,UIObserver } from '@ohos.arkui.UIContext';
import observer from '@ohos.arkui.observer';

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
  // @Provide stackA: NavPathStack = new NavPathStack();
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
        AppStorage.setOrCreate<string>('showText', 'on');
        console.log(`testTag navDestinationSwitchCallbackWithUIContext1, info: \"from\":${typeof info.from === 'string' ? ('"' + info.from + '"') : JSON.stringify(info.from)},\"to\":${typeof info.to === 'string' ? ('"' + info.to + '"') : JSON.stringify(info.to)}`);
      }
    }
  }

  navDesUpdateCallback1(info: NavDestinationInfo) {
    AppStorage.setOrCreate<string>('showUpdateText', 'on');
    console.log(`testTag navDesUpdateCallback1, info: ${AppStorage.get<string>('showUpdateText') as string}`);
  }

  aboutToAppear(): void {
    this.obs = this.getUIContext().getUIObserver();
  }

  contextObserverOn(){
    this.obs?.on('navDestinationSwitch', this.navDestinationSwitchCallbackWithUIContext1);
    this.obs?.on('navDestinationUpdate', this.navDesUpdateCallback1);
  }

  contextObserverOff(){
    AppStorage.setOrCreate<string>('showText', 'off');
    AppStorage.setOrCreate<string>('showUpdateText', 'off');
    console.log(`testTag navDesUpdateCallback1, info: ${AppStorage.get<string>('showUpdateText') as string}`);
    this.obs?.off('navDestinationSwitch', this.navDestinationSwitchCallbackWithUIContext1);
    this.obs?.off('navDestinationUpdate', this.navDesUpdateCallback1);
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
      // Navigation(this.stackA) {
      //   Column({space:10}){
      //     Button('MainA push pageOne')
      //       .onClick((e: ClickEvent) => {
      //         this.stackA.pushPath({name: 'pageOne', param: 1})
      //       })
      //       .id('pushId')
      //   }
      // }
      // .navDestination(this.PageMapA)
      // .title('MainA')
      // .titleMode(NavigationTitleMode.Mini)
      // .backgroundColor(Color.Pink)
      // .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}