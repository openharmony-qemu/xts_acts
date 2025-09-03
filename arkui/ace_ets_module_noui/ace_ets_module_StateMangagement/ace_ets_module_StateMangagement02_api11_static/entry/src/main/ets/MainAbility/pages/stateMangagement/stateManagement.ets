/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Alignment,
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
  TextAlign,
  TextOverflow
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
import resourceManager from '@ohos.resourceManager';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct StateManagementDARK {
  aboutToAppear() {
    hilog.info(0x0000, TAG, 'aboutToAppear StateManagementDARK start');
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('StateArrayObject', router);
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
        .backgroundColor(resourceManager.ColorMode.DARK)
        .key("DARKText")
    }
    .width("100%")
    .height("100%")
  }
}

