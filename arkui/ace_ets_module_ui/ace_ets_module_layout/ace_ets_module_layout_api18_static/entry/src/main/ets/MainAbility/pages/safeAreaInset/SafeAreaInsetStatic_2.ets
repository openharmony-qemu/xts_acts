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
  LengthMetrics,
  LayoutPolicy
} from '@kit.ArkUI';

@Entry
@Component
struct SafeAreaInsetStatic_2 {
  @Builder
  n8TopContent() {
    Text('Top')
      .fontSize(8)
      .width(30)
      .height(10)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id('SafeAreaInsetStatic_n8Top')
  }

  @Builder
  n8EndContent() {
    Text('End')
      .fontSize(8)
      .width(12)
      .height(30)
      .textAlign(TextAlign.Center)
      .backgroundColor('#FFF3E0')
      .id('SafeAreaInsetStatic_n8End')
  }

  @Builder
  n8BottomContent() {
    Text('Bot')
      .fontSize(8)
      .width(30)
      .height(10)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id('SafeAreaInsetStatic_n8Bottom')
  }

  @Builder
  n8StartContent() {
    Text('Sta')
      .fontSize(8)
      .width(12)
      .height(30)
      .textAlign(TextAlign.Center)
      .backgroundColor('#FFF3E0')
      .id('SafeAreaInsetStatic_n8Start')
  }

  @Builder
  n3TopContent() {
    Text('top 10')
      .fontSize(8)
      .width(60)
      .height(10)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id('SafeAreaInsetStatic_n3Top')
  }

  @Builder
  n3BottomContent() {
    Text('bot 12')
      .fontSize(8)
      .width(60)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_n3Bottom')
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Stack() {
        Text('n8 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_n8Main')
      }
      .width(100)
      .height(90)
      .padding(5)
      .direction(Direction.Rtl)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: {
          content: () => { this.n8TopContent(); },
          alignment: SafeAreaInsetAlignment.START
        },
        end: {
          content: () => { this.n8EndContent(); },
          alignment: SafeAreaInsetAlignment.CENTER
        },
        bottom: {
          content: () => { this.n8BottomContent(); },
          alignment: SafeAreaInsetAlignment.END
        },
        start: {
          content: () => { this.n8StartContent(); },
          alignment: SafeAreaInsetAlignment.CENTER
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_n8Host')

      Stack() {
        Text('n3 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_n3Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: {
          content: () => { this.n3TopContent(); },
          spacing: LengthMetrics.vp(2)
        },
        bottom: {
          content: () => { this.n3BottomContent(); },
          spacing: LengthMetrics.vp(3)
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_n3Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
