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
  Direction,
  FlexAlign,
  SafeAreaInsetAlignment,
  SafeAreaInsetOptions,
  ColumnOptions,
  LengthMetrics
} from '@kit.ArkUI';

@Entry
@Component
struct SafeAreaInsetStatic_1 {
  @Builder
  n1BottomContent() {
    Text('20x15')
      .fontSize(8)
      .width(20)
      .height(15)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_n1Bottom')
  }

  @Builder
  n2TopContent() {
    Text('Top')
      .fontSize(8)
      .width(30)
      .height(10)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id('SafeAreaInsetStatic_n2Top')
  }

  @Builder
  n2EndContent() {
    Text('End')
      .fontSize(8)
      .width(12)
      .height(30)
      .textAlign(TextAlign.Center)
      .backgroundColor('#FFF3E0')
      .id('SafeAreaInsetStatic_n2End')
  }

  @Builder
  n2BottomContent() {
    Text('Bot')
      .fontSize(8)
      .width(30)
      .height(10)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id('SafeAreaInsetStatic_n2Bottom')
  }

  @Builder
  n2StartContent() {
    Text('Sta')
      .fontSize(8)
      .width(12)
      .height(30)
      .textAlign(TextAlign.Center)
      .backgroundColor('#FFF3E0')
      .id('SafeAreaInsetStatic_n2Start')
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Stack() {
        Text('n1 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_n1Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .direction(Direction.Ltr)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.n1BottomContent(); },
          spacing: LengthMetrics.vp(4)
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_n1Host')

      Stack() {
        Text('n2 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_n2Main')
      }
      .width(100)
      .height(90)
      .padding(5)
      .direction(Direction.Ltr)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: {
          content: () => { this.n2TopContent(); },
          alignment: SafeAreaInsetAlignment.START
        },
        end: {
          content: () => { this.n2EndContent(); },
          alignment: SafeAreaInsetAlignment.CENTER
        },
        bottom: {
          content: () => { this.n2BottomContent(); },
          alignment: SafeAreaInsetAlignment.END
        },
        start: {
          content: () => { this.n2StartContent(); },
          alignment: SafeAreaInsetAlignment.CENTER
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_n2Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
