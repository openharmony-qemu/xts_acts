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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  SymbolGlyphModifier,
  ColumnOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct ChipApi1 {
  @State text1: string = ''

  build() {
    Column({ space: 10 } as ColumnOptions) {
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

      Button('getInspectorTree').onClick((e: ClickEvent) => {
        
        this.text1 = '' + JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getElement("$attrs")
          .getString("backgroundColor")

      }).id('ChipApi1_btn1')

      Text(this.text1).id('ChipApi1_text')


    }
  }
}