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
  PropRef,
  ObjectLink,
  Observed,
  Consume,
  StoragePropRef,
  StorageLink,
  LocalStorage,
  LocalStoragePropRef,
  LocalStorageLink,
  Observed
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';
class sComModel {
  public value: string = '';

  constructor(value: string) {
    this.value = value;
  }
}

@Entry
@Component
struct StateComponent {
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateComponent', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      sComponent({ count: 1, increaseBy: 2 })
      sComponent({ title: new sComModel('Hello, World 2'), count: 7 })
    }
  }
}

@Component
struct sComponent {
  @State title: sComModel = new sComModel('Hello World');
  @State count: number = 0;
  private increaseBy: number = 1;

  build() {
    Column() {
      Text(`${this.title.value}`).height('5%')
        .id("text_component" + this.count)
      Button(`Click to change title`).height('5%')
        .id("change_component" + this.count)
        .onClick((e: ClickEvent) => {
          this.title.value = this.title.value === "Hello ArkUI" ? "Hello World" : "Hello ArkUI";
        })

      Button(`Click to increase count=${this.count}`).height('5%')
        .id("increase_component" + this.count)
        .onClick((e: ClickEvent) => {
          this.count += this.increaseBy;
        })
    }
  }
}