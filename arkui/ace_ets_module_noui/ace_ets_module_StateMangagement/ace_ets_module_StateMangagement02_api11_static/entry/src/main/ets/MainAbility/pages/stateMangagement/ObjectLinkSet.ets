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

@Observed
class SetClassA {
  public a: MySet<number> = new MySet<number>("Set", [1, 2, 3]);

  constructor(a: MySet<number>) {
    this.a = a;
  }
}


@Observed
export class MySet<T> extends Set<T> {
  public name: string = '';

  constructor(name?: string, args?: T[]) {
    super(args);
    this.name = name ? name : "My Set";
  }

  getName() {
    return this.name;
  }
}

@Entry
@Component
struct ObjectLinkSetNested {
  @State message: SetClassA = new SetClassA(new MySet<number>("Set", [1, 2, 3]));

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('ObjectLinkSet', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Row() {
      Column() {
        Button('init set').id("ObtLinkSet_init").height('5%')
          .onClick((e: ClickEvent) => {
            this.message.a = new MySet<number>("Set", [1, 2, 3])
          })

        ObjectLinkSetNestedChild({ mySet: this.message.a })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ObjectLinkSetNestedChild {
  @ObjectLink mySet: MySet<number> = new MySet<number>("Set", [1, 2, 3])
  @State st: string = ''

  build() {
    Row() {
      Column() {

        Button('set new one').id("ObtLinkSet_set").height('5%')
          .onClick((e: ClickEvent) => {
            this.mySet.add(5)
          })


        Button('clear').id("ObtLinkSet_clear").height('5%')
          .onClick((e: ClickEvent) => {
            this.mySet.clear()
            if (Array.from(this.mySet.entries())) {
              this.mySet.add(0)
            }
          })


        Button('delete the first one').height('5%')
          .id("ObtLinkSet_delete")
          .onClick((e: ClickEvent) => {
            this.mySet.delete(0)
          })

        ForEach(Array.from(this.mySet.entries()), (item: [Number, Number]) => {
          Text(`${item}`).height('5%')
            .fontSize(9)
            .id(`ObtLinkSet_value_${item[0]}`)
          Divider()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}