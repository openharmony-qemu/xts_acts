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

@Entry
@Component
struct ClearCacheRepeatReusable {
  private data: string[] = [];
  private scroller: Scroller = new Scroller();
  private repeatController: RepeatController = new RepeatController();
  private poolRef: ESObject = null;
  @State repeatClearTimes: number = 0;
  @State poolClearTimes: number = 0;

  aboutToAppear(): void {
    for (let i = 0; i < 200; i++) {
      this.data.push(`RItem ${i}`);
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
          .id('repeat_reusable_scroll')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.scroller.scrollBy(0, 1200); })

        Button('repeatClear')
          .id('repeat_reusable_repeat_clear')
          .width(90).height(15).fontSize(10)
          .onClick(() => {
            this.repeatController.clearCache();
            this.repeatClearTimes++;
          })
      }
  
      Row() {
        Button('poolClear')
          .id('repeat_reusable_pool_clear')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.clearPool(); })

        Button('top')
          .id('repeat_reusable_scroll_top')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.scroller.scrollToIndex(0); })
      }

      Row() {
        Text(`rC:${this.repeatClearTimes}`)
          .id('repeat_reusable_repeat_clear_times').fontSize(10)
        Text(`pC:${this.poolClearTimes}`)
          .id('repeat_reusable_pool_clear_times').fontSize(10)
      }

      List({ space: 2, scroller: this.scroller }) {
        Repeat<string>(this.data, { controller: this.repeatController })
          .each((ri: RepeatItem<string>) => {
            ListItem() {
              RepeatReusableChild({ item: ri.item, onPoolReady: (pool: ESObject) => { this.onPoolReady(pool); } })
            }
            .height(20)
          })
          .key((item: string) => item)
          .virtualScroll({ totalCount: this.data.length })
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
struct RepeatReusableChild {
  @Prop item: string = '';
  onPoolReady?: (pool: ESObject) => void;

  aboutToAppear(): void {
    const pool = UIUtils.getCustomComponentContext(this).getDefaultReusePool?.();
    if (pool && this.onPoolReady) {
      this.onPoolReady(pool);
    }
  }

  aboutToReuse(param: ESObject): void {
    const pool = UIUtils.getCustomComponentContext(this).getDefaultReusePool?.();
    if (pool && this.onPoolReady) {
      this.onPoolReady(pool);
    }
  }

  build() {
    Row() {
      Text(this.item).fontSize(12)
    }
    .width('100%').height('100%')
  }
}
