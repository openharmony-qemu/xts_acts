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

import { ExtendableGridItem, GridItemOptions, Length, Entry, Component, Text, ForEach, GridItem, Grid, Color } from '@kit.ArkUI';

class MyGridItem extends ExtendableGridItem {
  // 通用属性
  setGridItemOptions(value?: GridItemOptions): this{
    super.setGridItemOptions(value);
    // 添加自定义行为，如打印日志
    console.info('MyColumn: setGridItemOptions');
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
    super.rowStart(1);
    super.backgroundColor(Color.Orange);
    return this;
  }
}

@Entry
@Component
struct ExtendableGridItemBuiltIn {
  data: number[] = [0, 1, 2, 3, 4, 5];

  build() {
    Grid() {
      ForEach(this.data, (item: number) => {
        MyGridItem() {
          Text('N' + item)
            .id('ExtendableGridItem_002')
            .height('5%')
        }
        .newAttribute() // 调用自定义属性
        .id('ExtendableGridItem_001')
      })
    }
    .width('90%')
    .border({ width: 1, color: Color.Black })
    .columnsTemplate('repeat(auto-fit, 70)')
    .columnsGap(10)
    .rowsGap(10)
    .height(100)
  }
}

