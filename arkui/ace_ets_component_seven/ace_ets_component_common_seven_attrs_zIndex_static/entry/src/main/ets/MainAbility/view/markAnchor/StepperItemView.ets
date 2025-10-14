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
import {
  DataReloadOperation,
  DataOperationType,
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Stack,
  WaterFlow,
  LazyForEach,
  FlowItem,
  DataOperation,
  Color,
  TextAlign,
  DataChangeListener,
  IDataSource,
  Button,
  ButtonAttribute,
  ClickEvent,

  Image,
  Search,
  Row,FlexOptions,
  Column,Flex,FlexDirection,ItemAlign,FlexAlign,FontWeight,
  SearchController,ComponentV2,ForEach,
  ColumnOptions,WaterFlowSections,Scroller,SectionOptions,
  Position,Builder,Margin,Padding,ItemState,Stepper,StepperItem,TextAttribute,CommonMethod,applyStyles
} from '@ohos.arkui.component'
import { State, Link,  } from '@ohos.arkui.stateManagement'

function superFancyText(this: TextAttribute): this {
  this.fontSize(36);
  this.fontColor('#182431')
  this.fontWeight(500)
  this.opacity(0.4)
  this.margin({ top: 82, bottom: 40 } as Margin)
  return this;
}

@Component
export struct StepperItemView {
  @State prevIndex: Int = 0
  @State currentIndex: Int = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @Link _markAnchor: Position;
  private componentKey: string = '';
  private parentWidth: number;
  private parentHeight: number;
  private subassemblyWidth: number;
  private subassemblyHeight: number;
  private parentComponentKey: string = '';
  private referenceComponentKey: string = '';

  fancy(instance: CommonMethod) {
    instance.width(336);
    instance.height(621);
    instance.backgroundColor(Color.White);
    instance.margin({ top: 48, left: 12 } as Margin)
    instance.borderRadius(24)
  }

  build() {
    Stepper({
      index: this.currentIndex
    }) {
      StepperItem() {
        Column() {
          Text('Page One')
            .superFancyText()
          Button('change status:' + this.firstState)
            .backgroundColor('#007dFF')
            .onClick((e:ClickEvent) => {
              this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
            })
        }
        .applyStyles(this.fancy)
      }
      .width(this.subassemblyWidth)
      .height(this.subassemblyHeight)
      .nextLabel('Next')
      .status(this.firstState)
      .markAnchor(this._markAnchor)
      .key(this.componentKey)

      StepperItem() {
        Column() {
          Text('Page Two')
.superFancyText()
          Button('change status:' + this.secondState)
            .backgroundColor('#007dFF')
            .onClick((e:ClickEvent) => {
              this.secondState = this.secondState === ItemState.Disabled ? ItemState.Normal : ItemState.Disabled
            })
        }
.applyStyles(this.fancy)
      }
      .width(this.subassemblyWidth)
      .height(this.subassemblyHeight)
      .nextLabel('Next')
      .prevLabel('Previous')
      .status(this.secondState)
      .key(this.referenceComponentKey)
    }
    .backgroundColor('#F1F3F5')
    .onFinish(() => {
      console.info('onFinish')
    })
    .onSkip(() => {
      console.info('onSkip')
    })
    .onChange((prevIndex: Int, index: Int) => {
      this.currentIndex = index
      this.prevIndex = prevIndex
    })
    .width(this.parentWidth)
    .height(this.parentHeight)
    .key(this.parentComponentKey)
  }
}