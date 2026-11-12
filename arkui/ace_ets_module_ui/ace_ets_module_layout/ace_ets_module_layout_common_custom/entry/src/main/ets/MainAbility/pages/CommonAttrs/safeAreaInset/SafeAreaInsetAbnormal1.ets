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
struct SafeAreaInsetAbnormal1 {
  @State aCase: number = 0;
  @State a5Align: SafeAreaInsetAlignment | null | undefined = undefined;

  @Builder
  BottomText50x12(idStr: string) {
    Text('50x12')
      .fontSize(8)
      .width(50)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
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

  private aCaseCallback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.aCase = eventData.data?.acase;
    }
  }

  private a5Callback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.a5Align = eventData.data?.align;
    }
  }

  onPageShow() {
    let aCaseEvent: events_emitter.InnerEvent = {
      eventId: 60314,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(aCaseEvent, this.aCaseCallback);

    let a5Event: events_emitter.InnerEvent = {
      eventId: 60311,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(a5Event, this.a5Callback);
  }

  aboutToDisappear() {
    events_emitter.off(60314);
    events_emitter.off(60311);
  }

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('asp main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetAbnormal_aSpacingMain')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.BottomText50x12('SafeAreaInsetAbnormal_aSpacingBottom'); },
          spacing: this.aCase === 0 ? LengthMetrics.vp(-10)
            : this.aCase === 1 ? LengthMetrics.px(-5)
            : this.aCase === 2 ? LengthMetrics.vp(NaN)
            : LengthMetrics.vp(Number.POSITIVE_INFINITY)
        }
      })
      .id('SafeAreaInsetAbnormal_aSpacingHost')

      Stack() {
        Text('a5 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetAbnormal_a5Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.BottomText20x15('SafeAreaInsetAbnormal_a5Bottom'); },
          spacing: LengthMetrics.vp(4),
          alignment: this.a5Align
        }
      })
      .id('SafeAreaInsetAbnormal_a5Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
