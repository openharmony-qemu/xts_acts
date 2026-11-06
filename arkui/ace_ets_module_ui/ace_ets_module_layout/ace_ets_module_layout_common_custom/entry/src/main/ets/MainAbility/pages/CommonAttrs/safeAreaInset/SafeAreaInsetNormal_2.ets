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
struct SafeAreaInsetNormal_2 {
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

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('n3 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n3StartEndMain')
      }
      .width(100)
      .height(90)
      .padding(5)
      .direction(Direction.Ltr)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: {
          content: () => { this.EdgeText30x10('Top', 'SafeAreaInsetNormal_n3StartTop'); },
          alignment: SafeAreaInsetAlignment.START
        },
        bottom: {
          content: () => { this.EdgeText30x10('Bot', 'SafeAreaInsetNormal_n3EndBottom'); },
          alignment: SafeAreaInsetAlignment.END
        }
      })
      .id('SafeAreaInsetNormal_n3StartEndHost')

      Stack() {
        Text('n3 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n3CenterMain')
      }
      .width(100)
      .height(90)
      .padding(5)
      .direction(Direction.Ltr)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: {
          content: () => { this.EdgeText30x10('Top', 'SafeAreaInsetNormal_n3CenterTop'); },
          alignment: SafeAreaInsetAlignment.CENTER
        },
        bottom: {
          content: () => { this.EdgeText30x10('Bot', 'SafeAreaInsetNormal_n3DefaultBottom'); }
        }
      })
      .id('SafeAreaInsetNormal_n3CenterHost')
    }
    .width('80%')
    .height('80%')
  }
}
