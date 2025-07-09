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
  FlexAlign,
  Builder,
  NavPathStack,
  FontWeight,
  Navigation,
  NavDestination,
  NavigationMode,
  ButtonType,
  Color,
  DatePicker
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
  LocalStorageProp,
  LocalStorageLink,
  Observed
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';
class sArrModel {
  public value: number = 1;
  constructor(value: number) {
    this.value = value;
  }
}

class sArrClassA {
  public value: string = '';
  public data: sArrModel = new sArrModel(1);
  constructor(value: string, num: sArrModel) {
    this.value = value;
    this.data = num;
  }
}

@Entry
@Component
struct StateArray {
  @State title: sArrModel[] = [new sArrModel(11), new sArrModel(1)]
  @State ClassA: sArrClassA = new sArrClassA("Hello", new sArrModel(6))
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateArray', router, Type.from<common.Context>());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Button("Reset").id("StateArray_reset").height('5%')
        .onClick((e: ClickEvent) => {
          this.title = [new sArrModel(11), new sArrModel(1)]
          this.ClassA = new sArrClassA("Hello", new sArrModel(6))
        })
      Text('title：' + JSON.stringify(this.title)).fontSize(9)
        .height('5%')
        .key("text_Array")
      Button('Click to change value to the array').fontSize(9)
        .height('5%')
        .key("change_Array")
        .onClick((e: ClickEvent) => {
          // 改变某一个Array值
          this.title[0] = new sArrModel(8)
        })

      Button('Click to delete value to the array').fontSize(9)
        .height('5%')
        .key("delete_Array")
        .onClick((e: ClickEvent) => {
          this.title.pop()
        })

      Button('Click to add value to the array').fontSize(9)
        .height('5%')
        .key("add_Array")
        .onClick((e: ClickEvent) => {
          this.title.push(new sArrModel(12))
        })

      Text('ClassA：' + JSON.stringify(this.ClassA)).fontSize(9)
        .height('5%')
        .key("text_ClassA")
      Button('Click to change Parent Component Property Values').fontSize(9)
        .height('5%')
        .key("change_Parent")
        .onClick((e: ClickEvent) => {
          // 动态修改父组件属性值
          this.ClassA.value = "World"
        })

      Button('Click to change self Component Property Values').fontSize(9)
        .height('5%')
        .key("change_Self")
        .onClick((e: ClickEvent) => {
          // 动态修改自组件属性值
          this.ClassA.data = new sArrModel(8)
        })
    }.width('100%')
  }
}