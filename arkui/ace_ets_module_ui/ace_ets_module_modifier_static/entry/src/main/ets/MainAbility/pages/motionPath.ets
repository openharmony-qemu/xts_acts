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
import { Entry,Component,$r,Builder,List, ListItem,Marquee,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,animateTo,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter'







interface FormXy {
  fromX: string
  toY: string
}
@Entry
@Component
struct MotionPath7Example {
  @State offsetX: number = 0
  @State offsetY: number = 0
  @State toggle: boolean = true
  @State rotatable: boolean = false
  @State path: string = 'Mstart.x start.y L300 200 L300 500 Lend.x end.y'
  @State fromX: number = 0
  @State toY: number = 1



  build() {
    Column() {
      Button('click me')
        .key('button')

        .onClick((e: ClickEvent) => {
          this.rotatable = true;
          console.info('button rotate current action state is:' + this.rotatable);
          try {
            let backData: events_emitter.EventData = {
              data: {
                "ACTION": this.rotatable,
              } as Record<string,Object>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 132,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button emit action state err: " + JSON.stringify((err as Error)?.message))
          }
          animateTo({ duration: 4000, curve: Curve.Linear }, () => {
            this.toggle = !this.toggle;
          })
        })
        .backgroundColor(0x317aff)
      Button('next')
        .key('button1')
        .onClick((e: ClickEvent) => {
          try {
            let backData: events_emitter.EventData = {
              data: {
                "fromX": this.fromX,
                "toY": this.toY
              } as Record<string,Object>
            }
            let backEvent: events_emitter.InnerEvent = {
              eventId: 133,
              priority: events_emitter.EventPriority.LOW
            }
            console.info("button1 position start to emit action state")
            events_emitter.emit(backEvent, backData)
          } catch (err) {
            console.info("button1 position emit action state err: " + JSON.stringify((err as Error)?.message))
          }
        })
    }
    .key('motionPath')
      .width('100%').height('100%').alignItems(this.toggle ? HorizontalAlign.Start : HorizontalAlign.Center)
  }

  onPageShow() {
    console.info('motionPath page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 134,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangeCallBack)
  }

  private stateChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('motionPath page state change called:' + JSON.stringify(eventData));
      if ((eventData.data as FormXy)?.fromX != null) {
        this.fromX == Number.parseInt(((eventData.data as FormXy)?.fromX) as string);
      }
      if ((eventData.data as FormXy)?.toY != null) {
        this.toY == Number.parseInt(((eventData.data as FormXy)?.toY) as string);
      }
    }
  }
}