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

import CommonFunc from '../../../MainAbility/common/Common';
import {
  $r,
  Alignment,
  Button,
  ButtonType,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexWrap,
  FontWeight,
  ItemAlign,
  Profiler,
  Resource,
  Row,
  Scroll,
  setAppBgColor,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component'
import { AppStorage, Consume, Link, PropRef, Provide, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';

@Component
struct Child_CA {
  @Consume Array: Array<Number> | Array<boolean> | Boolean | Array<Resource> | Array<Int>;

  build() {
    Column() {

      Text("设置变量Array<Number>类型[1]-->[10]").height('5%')
      Button('change')
        .onClick((): void => {
          this.Array = [10];
        })
        .key('state1')
        .height('5%')

      Text("切换变量Array<boolean>类型[1]-->[true]").height('5%')
      Button('change')
        .onClick((): void => {
          this.Array = [true];
        })
        .key('state2')
        .height('5%')

      Text("切换变量boolean类型[1]-->true").height('5%')
      Button('change')
        .onClick((): void => {
          this.Array = true;
        })
        .key('state3')
        .height('5%')

      Text("切换变量Array<Resource>类型[1]-->Array<Resource>").height('5%')
      Button('change')
        .onClick((): void => {
          this.Array = [$r('app.string.number')];
        })
        .key('state4')
        .height('5%')
    }
  }
}


@Entry
@Component
struct Ancestors_CA {
  @Provide Array: Array<Number> | Array<boolean> | Boolean | Array<Resource> | Array<Int> = [1];

  build() {
    Column() {
      Text("count type of " + JSON.stringify(CommonFunc.getType(this.Array)) + " number is " +
      JSON.stringify(this.Array))
        .fontSize(9).key('ConsumeArray').height('5%')


      Child_CA()

    }.width('100%')
  }
}