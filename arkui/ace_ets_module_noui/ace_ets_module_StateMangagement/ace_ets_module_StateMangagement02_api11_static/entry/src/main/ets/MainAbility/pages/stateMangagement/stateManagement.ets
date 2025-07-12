/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
  Alignment,
  TextAlign,
  TextOverflow,
  ColorMode
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

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct StateManagementDARK {
  aboutToAppear() {
    hilog.info(0x0000, TAG, 'aboutToAppear StateManagementDARK start');
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateArrayObject', router, Type.from<common.Context>());
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  aboutToDisappear() {
    hilog.info(0x0000, TAG, 'aboutToAppear StateManagementDARK end');
  }
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("stateManagement-DARK")
        .width(100)
        .height('70%')
        .fontSize(9)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .backgroundColor(ColorMode.DARK)
        .key("DARKText")
    }
    .width("100%")
    .height("100%")
  }
}

