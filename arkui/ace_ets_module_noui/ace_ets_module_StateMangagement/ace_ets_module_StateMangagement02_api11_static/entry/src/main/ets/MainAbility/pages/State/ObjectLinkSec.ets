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
  Color
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
import common from '@ohos.app.ability.common';
@Observed
class SecClassB {
  public b: number = 1;

  constructor(b: number) {
    this.b = b;
  }
}

class SecClassA {
  public a:SecClassB = new SecClassB(1)

  constructor(a:SecClassB) {
    this.a = a;
  }
}
@Component
struct ViewSec {
  @ObjectLink class_C: SecClassB = new SecClassB(1);
  build() {
    Row() {
      Text(`${this.class_C.b}`).height('5%')
    }
  }
}

@Entry
@Component
struct ViewASec {
  @State class_A: SecClassA = new SecClassA(new SecClassB(5));
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('ObjectLinkSec', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Column(){
        Text('@State不能接收第二层属性值').height('5%')
        Row(){
          Button('第二层变量+1')
            .height('5%')
            .width('50%')
            .key(("btn_state2"))
            .backgroundColor('#E8A027')
            .onClick((e: ClickEvent) => {
              this.class_A.a.b += 1;
            })
          Text(`${this.class_A.a.b}`).key(("sec_state"))
            .height('5%')
            .width('50%')
        }
      }

      Column(){
        Text('@Provide不能接收第二层属性值').height('5%')
        Row(){
          Button('第二层变量+1')
            .height('5%')
            .width('50%')
            .key(("btn_provide2"))
            .backgroundColor('#E8A027')
            .onClick((e: ClickEvent) => {
            })
        }
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
