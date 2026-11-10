'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Entry, ComponentV2, Column, Row, Text, Button, List, ListItem, LazyForEach, IDataSource, DataChangeListener, Scroller, LazyForEachController, BarState, Alignment, FlexAlign, ReusableV2 } from '@ohos.arkui.component';
import { Local, Param } from '@ohos.arkui.stateManagement';

export class LazyReusableV2DataSource implements IDataSource<string> {
  private dataArray: Array<string> = [];
  private listeners: Array<DataChangeListener> = [];

  pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  totalCount(): int {
    return this.dataArray.length;
  }

  getData(index: int): string {
    return this.dataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataAdd(index: int): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }
}

@Entry
@ComponentV2
struct ClearCacheLazyForEachReusableV2Static {
  private data: LazyReusableV2DataSource = new LazyReusableV2DataSource();
  private scroller: Scroller = new Scroller();
  private lazyController: LazyForEachController = new LazyForEachController();
  @Local lazyClearTimes: number = 0;
  @Local poolClearTimes: number = 0;

  aboutToAppear(): void {
    for (let i = 1; i <= 500; i++) {
      this.data.pushData(i.toString());
    }
  }

  clearPool(): void {
    this.poolClearTimes++;
  }

  build() {
    Column() {
      Row() {
        Button('scroll')
          .id('lazy_reusablev2_static_scroll')
          .width(90).height(15).fontSize(10)
          .onClick((): void => { this.scroller.scrollBy(0, 1200); })

        Button('lazyClear')
          .id('lazy_reusablev2_static_lazy_clear')
          .width(90).height(15).fontSize(10)
          .onClick((): void => {
            this.lazyController.clearCache();
            this.lazyClearTimes++;
          })
      }
    
      Row() {
        Button('poolClear')
          .id('lazy_reusablev2_static_pool_clear')
          .width(90).height(15).fontSize(10)
          .onClick((): void => { this.clearPool(); })

        Button('top')
          .id('lazy_reusablev2_static_scroll_top')
          .width(90).height(15).fontSize(10)
          .onClick((): void => { this.scroller.scrollToIndex(0); })
      }

      Row() {
        Text(`lC:${this.lazyClearTimes}`)
          .id('lazy_reusablev2_static_lazy_clear_times').fontSize(10)
        Text(`pC:${this.poolClearTimes}`)
          .id('lazy_reusablev2_static_pool_clear_times').fontSize(10)
      }
      .width('100%').height(15)

      List({ scroller: this.scroller }) {
        LazyForEach(this.data, (item: string, index: int) => {
          ListItem() {
            LazyReusableV2StaticChild({ item: item })
          }
          .height(20)
        }, (item: string, index: int) => item + index.toString(),
          { controller: this.lazyController })
      }
      .width('100%').height('50%')
      .scrollBar(BarState.Off)
      .align(Alignment.Center)
    }
    .width('100%').height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

@ReusableV2
@ComponentV2
struct LazyReusableV2StaticChild {
  @Param item: string = '';

  build() {
    Row() {
      Text(`item:${this.item}`).fontSize(12)
    }
    .width('100%').height('100%')
  }
}
