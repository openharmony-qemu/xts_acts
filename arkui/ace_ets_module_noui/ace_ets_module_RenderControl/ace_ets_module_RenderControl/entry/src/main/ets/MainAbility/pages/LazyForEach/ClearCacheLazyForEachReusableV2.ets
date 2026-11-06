/**
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

import { UIUtils } from '@kit.ArkUI';

export class LazyReusableV2DataSource implements IDataSource {
  private dataArray: string[] = []
  private listeners: DataChangeListener[] = []

  pushData(data: string): void {
    this.dataArray.push(data)
    this.notifyDataAdd(this.dataArray.length - 1)
  }

  totalCount(): number {
    return this.dataArray.length;
  }

  getData(index: number): string {
    return this.dataArray[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }
}

@Entry
@ComponentV2
struct ClearCacheLazyForEachReusableV2 {
  private data: LazyReusableV2DataSource = new LazyReusableV2DataSource();
  private scroller: Scroller = new Scroller();
  private lazyController: LazyForEachController = new LazyForEachController();
  @Local lazyClearTimes: number = 0;
  @Local poolClearTimes: number = 0;
  @Local poolRef: ESObject = null;

  aboutToAppear(): void {
    for (let i = 1; i <= 500; i++) {
      this.data.pushData(i.toString());
    }
  }

  clearPool(): void {
    if (this.poolRef) {
      this.poolRef.clearCache();
    }
    this.poolClearTimes++;
  }

  onPoolReady(pool: ESObject): void {
    this.poolRef = pool;
  }

  build() {
    Column() {
      Row() {
        Button('scroll')
          .id('lazy_reusablev2_scroll')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.scroller.scrollBy(0, 1200); })

        Button('lazyClear')
          .id('lazy_reusablev2_lazy_clear')
          .width(90).height(15).fontSize(10)
          .onClick(() => {
            this.lazyController.clearCache();
            this.lazyClearTimes++;
          })
      }

      Row() {
        Button('poolClear')
          .id('lazy_reusablev2_pool_clear')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.clearPool(); })

        Button('top')
          .id('lazy_reusablev2_scroll_top')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.scroller.scrollToIndex(0); })
      }

      Row() {
        Text(`lC:${this.lazyClearTimes}`)
          .id('lazy_reusablev2_lazy_clear_times').fontSize(10)
        Text(`pC:${this.poolClearTimes}`)
          .id('lazy_reusablev2_pool_clear_times').fontSize(10)
      }

      List({ space: 2, scroller: this.scroller }) {
        LazyForEach(this.data, (item: string, index: number) => {
          ListItem() {
            LazyReusableV2Child({ item: item, poolHolder: this })
          }
          .height(20)
        }, (item: string, index: number) => item + index,
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

@ComponentV2
@ReusableV2
struct LazyReusableV2Child {
  @Param item: string = '';
  @Param poolHolder: ESObject = null;

  aboutToAppear(): void {
    const pool = UIUtils.getCustomComponentContext(this).getDefaultReusePool?.();
    if (pool && this.poolHolder) {
      this.poolHolder.onPoolReady(pool);
    }
  }

  build() {
    Row() {
      Text(`item:${this.item}`).fontSize(12)
    }
    .width('100%').height('100%')
  }
}
