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
  ContentItemV2,
  IconTypeV2
} from '@ohos.arkui.advanced.ComposeListItemV2';

@Entry
@ComponentV2
struct ComposeListItemV2IconTypeExample {
  @Local badgeIcon: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.BADGE,
    primaryText: 'Badge Icon'
  });
  @Local normalIcon: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.NORMAL_ICON,
    primaryText: 'Normal Icon'
  });
  @Local systemIcon: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.SYSTEM_ICON,
    primaryText: 'System Icon'
  });
  @Local headSculpture: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.HEAD_SCULPTURE,
    primaryText: 'Head Sculpture'
  });
  @Local appIcon: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.APP_ICON,
    primaryText: 'App Icon'
  });
  @Local preview: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.PREVIEW,
    primaryText: 'Preview Icon'
  });
  @Local longitudinal: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.LONGITUDINAL,
    primaryText: 'Longitudinal Icon'
  });
  @Local vertical: ContentItemV2 = new ContentItemV2({
    icon: $r('sys.media.ohos_ic_public_voice'),
    iconStyle: IconTypeV2.VERTICAL,
    primaryText: 'Vertical Icon'
  });

  aboutToAppear(): void {
    console.info('ComposeListItemV2IconTypeExample aboutToAppear');
  }

  build(): void {
    Scroll() {
      Column({ space: 10 } as  ColumnOptions) {
        Text('IconTypeV2 Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        ComposeListItemV2({ contentItemV2: this.badgeIcon });

        ComposeListItemV2({ contentItemV2: this.normalIcon });

        ComposeListItemV2({ contentItemV2: this.systemIcon });

        ComposeListItemV2({ contentItemV2: this.headSculpture });

        ComposeListItemV2({ contentItemV2: this.appIcon });

        ComposeListItemV2({ contentItemV2: this.preview });

        ComposeListItemV2({ contentItemV2: this.longitudinal });

        ComposeListItemV2({ contentItemV2: this.vertical });
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}