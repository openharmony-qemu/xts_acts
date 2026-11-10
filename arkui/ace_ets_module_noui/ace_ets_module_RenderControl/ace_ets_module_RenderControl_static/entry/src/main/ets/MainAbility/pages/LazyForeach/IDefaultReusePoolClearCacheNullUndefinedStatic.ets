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

import { Entry, Component, Column, Row, Text, Button, List, ListItem, ForEach, BarState, FlexAlign, Reusable } from '@ohos.arkui.component';
import { State, PropRef } from '@ohos.arkui.stateManagement';

interface IDefaultReusePool {
  clearCache(): void;
}

@Entry
@Component
struct IDefaultReusePoolClearCacheNullUndefinedStatic {
  private dataList: Array<string> = [];
  private poolRef: IDefaultReusePool | undefined = undefined;
  @State undefinedResult: string = '';

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.dataList.push(`Item ${i.toString()}`);
    }
  }

  clearUndefined(): void {
    const pool: IDefaultReusePool | undefined = this.poolRef;
    if (pool) {
      try {
        pool.clearCache();
        this.undefinedResult = 'no_crash';
      } catch (e) {
        this.undefinedResult = 'crash';
      }
    } else {
      this.undefinedResult = 'no_crash';
    }
  }

  build() {
    Column() {
      Row() {
        Button('clearUndefined')
          .id('pool_undefined_static_clear_btn')
          .width(90).height(15).fontSize(10)
          .onClick((): void => { this.clearUndefined(); })
      }

      Row() {
        Text(`undef:${this.undefinedResult}`)
          .id('pool_undefined_static_result').fontSize(10)
      }
      .width('100%').height(15)

      List() {
        ForEach(this.dataList, (item: string, index: int) => {
          ListItem() {
            NullUndefinedStaticChild({ item: item })
          }
          .height(20)
        }, (item: string) => item)
      }
      .width('100%').height('60%')
      .scrollBar(BarState.Off)
    }
    .width('100%').height('100%')
    .justifyContent(FlexAlign.Start)
  }
}

@Reusable
@Component
struct NullUndefinedStaticChild {
  @PropRef item: string = '';

  build() {
    Row() {
      Text(this.item).fontSize(12)
    }
    .width('100%').height('100%')
  }
}
