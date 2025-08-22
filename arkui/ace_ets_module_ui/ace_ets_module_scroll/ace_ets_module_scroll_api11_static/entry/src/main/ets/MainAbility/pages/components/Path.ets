/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
  Entry,
  Component,
  Column,
  Flex,

  Visibility,
  Button,
  Text,
  Marquee,
  ClickEvent,
  FontWeight,
  Color,
  Path,
  ColumnOptions,
  Margin,
  FlexAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct PathExample {
  onPageShow() {
    console.info('path page show called');
  }

  onBuildDone() {
    console.info('path page build done called');
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('Straight line').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Path()
        .width(300)
        .height(10)
        .stroke(Color.Black)
        .strokeWidth(3)
        .key('path')

      Text('Straight line graph').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Path().width(100).height(100)
        
        Path().width(100).height(100)
        
        Path().width(100).height(100)
        
      }.width('100%')

      Text('Curve graphics').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Path().width(100).height(100)
        
        Path().width(100).height(100)
        
      }
    }.width('100%').margin({ top: 5 } as Margin)
  }
}
