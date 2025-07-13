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
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  Provide,
  Prop,
  ObjectLink,
  Observed,
  Consume,
  StorageProp,
  StorageLink,
  LocalStorage,
  LocalStorageProp
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
interface LinkModelLinkData {
  value: string
}
class LinkModel implements LinkModelLinkData {
  value: string = ''

  constructor(value: string) {
    this.value = value
  }
}

enum KFCLD{A=1,B,C}
@Entry
@Component
struct parData_Link {
  @State numA: number = 0
  @State text: string = 'hello'
  @State flag: boolean = true
  @State enum1: KFCLD = KFCLD.A
  @State class1: LinkModel = new LinkModel('Hello World')
  @State strArray: Array<string> = ['First','Second','Third']
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LinkData', router, Type.from<common.Context>());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      sonData_Link({message: this.text, numB: this.numA, boolean1: this.flag, enu: this.enum1, class2: this.class1, strArray: this.strArray})
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct sonData_Link{
  @Link numB: number = 1
  @Link message: string = ''
  @Link boolean1: boolean = false
  @Link enu: KFCLD = KFCLD.A
  @Link class2: LinkModel = new LinkModel('')
  @Link strArray : Array<string> = new Array<string>('')


  build(){
    Column(){
      Text('string: ' + this.message).key("link_str")
        .fontSize(9)
        .height('5%')
      Button('Click to change str')
        .height('5%')
        .key(("strBtn_link"))
        .onClick((e: ClickEvent) => {
          this.message = "harmony";
        })

      Text('number: ' + String(this.numB)).key(("link_num"))
        .height('5%')
        .fontSize(9)
      Button('Click to change num')
        .height('5%')
        .key(("numBtn_link"))
        .onClick((e: ClickEvent)=>{
          this.numB++;
        })

      Text('boolean: ' + String(this.boolean1)).key(("link_bon"))
        .height('5%')
        .fontSize(9)
      Button('Click to change bool')
        .height('5%')
        .key(("bonBtn_link"))
        .onClick((e: ClickEvent) => {
          this.boolean1 = false;
        })

      Text('enum: ' + this.enu.toString()).key(("link_enum"))
        .height('5%')
        .fontSize(9)
      Button('Click to change enum')
        .height('5%')
        .key(("enumBtn_link"))
      .onClick((e: ClickEvent)=>{
        this.enu = KFCLD.B
      })

      Text('class: ' + this.class2.value).key(("link_cla"))
        .height('5%')
        .fontSize(9)
      Button('Click to change class')
        .height('5%')
        .key(("claBtn_link"))
        .onClick((e: ClickEvent)=>{
          this.class2.value = 'Hi ArkUI'
        })

      Text('array: ' + this.strArray).key(("link_strArr"))
        .height('5%')
        .fontSize(9)
      Button('Click to change strArray')
        .height('5%')
        .key(("sArrBtn_link"))
        .onClick((e: ClickEvent)=>{
          this.strArray = ['A','B','C']
        })
    }
  }
}