/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  SwiperContentTransitionProxy,
  Color,
  Column,
  SwiperController,
  Text,
  Swiper,
  ForEach,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SwiperCustomPage {
  private swiperController: SwiperController = new SwiperController()
  @State backgroundColors: Color[] = [Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  @State opacityList: number[] = new Array<number>()
  @State scaleList: number[] = new Array<number>()
  @State translateList: number[] = new Array<number>()
  @State zIndexList: int[] = new Array<int>()
  @State message: string = 'message'
  private DISPLAY_COUNT: Int = 2
  private MIN_SCALE: number = 0.75
  @State text: string = 'text'

  aboutToAppear(): void {
    for (let i = 0; i < this.backgroundColors.length; i++) {
      this.opacityList.push(1.0)
      this.scaleList.push(1.0)
      this.translateList.push(0.0)
      this.zIndexList.push(0)
    }
  }

  build() {
    Column() {
      Text(this.message).id('swiper_mess')
      Text(this.text).id('swiper_texts')
      Swiper(this.swiperController) {
        ForEach(this.backgroundColors, (backgroundColor: Color, index: int) => {
          Text(index.toString())
            .width('100%')
            .height('100%')
            .fontSize(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(backgroundColor)
            .opacity(this.opacityList[index.toInt()])
            .scale({ x: this.scaleList[index.toInt()], y: this.scaleList[index.toInt()] })
            .translate({ x: this.translateList[index.toInt()] })
            .zIndex(this.zIndexList[index.toInt()])
        })
      }
      .id('Swiper_Length')
      .height(300)
      .indicator(false)
      .indicatorInteractive(true)
      .displayCount(this.DISPLAY_COUNT, true)
      .customContentTransition({
        
        timeout: 1000,
        
        transition: (proxy: SwiperContentTransitionProxy) => {
          this.text = 'mainAxisLength'
          if (proxy.position <= proxy.index % this.DISPLAY_COUNT ||
            proxy.position >= this.DISPLAY_COUNT + proxy.index % this.DISPLAY_COUNT) {
            
            this.opacityList[proxy.index.toInt()] = 1.0
            this.scaleList[proxy.index.toInt()] = 1.0
            this.translateList[proxy.index.toInt()] = 0.0
            this.zIndexList[proxy.index.toInt()] = 0
          } else {
            
            if (proxy.index % this.DISPLAY_COUNT === 0) {
              this.opacityList[proxy.index.toInt()] = 1 - proxy.position / this.DISPLAY_COUNT
              this.scaleList[proxy.index.toInt()] =
                this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - proxy.position / this.DISPLAY_COUNT)
              this.translateList[proxy.index.toInt()] = -proxy.position * proxy.mainAxisLength +
                (1 - this.scaleList[proxy.index.toInt()]) * proxy.mainAxisLength / 2.0
            } else {
              this.opacityList[proxy.index.toInt()] = 1 - (proxy.position - 1) / this.DISPLAY_COUNT
              this.scaleList[proxy.index.toInt()] =
                this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - (proxy.position - 1) / this.DISPLAY_COUNT)
              this.translateList[proxy.index.toInt()] = -(proxy.position - 1) * proxy.mainAxisLength -
                (1 - this.scaleList[proxy.index.toInt()]) * proxy.mainAxisLength / 2.0
            }
            this.zIndexList[proxy.index.toInt()] = -1
          }
        }
      })
      .onContentDidScroll((selectedIndex: number, index: number, position: number, mainAxisLength: number): void => {
        
        this.message = 'onContentDidScroll'
        console.info("onContentDidScroll selectedIndex: " + selectedIndex + ", index: " + index + ", position: " +
          position + ", mainAxisLength: " + mainAxisLength)
      })
    }.width('100%')
  }
}