/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Component,
  Column,
  Row,
  Text,
  Button,
  Stack,
  Color,
  Margin,
  ClickEvent,
  FlexAlign,
  IDataSource,
  DataChangeListener
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

class MyDataSource implements IDataSource<Color> {
  private list: Color[] = []

  constructor(list: Color[]) {
    this.list = list
  }

  totalCount(): int {
    return this.list.length
  }

  getData(index: int): Color {
    return this.list[index.toInt()]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
  }
}

@Entry
@Component
struct arcDirectionSwiperTest {
  @State itemSimpleColor: Color | number | string = Color.Gray
  @State selectedItemSimpleColor: Color | number | string = Color.Green
  private data: MyDataSource = new MyDataSource([])
  @State backgroundColors: Color[] = [
    Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Orange, Color.Transparent]

  aboutToAppear(): void {
    let list: number[] = new Array<number>()
    for (let i = 1; i <= 6; i++) {
      list.push(i);
    }
    this.data = new MyDataSource(this.backgroundColors)
  }

  build() {
    Column() {
      Row() {
        Button('ArcDirection3').id('arcs_arcDirection_3')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.itemSimpleColor = 0xFF0000FF
            this.selectedItemSimpleColor = 0xFFFF00
          })
        Button('ArcDirection9').id('arcs_arcDirection_9')
          .height('8%')
          .onClick((e: ClickEvent) => {
            this.itemSimpleColor = '#FFEC8B'
            this.selectedItemSimpleColor = '#FFFF0000'
          })
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly)


    }.height('100%')
  }
}