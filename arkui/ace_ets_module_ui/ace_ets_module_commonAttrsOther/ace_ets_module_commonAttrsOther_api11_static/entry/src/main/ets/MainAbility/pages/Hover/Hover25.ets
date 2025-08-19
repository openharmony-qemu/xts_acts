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
  HoverEffect,
  HoverEvent,
  Image,
  ItemAlign,
  Margin,
  Position,
  ResourceColor,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct HoverExample25 {
  @State isHoverVal25: string = 'unhover'
  @State color: ResourceColor = Color.Blue

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Column({ space: 5 } as ColumnOptions) {
        Text(this.isHoverVal25)
          .key("hover25")
          .fontSize(50)
          .backgroundColor(this.color)
          .position({ x: 0, y: 0 } as Position)
          .hoverEffect(HoverEffect.Highlight)
          .onHover((isHover: boolean, event: HoverEvent): void => {
            if (isHover) {
              this.isHoverVal25 = 'onhover'
              this.color = Color.Pink
            }
          })
      }
      .hoverEffect(HoverEffect.None)
      .width('100%').height('100%').border({ width: 1 })

    }
  }
}