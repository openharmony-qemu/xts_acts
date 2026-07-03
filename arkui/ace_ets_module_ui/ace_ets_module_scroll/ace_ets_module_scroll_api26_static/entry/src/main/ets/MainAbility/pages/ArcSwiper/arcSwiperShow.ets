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
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  Text,
  ForEach,
  TextAlign,
  Color,
  LinearGradient,
  SwiperAnimationEvent,
  EdgeEffect,
  CrownSensitivity,
  Margin,
  ResourceColor,
  $r
} from '@ohos.arkui.component'

import {
  ArcSwiper, ArcDotIndicator, ArcDirection, ArcSwiperController,
} from '@ohos.arkui.ArcSwiper'

import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct arcSwiperTestShow {
  @State itemSimpleColor: Color | Int | string = ''
  @State selectedItemSimpleColor: Color | Int | string = ''
  private arcSwiperController: ArcSwiperController = new ArcSwiperController()
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator()
  @State arr: string[] = ['']
  @State backgroundColors: Color[] = [
    Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  @State isIndicatorSelected?: boolean | undefined = true
  @State maskColor?: (LinearGradient | undefined) = new LinearGradient([{ color: Long.toInt(0XFF67F9D4), offset: 0.5 },
    { color: Long.toInt(0XFFFFFF00), offset: 1.0 }])
  @State itemColor?: ResourceColor | undefined = $r('app.color.color_red')
  @State index?: Int | undefined = 1
  @State arcDirection?: ArcDirection | undefined = ArcDirection.SIX_CLOCK_DIRECTION
  @State backplaneColor?: ResourceColor | undefined = '#7F7F7F7F'
  @State selectedItemColor?: ResourceColor | undefined = ''
  @State onAnimationStartIndex2: Int = -1
  @State onAnimationEndIndex2: Int = -1
  @State onChangeIndex2: Int = -1
  @State finishText2: Int = 0

  aboutToAppear(): void {
    for (let i = 0; i < 6; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    Column() {
      Text('onChange: ' + this.onChangeIndex2).id('arcSwiper_show_onChange')
        .margin({ top: 10 } as Margin)
      Text('finishText: ' + this.finishText2).id('arcSwiper_show_finishAnimation')
      Text('onAnimationStart: ' + this.onAnimationStartIndex2).id('arcSwiper_show_onAnimationStart')
      Text('onAnimationEnd: ' + this.onAnimationEndIndex2).id('arcSwiper_show_onAnimationEnd')
      Row() {
        Button('showPrevious').id('arcSwiper_showPrevious')
          .height('8%')
          .onClick(() => {
            this.arcSwiperController.showPrevious()
          })
        Button('showNext').id('arcSwiper_showNext')
          .height('8%')
          .onClick(() => {
            this.arcSwiperController.showNext()
          })
      }

      ArcSwiper(this.arcSwiperController) {
        ForEach(this.arr, (item: string, index: Int) => {
          Text(index.toString())
            .width('100%')
            .height('100%')
            .backgroundColor(this.backgroundColors[index%6])
            .textAlign(TextAlign.Center)
            .fontSize(30)
        })
      }
      .width(150)
      .height(150)
      .index(this.index)
      .duration(400)
      .vertical(false)
      .effectMode(EdgeEffect.Fade)
      .indicator(this.isIndicatorSelected == true ?
        (this.arcDotIndicator
          .arcDirection(this.arcDirection)
          .itemColor(this.itemColor)
          .backgroundColor(this.backplaneColor)
          .maskColor(this.maskColor)
          .selectedItemColor(this.selectedItemColor)) : this.isIndicatorSelected
      )
      .disableSwipe(false)
      .disableTransitionAnimation(false)
      .digitalCrownSensitivity(CrownSensitivity.LOW)
      .onChange((index: Int) => {
        this.onChangeIndex2 = index
        console.info('onChange:' + index.toString())
      })
      .onAnimationStart((index: Int, targetIndex: Int, event: SwiperAnimationEvent) => {
        this.onAnimationStartIndex2 = index

        console.info('index: ' + index)
        console.info('targetIndex: ' + targetIndex)
        console.info('current offset: ' + event.currentOffset)
        console.info('target offset: ' + event.targetOffset)
        console.info('velocity: ' + event.velocity)
      })
      .onAnimationEnd((index: Int, event: SwiperAnimationEvent) => {
        this.onAnimationEndIndex2 = index
        this.arcSwiperController.finishAnimation(() => {
          console.log('onAnimationEnd finishAnimation')
          this.finishText2++
        })
        console.info('index: ' + index)
        console.info('current offset: ' + event.currentOffset)
      })
    }
    .width('90%')
    .height('100%')
  }
}