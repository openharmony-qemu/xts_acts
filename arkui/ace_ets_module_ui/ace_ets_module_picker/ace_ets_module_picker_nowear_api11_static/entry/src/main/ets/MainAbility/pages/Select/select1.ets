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
import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  Font,
  FontStyle,
  Select,
  OnSelectCallback
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct select1 {
  @State value: string = '10';
  @State font: Font = {
    size: 30,
    weight: 400,
    family: 'serif',
    style: FontStyle.Normal
  } as Font
  @State fontColor: Color = Color.Grey

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  build() {
    Column() {
      Select([{ value: 'aaa', icon: "/images/img.png" },
        { value: 'bbb', icon: "/images/img.png" },
        { value: 'ccc', icon: "/images/img.png" },
        { value: 'ddd', icon: "/images/img.png" }])
        .selected(2)
        .value('TTT')
        .value(this.value)
        .font(this.font)
        .fontColor(this.fontColor)
        .selectedOptionFont({
          size: 40,
          weight: 500,
          family: 'serif',
          style: FontStyle.Normal
        })
        .optionFont({
          size: 30,
          weight: 400,
          family: 'serif',
          style: FontStyle.Normal
        })
        .key('select')
        .onSelect((index: int, text?: string | undefined) => {
          console.info("Select:" + index)
        } as OnSelectCallback)
    }
  }
}