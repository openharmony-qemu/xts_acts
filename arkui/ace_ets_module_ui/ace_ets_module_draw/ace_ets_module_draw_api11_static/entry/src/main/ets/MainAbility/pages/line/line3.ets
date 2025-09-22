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
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  $rawfile,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Circle,
  TextOverflow,
  Image,
  Alignment,
  TextAlign,
  Ellipse,
  Line,
  Length,
  Margin,
} from '@ohos.arkui.component';
import { State, Link, PropRef, AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct LineExample {
  @State startPoint: Array<Length> = [0, 0] as Array<Length>
  @State endPoint: Array<Length> = [50, 100] as Array<Length>

  build() {
    Column() {
      
      
    }.margin({ top: 5 } as Margin)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData): void => {
      if (eventData != null) {
        console.info("line page state change called:" + JSON.stringify(eventData));
        if (((eventData.data) as Record<string, RecordData>)?.['startPoint'] != null) {
          this.startPoint[0] = ((eventData.data) as Record<string, RecordData>)?.['startPoint'] as string;
        }
        if (((eventData.data) as Record<string, RecordData>)?.['startPointOne'] != null) {
          this.startPoint[1] = ((eventData.data) as Record<string, RecordData>)?.['startPointOne'] as string;
        }
        if (((eventData.data) as Record<string, RecordData>)?.['endPointOne'] != null) {
          this.endPoint[1] = ((eventData.data) as Record<string, RecordData>)?.['endPointOne'] as string;
        }
        if (((eventData.data) as Record<string, RecordData>)?.['endPoint'] != null) {
          this.endPoint[0] = ((eventData.data) as Record<string, RecordData>)?.['endPoint'] as string;
        }
      }
    }

  onPageShow() {
    console.info('line page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 131,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }
}