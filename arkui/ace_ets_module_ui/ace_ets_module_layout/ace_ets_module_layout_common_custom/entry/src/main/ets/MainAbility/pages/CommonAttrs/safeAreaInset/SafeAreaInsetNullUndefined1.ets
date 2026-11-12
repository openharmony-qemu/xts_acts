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

import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct SafeAreaInsetNullUndefined1 {
  @State uMode: number = 0;

  private uModeCallback = (eventData: events_emitter.EventData) => {
    if (eventData != null && eventData.data != null) {
      this.uMode = eventData.data?.mode;
    }
  }

  onPageShow() {
    let uModeEvent: events_emitter.InnerEvent = {
      eventId: 60322,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(uModeEvent, this.uModeCallback);
  }

  aboutToDisappear() {
    events_emitter.off(60322);
  }

  build() {
    Column({ space: 8 }) {
      Stack() {
        Text('u1 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNullUndefined_u1Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .id('SafeAreaInsetNullUndefined_u1Host')

      Stack() {
        Text('u2 main')
          .width('100%')
          .height('100%')
          .fontSize(8)
          .textAlign(TextAlign.Center)
          .backgroundColor('#D1C4E9')
          .id('SafeAreaInsetNullUndefined_u2Main')
      }
      .width(100)
      .height(80)
      .padding(5)
      .backgroundColor('#F5F5F5')
      .safeAreaInset(this.uMode === 0 ? undefined : this.uMode === 1 ? null : { bottom: null })
      .id('SafeAreaInsetNullUndefined_u2Host')
    }
    .width('80%')
    .height('80%')
    .justifyContent(FlexAlign.Center)
  }
}
