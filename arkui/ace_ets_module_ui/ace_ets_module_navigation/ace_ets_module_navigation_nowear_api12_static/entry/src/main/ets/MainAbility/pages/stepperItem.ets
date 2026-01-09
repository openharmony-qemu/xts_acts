'use static';
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
import Log from '../common/Log';
import events_emitter from '@ohos.events.emitter'
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight, Position,Alignment,TextAttribute,ColumnAttribute,
Row, ClickEvent, Margin, ButtonType,Stepper, StepperItem, ItemState, Color,StepperItemAttribute,AttributeModifier} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
const TAG = 'ets_apiLack_add';

function itemTextStyle(this: TextAttribute) {
  this.fontColor('#182431')
  this.fontSize(36)
  this.fontWeight(500)
  this.opacity(0.4)
  this.margin({ top: 82, bottom: 40 } as Margin)
  return this;
}


function itemStyle(this: ColumnAttribute) {
  this.width(336)
  this.height(621)
  this.margin({ top: 48, left: 12 } as Margin)
  this.borderRadius(24)
  this.backgroundColor('#FFFFFF')
  return this;
}


class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
  applyNormalAttribute(instance: StepperItemAttribute): void {
    instance.nextLabel('textLabel')
  }
}
@Entry
@Component
struct StepperExample {
  @State stepperItemModifier: StepperItemModifier = new StepperItemModifier()
  @State currentIndex: int = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @State thirdState: ItemState = ItemState.Normal

  build() {
    Stepper({ index: this.currentIndex }) {
      // 第一个步骤页
      StepperItem() {
        Column() {
          Text('Page One')
            .itemTextStyle()
          Button('change status:' + this.firstState)
            .backgroundColor('#007dFF')
            .onClick((e:ClickEvent) => {
              this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
            })
        }
        .itemStyle()
      }
      .key("nextLabel1")
      .attributeModifier(this.stepperItemModifier)
      .status(this.firstState)
    }
    .backgroundColor('#F1F3F5')
    .onFinish(() => {
      console.info('onFinish')
    })
    .onSkip(() => {
      console.info('onSkip')
    })
    .onChange((prevIndex?: number, index?: number) => {
      if (index) {
        this.currentIndex = index as int
      }
    })
  }
}