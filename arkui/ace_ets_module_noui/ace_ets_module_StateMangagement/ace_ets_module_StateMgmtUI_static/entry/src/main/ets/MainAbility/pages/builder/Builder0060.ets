'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { Builder, Button, ClickEvent, Column, Component, Entry, FlexAlign, Text } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

interface IActionButton {
  onClick: () => void;
  label: string;
}

@Builder
function ActionButton(ia: IActionButton): void {
  Button(ia.label)
    .id('builder0060')
    .height('5%')
    .onClick((e: ClickEvent) => {
      ia.onClick();
    })
}

@Entry
@Component
struct Builder0060 {
  @State message: string = 'Hello World';
  @State logText: string = '';

  build(): void {
    Column() {
      ActionButton({
        onClick: () => {
          console.info('Button clicked');
          this.logText = 'Button clicked';
        },
        label: this.message
      })
      Text(this.logText)
        .id('builder0060_text1')
        .height('5%')
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
