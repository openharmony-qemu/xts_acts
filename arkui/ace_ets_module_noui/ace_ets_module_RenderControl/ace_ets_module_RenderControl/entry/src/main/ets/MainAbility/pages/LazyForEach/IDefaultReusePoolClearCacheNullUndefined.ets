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
struct IDefaultReusePoolClearCacheNullUndefined {
  private dataList: string[] = [];
  private poolRef: ESObject = null;
  @State nullResult: string = '';
  @State undefinedResult: string = '';

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.dataList.push(`Item ${i}`);
    }
  }

  clearNull(): void {
    if (this.poolRef) {
      try {
        this.poolRef.clearCache(null);
        this.nullResult = 'no_crash';
      } catch (e) {
        this.nullResult = 'crash';
      }
    } else {
      this.nullResult = 'no_crash';
    }
  }

  clearUndefined(): void {
    if (this.poolRef) {
      try {
        this.poolRef.clearCache(undefined);
        this.undefinedResult = 'no_crash';
      } catch (e) {
        this.undefinedResult = 'crash';
      }
    } else {
      this.undefinedResult = 'no_crash';
    }
  }

  onPoolReady(pool: ESObject): void {
    this.poolRef = pool;
  }

  build() {
    Column() {
      Row() {
        Button('clearNull')
          .id('pool_null_clear_btn')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.clearNull(); })

        Button('clearUndefined')
          .id('pool_undefined_clear_btn')
          .width(90).height(15).fontSize(10)
          .onClick(() => { this.clearUndefined(); })
      }
    
      Row() {
        Text(`null:${this.nullResult}`)
          .id('pool_null_result').fontSize(10)
        Text(`undef:${this.undefinedResult}`)
          .id('pool_undefined_result').fontSize(10)
      }
      .width('100%').height(15)

      List() {
        ForEach(this.dataList, (item: string, index: number) => {
          ListItem() {
            NullUndefinedChild({ item: item, onPoolReady: (pool: ESObject) => { this.onPoolReady(pool); } })
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
struct NullUndefinedChild {
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
