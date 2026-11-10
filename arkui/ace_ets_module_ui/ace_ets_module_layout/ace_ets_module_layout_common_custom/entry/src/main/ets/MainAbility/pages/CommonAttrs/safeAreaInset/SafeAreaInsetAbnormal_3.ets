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
struct SafeAreaInsetAbnormal_3 {
  @State a9Mode: number = 0;
  @State a9Opt: SafeAreaInsetOptions | null | undefined = undefined;

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

  private a9Callback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.a9Opt = eventData.data?.opt;
      this.a9Mode = 1;
    }
  }

  onPageShow() {
    let a9Event: events_emitter.InnerEvent = {
      eventId: 60312,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(a9Event, this.a9Callback);
  }

  aboutToDisappear() {
    events_emitter.off(60312);
  }

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('a8 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetAbnormal_a8Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset({
        bottom: {
          content: (): void => {
          }
        }
      })
      .id('SafeAreaInsetAbnormal_a8Host')

      Stack() {
        Text('a9 main')
          .width(60)
          .height(30)
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetAbnormal_a9Main')
      }
      .width(100)
      .height(LayoutPolicy.wrapContent)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset(this.a9Mode === 0 ? {
        top: {
          content: () => { this.TopText60x10('SafeAreaInsetAbnormal_a9Top'); },
          spacing: LengthMetrics.vp(2)
        },
        bottom: {
          content: () => { this.BottomText60x12('SafeAreaInsetAbnormal_a9Bottom'); },
          spacing: LengthMetrics.vp(3)
        }
      } : this.a9Opt)
      .id('SafeAreaInsetAbnormal_a9Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
