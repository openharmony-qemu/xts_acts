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

import { Entry, Column, Component, Button, Scroller, BarState, Scroll, Flex, Alignment, ScrollDirection, EdgeEffect } from '@ohos.arkui.component'
import fs from '@ohos.file.fs';

export const entryName : string = "FloatingBall";
@Entry({routeName: "FloatingBall", useSharedStorage: true})
@Component
struct Index {
  scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        this.SingleAction()
      }
      .padding({
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      })
    }
    .scrollable(ScrollDirection.Vertical)
    .edgeEffect(EdgeEffect.Spring)
    .scrollBar(BarState.Off)
    .height('100%')
    .width('100%')
    .align(Alignment.Top)
    .backgroundColor('#99182431')
  }

  @Builder
  SingleAction() {
    Column() {
      Button('创建')
        .width(100)
        .height(30)
        .onClick(() => {
        })
    }
  }
}