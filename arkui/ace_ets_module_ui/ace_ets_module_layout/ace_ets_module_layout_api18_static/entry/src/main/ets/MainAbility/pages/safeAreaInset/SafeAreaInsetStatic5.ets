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
  SafeAreaInsetOptions,
  ColumnOptions,
  LengthMetrics,
  LayoutPolicy,
  LocalizedPadding
} from '@kit.ArkUI';

@Entry
@Component
struct SafeAreaInsetStatic5 {
  @Builder
  n5BottomContent() {
    Text('50x12')
      .fontSize(8)
      .width(50)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_n5Bottom')
  }

  @Builder
  n6BottomContent() {
    Text('mar2')
      .fontSize(8)
      .width(50)
      .height(12)
      .margin(2)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_n6Bottom')
  }

  @Builder
  n7aBottomContent() {
    Text('50x12')
      .fontSize(8)
      .width(50)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_n7aBottom')
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Stack() {
        Text('n5 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_n5Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.n5BottomContent(); }
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_n5Host')

      Stack() {
        Text('n6 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_n6Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.n6BottomContent(); },
          spacing: LengthMetrics.vp(3)
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_n6Host')

      Stack() {
        Text('n7a main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_n7aMain')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaPadding({ bottom: LengthMetrics.vp(8) } as LocalizedPadding)
      .safeAreaInset({
        bottom: {
          content: () => { this.n7aBottomContent(); },
          spacing: LengthMetrics.vp(3)
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_n7aHost')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
