/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
  Row, ClickEvent, Margin, ButtonType,Stepper, StepperItem,ItemState} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../../common/MessageManager';
@Entry
@Component
struct stepperAction001 {
  @State currentIndex: int = 0
  build() {
    Column(){
      Stepper({
        index: this.currentIndex
      }) {
          StepperItem() {
            Text('Page One')
          }
          .nextLabel('Next1')

          StepperItem() {
            Text('Page Two')
          }
          .nextLabel('Next2')
          .prevLabel('Previous1')

          StepperItem() {
            Text('Page Three')
          }
          .prevLabel('Previous2')
      }
    }
  }
}