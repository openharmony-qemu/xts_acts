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

import { Entry, Component, Column, ColumnOptions, Button, ClickEvent, Row, Text, } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DataStyleExample {
  @State value1: string = ""
  @State value2: string = ""
  @State type: string = ""
  build() {
    Row() {
      Column({ space: 12 } as ColumnOptions) {
        Text(this.value1)
        Text(this.value2)
        Text(this.type)
          .id("type")
   
        Button("click to show value")
          .id("btn")
          .onClick((e: ClickEvent) => {
           
          })
      }.width("100%")
    }.height("100%")
  }
}