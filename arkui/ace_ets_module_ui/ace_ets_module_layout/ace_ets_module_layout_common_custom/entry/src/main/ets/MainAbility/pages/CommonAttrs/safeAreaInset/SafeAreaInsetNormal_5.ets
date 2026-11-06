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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct SafeAreaInsetNormal_5 {
  @State useRtl: boolean = false;

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

  private n9Callback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.useRtl = eventData.data?.rtl;
    }
  }

  onPageShow() {
    let n9Event: events_emitter.InnerEvent = {
      eventId: 60303,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(n9Event, this.n9Callback);
  }

  aboutToDisappear() {
    events_emitter.off(60303);
  }

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('n8 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n8Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaPadding({ bottom: LengthMetrics.vp(20) })
      .safeAreaInset({
        bottom: {
          content: () => { this.BottomText20x15('SafeAreaInsetNormal_n8Bottom'); },
          spacing: LengthMetrics.vp(4)
        }
      })
      .id('SafeAreaInsetNormal_n8Host')

      Stack() {
        Text('n9 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n9Main')
      }
      .width(100)
      .height(90)
      .padding(5)
      .direction(this.useRtl ? Direction.Rtl : Direction.Ltr)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        top: {
          content: () => { this.EdgeText30x10('Top', 'SafeAreaInsetNormal_n9Top'); },
          alignment: SafeAreaInsetAlignment.START
        },
        end: {
          content: () => { this.EdgeText12x30('End', 'SafeAreaInsetNormal_n9End'); },
          alignment: SafeAreaInsetAlignment.CENTER
        },
        bottom: {
          content: () => { this.EdgeText30x10('Bot', 'SafeAreaInsetNormal_n9Bottom'); },
          alignment: SafeAreaInsetAlignment.END
        },
        start: {
          content: () => { this.EdgeText12x30('Sta', 'SafeAreaInsetNormal_n9Start'); },
          alignment: SafeAreaInsetAlignment.CENTER
        }
      })
      .id('SafeAreaInsetNormal_n9Host')
    }
    .width('80%')
    .height('80%')
  }
}
