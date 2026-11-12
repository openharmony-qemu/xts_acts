'use static';
/**
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

import {
  Entry,
  Component,
  Builder,
  Column,
  Stack,
  Text,
  TextAlign,
  FlexAlign,
  Button,
  SafeAreaInsetOptions,
  ColumnOptions,
  LengthMetrics,
  LayoutPolicy,
  LocalizedPadding,
  State
} from '@kit.ArkUI';

@Entry
@Component
struct SafeAreaInsetStatic6 {
  @State r2Reset: boolean = false;

  @Builder
  n7bBottomContent() {
    Text('50x12')
      .fontSize(8)
      .width(50)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_n7bBottom')
  }

  @Builder
  r2BottomContent() {
    Text('50x12')
      .fontSize(8)
      .width(50)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_r2Bottom')
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Stack() {
        Text('n7b main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_n7bMain')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaPadding({ bottom: LengthMetrics.vp(20) } as LocalizedPadding)
      .safeAreaInset({
        bottom: {
          content: () => { this.n7bBottomContent(); },
          spacing: LengthMetrics.vp(3)
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_n7bHost')

      Button('r2 toggle')
        .fontSize(10)
        .height(24)
        .id('SafeAreaInsetStatic_r2Toggle')
        .onClick(() => {
          this.r2Reset = !this.r2Reset;
        })

      Stack() {
        Text('r2 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_r2Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset(this.r2Reset ? undefined : {
        bottom: {
          content: () => { this.r2BottomContent(); },
          spacing: LengthMetrics.vp(3)
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_r2Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
