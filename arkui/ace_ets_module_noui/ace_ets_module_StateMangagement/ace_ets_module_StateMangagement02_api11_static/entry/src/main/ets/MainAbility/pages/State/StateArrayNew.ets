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
  Watch,
} from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct StateArrayNew {
  @State arr_every: Array<number> = new Array<number>(1, 2, 3, 4, 5, 6, 7)
  @State res_every: boolean = true
  @State arr_some: Array<number> = new Array<number>(1, 2, 3, 4, 5, 6, 7)
  @State res_some: boolean = true
  @State arr_filter: Array<string> = new Array<string>('spray', 'limit', 'elite', 'exuberant', 'destruction', 'present')
  @State res_filter: Array<string> = new Array<string>('spray', 'limit', 'elite', 'exuberant', 'destruction', 'present')
  @State arr_reduce: Array<number> = new Array<number>(1, 2, 3, 4, 5, 6, 7)
  @State res_reduce: number = 0
  @State arr_reduceRight: Array<Array<number>> =
    new Array<Array<number>>(new Array<number>(0, 1), new Array<number>(2, 3), new Array<number>(4, 5))
  @State res_reduceRight: Array<number> = new Array<number>()

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateArrayNew', router);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column() {
      Text('Click to every value to the array ' + this.res_every).fontSize(9)
        .height('5%')
        .id("every_Array")
        .onClick((e: ClickEvent) => {
          this.res_every = this.arr_every.every((x, i, arr) => x >= 2)
        })

      Text('Click to some value to the array ' + this.res_some).fontSize(9)
        .height('5%')
        .id("some_Array")
        .onClick((e: ClickEvent) => {
          this.res_some = this.arr_some.some((x, i, arr) => x == 2)
        })

      Text('Click to filter value to the array ' + this.res_filter).fontSize(9)
        .height('5%')
        .id("filter_Array")
        .onClick((e: ClickEvent) => {
          this.res_filter = this.arr_filter.filter((x, i, arr) => x.length > 6)
        })

      Text('Click to reduce value to the array ' + this.res_reduce).fontSize(9)
        .height('5%')
        .id("reduce_Array")
        .onClick((e: ClickEvent) => {
          this.res_reduce =
            this.arr_reduce.reduce((accumulator: number, currentValue: number) => accumulator + currentValue, 0)
        })

      Text('Click to reduceRight value to the array ' + this.res_reduceRight).fontSize(9)
        .height('5%')
        .id("reduceRight_Array")
        .onClick((e: ClickEvent) => {
          this.res_reduceRight = this.arr_reduceRight.reduceRight((accumulator: Array<number>,
            currentValue: Array<number>) => accumulator.concat(currentValue))
        })
    }.width('100%')
  }
}