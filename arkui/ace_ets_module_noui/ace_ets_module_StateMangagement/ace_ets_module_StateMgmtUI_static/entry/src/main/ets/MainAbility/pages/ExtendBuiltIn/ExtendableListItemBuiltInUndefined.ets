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

import { ExtendableListItem, ListItemOptions, Length, LayoutPolicy, ListDividerOptions, List, Entry, Component, Text, State, ForEach, TextAlign, ListItem, Color } from '@kit.ArkUI';

class MyListItem extends ExtendableListItem {
  setListItemOptions(value?: ListItemOptions): this{
    super.setListItemOptions(value);
    // 添加自定义行为，如打印日志
    console.info('MyListItem: setListItemOptions');
    return this;
  }
  width(): this {
    super.width('50%');
    return this;
  }

  height(): this {
    super.height('30%');
    return this;
  }

  newAttribute(): this {
    super.margin(10);
    super.borderRadius(10);
    return this;
  }
}

@Entry
@Component
struct ExtendableListItemBuiltInUndefined {
  @State arr: Array<string> = [''];

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    List({ space: 10 }) {
      ForEach(this.arr, (item: string) => {
        MyListItem(undefined) {
          Text(item.toString())
            .height('5%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.arr[0] += 'a';
            })
        }
        .id('ExtendableListItem_002')
        .width()
        .newAttribute()
      }, (item: string) => item)
    }
    .id('ExtendableListItem_003')
    .width('100%')
    .height('100%')
    .divider({ strokeWidth: 1, color: Color.Blue } as ListDividerOptions)
  }
}