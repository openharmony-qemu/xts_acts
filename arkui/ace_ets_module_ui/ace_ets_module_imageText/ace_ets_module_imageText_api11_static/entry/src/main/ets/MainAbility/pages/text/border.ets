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
import {
  Entry,
  Component,
  Flex,
  Text,
  BorderStyle,
  EdgeStyles,
  BorderOptions,
  EdgeWidths,
  Length,
  ResourceColor,
  EdgeColors,
  BorderStyle,
  FlexAlign,
  ItemAlign,
  TextAlign
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

@Entry
@Component
struct BorderExample {
  @State borderStyle1: BorderStyle | EdgeStyles = BorderStyle.Solid;
  @State borderRadius1: number = 70;
  @State border1?: BorderOptions | null = null;
  @State borderWidth1: EdgeWidths | Length | null = null;
  @State borderColor1: ResourceColor | EdgeColors| null = null;
  private stateChangCallBack :(eventData: events_emitter.EventData) =>void  = (eventData: events_emitter.EventData) : void => {
    if (eventData != null) {
      console.info("Border page state change called:" + JSON.stringify(eventData));
      if (((eventData.data) as Record<String, RecordData>)?.['border'] != null) {
        this.border1 = ((eventData.data) as Record<String, RecordData>)?.['border'] as BorderOptions | null;
      }
      if (((eventData.data) as Record<String, RecordData>)?.['borderStyle'] != null) {
        this.borderStyle1 = ((eventData.data) as Record<String, RecordData>)?.['borderStyle'] as BorderStyle|EdgeStyles;
      }
      if (((eventData.data) as Record<String, RecordData>)?.['borderWidth'] != null) {
        this.borderWidth1 = ((eventData.data) as Record<String, RecordData>)?.['borderWidth'] as  EdgeWidths | Length | null;
      }
      if (((eventData.data) as Record<String, RecordData>)?.['borderColor'] != null) {
        this.borderColor1 = ((eventData.data) as Record<String, RecordData>)?.['borderColor'] as ResourceColor | EdgeColors| null;
      }
      if (((eventData.data) as Record<String, RecordData>)?.['borderRadius'] != null) {
        this.borderRadius1 = ((eventData.data) as Record<String, RecordData>)?.['borderRadius'] as number;
      }
      console.info("Border borderStyle state change called:" + JSON.stringify(eventData));
      switch (String(((eventData.data) as Record<String, RecordData>)?.['borderStyle'])) {
        case 'Dotted':
          this.borderStyle1 = BorderStyle.Dotted;
          break;
        case 'Dashed':
          this.borderStyle1 = BorderStyle.Dashed;
          break;
        case 'Solid':
          this.borderStyle1 = BorderStyle.Solid;
          break;
        default:
          this.borderStyle1 = BorderStyle.Solid;
      }
    }
  }

  onPageShow() {
    console.info('border page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 3,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
      Text('dashed')
        .borderStyle(BorderStyle.Dashed)
        .borderWidth(5)
        .borderColor(0xAFEEEE)
        .borderRadius(this.borderRadius1)
        .key("borderRadius")
        .width(120)
        .height(120)
        .textAlign(TextAlign.Center)
        .fontSize(16)
      Text('Solid')
        .borderStyle(BorderStyle.Solid)
        .borderWidth(5)
        .key("borderWidth")
        .borderColor(0xEE0000)
        .borderRadius(10)
        .width(120)
        .height(120)
        .textAlign(TextAlign.Center)
        .fontSize(16)
      Text('dotted')
        .border({ width: 5, color: 0x317AF7, radius: 8, style: BorderStyle.Dotted })
        .key("borderColor")
        .width(120)
        .height(120)
        .textAlign(TextAlign.Center)
        .fontSize(16)
    }.width('100%').height(150)
  }
}