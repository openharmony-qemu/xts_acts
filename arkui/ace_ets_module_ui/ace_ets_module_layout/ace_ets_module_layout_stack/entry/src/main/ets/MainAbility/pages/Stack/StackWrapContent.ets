/*
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

import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct StackWrapContent1 {
  @State width1: number = 50
  @State height1: number = 50
  build() {
    Column(){
      Column({space:3}) {
        Stack() {
          Flex().width(this.width1).height(this.height1)
        }
        .id('StackWrapContent1')
        .backgroundColor(Color.Blue)
        .width(LayoutPolicy.wrapContent)
        .height(LayoutPolicy.wrapContent)

        Row() {
          Button('160_120').onClick(() => {
            this.width1 = 160
            this.height1 = 120
          }).id('StackButton1').height(20).width(80)
        }
      }.width(150).height(100)
    }.width('100%').height('100%')
  }
}