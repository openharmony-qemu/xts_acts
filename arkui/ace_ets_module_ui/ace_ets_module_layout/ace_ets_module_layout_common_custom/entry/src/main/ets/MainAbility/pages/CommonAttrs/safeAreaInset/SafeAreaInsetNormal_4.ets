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
struct SafeAreaInsetNormal_4 {
  @State replaceCase: number = 0;

  @Builder
  TopText60x10(idStr: string) {
    Text('top 10')
      .fontSize(8)
      .width(60)
      .height(10)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E3F2FD')
      .id(idStr)
  }

  @Builder
  AltTopText60x16(idStr: string) {
    Text('alt 16')
      .fontSize(8)
      .width(60)
      .height(16)
      .textAlign(TextAlign.Center)
      .backgroundColor('#FFF3E0')
      .id(idStr)
  }

  @Builder
  BottomText60x12(idStr: string) {
    Text('bot 12')
      .fontSize(8)
      .width(60)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id(idStr)
  }

  @Builder
  BottomText50x12Margin(idStr: string) {
    Text('mar2')
      .fontSize(8)
      .width(50)
      .height(12)
      .margin(2)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id(idStr)
  }

  private n6Callback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.replaceCase = eventData.data?.mode;
    }
  }

  onPageShow() {
    let n6Event: events_emitter.InnerEvent = {
      eventId: 60302,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(n6Event, this.n6Callback);
  }

  aboutToDisappear() {
    events_emitter.off(60302);
  }

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('n6 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n6Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset(this.replaceCase === 2 ? undefined : {
        top: {
          content: this.replaceCase === 4
            ? () => { this.AltTopText60x16('SafeAreaInsetNormal_n6AltTop'); }
            : () => { this.TopText60x10('SafeAreaInsetNormal_n6Top'); },
          spacing: LengthMetrics.vp(2)
        },
        bottom: this.replaceCase === 1 ? undefined : {
          content: () => { this.BottomText60x12('SafeAreaInsetNormal_n6Bottom'); },
          spacing: LengthMetrics.vp(3)
        }
      })
      .id('SafeAreaInsetNormal_n6Host')

      Stack() {
        Text('n7 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n7Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.BottomText50x12Margin('SafeAreaInsetNormal_n7Bottom'); },
          spacing: LengthMetrics.vp(3)
        }
      })
      .id('SafeAreaInsetNormal_n7Host')
    }
    .width('80%')
    .height('80%')
  }
}
