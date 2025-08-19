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
  AdaptiveColor,
  Alignment,
  BindOptions,
  BlurStyle,
  Button,
  ButtonType,
  Circle,
  CircleOptions,
  ClickEvent,
  Color,
  ColoringStrategy,
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
  TextAlign,
  ThemeColorMode
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, LocalStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry({ routeName: 'ApiRect' })
@Component
struct MyComponent {
  @State message: string = 'Hello, World!';

  build() {

    Row() {
      Text(this.message)
        .onClick((e: ClickEvent) => {

          this.message = 'Hello, ArkUI!';
        })
    }
  }
}