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
struct LinkMapChild {
  @Link value: Map<number, string> = new Map<number, string>([[0, "a"], [1, "b"], [3, "c"]])

  build() {
    Column() {

      Button('child init map').id("LinkMap_init").height('5%')
        .onClick((e: ClickEvent) => {
          this.value = new Map<number, string>([[0, "a"], [1, "b"], [3, "c"]])
        })

      Button('child set new one').id("LinkMap_set").height('5%')
        .onClick((e: ClickEvent) => {
          this.value.set(4, "d")
        })

      Button('child clear').id("LinkMap_clear").height('5%')
        .onClick((e: ClickEvent) => {
          this.value.clear()
          if (Array.from(this.value.entries())) {
            this.value.set(0, "K")
          }
        })

      Button('child replace').id("LinkMap_replace").height('5%')
        .onClick((e: ClickEvent) => {
          this.value.set(0, "aa")
        })

      Button('child delete').id("LinkMap_delete").height('5%')
        .onClick((e: ClickEvent) => {
          this.value.delete(0)
        })

      ForEach(Array.from(this.value.entries()), (item: [Number, String]) => {
        Text(`${item[0]} ${item[1]}`).fontSize(9).id("LinkMap_value_" + item[1]).height('5%')
        Divider()
      })
    }
  }
}


@Entry
@Component
struct LinkMapSample2 {
  @State message: Map<number, string> = new Map<number, string>([[0, "a"], [1, "b"], [3, "c"]])

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('LinkMap', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Row() {
      Column() {
        LinkMapChild({ value: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}