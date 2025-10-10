/*
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
  SwiperController,
  Column,
  Text,
  LazyForEach,
  Margin,
  IDataSource,
  DataChangeListener,
  DotIndicator,
  ColumnOptions,
  Swiper,
  TextAlign,
  Color,
  EdgeEffect,
  Visibility,
  ClickEvent,
  SwiperDisplayMode,
  SwiperAnimationEvent,
  Row,
  RowOptions,
  Button,
  Curve,
  SwiperAnimationEvent,
  HorizontalAlign,
  ArrowStyle,
  SwiperAutoFill,
  Padding,
  Indicator,
  FontWeight,
  Flex,
  FlexAlign,
  List,
  ListItem,
  $r,
  Alignment,
  TextOverflow,
  SwiperAutoFill,
  FlexDirection,
  ItemAlign,
  Scroll,
  ForEach
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

class MyDataSourceSwiper implements IDataSource<number> {
  private list: number[] = []

  constructor(list: number[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): number {
    return this.list[index.toInt()]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}

interface ColorObject {
  cardId: number,
  color: Color
}

@Entry
@Component
struct SwiperExample3 {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSourceSwiper = new MyDataSourceSwiper([])
  @State isHoverShow: boolean = false
  @State isTrue: boolean = true
  @State isArrow: boolean = true
  @State arrowStyle: ArrowStyle = {} as ArrowStyle
  @State boolFlag: boolean = false
  @State bool: boolean = false
  @State boolIsNum: boolean = false
  @State boolIsStr: boolean = false
  @State boolIsNull: boolean = false
  @State boolNum: number = 2
  @State boolStr: string = ''
  @State indicator: boolean = true
  private colorList: ColorObject[] = [
    { cardId: 1, color: Color.White },
    { cardId: 2, color: Color.Yellow },
    { cardId: 3, color: Color.Blue },
    { cardId: 4, color: Color.Brown },
    { cardId: 5, color: Color.Gray },
    { cardId: 6, color: Color.Green },
    { cardId: 7, color: Color.Grey },
    { cardId: 8, color: Color.Orange },
    { cardId: 9, color: Color.Pink },
    { cardId: 10, color: Color.Red }] as ColorObject[]
  private valueChangeCallBack: (eventData: events_emitter.EventData) => void =
    (eventData: events_emitter.EventData) => {
      console.info("key==> page valueChangeCallBack");
      console.info("valueChangeCallBack eventData:" + JSON.stringify(eventData));
      console.info("valueChangeCallBack eventData.data?.['type']:" +
      JSON.stringify(((eventData.data) as Record<String, RecordData>)?.['type']));
      if (eventData != null && eventData.data != null) {
        console.info("swiper page state change called:" + JSON.stringify(eventData));
        const jsonElementInstance = JSON.parseJsonElement(JSON.stringify(eventData))
        const jsonElementData = jsonElementInstance.tryGetElement('data')
        if (((eventData.data) as Record<String, RecordData>)?.['type'] == undefined) {
          this.arrowStyle = jsonElementData?.tryGetElement('arrowStyle') != null ?
            (jsonElementData?.tryGetElement('arrowStyle') as ArrowStyle) : {} as ArrowStyle;
        }
        if (((eventData.data) as Record<String, RecordData>)?.['type'] == "BoolTrue") {
          console.info("valueChangeCallBack BoolTrue:" + JSON.stringify(eventData));
          this.boolFlag = true
          this.bool = true
          console.info("valueChangeCallBack this.bool:" + JSON.stringify(this.bool));
        }
        if (((eventData.data) as Record<String, RecordData>)?.['type'] == "BoolFalse") {
          console.info("valueChangeCallBack BoolFalse:" + JSON.stringify(eventData));
          this.boolFlag = true
          this.bool = false
        }
        if (((eventData.data) as Record<String, RecordData>)?.['type'] == "BoolErrNum") {
          console.info("valueChangeCallBack BoolErrNum:" + JSON.stringify(eventData));
          this.boolFlag = false
          this.boolIsNum = true
          this.boolNum = Number(((eventData.data) as Record<String, RecordData>)?.['displayArrow']?.toString() ?? '0')
        }
        if (((eventData.data) as Record<String, RecordData>)?.['type'] == "BoolErrStr") {
          console.info("valueChangeCallBack BoolErrStr:" + JSON.stringify(eventData));
          this.boolFlag = false
          this.boolIsNum = false
          this.boolIsStr = true
          this.boolStr = ((eventData?.data) as Record<String, RecordData>)?.['displayArrow']?.toString() ?? ''
        }
        if (((eventData.data) as Record<String, RecordData>)?.['type'] == "BoolErrNull") {
          console.info("valueChangeCallBack BoolErrNull:" + JSON.stringify(eventData));
          this.boolFlag = false
          this.boolIsNum = false
          this.boolIsStr = false
          this.boolIsNull = true
        }
        if (((eventData.data) as Record<String, RecordData>)?.['type'] == "BoolErrUndefined") {
          console.info("valueChangeCallBack BoolErrUndefined:" + JSON.stringify(eventData));
          this.boolFlag = false
          this.boolIsNum = false
          this.boolIsStr = false
          this.boolIsNull = false
        }
      }
    }

  aboutToAppear(): void {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Column() {
        Swiper(this.swiperController) {
          ForEach(this.colorList, (item: ColorObject, index: number) => {
            Text("第" + (item.cardId).toString() + "页")
              .width('90%')
              .height('15%')
              .backgroundColor(item.color)
              .textAlign(TextAlign.Center)
              .fontSize(20)
          })
        }
        .key("SwiperA")
        .backgroundColor($r("sys.color.ohos_id_color_component_normal"))
        .foregroundColor($r("sys.color.ohos_id_color_primary"))
        .index(0)
        .indicator(this.indicator)
        .cachedCount(1)
        .loop(false)
        .duration(1000)
        .vertical(false)
        .onChange((index: Int): void => {
          console.info(index.toString())
        })
        .displayArrow(this.arrowStyle, true)
      }

      Column() {
        Swiper(this.swiperController) {
          ForEach(this.colorList, (item: ColorObject, index: number) => {
            Text("第" + (item.cardId).toString() + "页")
              .width('90%')
              .height('15%')
              .backgroundColor(item.color)
              .textAlign(TextAlign.Center)
              .fontSize(20)
          })
        }
        .key("SwiperB")
        .index(0)
        .indicator(this.indicator)
        .cachedCount(1)
        .loop(false)
        .duration(1000)
        .vertical(false)
        .onChange((index: Int): void => {
          console.info(index.toString())
        })

        
        
      }

      Column() {
        Swiper(this.swiperController) {
          ForEach(this.colorList, (item: ColorObject, index: number) => {
            Text("第" + (item.cardId).toString() + "页")
              .width('90%')
              .height('15%')
              .backgroundColor(item.color)
              .textAlign(TextAlign.Center)
              .fontSize(20)
          })
        }
        .key("SwiperC")
        .index(0)
        .indicator(this.indicator)
        .cachedCount(1)
        .loop(false)
        .duration(1000)
        .vertical(false)
        .onChange((index: Int): void => {
          console.info(index.toString())
        })

        
        
      }

      Column() {
        Swiper(this.swiperController) {
          ForEach(this.colorList, (item: ColorObject, index: number) => {
            Text("第" + (item.cardId).toString() + "页")
              .width('90%')
              .height('15%')
              .backgroundColor(item.color)
              .textAlign(TextAlign.Center)
              .fontSize(20)
          })
        }
        .key("SwiperC")
        .index(0)
        .indicator(this.indicator)
        .cachedCount(1)
        .loop(false)
        .duration(1000)
        .vertical(false)
        .onChange((index: Int): void => {
          console.info(index.toString())
        })

        
        

      }

      Column() {
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: number, index: number) => {
            Text(item.toString())
              .width('90%')
              .height('15%')
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(20)
          }, (item: number) => item.toString())
        }
        .key("SwiperD")
        .foregroundColor($r("sys.color.ohos_id_color_primary"))
        .index(0)
        .indicator(this.indicator) 
        .cachedCount(1)
        .loop(false)
        .duration(1000)
        .vertical(false)
        .onChange((index: Int): void => {
          console.info(index.toString())
        })
        .displayArrow(this.arrowStyle)
      }

      Column() {
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: number, index: number) => {
            Text(item.toString())
              .width('90%')
              .height('15%')
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(20)
          }, (item: number) => item.toString())
        }
        .key("SwiperE")
        .foregroundColor($r("sys.color.ohos_id_color_primary"))
        .index(0)
        .indicator(this.indicator)
        .cachedCount(1)
        .loop(false)
        .duration(1000)
        .vertical(false)
        .onChange((index: Int): void => {
          console.info(index.toString())
        })
        .displayArrow(true)
      }

      Column() {
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: number, index: number) => {
            Text(item.toString())
              .width('90%')
              .height('15%')
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(20)
          }, (item: number) => item.toString())
        }
        .key("SwiperF")
        .index(0)
        .indicator(this.indicator)
        .cachedCount(1)
        .loop(false)
        .duration(1000)
        .vertical(false)
        .onChange((index: Int): void => {
          console.info(index.toString())
        })
      }
    }
    .height('100%')
    .width('80%')
    .margin({ top: 5 } as Margin)
  }
}
