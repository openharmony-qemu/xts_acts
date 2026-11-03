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

import { Entry, ComponentV2, Column, Row, Text, Button, List, ListItem, Repeat, RepeatItem, RepeatController, Scroller, BarState, Alignment, FlexAlign, ReusableV2 } from '@ohos.arkui.component';
import { Local, Param } from '@ohos.arkui.stateManagement';

@Entry
@ComponentV2
struct ClearCacheRepeatReusableV2Static {
  @Local data: Array<string> = [];
  private scroller: Scroller = new Scroller();
  private repeatController: RepeatController = new RepeatController();
  @Local repeatClearTimes: number = 0;
  @Local poolClearTimes: number = 0;

  aboutToAppear(): void {
    for (let i = 0; i < 200; i++) {
      this.data.push(`RV2Item ${i.toString()}`);
    }
  }

  clearPool(): void {
    this.poolClearTimes++;
  }

  build() {
    Column() {
      Row() {
        Button('scroll')
          .id('repeat_reusablev2_static_scroll')
          .width(90).height(15).fontSize(10)
          .onClick((): void => { this.scroller.scrollBy(0, 1200); })

        Button('repeatClear')
          .id('repeat_reusablev2_static_repeat_clear')
          .width(90).height(15).fontSize(10)
          .onClick((): void => {
            this.repeatController.clearCache();
            this.repeatClearTimes++;
          })
      }

      Row() {
        Button('poolClear')
          .id('repeat_reusablev2_static_pool_clear')
          .width(90).height(15).fontSize(10)
          .onClick((): void => { this.clearPool(); })

        Button('top')
          .id('repeat_reusablev2_static_scroll_top')
          .width(90).height(15).fontSize(10)
          .onClick((): void => { this.scroller.scrollToIndex(0); })
      }

      Row() {
        Text(`rC:${this.repeatClearTimes}`)
          .id('repeat_reusablev2_static_repeat_clear_times').fontSize(10)
        Text(`pC:${this.poolClearTimes}`)
          .id('repeat_reusablev2_static_pool_clear_times').fontSize(10)
      }
      .width('100%').height(15)

      List({ scroller: this.scroller }) {
        Repeat<string>(this.data, { controller: this.repeatController })
          .each((ri: RepeatItem<string>) => {
            ListItem() {
              RepeatReusableV2StaticChild({ item: ri.item })
            }
            .height(20)
          })
          .key((item: string, index: int) => item)
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

@ReusableV2
@ComponentV2
struct RepeatReusableV2StaticChild {
  @Param item: string = '';

  build() {
    Row() {
      Text(this.item).fontSize(12)
    }
    .width('100%').height('100%')
  }
}
