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
  State
} from '@kit.ArkUI';

@Entry
@Component
struct SafeAreaInsetStatic_7 {
  @State r5BottomCleared: boolean = false;

  private cfg(): SafeAreaInsetOptions | undefined {
    if (this.r5BottomCleared) {
      return {
        top: {
          content: () => { this.r5TopContent(); },
          spacing: LengthMetrics.vp(2)
        },
        bottom: undefined
      }
    } else {
      return {
        top: {
          content: () => { this.r5TopContent(); },
          spacing: LengthMetrics.vp(2)
        },
        bottom: {
          content: () => { this.r5BottomContent(); },
          spacing: LengthMetrics.vp(3)
        }
      }
    }
  }

  @Builder
  r4TopContent() {
    Text('top 10')
      .fontSize(8)
      .width(60)
      .height(10)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id('SafeAreaInsetStatic_r4Top')
  }

  @Builder
  r5TopContent() {
    Text('top 10')
      .fontSize(8)
      .width(60)
      .height(10)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id('SafeAreaInsetStatic_r5Top')
  }

  @Builder
  r5BottomContent() {
    Text('bot 12')
      .fontSize(8)
      .width(60)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id('SafeAreaInsetStatic_r5Bottom')
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Stack() {
        Text('r4 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_r4Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: {
          content: () => { this.r4TopContent(); },
          spacing: LengthMetrics.vp(2)
        },
        bottom: {
          content: (): void => {
          },
          spacing: LengthMetrics.vp(3)
        }
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_r4Host')

      Button('r5 toggle')
        .fontSize(10)
        .height(24)
        .id('SafeAreaInsetStatic_r5Toggle')
        .onClick(() => {
          this.r5BottomCleared = !this.r5BottomCleared;
        })

      Stack() {
        Text('r5 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_r5Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset(this.cfg())
      .id('SafeAreaInsetStatic_r5Host')

      Stack() {
        Text('r6 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetStatic_r6Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: undefined,
        end: undefined,
        bottom: undefined,
        start: undefined
      } as SafeAreaInsetOptions)
      .id('SafeAreaInsetStatic_r6Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
