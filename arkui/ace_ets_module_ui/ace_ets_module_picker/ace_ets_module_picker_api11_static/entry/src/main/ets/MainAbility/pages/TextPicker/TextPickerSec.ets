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
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Text, Rating, Margin, Row, TextPickerResult, Image, TextPicker, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    console.info("key==>pages res : onPageShow")
  }

  private valueChangeCallBack:(eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("key==> page valueChangeCallBack");
    if (eventData != null && eventData.data != null) {
      const data = eventData.data as ESObject //需要先获取并声明类型之后  再访问成员属性
      if (data.getProperty('type').toString() == "TextPicker" && data.getProperty('text').toString() == "true") {
        this.flag = true
        this.canLoop = true
        console.info("valueChangeCallBack this.flag:" + JSON.stringify(this.flag));
        console.info("valueChangeCallBack this.canLoop:" + JSON.stringify(this.canLoop));
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      }
      if (data.getProperty('type').toString() == "TextPicker" && data.getProperty('text').toString() == "false") {
        this.canLoop = false
        this.flag = true
        console.info("valueChangeCallBack this.flag:" + JSON.stringify(this.flag));
        console.info("valueChangeCallBack this.canLoop:" + JSON.stringify(this.canLoop));
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      }
      if (data.getProperty('type').toString() == "TextPicker" && data.getProperty('text').toString() == "") {
        this.flag = true
      }
      if (data.getProperty('type').toString() == "TextPicker" && data.getProperty('text').toString() == "0") {
        this.flag = false
      }
      if (data.getProperty('type').toString() == "TextPickerErr" && data.getProperty('text').toString() == "null") {
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
        console.info("valueChangeCallBack this.canLoop:" + JSON.stringify(this.canLoop));
        this.flag = false
        this.errFlag = true
      }
      if (data.getProperty('type').toString() == "TextPickerErr" && data.getProperty('text').toString() == "undefined") {
        console.info("valueChangeCallBack:" + JSON.stringify(eventData));
        console.info("valueChangeCallBack this.canLoop:" + JSON.stringify(this.canLoop));
        this.flag = false
        this.errFlag = false
      }
    }
  }

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  @State message: string = 'Hello World'
  @State canLoop: boolean = true
  @State flag: boolean = true
  @State errFlag: boolean = true
  private select2: int = 1;
  private select3: int = 1;
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4']
  private fruits2: string[] = ['apple1', 'orange2', 'peach3', 'grape4']

  build() {
    Row() {
      Column() {
        Image("../../../resources/base/media/icon.png")
          .height(50)
        TextPicker({ range: this.fruits, selected: this.select2 })
          .key("TextPickerErr")
          .onChange((value: string | string[], index: int | int[]):void => {
            console.info('Picker item changed, value: ' + value + ', index: ' + index)
          })
        TextPicker({ range: this.fruits, selected: this.select3 })
          .key("TextPickerNoCanLoop")
          .onChange((value: string | string[], index: int | int[]):void => {
            console.info('Picker item changed, value: ' + value + ', index: ' + index)
          })

        Button("TextPickerDialog")
          .key("TextPickerDialog")
          .backgroundColor("#ff5e7a80")
          .margin(20)
          .onClick((e:ClickEvent) => {

          })
      }
      .width('100%')
    }.height('100%')
  }
}

function fakeBoolean(val: string|number|boolean) {
  return val as boolean;
}