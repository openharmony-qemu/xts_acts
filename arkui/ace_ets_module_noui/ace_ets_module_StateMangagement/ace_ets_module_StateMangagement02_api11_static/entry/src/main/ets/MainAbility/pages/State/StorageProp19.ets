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
  Observed,
  // Environment
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';
AppStorage.clear()
enum KFC19{K = 1,F,L}
// Environment.envProp('stringCode', 'en');
// Environment.envProp('numberCode', 2);
// Environment.envProp('booleanCode', true);
// Environment.envProp('enumCode', KFC19.K);


@Entry
@Component
struct StorageProp19 {
  @StorageProp('stringCode') stringCode: string = 'en';
  @StorageProp('numberCode') numberCode: number = 2;
  @StorageProp('booleanCode') booleanCode: boolean = true;
  @StorageProp('enumCode') enumCode: KFC19 = KFC19.K;
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StorageProp19', router, Type.from<common.Context>());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Button(`button1: ${this.stringCode}`).width("100%").height('5%')
        .key("button1")
        .onClick((e: ClickEvent) => {
          this.stringCode = 'arkUI';
        })

      Button(`button2: ${this.numberCode}`).width("100%").height('5%')
        .key("button2")
        .onClick((e: ClickEvent) => {
          this.numberCode = 3
        })

      Button(`button3: ${this.booleanCode}`).width("100%").height('5%')
        .key("button3")
        .onClick((e: ClickEvent) => {
          this.booleanCode = false
        })

      Button(`button4: ${this.enumCode}`).width("100%").height('5%')
        .key("button4")
        .onClick((e: ClickEvent) => {
          this.enumCode = KFC19.F
        })

    }
  }
}