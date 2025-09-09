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
  Alignment,
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
  BreakpointsReference,
  Builder,
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
  DatePicker,
  Dimension,
  Divider,
  EdgeEffect,
  Ellipse,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  Font,
  FontStyle,
  FontWeight,
  ForEach,
  FormComponent,
  FormDimension,
  Gauge,
  GradientDirection,
  Grid,
  GridCol,
  GridItem,
  GridRow,
  GridRowDirection,
  HorizontalAlign,
  Hyperlink,
  Image,
  ImageAnimator,
  ImageSpan,
  ItemAlign,
  LineCapStyle,
  LineJoinStyle,
  List,
  ListItem,
  ListItemGroup,
  LoadingProgress,
  Margin,
  MarkStyle,
  Menu,
  MenuAlignType,
  MenuItem,
  MenuItemOptions,
  NavDestination,
  Navigation,
  NavPathStack,
  Padding,
  Path,
  PickerTextStyle,
  Polygon,
  Polyline,
  Position,
  Progress,
  ProgressType,
  Rect,
  RepeatMode,
  ResourceColor,
  RichEditor,
  RichEditorController,
  Row,
  RowOptions,
  Search,
  SearchController,
  Select,
  Shape,
  SharedTransitionEffectType,
  StickyStyle,
  Swiper,
  SwiperDisplayMode,
  Text,
  TextAlign,
  TextInputController,
  TextOverflow,
  Toggle,
  ToggleType,
  Visibility,
  Week
} from '@ohos.arkui.component';
import { Link, PropRef, State, } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter'

interface EventD {
  duration?: number
  delay?: number
  type?: SharedTransitionEffectType
}

@Entry
@Component
struct SharedTransition7Example {
  @State active: boolean = false
  @State duration: number = 1000
  @State delay: number = 0
  @State type: SharedTransitionEffectType = SharedTransitionEffectType.Static

  build() {
    List() {
      ListItem() {
        Row() {

          Navigation({}) {
            Image($r('app.media.icon')).width(50).height(50)
              .sharedTransition('sharedImage1', { duration: this.duration, delay: this.delay, type: this.type })
          }
          .key('Navigator')
          .padding({ left: 10 } as Padding)
          .onClick((e: ClickEvent) => {
            this.active = true
            console.info('SharedTransition current action state is: ' + this.active);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "duration": this.duration,
                  "delay": this.delay,
                  "type": this.type
                } as Record<string, Object>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 193,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("SharedTransition start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err) {
              console.info("SharedTransition emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })

          Text('SharedTransition').width(80).height(80).textAlign(TextAlign.Center)
        }
      }
    }
  }

  onPageShow() {
    console.info('sharedTransition page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 194,
      priority: events_emitter.EventPriority.LOW
    }

  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("sharedTransition page state change called:" + JSON.stringify(eventData));
      if ((eventData.data as EventD)?.duration != null) {
        this.duration = (eventData.data as EventD)?.duration ?? 1000;
      }
      if ((eventData.data as EventD)?.delay != null) {
        this.delay = (eventData.data as EventD)?.delay ?? 0;
      }
      if ((eventData.data as EventD)?.type != null) {
        this.type = (eventData.data as EventD)?.type ?? SharedTransitionEffectType.Static;
      }
    }
  }
}