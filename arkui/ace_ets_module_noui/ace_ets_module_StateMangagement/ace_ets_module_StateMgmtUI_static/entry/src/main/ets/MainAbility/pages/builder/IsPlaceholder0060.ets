'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Builder, Button, ClickEvent, Column, ComponentV2, Entry, FlexAlign, Text } from '@ohos.arkui.component';
import { Binding, Local, UIUtils } from '@ohos.arkui.stateManagement';

@Builder({ isPlaceholder: false })
function funIsPlaceholder0060False(msg: Binding<string>): void {
  Text(msg.value)
    .id('tvIsPlaceholder0060False')
    .height('5%')
}

@Entry
@ComponentV2
struct IsPlaceholder0060 {
  @Local tmp: string = 'HelloBuilder'

  build(): void {
    Column() {
      funIsPlaceholder0060False(UIUtils.makeBinding(() => this.tmp))
      Button('Change Msg')
        .id('btnIsPlaceholder0060Change')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.tmp = 'HelloWorld'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
