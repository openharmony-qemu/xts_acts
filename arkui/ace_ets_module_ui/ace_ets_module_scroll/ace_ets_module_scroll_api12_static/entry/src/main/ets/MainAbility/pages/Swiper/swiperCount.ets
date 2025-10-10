/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  Margin,
  DataChangeListener,
  SwiperController,
  Column,
  DotIndicator,
  SwiperAnimationEvent,
  ColumnOptions,
  IDataSource,
  Swiper,
  LazyForEach,
  Color,
  ArrowStyle,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { LengthMetrics } from '@ohos.arkui.node'

class MyDataSourceCount implements IDataSource<number> {
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

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct maxDisplayCountExample {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSourceCount = new MyDataSourceCount([])
  @State text1: string = ''

  aboutToAppear(): void {
    let list: number[] = new Array<number>()
    for (let i = 1; i <= 5; i++) {
      list.push(i);
    }
    this.data = new MyDataSourceCount(list)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: number, index: number) => {
          Text(item.toString())
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number, index: number) => String(item))
      }
      .id('maxDisplayCount_mess')
      .index(1)
      .indicatorInteractive(true)
      .indicator( 
        new DotIndicator()
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(15)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue)
          .maxDisplayCount(5)
          .end(LengthMetrics.vp(30))
      )
      .displayArrow({
        
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      } as ArrowStyle, false)
      .onChange((index: Int): void => {
        console.info(index.toString())
      })
      .onGestureSwipe((index: Int, extraInfo: SwiperAnimationEvent): void => {
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })
      .onAnimationStart((index: Int, targetIndex: Int, extraInfo: SwiperAnimationEvent): void => {
        console.info("index: " + index)
        console.info("targetIndex: " + targetIndex)
        console.info("current offset: " + extraInfo.currentOffset)
        console.info("target offset: " + extraInfo.targetOffset)
        console.info("velocity: " + extraInfo.velocity)
      })
      .onAnimationEnd((index: Int, extraInfo: SwiperAnimationEvent): void => {
        console.info("index: " + index)
        console.info("current offset: " + extraInfo.currentOffset)
      })

    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}