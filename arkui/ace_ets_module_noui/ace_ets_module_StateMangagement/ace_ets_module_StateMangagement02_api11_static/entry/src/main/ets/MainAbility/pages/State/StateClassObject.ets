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
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';

class scoClassA {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

class scoModel {
  public value: string = '';
  public name: scoClassA = new scoClassA('');

  constructor(value: string, name: scoClassA) {
    this.value = value;
    this.name = name;
  }
}

@Entry
@Component
struct StateClassObject {
  @State title: scoModel = new scoModel('Hello', new scoClassA('World'));

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateClassObject', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Row() {
      Column() {
        Text(`${this.title.value}`).fontSize(9).height('5%')
          .id("text_Object")
        Button(`Click to change Object1`).height('5%')
          .id("state_Object1")
          .onClick((e: ClickEvent) => {
            this.title = new scoModel('Hi', new scoClassA('ArkUI'));
          })
        Button(`Click to change Object2`).height('5%')
          .id("state_Object2")
          .onClick((e: ClickEvent) => {
            this.title.value = "Hello ArkUI"
          })

        Text(`${this.title.name.value}`).fontSize(9).height('5%')
          .id("text_Class")
        Button(`Click to change Class`).height('5%')
          .id("state_Class")
          .onClick((e: ClickEvent) => {
            this.title.name = new scoClassA('Harmony');
          })
      }
    }
  }
}