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
  AdaptiveColor,
  AlphabetIndexer,
  animateTo,
  ArrowPosition,
  Axis,
  BackgroundEffectOptions,
  Blank,
  BlurStyle,
  BorderImageOption,
  BorderOptions,
  BorderStyle,
  Button,
  ButtonType,
  CalendarAlign,
  CalendarPicker,
  Checkbox,
  CheckboxGroup,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Counter,
  Curve,
  DataPanel,
  Date,
  DatePicker,
  Divider,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  FormComponent,
  FormDimension,
  Gauge,
  GradientDirection,
  Image,
  ItemAlign,
  Margin,
  MarkStyle,
  MenuAlignType,
  Padding,
  PickerTextStyle,
  RepeatMode,
  ResourceColor,
  Row,
  Select,
  Swiper,
  SwiperDisplayMode,
  Text,
  TextAlign,
  TextInputController,
  Toggle,
  ToggleType,
  Visibility,
  Week
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';


@Entry
@Component
struct geometryTransition7Example {
  @State btn1: boolean = false
  @State show: string = "show"

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, }) {
      Button(this.show)
        .width(80)
        .height(30)
        .backgroundColor(0x317aff)
        .margin({ bottom: 50 } as Margin)
        .key('button')
        .onClick((e: ClickEvent) => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "btn1": this.btn1,
              } as Record<string, Object>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 104,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("geometryTransitionTest_0100 start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("geometryTransitionTest_0100 emit action state err: " +
            JSON.stringify((err as Error)?.message))
          }
          animateTo({ duration: 1000 }, () => {
            this.btn1 = !this.btn1
            if (this.btn1) {
              this.show = "hide"
            } else {
              this.show = "show"
            }
          })
        })
      if (this.btn1) {
        Button('') {
          Image($r('app.media.icon')).width("80%").height(300)
        }

      }
    }.height(400).width("100%").padding({ top: 100 } as Padding)
  }
}