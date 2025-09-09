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
  $r,
  $rawfile,
  AlphabetIndexer,
  ArrowPosition,
  Axis,
  BarPosition,
  BlurStyle,
  Builder,
  Button,
  ButtonAttribute,
  CalendarAlign,
  CalendarPicker,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Curve,
  Date,
  Divider,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  ItemAlign,
  List,
  ListItem,
  Margin,
  MenuAlignType,
  PickerTextStyle,
  PlaybackSpeed,
  Resource,
  Row,
  Scroll,
  Scroller,
  Select,
  Swiper,
  SwiperDisplayMode,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextAreaController,
  TextInputController,
  TextPicker,
  Video,
  Week
} from '@ohos.arkui.component';
import { Link, PropRef, State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import Utils from '../common/Utils';

import { BusinessError } from '@ohos.base';


@Entry
@Component
struct ListNestedScroll {
  scroller: Scroller = new Scroller()
  @State selfScrollTime: number = 0
  @State parentScrollTime: number = 0
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)

  build() {
    Column() {
      Button("NestedScrollOptionsScroll click")
        .key('listNestedScrollOptionsScrollTestButton')
        .onClick((e: ClickEvent) => {
          console.info("List NestedScrollOptionsScroll  onClick start ");
          try {
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.parentScrollTime > 0 && this.selfScrollTime > 0,
                  "parentScrollTime": this.parentScrollTime,
                  "selfScrollTime": this.selfScrollTime
                } as Record<string, Object>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 77002,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("List NestedScrollOptionsScroll start to emit action state");
              events_emitter.emit(backEvent, backData);
            } catch (err) {
              console.info("List NestedScrollOptionsScroll emit action state err: " + JSON.stringify(err));
            }
          } catch (error) {
            console.error(`List NestedScrollOptionsScroll ErrorCode: ${(error as BusinessError)?.code},  Message: ${(error as Error)?.message}`);
          }
          console.info("List NestedScrollOptionsScroll  onClick end ");
        })

      Scroll(this.scroller) {
        Column() {
          Column().width('100%').height('20%').backgroundColor(Color.Green)
          List({ space: 10 }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text("item" + item)
                  .fontSize(16)
              }

            }, (item: number) => String(item))
          }

          .height('90%')


          Column().width('100%').height('20%').backgroundColor(Color.Red)
        }.width('100%')
      }


      .width('100%')
      .height('70%')
    }.key('ColumnSize')
  }
}