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

import events_emitter from '@ohos.events.emitter';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ColumnOptions,
  TextAlign,
  Scroll,
  Image,
  $r,
  $$,
  SheetType,
  BindOptions,
  SheetOptions,
  Alignment,
  Color,
  Row,
  TransitionEffect,
  RotateOptions,
  AnimateParam,
  Curve,
  Visibility
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
// import { AnimationOptions } from '@ohos.animator';
import { AppStorage, Link } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct VisibilityExample {
  @State visibilityValue: Visibility = Visibility.Visible;

  onPageShow() {
    let hiddenChangeEvent: events_emitter.InnerEvent = {
      eventId: 47,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(hiddenChangeEvent, this.hiddenChangCallBack)

    let noneChangeEvent: events_emitter.InnerEvent = {
      eventId: 48,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(noneChangeEvent, this.noneChangCallBack)

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 1116,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.hiddenChangCallBack);
  }

  private hiddenChangCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData) => {
      console.info("[hiddenChangCallBack] stateChangCallBack");
      if (eventData != null) {
        console.info("[hiddenChangCallBack] state change called:" + JSON.stringify(eventData));
        if (eventData.data?.['visibility'] != null) {
          // this.visibilityValue = eventData.data?.['visibility'] as Visibility;
        }
      }
    }
  private noneChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[noneChangCallBack] stateChangCallBack");
    if (eventData != null) {
      console.info("[noneChangCallBack] state change called:" + JSON.stringify(eventData));
      if (eventData.data?.['visibility'] != null) {
        // this.visibilityValue = eventData.data?.['visibility'] as Visibility;
      }
    }
  }

  build() {
    Column() {
      Column() {
        Text('BoxOne')
          .fontSize(9)
          .width('90%')
          .fontColor(0xCCCCCC)
        Row()
          .visibility(this.visibilityValue)
          .width('90%')
          .height(80)
          .backgroundColor(0xAFEEEE)
          .padding(20)
          .key('box')

        Text('BoxTwo')
          .fontSize(9)
          .width('90%')
          .fontColor(0xCCCCCC)
        Row()
          .visibility(Visibility.Visible)
          .width('90%')
          .height(80)
          .backgroundColor(0xAFEEEE)
          .padding(20)
      }
      .width('90%')
      .border({ width: 1 })
    }
    .width('100%')
    .margin({ top: 5 } as Margin)
  }
}
