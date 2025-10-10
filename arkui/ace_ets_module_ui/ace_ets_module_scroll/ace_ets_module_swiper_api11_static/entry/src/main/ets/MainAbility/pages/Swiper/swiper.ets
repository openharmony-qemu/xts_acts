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
  FlexAlign
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { MessageManager, Callback, Message, GlobalMessage } from '../../common/MessageManager1';
import events_emitter from '@ohos.events.emitter'
import { RecordData } from '@ohos.base';

class MyDataSource implements IDataSource<string> {
  private list: string[] = []
  private listener?: DataChangeListener = undefined

  constructor(list: string[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): string {
    return this.list[index.toInt()]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])
  @State index: Int = 1
  @State displayCount: Int = 3
  @State displayMode: SwiperDisplayMode = SwiperDisplayMode.STRETCH
  
  @State edgeEffect: EdgeEffect = EdgeEffect.None
  @State autoPlay: boolean = false
  @State interval: Int = 4000
  @State indicator: boolean = true
  @State loop: boolean = false
  @State duration: Int = 1000
  @State vertical: boolean = false
  @State itemSpace: double = 0.0
  @State onActionCalledOne: boolean = false;
  @State onActionCalledTwo: boolean = false;
  @State onActionCalledThree: boolean = false;

  aboutToAppear(): void {
    let list: string[] = []
    for (let i: number = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string, index: number) => {
          Text(item)
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(20)
        })
      }
      .cachedCount(2)
      .index(this.index)
      .autoPlay(this.autoPlay, undefined)
      .interval(this.interval)
      .indicator(this.indicator)
      .loop(this.loop)
      .duration(this.duration)
      .vertical(this.vertical)
      .itemSpace(this.itemSpace)
      .displayMode(this.displayMode)
      .displayCount(this.displayCount)
      .effectMode(this.edgeEffect)
      .indicator(
        new DotIndicator()
          .top(20)
          .right(20)
          .itemWidth(2)
          .itemHeight(2)
          .color(Color.Blue))
      .key('swiper')
      .onChange((index: Int): void => {
        console.info(index.toString())
        this.onActionCalledThree = true;
        console.info('onChange current action state is: ' + this.onActionCalledThree);
        try {
          let backData: events_emitter.EventData = {
            data: {
              "ACTION": this.onActionCalledThree,
            } as Record<String, RecordData>
          }
          let backEvent: events_emitter.InnerEvent = {
            eventId: 204,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("onChange start to emit action state")
          events_emitter.emit(backEvent, backData)
        } catch (err) {
          console.info("onChange emit action state err: " + JSON.stringify((err as Error)?.message))
        }
      })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('next')
          .key('button1')
          .onClick((e: ClickEvent) => {
            this.swiperController.showNext();
            this.onActionCalledOne = true;
            console.info('button1 current action state is: ' + this.onActionCalledOne);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.onActionCalledOne,
                } as Record<String, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 205,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("button1 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err: Error) {
              console.info("button1 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
        Button('preview')
          .key('button2')
          .onClick((e: ClickEvent) => {
            this.swiperController.showPrevious()
            this.onActionCalledTwo = true;
            console.info('button2 current action state is: ' + this.onActionCalledTwo);
            try {
              let backData: events_emitter.EventData = {
                data: {
                  "ACTION": this.onActionCalledTwo,
                } as Record<String, RecordData>
              }
              let backEvent: events_emitter.InnerEvent = {
                eventId: 206,
                priority: events_emitter.EventPriority.LOW
              }
              console.info("button2 start to emit action state")
              events_emitter.emit(backEvent, backData)
            } catch (err: Error) {
              console.info("button2 emit action state err: " + JSON.stringify((err as Error)?.message))
            }
          })
      }
    }.margin({ top: 5 } as Margin)
  }

  onPageShow() {
    console.info('swiper page show called');
    let stateChangeEvent: events_emitter.InnerEvent = {
      eventId: 207,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangCallBack)

    let stateChangeEventOne: events_emitter.InnerEvent = {
      eventId: 208,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventOne, this.stateChangCallBack)

    let stateChangeEventTwo: events_emitter.InnerEvent = {
      eventId: 209,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventTwo, this.stateChangCallBack)

    let stateChangeEventThree: events_emitter.InnerEvent = {
      eventId: 210,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEventThree, this.stateChangCallBack)
  }

  private stateChangCallBack: (eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info("swiper page state change called:" + JSON.stringify(eventData));
      const jsonElementInstance = JSON.parseJsonElement(JSON.stringify(eventData))
      const jsonElementData = jsonElementInstance.tryGetElement('data')
      this.index = jsonElementData?.tryGetDouble('index')?.toInt() ?? 1;
      this.autoPlay = jsonElementData?.tryGetBoolean('autoPlay') ?? false;
      this.interval = jsonElementData?.tryGetDouble('interval')?.toInt() ?? 4000;
      this.indicator = jsonElementData?.tryGetBoolean('indicator') ?? false;
      this.loop = jsonElementData?.tryGetBoolean('loop') ?? false;
      this.duration = jsonElementData?.tryGetDouble('duration')?.toInt() ?? 1000;
      this.vertical = jsonElementData?.tryGetBoolean('vertical') ?? false;
      this.itemSpace = jsonElementData?.tryGetDouble('itemSpace') ?? 0;
    }
  }
}