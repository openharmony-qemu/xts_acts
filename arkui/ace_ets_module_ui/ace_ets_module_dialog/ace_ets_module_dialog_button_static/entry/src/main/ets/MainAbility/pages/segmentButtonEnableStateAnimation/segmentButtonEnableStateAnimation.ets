/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { Column, ColumnOptions, Text, Entry, Component } from '@ohos.arkui.component';
import { TabSegmentButtonV2, SegmentButtonV2Items } from '@ohos.arkui.advanced.SegmentButtonV2';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SegmentButtonEnableStateAnimation {
  private tabSel: Int = 0;

  aboutToAppear(): void {
    AppStorage.setOrCreate<boolean>('segV1_mounted', true);
  }

  build() {
    Column({ space: 8 } as ColumnOptions) {
      Text('@ohos.arkui.advanced.SegmentButton enableStateAnimation')
        .fontSize(11)
        .width('100%')
        .height('10%')
        .id('segV1_title');
      TabSegmentButtonV2({
        items: new SegmentButtonV2Items([{ text: 'T1' }, { text: 'T2' }]),
        selectedIndex: this.tabSel,
        enableStateAnimation: true,
      })
        .id('segV1_body')
        .width('100%')
        .height('10%');
    }
    .width('100%')
    .height('100%')
    .padding({ left: '2%', right: '2%', top: '1%', bottom: '1%' });
  }
}
