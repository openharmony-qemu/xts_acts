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
  OverlayOffset,
  OverlayOptions,
  Padding
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct OverlayExample {
  @State title: string = 'old title'
  @State x: number = 0
  @State y: number = -15
  @State alignment: Alignment = Alignment.Bottom

  onPageShow() {
    console.info('[overlay] page show called ');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 143,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);

    let stateChangeEvent2: events_emitter.InnerEvent = {
      eventId: 1110,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent2, this.stateChangCallBack);
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    console.info("[stateChangCallBack] stateChangCallBack ");
    if (eventData != null) {
      console.info("[stateChangCallBack] state change called: " + JSON.stringify(eventData));
      // if (eventData.data?.['align'] != null) {
      //   this.alignment = eventData.data?.['align'] as Alignment
      // }
      if (eventData.data?.['title'] != null) {
        this.title = eventData.data?.['title'] as string
      }
      if (eventData.data?.['x'] != null) {
        this.x = eventData.data?.['x'] as number
      }
      if (eventData.data?.['y'] != null) {
        this.y = eventData.data?.['y'] as number
      }

    }
  }

  build() {
    Column() {
      Column() {
        Text('floating layer')
          .fontSize(12)
          .fontColor(0xCCCCCC)
          .maxLines(1)
        Column() {
          Image('/images/img.jpeg')
            .width(340).height(240)
            .key('overlay')
            .overlay(this.title,
              { align: this.alignment, offset: { x: this.x, y: this.y } as OverlayOffset } as OverlayOptions)
        }.border({ color: Color.Black, width: 2 })
      }.width('100%')
    }.padding({ top: 20 } as Padding)
  }
}