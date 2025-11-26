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
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType,Stepper, StepperItem} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct stepperInterface005 {
  @State currentIndex: int | undefined = 0
  build() {
    Column(){
      Text(this.currentIndex?.toString())
      .height(20)
      Stepper({
        index: this.currentIndex
      }) {
          StepperItem() {
          }
          .nextLabel('Next')

          StepperItem() {
          }
      }
      .onNext((index: int, pendingIndex: int) => {
        this.currentIndex = pendingIndex
      })
    }
  }
}