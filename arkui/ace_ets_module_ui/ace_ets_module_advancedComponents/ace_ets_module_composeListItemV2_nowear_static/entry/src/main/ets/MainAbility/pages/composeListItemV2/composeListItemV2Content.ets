'use static';
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

import { Entry, ComponentV2, $r, Column, Scroll, Text, FontWeight, Local, ColumnOptions } from '@kit.ArkUI';
import {
  ComposeListItemV2,
  ContentItemV2, ContentItemV2Options,
  OperateItemV2,
  IconTypeV2
} from '@ohos.arkui.advanced.ComposeListItemV2';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct ComposeListItemV2ContentExample {
  @Local contentItem1: ContentItemV2 = new ContentItemV2({ primaryText: 'Primary Text' });
  @Local contentItem2: ContentItemV2 = new ContentItemV2({
    primaryText: 'Primary Text',
    secondaryText: 'Secondary Text'
  });
  @Local contentItem3: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.NORMAL_ICON,
    primaryText: 'Primary Text with Icon'
  });

  @Local contentItem4Options:ContentItemV2Options = {
    icon: $r('sys.media.ohos_ic_public_voice'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')),
    iconStyle: IconTypeV2.NORMAL_ICON,
    primaryText: 'Primary Text',
    description: 'Description Text',
    secondaryText: 'Secondary Text',
  }

  @Local contentItem4: ContentItemV2 = new ContentItemV2(this.contentItem4Options);

  @Local contentItem5: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')),
    iconStyle: IconTypeV2.NORMAL_ICON,
    primaryText: 'Full Content',
    secondaryText: 'Secondary',
    description: 'Description'
  });

  aboutToAppear(): void {
    console.info('ComposeListItemV2ContentExample aboutToAppear');
  }

  build(): void {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Text('ContentItemV2 Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        ComposeListItemV2({contentItemV2: this.contentItem1 });

        ComposeListItemV2({ contentItemV2: this.contentItem2 });

        ComposeListItemV2({ contentItemV2: this.contentItem3 });

        ComposeListItemV2({ contentItemV2: this.contentItem4 });

        ComposeListItemV2({ contentItemV2: this.contentItem5 });
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}