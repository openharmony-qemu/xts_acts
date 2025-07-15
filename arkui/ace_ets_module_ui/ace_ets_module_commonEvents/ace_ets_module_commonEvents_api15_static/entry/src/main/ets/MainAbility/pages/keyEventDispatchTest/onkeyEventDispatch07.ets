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
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { KeyType, KeyEvent, Row, Entry, Column, Text, Button, ClickEvent, Component } from '@ohos.arkui.component'

@Entry
@Component
struct onKeyEventExample7 {

 @State disPatchText : string = "";
  @State keyText : string = "";
build() {
      Column() {
      Row() {
        Text(this.disPatchText).key("disPatchKey")
        Text(this.keyText).key("kkey")
      }
      Button('分发事件').margin(5)
      Button('分发事件1').margin(5)
      Button('分发事件2').margin(5)

      Button('响应排派发的事件')
        .onKeyEvent((event:KeyEvent)=> {

          console.info("the keyEvent is " + JSON.stringify(event))
          this.keyText = "keyTrigger"
          // return true
        }).key('keyResponse')


    }.height('100%').width('100%').padding(35).onKeyEventDispatch((event:KeyEvent): boolean=> {

        console.info("the  disPatchHandler is " + JSON.stringify(event))
        this.getUIContext().getFocusController().requestFocus("keyResponse");
        let isConsumed = this.getUIContext().dispatchKeyEvent("keyResponse",event);
        this.disPatchText = "dis" + isConsumed;
        return false;

      }).key('keyDispatch')
  }
}