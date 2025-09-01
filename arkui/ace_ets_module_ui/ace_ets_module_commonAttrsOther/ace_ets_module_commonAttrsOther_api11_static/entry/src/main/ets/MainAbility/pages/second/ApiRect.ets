/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import events_emitter from '@ohos.events.emitter'
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  OverlayOffset,
  OverlayOptions,
  Padding,
  Rect,
  RectOptions,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, LocalStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct ApiRect {
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('normal').fontSize(11).fontColor(0xCCCCCC).width('90%')
        .onClick((e: ClickEvent) => {


        })

      Column({ space: 5 } as ColumnOptions) {
        Text('normal').fontSize(9).fontColor(0xCCCCCC).width('90%')

        Rect({ width: '90%', height: 50 } as RectOptions)
          .fill(Color.Pink)

        Rect()
          .width('90%')
          .height(50)
          .fillOpacity(0)
          .stroke(Color.Red)
          .strokeWidth(3)


        Text('with rounded corners').fontSize(11).fontColor(0xCCCCCC).width('90%')

        Rect({ width: '90%', height: 80 } as RectOptions)
          .radiusHeight(20)
          .radiusWidth(40)
          .fill(Color.Pink)

        Rect({ width: '90%', height: 80 } as RectOptions)
          .radius(20)
          .fill(Color.Pink)
          .stroke(Color.Transparent)
      }.width('100%').margin({ top: 10 } as Margin)

    }.width('100%').margin({ top: 5 } as Margin)
  }
}