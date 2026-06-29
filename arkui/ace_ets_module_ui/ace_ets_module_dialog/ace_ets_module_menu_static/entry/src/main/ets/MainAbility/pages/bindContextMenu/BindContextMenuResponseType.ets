'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Entry, Component, Column, Text, Flex, FlexDirection, FlexAlign,
  ItemAlign, Divider, ResponseType, TextAlign, TextOverflow, Visibility, Builder,
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Builder
function contextMenuBuilder(): void {
  Flex({
    direction: FlexDirection.Column,
    justifyContent: FlexAlign.Center,
    alignItems: ItemAlign.Center,
  }) {
    Text('context menu item').fontSize(20).width(100).height(50).textAlign(TextAlign.Center)
    Divider().height(10)
  }
}

@Entry
@Component
struct BindContextMenuResponseTypeIndex {
  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('BindContextMenuResponseType router init error: ' + error);
    }
  }

  build(): void {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center,
    }) {
      Text('responseType-RightClick')
        .width(120).height(70).fontSize(16).border({ width: 1 }).padding(10)
        .textAlign(TextAlign.Center).textOverflow({ overflow: TextOverflow.None })
        .id('RightClickText')
        .bindContextMenu(contextMenuBuilder, ResponseType.RightClick)
        .visibility(Visibility.Visible)
      Text('responseType-LongPress')
        .width(120).height(70).fontSize(16).border({ width: 1 }).padding(10)
        .textAlign(TextAlign.Center).textOverflow({ overflow: TextOverflow.None })
        .id('LongPressText')
        .bindContextMenu(contextMenuBuilder, ResponseType.LongPress)
        .visibility(Visibility.Visible)
      Column() {
        Text('rightclick for menu').id('TestColumnLabel')
      }
      .id('TestColumn')
      .width('100%')
      .margin({ top: 5 })
      .bindContextMenu(contextMenuBuilder, ResponseType.RightClick)
    }
    .width('100%').height('100%')
  }
}
