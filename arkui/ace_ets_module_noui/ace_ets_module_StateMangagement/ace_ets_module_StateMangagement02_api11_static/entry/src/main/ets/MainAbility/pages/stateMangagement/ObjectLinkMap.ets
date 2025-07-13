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
  DatePicker,
  Divider,
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
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from "@ohos.hilog";
import common from '@ohos.app.ability.common';
@Observed
class MapClassA {
  public a: MyMap<number, string> = new MyMap<number, string>("myMap", [[0, "a"], [1, "b"], [3, "c"]])

  constructor(a: MyMap<number, string>) {
    this.a = a;
  }
}


@Observed
export class MyMap<K, V> extends Map<K, V> {
  public name: string = '';

  constructor(name?: string, args?: [K, V][]) {
    super(args);
    this.name = name ? name : "My Map";
  }

  getName() {
    return this.name;
  }
}

@Entry
@Component
struct ObjectLinkMapNested {
  @State message: MapClassA = new MapClassA(new MyMap<number, string>("myMap", [[0, "a"], [1, "b"], [3, "c"]]));
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('ObjectLinkMap', router, Type.from<common.Context>());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }
  build() {
    Row() {
      Column() {
        Button('init map').id("ObtLinkMap_init").height('5%')
          .onClick((e: ClickEvent) => {
            this.message.a = new MyMap<number, string>("myMap", [[0, "a"], [1, "b"], [3, "c"]])
          })

        ObjectLinkMapNestedChild({ myMap: this.message.a })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ObjectLinkMapNestedChild {
  @ObjectLink myMap: MyMap<number, string>= new MyMap<number, string>("myMap", [[0, "a"], [1, "b"], [3, "c"]])

  build() {
    Row() {
      Column() {

        Button('set new one').id("ObtLinkMap_set").height('5%')
          .onClick((e: ClickEvent) => {
            this.myMap.set(4, "d")
          })

        Button('clear').id("ObtLinkMap_clear").height('5%')
          .onClick((e: ClickEvent) => {
            this.myMap.clear()
            if (Array.from(this.myMap.entries())) {
              this.myMap.set(0, "K")
            }
          })

        Button('replace the first one').id("ObtLinkMap_replace").height('5%')
          .onClick((e: ClickEvent) => {
            this.myMap.set(0, "aa")
          })

        Button('delete the first one').id("ObtLinkMap_delete").height('5%')
          .onClick((e: ClickEvent) => {
            this.myMap.delete(0)
          })

        ForEach(Array.from(this.myMap.entries()), (item: [Number, String]) => {
          Text(`${item[0]} ${item[1]}`).fontSize(9).id("ObtLinkMap_value_" + item[1]).height('5%')
          Divider()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}