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

@Observed
class ClassAB {
  public num: number = 1;

  constructor(num: number) {
    this.num = num
  }
}

@Entry
@Component
struct ViewAS {
  @State class_A: ClassAB = new ClassAB(5);

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('ObjectLinkSpl', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Button("Reset").id("ViewAS_reset")
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.class_A = new ClassAB(5)
        })
      Text('@State: ' + this.class_A.num).key("num_state")
        .fontSize(9).height('5%')
      Button('State + 1').key("adds_state")
        .height('5%')
        .backgroundColor('#E8A027')
        .onClick((e: ClickEvent) => {
          this.class_A.num++;
        })

      Text("ObjectLink: " + this.class_A.num).key("sNum_olk")
        .fontSize(9).height('5%')
      ViewBs({ class_C: this.class_A })

      Text("son_Prop: " + this.class_A.num).key("sNum_props")
        .fontSize(9).height('5%')
      son_Props({ numA: this.class_A.num })

      Text("son_Link: " + this.class_A.num).key("sNum_links")
        .fontSize(9).height('5%')
      son_Links({ numB: this.class_A })

    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}


@Component
struct ViewBs {
  @ObjectLink class_C: ClassAB = new ClassAB(5);

  build() {
    Column() {
      Button('ObjectLink + 1').key(("btn_olk"))
        .height('5%')
        .backgroundColor('#E8A027')
        .onClick((e: ClickEvent) => {
          this.class_C.num += 1;
        })
    }

  }
}

@Component
struct son_Props {
  @Prop numA: number = 1

  build() {
    Column() {
      Button('Prop + 1').key(("btn_prop"))
        .height('5%')
        .backgroundColor('#E8A027')
        .onClick((e: ClickEvent) => {
          this.numA += 1;
        })
    }
  }
}

@Component
struct son_Links {
  @Link numB: ClassAB = new ClassAB(5)

  build() {
    Column() {
      Button('Link + 1').key(("btn_link"))
        .height('5%')
        .backgroundColor('#E8A027')
        .onClick((e: ClickEvent) => {
          this.numB.num += 1;
        })
    }
  }
}