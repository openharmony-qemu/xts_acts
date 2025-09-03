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
  Polyline,
  PolylineAttribute,
  Image,
  Alignment,
  TextAlign,
  Ellipse,
  Line,
  Path,
  Margin,
  Polygon,
  PolygonAttribute,
  LineCapStyle,
  LineJoinStyle,
  Shape,
  Rect,
  Length,
  Margin,
  Position,
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ShapeExample {
  @State strokeDashOffset: number = 0;
  @State strokeLineCap: LineCapStyle = LineCapStyle.Butt;
  @State strokeLineJoin: LineJoinStyle = LineJoinStyle.Miter;
  @State strokeMiterLimit: number = 4;
  @State strokeOpacity: number = 1;
  @State strokeWidth: number = 1;
  @State antiAlias: boolean = true;
  @State strokeDashArray: Array<Length> = [20] as Array<Length>;
  @State fillOpacity: number = 0;
  @State strokeValue: string = '#FF000000';
  private stateChangCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData): void => {
      if (eventData != null) {
        console.info("text page state change called:" + JSON.stringify(eventData));
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      }
    }

  onPageShow() {
    console.info('qrCode page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 192,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack);
  }

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Text('basic').fontSize(30).fontColor(0xCCCCCC).width(320)
      Shape() {
        Rect().width(300).height(50)
        Ellipse().width(300).height(50).offset({ x: 0, y: 60 } as Position)
        
      }
      .key('shape')
      .viewPort({
        x: -2,
        y: -2,
        width: 304,
        height: 130
      })
      .fill(0x317Af7)
      .stroke(this.strokeValue)
      .strokeDashArray(this.strokeDashArray)
      .strokeDashOffset(this.strokeDashOffset)
      .strokeLineCap(this.strokeLineCap)
      .strokeLineJoin(this.strokeLineJoin)
      .strokeMiterLimit(this.strokeMiterLimit)
      .strokeOpacity(this.strokeOpacity)
      .strokeWidth(this.strokeWidth)
      .antiAlias(this.antiAlias)
      .fillOpacity(this.fillOpacity)
      .mesh([], 1, 1)
    }.width('100%').margin({ top: 15 } as Margin)
  }
}
