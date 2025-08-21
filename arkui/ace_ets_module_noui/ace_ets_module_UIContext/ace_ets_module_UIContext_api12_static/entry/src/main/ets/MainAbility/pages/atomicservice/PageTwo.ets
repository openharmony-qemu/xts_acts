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
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FontWeight,
  Margin,
  NavDestination,
  NavDestinationContext,
  NavPathStack,
  PopInfo,
  Row,
  RowOptions,
  Text,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class resultClass {
  public count: number = 10

  constructor(count: number) {
    this.count = count;
  }
}

@Builder
export function PageTwoBuilder() {
  PageTwo()
}

@Component
export struct PageTwo {
  pathStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column() {
        Button('pop', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            this.pathStack.pop(new resultClass(1));
          })
      }.width('100%').height('100%')
    }.title('pageTwo')
    .onBackPressed(() => {
      this.pathStack.pop(new resultClass(0));
      return true;
    }).onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}