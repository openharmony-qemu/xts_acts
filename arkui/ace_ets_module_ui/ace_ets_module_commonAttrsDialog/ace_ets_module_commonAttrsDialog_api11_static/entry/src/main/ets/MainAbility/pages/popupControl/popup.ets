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
  ArrowPointPosition,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Dimension,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Padding,
  Placement,
  Position,
  ResourceStr,
  Row,
  RowOptions,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import { RecordData } from '@ohos.base'

interface CustomEventData {
  enableArrow?: boolean;

}

@Entry
@Component
struct PopupExample12 {
  @State noHandlePopup: boolean = false;
  @State handlePopup: boolean = false;
  @State customPopup: boolean = false;
  @State enableArrow: boolean = true;
  @State placementOnTop: boolean = false;
  @State arrowWidth: Dimension = '20px';
  @State arrowHeight: Dimension = '20px';
  @State arrowPointPosition: ArrowPointPosition = ArrowPointPosition.START;

  build() {
    Flex({ direction: FlexDirection.Column } as FlexOptions) {
      Button('no handle popup')
        .key('button2')
        .onClick((e: ClickEvent) => {
          this.noHandlePopup = !this.noHandlePopup
          try {
            let backData: events_emitter.EventData = {
              data: {
                "placementOnTop": this.placementOnTop,
                "arrowPointPosition": this.arrowPointPosition,
                "arrowWidth": this.arrowWidth,
                "arrowHeight": this.arrowHeight,
              } as Record<string, RecordData>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 65,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button2 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
        .position({ x: 100, y: 50 } as Position)
    }.width('100%').padding({ top: 5 } as Padding)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("customPopupOption page state change called:" + JSON.stringify(eventData));

      const customData = eventData.data as CustomEventData;


      if (typeof customData.enableArrow === 'boolean') {
        this.enableArrow = customData.enableArrow as boolean;
      }
    }
  }
}