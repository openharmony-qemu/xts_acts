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

import events_emitter from '@ohos.events.emitter';
import {
  $r,
  $rawfile,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DismissDialogAction,
  DragEvent,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  HoverModeAreaType,
  Image,
  ItemAlign,
  Margin,
  ResourceStr,
  Scroll,
  Text,
  TextAlign,
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import testsuite from '../../../../src/test/List.test'

@Entry
@Component
struct actionSheetHoverMode {
  @State enableHoverMode: boolean = false
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Button('change enableHoverMode ' + this.enableHoverMode)
        .id('btn1')
        .onClick((e: ClickEvent) => {
          this.enableHoverMode = true
        })
      Button('change hoverModeArea ' + this.hoverModeArea)
        .id('btn2')
        .onClick((e: ClickEvent) => {
          this.hoverModeArea = HoverModeAreaType.BOTTOM_SCREEN
        })
      Button('Click to Show ActionSheet')
        .id('actionSheet')
        .onClick((e: ClickEvent) => {


        })
    }
    .id('col')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}