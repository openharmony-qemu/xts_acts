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
  Color,
  Column,
  Component,
  DatePicker,
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
  LocalStorageProp,
  ObjectLink,
  Observed,
  Prop,
  Provide,
  State,
  StorageLink,
  StorageProp,
  Watch
} from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

enum KFC {A11 = 1, B11 = 2, C11 = 3}

@Entry
@Component
struct PropEnum {
  @State enumA: KFC = KFC.A11

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('PropEnum', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Button("Reset").id("PropEnum_reset")
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.enumA = KFC.A11
        })
      Text('@Prop 支持数据类型：enum').fontSize(9).height('5%')
      Text('Father State: ' + this.enumA)
        .width("100%")
        .height('5%')
        .key("PropEnum")
        .backgroundColor(this.enumA)
        .onClick((e: ClickEvent) => {
          this.enumA = KFC.B11
        })
      Text('父组件: ' + this.enumA).fontSize(9).height('5%')
      ChildPropEnum({ enumB: this.enumA })
    }.width('100%')

  }
}

@Component
struct ChildPropEnum {
  @Prop enumB: KFC = KFC.A11;

  build() {
    Column() {
      Text('@Prop 单向的 内部修改不会改变父组件').fontSize(9).height('5%')

      Text('Child Prop: ' + this.enumB)
        .width("100%")
        .height('5%')
        .key("ChildPropEnum")
        .backgroundColor(this.enumB)
        .onClick((e: ClickEvent) => {
          this.enumB = KFC.C11
        })
    }.width('100%')

  }
}
