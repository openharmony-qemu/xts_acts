'use static'
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

import { Entry, Component, Grid, Text, BorderOptions, Scroller, GridLayoutOptions, ForEach, GridItem, Color, ExtendableGrid, Length } from '@kit.ArkUI';

class MyGrid extends ExtendableGrid {
  // 通用属性
  setGridOptions(scroller?: Scroller, layoutOptions?: GridLayoutOptions): this{
    // 添加自定义行为，如打印日志
    console.info('MyColumn: setGridOptions');
    return this;
  }
  width(): this {
    super.width('100%');
    return this;
  }

  height(): this {
    super.height('100%');
    return this;
  }

  // 自定义属性
  newAttribute(): this {
    super.columnsGap(10);
    super.rowsGap(10);
    super.height(100);
    return this;
  }
}

@Entry
@Component
struct ExtendableGridBuiltIn {
  data: number[] = [0, 1, 2, 3, 4, 5];

  build() {
    MyGrid() {
      ForEach(this.data, (item: number) => {
        GridItem() {
          Text('N' + item)
            .height('5%')
        }
        .backgroundColor(Color.Orange)
      })
    }
    .id('ExtendableGrid_001')
    .width() // 调用重写属性
    .border({ width: 1, color: Color.Black } as BorderOptions)
    .columnsTemplate('repeat(auto-fit, 70)')
    .newAttribute() // 调用自定义属性
  }
}

