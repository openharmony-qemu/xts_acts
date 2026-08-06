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
import { Button, Column, Component, Entry, ObjectLink, Observed, State, Text, TextAlign,ObservedArray, ObservedDate, ObservedMap, ObservedSet,Row,ForEach,Divider,TextVerticalAlign } from '@kit.ArkUI';


@Component
struct ArraySample {
  // 直接创建ObservedArray实例即具有API操作可观察能力，不依赖于状态管理装饰器。
  arr: ObservedArray<int> = new ObservedArray<int>(3, (index: int): int => index);
  build() {
    Column() {
      Text(`${this.arr}`)
        .id('arrayText')
        .height('5%')
      Button('push')
        .id('pushButton')
        .height('5%')
        .onClick(() => {
          // 添加元素，UI会刷新
          this.arr.push(this.arr.length);
        })
      Button('reverse')
        .id('reverseButton')
        .height('5%')
        .onClick(() => {
          // 翻转arr中的元素，UI会刷新
          this.arr.reverse();
        })
    }
  }
}



@Component
struct MapSample {
  // 直接创建ObservedMap实例即具有API操作可观察能力，不依赖于状态管理装饰器。
  message: ObservedMap<int, string> = new ObservedMap<int, string>([[0, 'a'], [1, 'b']]);

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.message.entries()), (item: [int, string]) => {
          Text(`${item[0]}: ${item[1]}`)
            .id('mapText')
            .height('5%')
          Divider()
        })
        Button('set')
          .id('setButton')
          .height('5%')
          .onClick(() => {
            // 添加新的键值对，UI会刷新
            this.message.set(2, 'c');
          })
        Button('delete')
          .id('deleteButton')
          .height('5%')
          .onClick(() => {
            // 删除key为0的键值对，UI会刷新
            this.message.delete(0);
          })
      }
      .id('mapContainer')
    }
  }
}


@Component
struct SetSample {
  // 直接创建ObservedSet实例即具有API操作可观察能力，不依赖于状态管理装饰器。
  message: ObservedSet<int> = new ObservedSet<int>([0, 1, 2, 3]);

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.message.values()), (item: int) => {
          Text(`${item}`)
            .id('setText')
            .height('5%')
          Divider()
        })
        Button('add')
          .id('addButton')
          .height('5%')
          .onClick(() => {
            // 添加元素，UI会刷新
            this.message.add(this.message.size);
          })
        Button('delete')
          .id('deleteSetButton')
          .height('5%')
          .onClick(() => {
            // 移除值为0的元素，UI会刷新
            this.message.delete(0);
          })
      }
      .id('setContainer')
    }
  }
}


@Component
struct DateSample {
  // 直接创建ObservedDate实例即具有API操作可观察能力，不依赖于状态管理装饰器。
  selectedDate: ObservedDate = new ObservedDate('2026-05-01');

  formatChineseDate(date: ObservedDate): string {
    const year = date.getFullYear();
    // 月份从0开始，需要加1，并补零
    const month = String(date.getMonth() + 1).padStart(2, '0');
    // 日期补零
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }

  build() {
    Column() {
      Text(`${this.formatChineseDate(this.selectedDate)}`)
        .id('dateText')
        .height('5%')

      Button('increase year')
        .id('increaseYearButton')
        .height('5%')
        .onClick(() => {
          // 将selectedDate实例对应的年份加1，UI会刷新
          this.selectedDate.setFullYear(this.selectedDate.getFullYear() + 1);
        })
      Button('increase month')
        .id('increaseMonthButton')
        .height('5%')
        .onClick(() => {
          // 将selectedDate实例对应的月份加1，UI会刷新
          this.selectedDate.setMonth(this.selectedDate.getMonth() + 1);
        })
    }
  }
}


@Entry
@Component
struct SVDeepListenObservedBuiltIn {
  build() {
    Column() {
      ArraySample();
      MapSample();
      SetSample();
      DateSample();
    }
    .width('100%')
    .height('100%')
  }
}