/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Callback, Message, MessageManager } from '../../common/MessageManager';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  BarPosition,
  BaseGestureEvent,
  Builder,
  Button,
  Color,
  Column,
  Component,
  Divider,
  Entry,
  GestureControl,
  GestureJudgeResult,
  GestureRecognizer,
  Margin,
  Padding,
  PanGestureEvent,
  Resource,
  ScrollableTargetInfo,
  SubTabBarStyle,
  TabContent,
  Tabs,
  TabsAnimationEvent,
  TabsController,
  Text
} from '@ohos.arkui.component'

interface ParamName {
  name: string,
  message: MessageManager<Resource>
}

@Entry
@Component
struct GestureTest {
  @State currentIndex: int = 0
  @State selectedIndex: number = 0
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  controller?: TabsController = new TabsController();
  @State exposeInnerGesture: boolean = true;
  @State callBackString: string = "";
  messageManager: MessageManager<Resource> = new MessageManager<Resource>();

  onPageShow() {
    console.info('tabsInterceptionEnhancement pages onPageShow');
    let value: ParamName = {
      name: 'messageManager', message: this.messageManager
    }

    AppStorage.setOrCreate<ParamName>('value', value);
    let callback: (message: Message<Resource>) => void = (message: Message<Resource>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'exposeInnerGesture') {
        this.exposeInnerGesture = Boolean(message.value);
      }

    };
    this.messageManager.registerCallback(callback);
  }

  @Builder
  tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.selectedIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.selectedIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 } as Margin)
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.selectedIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column() {
      Text(this.callBackString).key("callBackS");
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column() {
            Text(`GreenTest`).fontSize(16)
          }.width('100%').height('100%').backgroundColor(Color.Green).key("firstTabsContent")

        }

        TabContent() {
          Tabs() {
            TabContent() {
              Column() {
                Text(`BlueTest`).fontSize(16)
              }.width('100%').height('100%').backgroundColor(Color.Blue)
            }.tabBar(new SubTabBarStyle('blue'))

            TabContent() {
              Column() {
                Text(`PinkTest`).fontSize(16)
              }.width('100%').height('100%').backgroundColor(Color.Pink)
            }.tabBar(new SubTabBarStyle('pink'))
          }
          .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
            others: Array<GestureRecognizer>): GestureJudgeResult => {
            console.info('ets onGestureRecognizerJudgeBegin child')
            this.callBackString = "接口触发"
            if (current) {
              let target = current.getEventTargetInfo();
              if (target && current.isBuiltIn() && current.getType() == GestureControl.GestureType.PAN_GESTURE) {
                console.info('ets onGestureRecognizerJudgeBegin child PAN_GESTURE')
                let swiperTaget = target as ScrollableTargetInfo
                if (swiperTaget instanceof ScrollableTargetInfo) {
                  console.info('ets onGestureRecognizerJudgeBegin child PAN_GESTURE isEnd: ' + swiperTaget.isEnd() +
                    ' isBegin: ' + swiperTaget.isBegin())
                }
                if (swiperTaget instanceof ScrollableTargetInfo && (swiperTaget.isEnd() || swiperTaget.isBegin())) {
                  let panEvent = event as PanGestureEvent;
                  console.log('pan direction:' + panEvent.offsetX + ' begin:' + swiperTaget.isBegin() + ' end:' +
                  swiperTaget.isEnd())
                  if (panEvent && panEvent.offsetX < 0 && swiperTaget.isEnd()) {
                    console.info('ets onGestureRecognizerJudgeBegin child reject end')
                    return GestureJudgeResult.REJECT;
                  }
                  if (panEvent && panEvent.offsetX > 0 && swiperTaget.isBegin()) {
                    console.info('ets onGestureRecognizerJudgeBegin child reject begin')
                    return GestureJudgeResult.REJECT;
                  }
                }
              }
            }
            return GestureJudgeResult.CONTINUE;
          }, this.exposeInnerGesture)
        }

        TabContent() {
          Column() {
            Text(`blue and pink test`).fontSize(16)
          }.width('100%').height('100%').backgroundColor(Color.Brown)
        }

      }
      .onAnimationStart((index: int, targetIndex: int, event: TabsAnimationEvent): void => {

        this.selectedIndex = targetIndex
      })
    }
  }
}