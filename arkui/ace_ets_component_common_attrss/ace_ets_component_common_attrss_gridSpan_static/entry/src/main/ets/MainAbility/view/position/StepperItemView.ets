'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import {FlexDirection,FlowItem,WaterFlow,ColumnOptions,IndexerAlign,FontWeight,AlphabetIndexer,Margin,StickyStyle,Color,TextAlign,Builder,ForEach,ListItem,ListItemGroup,List,Position,Button, Stepper,AlignRuleOption,ItemState,Component,StepperItem,ClickEvent,Column,VerticalAlign,Text } from '@ohos.arkui.component'
import { State ,Link } from '@ohos.arkui.stateManagement'



@Component
export struct StepperItemView {
  @State prevIndex: Int = 0
  @State currentIndex: Int = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @Link _position: Position = {x:0,y:0};
  private componentKey: string = '';
  private parentWidth: number =0;
  private parentHeight: number=0;
  private parentComponentKey: string='';
  private referenceComponentKey: string='';

  build() {
    Stepper({
      index: this.currentIndex
    }) {
      StepperItem() {
        Column() {
          Text('Page One')
            


          Button('change status:' + this.firstState)
            .backgroundColor('#007dFF')
            .onClick((e: ClickEvent) => {
              this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
            })
        }


      }
      .nextLabel('Next')
      .status(this.firstState)
      .position(this._position)
      .key(this.componentKey)

      StepperItem() {
        Column() {
          Text('Page Two')
            


          Button('change status:' + this.secondState)
            .backgroundColor('#007dFF')
            .onClick((e: ClickEvent) => {
              this.secondState = this.secondState === ItemState.Disabled ? ItemState.Normal : ItemState.Disabled
            })
        }


      }
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