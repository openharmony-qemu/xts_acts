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
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct State0070 {
  @State private strArr: string[] = new Array<string>('red', 'green', 'yellow')
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('State0070', router, Type.from<common.Context>());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Text(JSON.stringify(this.strArr))
        .id('tvState0070')
      Text(this.strArr[1])
      Button('Add gray')
        .id('btnAddState0070')
        .onClick((e: ClickEvent)=>{
          this.strArr.push('gray')
        })
      Button('Update red to white')
        .id('btnUpdateState0070')
        .onClick((e: ClickEvent)=>{
          this.strArr[0] = 'white'
        })
      Button('Delete green')
        .id('btnDelState0070')
        .onClick((e: ClickEvent)=>{
          // this.strArr.splice(1, 1)
        })
    }
  }
}