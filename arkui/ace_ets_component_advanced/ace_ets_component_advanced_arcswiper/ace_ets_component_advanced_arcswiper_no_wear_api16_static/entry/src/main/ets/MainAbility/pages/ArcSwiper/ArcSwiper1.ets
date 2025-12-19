'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {
  ArcDirection,
  ArcDotIndicator,
  ArcSwiper,
  ArcSwiperAttribute,
  ArcSwiperController
} from '@ohos.arkui.ArcSwiper'
import { PromptAction, UIContext } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base';
import {
  Alignment,
  BlurStyle,
  Builder,
  Color,
  Column,
  ColumnOptions,
  Component,
  CrownSensitivity,
  DataChangeListener,
  Divider,
  EdgeEffect,
  Entry,
  FontStyle,
  IDataSource,
  LazyForEach,
  List,
  ListItem,
  Row,
  Scroll,
  Scroller,
  Stack,
  Text,
  TextAlign,
  wrapBuilder
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Context } from '@ohos.abilityAccessCtrl'

class MyDataSource implements IDataSource<int> {
  private list: int[] = []

  constructor(list: int[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): int {
    let RealIndex = index.toInt()
    return this.list[RealIndex]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct ArcSwiper1 {
  scroller: Scroller = new Scroller();
  private arcSwiperController: ArcSwiperController = new ArcSwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list: int[] = []
    for (let i = 1; i <= 5; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(list)
  }

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 } as ColumnOptions) {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            ArcSwiper(this.arcSwiperController) {
              // LazyForEach(this.data, (item: int) => {
              //   Text(item.toString())
              //     .width('90%')
              //     .height('90%')
              //     .backgroundColor(Color.Red)
              //     .textAlign(TextAlign.Center)
              //     .fontSize(30)
              // }, (item: int) => item!.toString())
            }
            .key('arcSwiperTest001')
            .index(-1)
            .effectMode(EdgeEffect.Spring)
            .digitalCrownSensitivity(CrownSensitivity.LOW)
            .indicator(new ArcDotIndicator()
              .arcDirection(ArcDirection.THREE_CLOCK_DIRECTION)
              .itemColor(Color.Red)
              .selectedItemColor(Color.Red)
              .backgroundColor(Color.Red)
            )
          }
        }
      }
    }
  }
}
