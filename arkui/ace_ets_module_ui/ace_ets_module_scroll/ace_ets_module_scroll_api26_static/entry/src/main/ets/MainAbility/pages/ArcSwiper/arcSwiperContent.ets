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
  IDataSource,
  LinearGradient,
  SwiperAnimationEvent,
  Circle,
  DataChangeListener,
  EdgeEffect,
  CrownSensitivity,
  FlexAlign,
  Margin,
} from '@ohos.arkui.component'

import {
  ArcSwiper,
  ArcSwiperAttribute,
  ArcDotIndicator,
  ArcDirection,
  ArcSwiperController,
  ArcSwiperContentTransitionProxy
} from '@ohos.arkui.ArcSwiper'

import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct arcSwiperContentTest {
  @State itemSimpleColor: Color | Int | string = ''
  @State selectedItemSimpleColor: Color | Int | string = ''
  private arcSwiperController: ArcSwiperController = new ArcSwiperController()
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator()
  @State backgroundColors: Color[] = [
    Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  @State opacityList: Double[] = [0.0]
  @State scaleList: Double[] = [0.0]
  @State translateList: Double[] = [0.0]
  @State zIndexList: Int[] = [0]
  @State selectedIndex1: Int = -1
  @State index1: Int = -1
  @State onAnimationStartIndex: Int = -1
  private DISPLAY_COUNT: Int = 1
  private MIN_SCALE: Double = 0.75

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
      Text('onAnimationStartIndex: ' + this.onAnimationStartIndex).id('onAnimationStart_arcs_content')
        .margin({ top: 10 } as Margin)
      Text('index: ' + this.index1).id('index1_arcs_content')
      ArcSwiper(this.arcSwiperController) {
        ForEach(this.backgroundColors, (backgroundColor: Color, index: Int) => {
          Text(index.toString())
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
            .fontSize(30)
            .backgroundColor(backgroundColor)
            .opacity(this.opacityList[index])
            .scale({ x: this.scaleList[index], y: this.scaleList[index] })
            .translate({ x: this.translateList[index] })
            .zIndex(this.zIndexList[index])
        })
      }
      .id('arcs_customContent')
      .width(150)
      .height(150)
      .effectMode(EdgeEffect.Fade)
      .backgroundColor(Color.Transparent)
      .index(0)
      .duration(400)
      .vertical(false)
      .indicator(this.arcDotIndicator
        .arcDirection(ArcDirection.SIX_CLOCK_DIRECTION)
        .itemColor(this.itemSimpleColor)
        .selectedItemColor(this.selectedItemSimpleColor)
        .backgroundColor(Color.Gray)
        .maskColor(new LinearGradient([{ color: '#FF67F9D4', offset: 0 }, { color: '#FFFF9554', offset: 1 }]))
      )
      .disableSwipe(false)
      .digitalCrownSensitivity(CrownSensitivity.MEDIUM)
      .disableTransitionAnimation(false)
      .onChange((index: Int) => {
        console.info('onChange:' + index.toString())
      })
      .onGestureSwipe((index: Int, event: SwiperAnimationEvent) => {
        console.info('onGestureSwipe index: ' + index)
        console.info('onGestureSwipe current offset: ' + event.currentOffset)
        console.info('onGestureSwipe target offset: ' + event.targetOffset)
        console.info('onGestureSwipe velocity: ' + event.velocity)
      })
      .onAnimationStart((index: Int, targetIndex: Int, event: SwiperAnimationEvent) => {
        this.onAnimationStartIndex = index

        console.info('index: ' + index)
        console.info('targetIndex: ' + targetIndex)
        console.info('current offset: ' + event.currentOffset)
        console.info('target offset: ' + event.targetOffset)
        console.info('velocity: ' + event.velocity)
      })
      .customContentTransition({
        timeout: 1000,
        transition: (proxy: ArcSwiperContentTransitionProxy) => {
          console.info('transition：index: ' + proxy.index + ',' + 'selectedIndex: ' + proxy.selectedIndex + ',' +
            'position: ' + proxy.position + ',' + 'mainAxisLength: ' + proxy.mainAxisLength)
          this.selectedIndex1 = proxy.selectedIndex
          this.index1 = proxy.index
          if (proxy.position <= proxy.index % this.DISPLAY_COUNT ||
            proxy.position >= this.DISPLAY_COUNT + proxy.index % this.DISPLAY_COUNT) {
            this.opacityList[proxy.index] = 1.0
            this.scaleList[proxy.index] = 1.0
            this.translateList[proxy.index] = 0.0
            this.zIndexList[proxy.index] = 0
            proxy.finishTransition()
          } else {
            if (proxy.index % this.DISPLAY_COUNT === 0) {
              this.opacityList[proxy.index] = 1 - proxy.position / this.DISPLAY_COUNT
              this.scaleList[proxy.index] =
                this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - proxy.position / this.DISPLAY_COUNT)
              this.translateList[proxy.index] =
                -proxy.position * proxy.mainAxisLength + (1 - this.scaleList[proxy.index]) * proxy.mainAxisLength / 2.0
            } else {
              this.opacityList[proxy.index] = 1 - (proxy.position - 1) / this.DISPLAY_COUNT
              this.scaleList[proxy.index] =
                this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - (proxy.position - 1) / this.DISPLAY_COUNT)
              this.translateList[proxy.index] = -(proxy.position - 1) * proxy.mainAxisLength -
                (1 - this.scaleList[proxy.index]) * proxy.mainAxisLength / 2.0
            }
            this.zIndexList[proxy.index] = -1
            proxy.finishTransition()
          }
        }
      })

    }.height('100%')
  }
}