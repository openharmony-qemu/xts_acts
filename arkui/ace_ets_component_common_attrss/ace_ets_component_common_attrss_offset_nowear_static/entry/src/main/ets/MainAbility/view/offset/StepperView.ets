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
  Component,
  Text,
  Button,
  ClickEvent,
  Column,
  List,
  ListItemGroup,
  Stepper,
  StepperItem,
  ListItem,
  StickyStyle,
  Position,
  TextAlign,
  Color,
  ItemState,
  Margin
} from '@ohos.arkui.component';
import { Link, State } from '@ohos.arkui.stateManagement';




















@Component
export struct StepperView {
  @State prevIndex: Int = 0
  @State currentIndex: Int = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @State thirdState: ItemState = ItemState.Normal
  @Link _offset: Position;
  private componentKey: string = '';

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

      StepperItem() {
        Column() {
          Text('Page Three')
            
          Button('change status:' + this.thirdState)
            .backgroundColor('#007dFF')
            .onClick((e: ClickEvent) => {
              this.thirdState = this.thirdState === ItemState.Waiting ? ItemState.Normal : ItemState.Waiting
            })
        }
      }
      .status(this.thirdState)

      StepperItem() {
        Column() {
          Text('Page Four')
            
        }
      }
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
    .offset(this._offset)
    .key(this.componentKey)
  }
}