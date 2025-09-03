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
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  ItemAlign,
  NavDestination,
  Navigation,
  NavigationMode,
  NavPathStack,
  Row,
  Text
} from '@ohos.arkui.component'
import {
  AppStorage,
  Consume,
  Link,
  LocalStorage,
  LocalStorageLink,
  LocalStoragePropRef,
  ObjectLink,
  Observed,
  PropRef,
  Provide,
  State,
  StorageLink,
  StoragePropRef,
  Watch
} from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

let nextID: number = 0

@Observed
class ClassA {
  public num: number
  public id: number

  constructor(num: number) {
    this.num = num
    this.id = nextID++
  }
}

@Component
struct arrViewA {
  @ObjectLink data: ClassA = new ClassA(5)

  build() {
    Row() {
      Text("viewA: " + `${this.data.num}`)

    }
  }
}

@Entry
@Component
struct arrViewB {
  @State arrA: ClassA[] = [new ClassA(5), new ClassA(6)]

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('ObjectLinkArray', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Button("Reset").id("arrViewB_reset")
        .height('5%')
        .onClick((e: ClickEvent) => {
          nextID = 0
          this.arrA = [new ClassA(5), new ClassA(6)]
        })
      Text('hello: ' + JSON.stringify(this.arrA)).fontSize(9)
        .key("view_arrObl").height('5%')
      Button(`ViewB: change`).fontSize(9)
        .height('5%')
        .key("change_ArrObl")
        .onClick((e: ClickEvent) => {

          this.arrA[0] = new ClassA(8)
        })

      Button(`ViewB: push`).fontSize(9)
        .height('5%')
        .key("add_ArrObl")
        .onClick((e: ClickEvent) => {
          this.arrA.push(new ClassA(7))
        })

      Button(`ViewB: shift`).fontSize(9)
        .height('5%')
        .key("delete_Arr1")
        .onClick((e: ClickEvent) => {
          this.arrA.shift()
        })

      Button(`ViewB: pop`).fontSize(9)
        .height('5%')
        .key("delete_Arr2")
        .onClick((e: ClickEvent) => {
          this.arrA.pop()
        })

      Button(`ViewB: reset array`)
        .height('5%')
        .key("reset_ArrObl")

        .onClick((e: ClickEvent) => {
          this.arrA = [new ClassA(5), new ClassA(6)]
        })
    }.width('100%')
  }
}