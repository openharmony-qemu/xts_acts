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


import events_emitter from '@ohos.events.emitter'
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
  Visibility,
  Stack,
  SizeOptions
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
// import { AnimationOptions } from '@ohos.animator';
import { AppStorage, Link } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct zIndexExample {
  @State zIndexValue: number = 1;

  onPageShow() {
    console.info('[zIndex] page show called ');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 236,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 1113,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);

  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[stateChangCallBack] stateChangCallBack ");
    if (eventData != null) {
      console.info("[stateChangCallBack] state change called: " + JSON.stringify(eventData));
      if (eventData.data?.['zIndex'] != null) {
        this.zIndexValue = eventData.data?.['zIndex'] as number
      }
    }
  }

  build() {
    Column() {
      Stack() {
        Text('first child, zIndex(2)')
          .size({ width: '40%', height: '60%' } as SizeOptions)
          .backgroundColor(0xbbb2cb)
          .zIndex(2)
        Text('second child, default zIndex(0)')
          .size({ width: '90%', height: '80%' } as SizeOptions)
          .backgroundColor(0xd2cab3)
          .align(Alignment.TopStart)
        Text('third child, zIndex(1)')
          .size({ width: '70%', height: '50%' } as SizeOptions)
          .backgroundColor(0xc1cbac)
          .align(Alignment.TopStart)
          .zIndex(this.zIndexValue)
          .key('zIndex')
      }
    }
    .width('100%')
    .height(200)
  }
}