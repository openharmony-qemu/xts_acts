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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct SafeAreaInsetNormal_1 {
  @Builder
  EdgeText30x10(label: string, idStr: string) {
    Text(label)
      .width(30)
      .height(10)
      .fontSize(8)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id(idStr)
  }

  @Builder
  EdgeText12x30(label: string, idStr: string) {
    Text(label)
      .fontSize(8)
      .width(12)
      .height(30)
      .textAlign(TextAlign.Center)
      .backgroundColor('#FFF3E0')
      .id(idStr)
  }

  @Builder
  BottomText20x15(idStr: string) {
    Text('20x15')
      .fontSize(8)
      .width(20)
      .height(15)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id(idStr)
  }

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('n1 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n1Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.BottomText20x15('SafeAreaInsetNormal_n1Bottom'); },
          spacing: LengthMetrics.vp(4)
        }
      })
      .id('SafeAreaInsetNormal_n1Host')

      Stack() {
        Text('n2 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n2Main')
      }
      .width(100)
      .height(90)
      .padding(5)
      .direction(Direction.Ltr)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: {
          content: () => { this.EdgeText30x10('Top', 'SafeAreaInsetNormal_n2Top'); },
          alignment: SafeAreaInsetAlignment.START
        },
        end: {
          content: () => { this.EdgeText12x30('End', 'SafeAreaInsetNormal_n2End'); },
          alignment: SafeAreaInsetAlignment.CENTER
        },
        bottom: {
          content: () => { this.EdgeText30x10('Bot', 'SafeAreaInsetNormal_n2Bottom'); },
          alignment: SafeAreaInsetAlignment.END
        },
        start: {
          content: () => { this.EdgeText12x30('Sta', 'SafeAreaInsetNormal_n2Start'); },
          alignment: SafeAreaInsetAlignment.CENTER
        }
      })
      .id('SafeAreaInsetNormal_n2Host')
    }
    .width('80%')
    .height('80%')
  }
}
