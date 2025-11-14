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
import { StatusClickComponent } from './publishStatusClick';
import { Entry, Text, Column, Component,Padding, Button, ClickEvent, Grid, ForEach, GridItem, TextAlign, BarState,
  EdgeEffect, ScrollSource, ScrollResult, ScrollState} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GridExampleA {
  private arr: Array<Double> = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
  @State message:string=''
  @State message1:string=''
  @State message2:string=''
  @State message3:string=''
  @State message4:string=''
  @State buttonNumber: number = 0;
  @State isBackToTop: boolean|undefined|null = false
  @State scrollCount: number = 0;
  @State scrollOffset: number = 0;
  private currentIndex: int = 0;
  build() {
    Column() {
      StatusClickComponent()
      Button('switch').onClick((e: ClickEvent) => {
        if (this.currentIndex !== 0) {
          this.scrollCount ++;
        }
        switch (String(this.isBackToTop)) {
          case 'false':
            this.isBackToTop = undefined
            break;
          case "undefined":
            this.isBackToTop = null
            break;
          case "null":
            this.isBackToTop = true
            break;
          case "true":
            this.isBackToTop = false
            break;
        }
      }).id('Switch')
      Text('offset:' + this.scrollOffset)
      Text('count:' + this.scrollCount)
      Text(this.message).id('gridScroll_1')
      Text(this.message1).id('gridScroll_2')
      Text(this.message2).id('gridScroll_3')
      Text(this.message3).id('gridBackToTop')
      Text(this.message4).id('gridAbnormal')
      Grid() {
        ForEach(this.arr, (item: number, index: int) => {
          GridItem() {
            Text('' + item)
              .width('100%').height('20%').fontSize(16)
              .textAlign(TextAlign.Center).borderRadius(10)//.backgroundColor(0xFFFFFF)
          }
          .onAppear(() => {
            this.currentIndex = index;
          })
        }, (item: number) => String(item))
      }
      .backToTop(this.isBackToTop ?? false)
      .columnsTemplate('1fr')
      .id('gridScroll_4')
      .scrollBar(BarState.Off)
      .friction(0.6)
      .edgeEffect(EdgeEffect.Spring)

      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
          this.message='onWillScroll'
          this.message3 = 'NotBackToTop';
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState): void => {
        this.message1='onDidScroll'
      })
      .onDidScroll((offset: number, scrollState: ScrollState): void => {
        this.scrollOffset = offset;
          if (this.scrollCount === 3) {
            console.log('DidAbnormal---------')
            this.message4 = 'DidAbnormal';
          }
      })
      .onReachStart(() => {
        this.message3 = 'onDidGridBackToTop';
      })
      .width('70%')
      .height('80%')
    }
    .width('100%')
    .height('100%')
    // .backgroundColor(0xDCDCDC)
    .padding({ top: 5 } as Padding)
  }
}
