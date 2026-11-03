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

export class LazyReusableDataSource implements IDataSource {
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
@Component
struct ClearCacheLazyForEachReusable {
  private data: LazyReusableDataSource = new LazyReusableDataSource();
  private scroller: Scroller = new Scroller();
  private lazyController: LazyForEachController = new LazyForEachController();
  private poolRef: ESObject = null;
  @State lazyClearTimes: number = 0;
  @State poolClearTimes: number = 0;

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
          .id('lazy_reusable_scroll')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.scroller.scrollBy(0, 1200); })

        Button('lazyClear')
          .id('lazy_reusable_lazy_clear')
          .width(90).height(15).fontSize(10)
          .onClick(() => {
            this.lazyController.clearCache();
            this.lazyClearTimes++;
          })
      }

      Row() {
        Button('poolClear')
          .id('lazy_reusable_pool_clear')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.clearPool(); })

        Button('top')
          .id('lazy_reusable_scroll_top')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.scroller.scrollToIndex(0); })
      }

      Row() {
        Text(`lC:${this.lazyClearTimes}`)
          .id('lazy_reusable_lazy_clear_times').fontSize(10)
        Text(`pC:${this.poolClearTimes}`)
          .id('lazy_reusable_pool_clear_times').fontSize(10)
      }
      
      List({ space: 2, scroller: this.scroller }) {
        LazyForEach(this.data, (item: string, index: number) => {
          ListItem() {
            LazyReusableChild({ item: item, onPoolReady: (pool: ESObject) => { this.onPoolReady(pool); } })
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

@Reusable
@Component
struct LazyReusableChild {
  @Prop item: string = '';
  onPoolReady?: (pool: ESObject) => void;

  aboutToAppear(): void {
    const ctx = UIUtils.getCustomComponentContext(this);
    const pool = ctx?.getDefaultReusePool?.();
    if (pool && this.onPoolReady) {
      this.onPoolReady(pool);
    }
  }

  aboutToReuse(param: ESObject): void {
    const ctx = UIUtils.getCustomComponentContext(this);
    const pool = ctx?.getDefaultReusePool?.();
    if (pool && this.onPoolReady) {
      this.onPoolReady(pool);
    }
  }

  build() {
    Row() {
      Text(`item:${this.item}`).fontSize(12)
    }
    .width('100%').height('100%')
  }
}
