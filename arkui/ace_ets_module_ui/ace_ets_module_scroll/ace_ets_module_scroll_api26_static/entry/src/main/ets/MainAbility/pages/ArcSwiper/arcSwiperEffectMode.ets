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
  Select,
  List,
  Text,
  ForEach,
  Scroll,
  LengthMetrics,
  Toggle,
  Scroller,
  ColorSpace,
  Margin,
  Color,
  TextAlign,
  DividerMode,
  EdgeEffect,
  ToggleType,
  CrownSensitivity,
  LinearGradient,
  SwiperAnimationEvent
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

import { CircleShape } from '@ohos.arkui.shape'

@Entry
@Component
struct arcSwiperContentTest {
  @State itemSimpleColor: Color | int | string = ''
  @State selectedItemSimpleColor: Color | int | string = ''
  private arcSwiperController: ArcSwiperController = new ArcSwiperController()
  private arcDotIndicator: ArcDotIndicator = new ArcDotIndicator()
  @State backgroundColors: Color[] = [
    Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange]
  innerSelectedIndex: int = 0;
  @State scaleList: double[] = [0.0]
  @State isVertical: (boolean | undefined)[] = [true, false, undefined]
  @State isVerticalIndex: int = 1
  @State isEffectMode: (EdgeEffect | undefined)[] =
    [EdgeEffect.Spring, EdgeEffect.Fade, EdgeEffect.None, undefined]
  @State isEffectModeIndex: int = 3

  aboutToAppear(): void {
    for (let i = 0; i < this.backgroundColors.length; i++) {
      this.scaleList.push(1)
    }
  }

  build() {
    Column() {
      Column() {
        ArcSwiper(this.arcSwiperController) {
          ForEach(this.backgroundColors, (backgroundColor: Color, index: int) => {
            Text(index.toString())
              .width(150)
              .height(150)
              .textAlign(TextAlign.Center)
              .fontSize(30)
              .backgroundColor(backgroundColor)
              .scale({ x: this.scaleList[index], y: this.scaleList[index] })
          })
        }
        .id('arcSwiper_Effect')
        .clipShape(new CircleShape({ width: 150, height: 150 }))
        .effectMode(this.isEffectMode[this.isEffectModeIndex])
        .backgroundColor(Color.Transparent)
        .index(0)
        .duration(1000)
        .indicator(this.arcDotIndicator
          .maskColor(new LinearGradient([{ color: Color.Blue, offset: 0 }]))
          .arcDirection(ArcDirection.SIX_CLOCK_DIRECTION)
          .itemColor(this.itemSimpleColor)
          .selectedItemColor(this.selectedItemSimpleColor)
        )
        .digitalCrownSensitivity(CrownSensitivity.MEDIUM)
        .vertical(false)
        .disableTransitionAnimation(false)
        .disableSwipe(false)
        .onChange((index: int) => {
          console.info('onChangeYjf:' + index.toString());
        })
      }.height('50%')

      Scroll() {
        Column() {
          Row() {
            Select([{ value: '动效:spring' }, { value: '动效:fade' },
              { value: '动效:none' },
              { value: '动效:undefined' }])
              .value('动效')
              .dividerStyle({
                strokeWidth: LengthMetrics.vp(5),
                color: '#d5d5d5',
                mode: DividerMode.EMBEDDED_IN_MENU
              })
              .onSelect((index: int, text?: string | undefined) => {
                console.info('Select:' + index);
                this.isEffectModeIndex = index
                console.info('Select:' + this.isEffectModeIndex);
              })
              .id('select_Effect')
          }
        }
      }.height('50%')
    }.width('100%').height('100%')
  }
}