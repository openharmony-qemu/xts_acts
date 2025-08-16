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
struct HoverExample232 {
  @State isHoverValA17: boolean = false
  @State isHoverValB17: boolean = false

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Column({ space: 5 } as ColumnOptions) {
        Column() {
          Column()
            .width('150%')
            .height('100%')
            .backgroundColor(Color.Gray)
            .position({ x: 150, y: 0 } as Position)
            .hoverEffect(HoverEffect.Highlight)
            .onHover((isHover: boolean, event: HoverEvent): void => {
              console.info('Scale isHover: ' + isHover as string)
              this.isHoverValB17 = isHover as boolean
            })
            .key('column_23B')
          Text('B' + JSON.stringify(this.isHoverValB17))
            .fontSize(20).margin(15).position({ x: 100, y: 100 } as Position).key('hoverB23')
        }
        .width('60%')
        .height('100%')
        .backgroundColor(Color.Green)
        .position({ x: 0, y: 0 } as Position)
        .hoverEffect(HoverEffect.Highlight)
        .onHover((isHover: boolean, event: HoverEvent): void => {
          console.info('Scale isHover: ' + isHover as string)
          this.isHoverValA17 = isHover as boolean
        })

        Text('A' + JSON.stringify(this.isHoverValA17))
          .fontSize(20).margin(15).position({ x: 100, y: 100 } as Position).key('hoverA23')
      }
      .hoverEffect(HoverEffect.None)
      .width('100%').height('100%').border({ width: 1 })

    }
  }
}