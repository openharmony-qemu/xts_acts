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
  Entry,
  Component,
  Flex,
  Text,
  ClickEvent,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { AppStorage } from '@ohos.arkui.stateManagement'
import mediaquery from '@ohos.mediaquery'
import { RecordData } from '@ohos.base';

@Entry
@Component
struct stageMediaquery {
  @State color: string = '#000';
  @State text: string = 'Test';
 

  listener: mediaquery.MediaQueryListener = this.getUIContext().getMediaQuery().matchMediaSync('(orientation: landscape)');
  aboutToAppear() {

  }

  aboutToDisappear() {
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text("mediaQuery-Off")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("offText")
        .onClick((e:ClickEvent) => {
     
        })
      Text("mediaQuery-MatchMediaSync")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("matchMediaSyncText")
        .onClick((e:ClickEvent) => {
          console.log('mediaQuery-MatchMediaSync: ' + JSON.stringify(this.listener))
          let result = (this.listener != null)
          try {
            let backData: events_emitter.EventData = {
              data: {
                "STATUS": result
              } as Record<String, RecordData>
            } as events_emitter.EventData
            let backEvent: events_emitter.InnerEvent = {
              eventId: 60219,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("onSelect start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("onSelect emit action state err: " + JSON.stringify((err as Error)?.message))
          }

        })
      Text(this.text)
        .fontSize(50)
        .fontColor(this.color)
    }.width("100%").height("100%")
  }
}