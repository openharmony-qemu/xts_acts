/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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
import Utils from '../../test/Utils.test';

const EVENT_KEY = 209100;

@Entry
@Component
struct RichTextDynamicPage {
  @State cmd: string = '';
  @State isReceive: number = -1;
  @State html: string = '<p>dynamic-rich-text</p>';

  onPageShow() {
    events_emitter.on({ eventId: EVENT_KEY, priority: events_emitter.EventPriority.LOW }, (ev) => {
      if (ev?.data?.ACTION != null) {
        this.cmd = ev.data.ACTION as string;
        this.isReceive = 1;
      }
    });
  }

  build() {
    Column() {
      Button('RichTextDynamic').id('RichTextDynamicBtn').onClick(async () => {
        await Utils.waitForExist(() => this.isReceive, 'RichTextDynamicReceive', 1, 3000);
        this.isReceive = -1;
        if (this.cmd === 'richTextConstructor') {
          Utils.emitEvent(this.html.length > 0, 209110);
        }
      })
      RichText(this.html)
        .onComplete(() => { console.info('RichText complete'); })
    }.width('100%').height('100%')
  }
}
