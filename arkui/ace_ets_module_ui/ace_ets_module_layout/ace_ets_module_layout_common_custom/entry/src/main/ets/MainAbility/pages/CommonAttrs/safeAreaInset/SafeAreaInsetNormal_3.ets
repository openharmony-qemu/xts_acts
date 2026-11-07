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
struct SafeAreaInsetNormal_3 {
  @State useLargePadding: boolean = false;
  @State unitCase: number = 0;

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

  private n4Callback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.useLargePadding = eventData.data?.large;
    }
  }

  private n5Callback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.unitCase = eventData.data?.unit;
    }
  }

  onPageShow() {
    let n4Event: events_emitter.InnerEvent = {
      eventId: 60301,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(n4Event, this.n4Callback);

    let n5Event: events_emitter.InnerEvent = {
      eventId: 60304,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(n5Event, this.n5Callback);
  }

  aboutToDisappear() {
    events_emitter.off(60301);
    events_emitter.off(60304);
  }

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('n4 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n4Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaPadding({ bottom: LengthMetrics.vp(this.useLargePadding ? 20 : 8) })
      .safeAreaInset({
        bottom: {
          content: () => { this.BottomText50x12('SafeAreaInsetNormal_n4Bottom'); },
          spacing: LengthMetrics.vp(3)
        }
      })
      .id('SafeAreaInsetNormal_n4Host')

      Stack() {
        Text('n5 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNormal_n5Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.BottomText50x12('SafeAreaInsetNormal_n5Bottom'); },
          spacing: this.unitCase === 0 ? LengthMetrics.vp(3)
            : this.unitCase === 1 ? LengthMetrics.px(3)
            : this.unitCase === 2 ? LengthMetrics.fp(3)
            : this.unitCase === 3 ? LengthMetrics.lpx(3)
            : undefined
        }
      })
      .id('SafeAreaInsetNormal_n5Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
