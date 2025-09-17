/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { Button, ClickEvent, Column, Component, Entry, KeyEvent, KeyType, Row, Text } from '@ohos.arkui.component'

@Entry
@Component
struct KeyEventExample5 {
  @State childText: string = ''
  @State parentText: string = ''

  build() {
    Column() {
      Row() {
        Text(this.childText).key('childText5')
        Text(this.parentText).key('parentText5')
      }

      Button('KeyEvent')
        .onKeyEvent((keyEvent: KeyEvent) => {
          this.childText = "childResponse"
          console.info("the child key is " + JSON.stringify(keyEvent))
          return false
        }
        )

    }.height('100%').width('100%').padding(35).onKeyEvent((keyEvent: KeyEvent) => {
      console.info("the parent key is " + JSON.stringify(keyEvent))
      this.parentText = "parentResponse"
      return false
    })
  }
}