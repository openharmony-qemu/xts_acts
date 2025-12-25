'use static';
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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType,Stepper, StepperItem,ItemState,Position,Color,Alignment} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
@Entry
@Component
struct StepperExample {
  @State currentIndex: int = 0;
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal

  build() {
    Stepper({
      index: this.currentIndex
    }) {
      StepperItem() {
        Text('Stepper Page One')
          .fontSize(35)
          .fontColor(Color.Blue)
          .width(200)
          .lineHeight(50)
          .margin({ top: 200 } as Margin)
      }
      .nextLabel('')
      .position({ x: '35%', y: 0 } as Position)

      StepperItem() {
        Text('Stepper Page Two')
          .fontSize(35)
          .fontColor(Color.Blue)
          .width(200)
          .lineHeight(50)
          .margin({ top: 200 } as Margin)
          .onClick((e: ClickEvent) =>{
            this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
          })
      }
      .nextLabel('Next')
      .prevLabel('Previous')
      .status(this.firstState)
      .position({ x: '35%,y:0' } as Position)
    }
    .key('stepper')
    .onFinish(() => {
      console.info('onFinish')
    })
    .onSkip(() => {
      console.info('onSkip')
    })
    .onChange((prevIndex: int, index: int) => {
      this.currentIndex = index as int
    })
    .onNext((index: int, pendingIndex: int) => {
      console.info('pendingIndex:' + pendingIndex)
    })
    .onPrevious((index: int, pendingIndex: int) => {
      console.info('pendingIndex:' + pendingIndex)
    })
    .align(Alignment.Center)
  }
}
