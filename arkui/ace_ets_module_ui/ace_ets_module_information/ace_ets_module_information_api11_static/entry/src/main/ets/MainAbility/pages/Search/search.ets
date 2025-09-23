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
import events_emitter from '@ohos.events.emitter'
import {Entry, Component, CopyOptions, SearchController, CaretOffset, FontStyle, Font, Column, Text, Search, SearchOptions, ClickEvent, Button, Color } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct SearchExample {
  @State changevalue: string= ''
  @State submitvalue: string= ''
  @State textFont:Font = {
          size: 10,
          weight: 10,
          family: 'serif', 
          style: FontStyle.Normal
        } as Font
  @State searchButton:string = "10"
  @State maxLength: int = 19
  @State copyOption:CopyOptions = CopyOptions.LocalDevice
  controller: SearchController= new SearchController()
  controller2: SearchController= new SearchController()
  @State caretIndex : number = 9999
  @State text: string = ''
  @State positionInfo: CaretOffset = { index: 9999, x: 0, y: 0 } as CaretOffset

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("search page state change called:" + JSON.stringify(eventData));
    if (eventData != null) {
      if (((eventData.data) as ESObject ).getProperty('textFont') != null) {
        this.textFont = ((eventData.data) as ESObject ).getProperty('textFont').toStaticObject() as Font;
      }
      if (((eventData.data) as ESObject ).getProperty('searchButton') != null) {
        this.searchButton = ((eventData.data) as ESObject ).getProperty('searchButton').toString();
      }
      if (((eventData.data) as ESObject ).getProperty('text') != null) {
        this.text = ((eventData.data) as ESObject ).getProperty('text').toString();
      }
      if (((eventData.data) as ESObject ).getProperty('maxLength') != null) {
        this.maxLength = ((eventData.data) as ESObject ).getProperty('maxLength').toNumber() as int;
      }
      if (((eventData.data) as ESObject ).getProperty('copyOption') != null) {
        this.copyOption = ((eventData.data) as ESObject ).getProperty('copyOption').toStaticObject() as CopyOptions;
      }
    }
  }

  onPageShow() {
    console.info('search page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 190,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column() {
      Text(this.submitvalue)
      Text(this.changevalue)
      Search({ value: '', placeholder: 'input content', controller: this.controller } as SearchOptions)
        .searchButton('search')
        .textFont(this.textFont)
        .searchButton(this.searchButton)
        .maxLength(this.maxLength)
        .copyOption(this.copyOption)
        .key('search')
        .placeholderColor(Color.Red)
        .placeholderFont({
          size: 10,
          weight: 10,
          family: 'serif',
          style: FontStyle.Normal
        })
        .onSubmit((value: string):void => {
          this.submitvalue = value
        })
        .onChange((value: string):void => {
          this.changevalue = value
        })

      Search({ value: this.text, placeholder: 'input content', controller: this.controller2 } as SearchOptions)
        .textFont(this.textFont)
        .key('mySearch')
        .placeholderColor(Color.Red)
        .maxLength(10)
        .placeholderFont({
          size: 10,
          weight: 10,
          family: 'serif',
          style: FontStyle.Normal
        })

      Button('caretoffset')
        .backgroundColor('#00FF00')
        .margin(15)
        .onClick((e: ClickEvent) => {
          console.info('text length:' + this.text.length)
          this.controller2.caretPosition(this.text.length)
          this.positionInfo = this.controller2.getCaretOffset()
          console.info("index:" + this.positionInfo.index)
          this.caretIndex = this.positionInfo.index
        })
        .key('caretOffsetBtn')

      Text("Index" + this.caretIndex).key('caretOffsetText')
    }
  }
}











