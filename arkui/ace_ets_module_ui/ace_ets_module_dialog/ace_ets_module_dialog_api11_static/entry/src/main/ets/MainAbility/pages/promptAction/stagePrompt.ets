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
import events_emitter from '@ohos.events.emitter';
import { BusinessError, RecordData } from '@ohos.base';
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  FlexDirection,
  FlexAlign,
  ItemAlign,
  TextAlign,
  TextOverflow,
  Alignment,
  Divider
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router, PromptAction } from '@ohos.arkui.UIContext';

@Entry
@Component
struct stagePrompt {
  build() {
    Row() {
      Column() {
        Text("promptAction-showToast")
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
          .key("showToastText")
          .onClick((e: ClickEvent) => {
            try {

              AppStorage.get<UIContext>('uiContent')!.getPromptAction().showToast({
                message: 'Message Info',
                duration: 2000,
              });
              let backData: events_emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<string, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 60220,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showDialog start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (error: Error) {
              console.error("showToast emit action state err:" + JSON.stringify(error.message));
            }
            ;
          })

        Text("promptAction-showDialog")
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
          .key("showDialogText")
          .onClick((e: ClickEvent) => {
            try {
              let backData1: events_emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<string, RecordData>
              }
              let backEvent1: events_emitter.InnerEvent = {
                eventId: 60221,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent1, backData1)
            } catch (error: Error) {
              console.error("showDialog emit action state err:" + JSON.stringify(error.message));
            }
            ;
          })

        Text("promptAction-showActionMenu")
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
          .key("showActionMenuText")
          .onClick((e: ClickEvent) => {
            try {

              /*   AppStorage.get<UIContext>('uiContent',Type.from<UIContext>())!.getPromptAction()
                   .showActionMenu({
                     title: 'showActionMenu Title Info',
                     buttons: [
                       {
                         text: 'item1',
                         color: '#666666',
                       },
                       {
                         text: 'item2',
                         color: '#000000',
                       },
                     ]
                   })
                   .then((data) => {
                     console.info('showActionMenu success, click button: ' + data.index);
                   })
                   .catch((err: Error) => {
                     console.info('showActionMenu error: ' + err);
                   })*/
              let backData2: events_emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<string, RecordData>
              }
              let backEvent2: events_emitter.InnerEvent = {
                eventId: 60222,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent2, backData2)
            } catch (error: Error) {
              console.error(`showActionMenu args error code is ${error.code}, message is ${error.message}`);
            }
            ;
          })
        Text("promptAction-showDialogTwo")
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
          .key("showDialogTextTwo")
          .onClick((e: ClickEvent) => {
            try {
              let backData3: events_emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<string, RecordData>
              }
              let backEvent3: events_emitter.InnerEvent = {
                eventId: 60223,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent3, backData3)
            } catch (error: Error) {
              console.error("showDialog emit action state err:" + JSON.stringify(error.message));
            }
            ;
          })
        Text("promptAction-showActionMenuTwo")
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
          .key("showActionMenuTextTwo")
          .onClick((e: ClickEvent) => {
            try {
              let backData4: events_emitter.EventData = {
                data: {
                  "STATUS": true
                } as Record<string, RecordData>
              }
              let backEvent4: events_emitter.InnerEvent = {
                eventId: 60224,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("showActionMenu start to emit action state")
              events_emitter.emit(backEvent4, backData4)
            } catch (error: Error) {
              console.error(`showActionMenu args error code is ${error.code}, message is ${error.message}`);
            }
            ;
          })
      }
      .height('100%')
    }
  }
}