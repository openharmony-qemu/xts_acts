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
  State
} from '@kit.ArkUI';

@Entry
@Component
struct SafeAreaInsetStatic7 {
  @State r3Reset: boolean = false;

  @Builder
  r3BottomContent() {
    Text('50x12')
      .fontSize(8)
      .width(50)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_r3Bottom')
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Button('r3 toggle')
        .fontSize(10)
        .height(24)
        .id('SafeAreaInsetStatic_r3Toggle')
        .onClick(() => {
          this.r3Reset = !this.r3Reset;
        })

      Stack() {
        Text('r3 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_r3Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset(this.r3Reset ? {} as SafeAreaInsetOptions : {
        bottom: {
          content: () => { this.r3BottomContent(); },
          spacing: LengthMetrics.vp(3)
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_r3Host')

      Stack() {
        Text('r1 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_r1Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .id('SafeAreaInsetStatic_r1Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
