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
struct SafeAreaInsetNullUndefined_2 {
  @State u5Mode: number = 0;

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
  BottomText50x12(idStr: string) {
    Text('50x12')
      .fontSize(8)
      .width(50)
      .height(12)
      .textAlign(TextAlign.Center)
      .backgroundColor('#E8F5E9')
      .id(idStr)
  }

  private u5Callback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.u5Mode = eventData.data?.mode;
    }
  }

  onPageShow() {
    let u5Event: events_emitter.InnerEvent = {
      eventId: 60321,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(u5Event, this.u5Callback);
  }

  aboutToDisappear() {
    events_emitter.off(60321);
  }

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('u5 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNullUndefined_u5Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset(this.u5Mode === 5 ? undefined : this.u5Mode === 6 ? null : {
        top: this.u5Mode === 2 ? undefined : this.u5Mode === 4 ? null : {
          content: () => { this.TopText60x10('SafeAreaInsetNullUndefined_u5Top'); },
          spacing: LengthMetrics.vp(2)
        },
        bottom: this.u5Mode === 1 ? undefined : this.u5Mode === 3 || this.u5Mode === 4 ? null : {
          content: () => { this.BottomText60x12('SafeAreaInsetNullUndefined_u5Bottom'); },
          spacing: LengthMetrics.vp(3)
        }
      })
      .id('SafeAreaInsetNullUndefined_u5Host')

      Stack() {
        Text('u6a main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNullUndefined_u6aMain')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: () => { this.BottomText50x12('SafeAreaInsetNullUndefined_u6aBottom'); },
          spacing: undefined
        }
      })
      .id('SafeAreaInsetNullUndefined_u6aHost')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
