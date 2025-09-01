/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  Row,
  Text,
  ListItemGroup,
  ListItem,
  Margin,
  Color,
  TextAlign,
  Builder,
  List,
  ForEach
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct constraintSizeListItemGroup3 {
  private conTable3: CONTable3[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    } as CONTable3,
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    } as CONTable3,
    {
      title: '星期三',
      projects: ['历史', '地理', '政治']
    } as CONTable3
  ]

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(10)
  }

  build() {
    Column() {
      List() {
        ForEach(this.conTable3, (item: CONTable3) => {
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
        })
      }
      .width('100%')
      .height('40%')

    }.width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .margin({ top: 5 } as Margin)
  }
}


interface CONTable3 {
  title: string;
  projects: string[];
}