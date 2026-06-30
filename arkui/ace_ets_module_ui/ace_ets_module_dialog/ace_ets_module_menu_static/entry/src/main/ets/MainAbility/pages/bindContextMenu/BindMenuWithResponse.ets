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
  Entry, Component, Column, Button, Text, Flex, FlexDirection, FlexAlign,
  ItemAlign, Divider, ResponseType, TextAlign,
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct BindMenuWithResponseIndex {
  @State longPress: string = 'LONG_PRESS';
  @State rightClick: string = 'RIGHT_CLICK';

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
    } catch (error) {
      console.error('BindMenuWithResponse router init error: ' + error);
    }
  }

  @Builder
  MenuBuilderWithParam(type: ResponseType): void {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.Center,
      alignItems: ItemAlign.Center,
    }) {
      Text('Current ResponseType = ' + (type === ResponseType.RightClick ? 'RIGHT_CLICK' : 'LONG_PRESS'))
      Divider().height(10)
      if (type === ResponseType.LongPress) {
        Text('Item' + this.longPress).fontSize(20).width(200).height(20)
          .textAlign(TextAlign.Center).id('longTextId')
      }
      if (type === ResponseType.RightClick) {
        Text('Item' + this.rightClick).fontSize(20).width(200).height(20)
          .textAlign(TextAlign.Center).id('rightTextId')
      }
    }
  }

  build(): void {
    Column() {
      Button('BindContextMenuWithResponse')
        .bindContextMenuWithResponse(this.MenuBuilderWithParam, { enableArrow: true })
        .id('bindClickId')
      Button('hide').id('hideId')
    }
    .height('100%').width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
