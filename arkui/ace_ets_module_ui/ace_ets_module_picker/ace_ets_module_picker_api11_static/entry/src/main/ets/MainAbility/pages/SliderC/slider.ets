/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import {
  Entry,
  Component,
  Column,
  Text,
  Row,
  Color,
  Rating,
  Margin,
  Axis,
  ColumnOptions,
  SliderChangeMode,
  Slider,
  Padding,
  SliderStyle,
  FlexAlign
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct SliderExample {
  @State outSetValueOne: double = 40
  @State style: SliderStyle = SliderStyle.InSet
  @State directionT: Axis = Axis.Vertical
  @State reverse: boolean = true
  @State min: double = 2
  @State max: double = 1000
  @State step: double = 0.7
  @State inSetValueOne: double = 40
  @State outSetValueTwo: double = 40
  @State inSetValueTwo: double = 40
  @State vOutSetValueOne: double = 40
  @State vInSetValueOne: double = 40
  @State vInSetValueOne1: double = 40
  @State vOutSetValueTwo: double = 40
  @State vInSetValueTwo: double = 40
  @State blockColor: string = "#191970"
  @State trackColor: string = "#ADD8E6"
  @State selectedColor: string = "#191970"
  @State showSteps: boolean = true
  @State showTips: boolean = true
  @State trackThickness: string = '10px'
  @State modeT: string = 'mode'
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('slider onPageShow')

    AppStorage.setOrCreate('messageManager', this.messageManager)

  }

  build() {
    Column() {
      Row(){
        Text(this.vInSetValueOne + "").fontSize(9).fontColor(0xCCCCCC).key('tex')
        Text(this.modeT).fontSize(9).fontColor(0xCCCCCC).key('modeT')
        Slider({
          value: this.vOutSetValueOne,
          style: SliderStyle.OutSet,
          direction: Axis.Vertical
        })
          .blockColor(this.blockColor)
          .trackColor(this.trackColor)
          .selectedColor(this.selectedColor)
          .showTips(this.showTips)
          .trackThickness(this.trackThickness)
          .showSteps(this.showSteps)
          .onChange((value: double, mode: SliderChangeMode) => {
            this.vOutSetValueOne = value
            console.info('value:' + value + 'mode:' + mode.toString())
          })
          .key('sliderA')

      }
      .justifyContent(FlexAlign.Start)
      .height('50%')
      Column() {
        Slider({
          value: this.vInSetValueOne,
          style: this.style,
          direction: this.directionT,
          reverse: this.reverse, // 竖向的Slider默认是上端是min值，下端是max值，因此想要从下往上滑动，需要设置reverse为true
          min: this.min,
          max: this.max,
          step: this.step
        }).showTips(true)
          .onChange((value: double, mode: SliderChangeMode) => {
            this.vInSetValueOne = value
            console.info('value:' + value + 'm`ode:' + mode.toString())
          }).key('sliderConstructor')
        Slider().showTips(true)
          .onChange((value: double, mode: SliderChangeMode) => {
            this.vInSetValueOne1 = value
            this.modeT = mode.toString()
            console.info('value:' + value + 'm`ode:' + mode.toString())
          }).key('sliderConstructor2')
      }
      .height('40%')
      .width('90%')
    }
    .width('100%')
    .height('100%')
  }
}