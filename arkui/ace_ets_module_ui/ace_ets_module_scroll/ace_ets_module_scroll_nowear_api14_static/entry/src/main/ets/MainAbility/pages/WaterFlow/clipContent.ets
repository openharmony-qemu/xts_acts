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
import { WaterFlowDataSource } from './WaterFlowDataSource';
import {
  Entry,
  Component,
  Scroller,
  ScrollState,
  ScrollSource,
  ContentClipMode,
  Column,
  ColumnOptions,
  Text,
  Button,
  WaterFlow,
  LazyForEach,
  WaterFlow,
  FlowItem,
  Padding,
  ClickEvent,
  EdgeEffect,
  BarState,
  WaterFlowOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct clipContentWaterFlowDemo {
  minSize: number = 80
  maxSize: number = 180
  fontSize: number = 24
  
  scroller: Scroller = new Scroller()
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  dataCount: int = this.dataSource.totalCount()
  private itemHeightArray: number[] = new Array<number>()
  
  @State clipContent1: ContentClipMode = ContentClipMode.CONTENT_ONLY
  @State text1: string = 'CONTENT_ONLY'

  
  getSize() {
    let ret = Math.floor(Math.random() * this.maxSize)
    return (ret > this.minSize ? ret : this.minSize)
  }

  
  setItemSizeArray() {
    for (let i = 0; i < 100; i++) {
      this.itemHeightArray.push(this.getSize())
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('ContentClipMode: ' + this.text1)
      Button('BOUNDARY')
        .id('clipContent_water_boundary')
        .margin(5)
        .onClick((e: ClickEvent) => {
          this.text1 = 'BOUNDARY'
          this.clipContent1 = ContentClipMode.BOUNDARY
        })
      Button('SAFE_AREA')
        .id('clipContent_water_safearea')
        .margin(5)
        .onClick((e: ClickEvent) => {
          this.text1 = 'SAFE_AREA'
          this.clipContent1 = ContentClipMode.SAFE_AREA
        })

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

    }
    .width('100%')
    .height('100%')
  }
}