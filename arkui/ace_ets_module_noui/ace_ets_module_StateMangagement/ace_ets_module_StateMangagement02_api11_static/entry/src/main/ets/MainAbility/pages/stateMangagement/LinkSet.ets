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
  Divider,
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
  Text,
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
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';

@Component
struct LinkSetChild {
  @Link message: Set<number> = new Set<number>([1, 2, 3]);

  build() {
    Column() {

      Button('init set').id("LinkSet_init").height('5%')
        .onClick((e: ClickEvent) => {
          this.message = new Set<number>([1, 2, 3])
        })

      Button('set new one').id("LinkSet_set").height('5%')
        .onClick((e: ClickEvent) => {
          this.message.add(5)
        })

      Button('clear').id("LinkSet_clear").height('5%')
        .onClick((e: ClickEvent) => {
          this.message.clear()
          if (Array.from(this.message.entries())) {
            this.message.add(0)
          }
        })

      Button('delete the first one').id("LinkSet_delete").height('5%')
        .onClick((e: ClickEvent) => {
          this.message.delete(0)
        })

      ForEach(Array.from(this.message.entries()), (item: [Number, Number]) => {
        Text(`${item[0]}`).fontSize(9).id("LinkSet_value_" + item[0]).height('5%')
        Divider()
      })
    }
    .width('100%')
  }
}


@Entry
@Component
struct LinkSetSample1 {
  @State message: Set<number> = new Set<number>([1, 2, 3])

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LinkSet', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Row() {
      Column() {
        LinkSetChild({ message: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}