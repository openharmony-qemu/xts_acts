'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType,Stepper, StepperItem,Color,ItemState,ColumnOptions,Position,Alignment} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct StepperItemDisabled {
  @State currentIndex: int = 0;
  @State firstState: ItemState = ItemState.Normal;
  @State secondState: ItemState = ItemState.Normal;

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear StepperItemDisabled start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear StepperItemDisabled end`);
  }

  build() {
    Row() {
      Column({ space: 10 } as ColumnOptions) {
        Text('message')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Stepper({
          index: this.currentIndex
        }) {
          StepperItem() {
            Text('Page One')
              .fontSize(35)
              .fontColor(Color.Blue)
              .width(200)
              .lineHeight(50)
              .margin({ top: 250 } as Margin)
          }
          .nextLabel('')
          .position({ x: '35%', y: 0 } as Position)

          StepperItem() {
            Text('Page Two')
              .fontSize(35)
              .fontColor(Color.Blue)
              .width(200)
              .lineHeight(50)
              .margin({ top: 250 } as Margin)
              .onClick((e: ClickEvent) =>{
                this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
              })
          }
          .key("StepperItem")
          .nextLabel('Finish')
          .prevLabel('Previous')
          .status(this.firstState)
          .position({ x: '35%', y: 0 } as Position)
          .status(ItemState.Disabled)
        }
        .onFinish(() => {
          Log.showInfo(TAG, 'onFinish')
        })
        .onSkip(() => {
          Log.showInfo(TAG, 'onSkip')
        })
        .onChange((prevIndex: int, index: int) => {
          this.currentIndex = index as int
        })
        .align(Alignment.Center)
        .height('50%')
      }
      .width('100%')
    }
    .height('100%')
  }
}

