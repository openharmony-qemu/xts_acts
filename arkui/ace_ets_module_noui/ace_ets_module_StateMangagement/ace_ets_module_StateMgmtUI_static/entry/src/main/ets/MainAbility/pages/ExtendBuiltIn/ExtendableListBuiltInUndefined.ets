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

import { ExtendableList, ListOptions, Length, ListDividerOptions, List, Entry, Component, Text, State, ForEach, TextAlign, ListItem, Color } from '@kit.ArkUI';

class MyList extends ExtendableList {
  setListOptions(options?: ListOptions): this{
    super.setListOptions(options);
    // 添加自定义行为，如打印日志
    console.info('MyColumn: setListOptions');
    return this;
  }
  // 通用属性
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
    this.height('50%');
    this.width('30%');
    return this;
  }
}

@Entry
@Component
struct ExtendableListBuiltInUndefined {
  @State arr: Array<string> = [''];

  aboutToAppear(): void {
    for (let i = 0; i < 100; i++) {
      this.arr.push(i.toString());
    }
  }

  build() {
    // 调用扩展组件
    MyList(undefined) {
      ForEach(this.arr, (item: string) => {
        ListItem() {
          Text(item.toString())
            .height('5%')
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.arr[0] += 'a';
            })
        }
        .margin(10)
        .borderRadius(10)
        .backgroundColor('#FFFFFFFF')
      }, (item: string) => item)
    }
    .newAttribute() // 调用自定义属性
    .id('ExtendableList_undefined_001')
    .divider({ strokeWidth: 1, color: Color.Blue } as ListDividerOptions)
  }
}



