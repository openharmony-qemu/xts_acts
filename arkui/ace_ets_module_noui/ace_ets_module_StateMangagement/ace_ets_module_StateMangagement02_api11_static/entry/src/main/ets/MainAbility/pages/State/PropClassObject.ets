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
  Watch,
} from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import common from '@ohos.app.ability.common';

class ClassA2 {
  public value: string = '';

  constructor(value: string) {
    this.value = value;
  }
}


@Component
struct ChildPropObjectS {
  @PropRef subClass: ClassA2 = new ClassA2('Hello');

  build() {
    Column() {
      Text('@PropRef 单向的 内部修改不会改变父组件').fontSize(9).height('5%')
      Text('子组件Prop:' + this.subClass.value).fontSize(9).height('5%')
        .key("sub_prop_AA")
      Button('子组件Prop:').fontSize(9).height('5%')
        .key("sub_prop_A")
        .onClick((e: ClickEvent) => {
          this.subClass.value = "World"
        })
    }.width('100%')
  }
}

@Entry
@Component
struct PropObject {
  @State title: ClassA2 = new ClassA2('Hello');

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('PropClassObject', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Row() {
      Column() {
        Text('@PropRef 支持多数据类型Object、Class').fontSize(9).height('5%')
        Text('Click to change Class or Object: ' + this.title.value)
          .id("prop_Object_AA").height('5%')
        Button('Click to change Class or Object: ')
          .height('5%')
          .id("prop_Object_A")
          .onClick((e: ClickEvent) => {
            this.title = new ClassA2('Hi');
          })
        ChildPropObjectS({ subClass: this.title })
      }
    }
  }
}