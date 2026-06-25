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
  OperateItemV2,
  OperateIconV2,
  OperateButtonV2,
  OperateCheckV2,
  IconTypeV2
} from '@ohos.arkui.advanced.ComposeListItemV2';

@Entry
@ComponentV2
struct ComposeListItemV2OperateExample {
  @Local contentItem: ContentItemV2 = new ContentItemV2({ primaryText: 'Primary Text' });
  @Local operateIcon: OperateIconV2 = new OperateIconV2({
    value: $r('sys.media.ohos_ic_public_more')
  });
  @Local operateButton: OperateButtonV2 = new OperateButtonV2({ text: 'Button' });
  @Local toggle: OperateCheckV2 = new OperateCheckV2({ isCheck: false });
  @Local checkbox: OperateCheckV2 = new OperateCheckV2({ isCheck: false });
  @Local radio: OperateCheckV2 = new OperateCheckV2({ isCheck: false });
  @Local arrow: OperateIconV2 = new OperateIconV2({
    value: $r('sys.media.ohos_ic_public_arrow_right')
  });

  aboutToAppear(): void {
    console.info('ComposeListItemV2OperateExample aboutToAppear');
  }

  build(): void {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Text('OperateItemV2 Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Operate Icon' }),
          operateItemV2: new OperateItemV2({ icon: this.operateIcon })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Button Test' }),
          operateItemV2: new OperateItemV2({ button: this.operateButton })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Toggle Test' }),
          operateItemV2: new OperateItemV2({ toggle: this.toggle })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Checkbox Test' }),
          operateItemV2: new OperateItemV2({ checkbox: this.checkbox })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Radio Test' }),
          operateItemV2: new OperateItemV2({ radio: this.radio })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Arrow Test' }),
          operateItemV2: new OperateItemV2({ arrow: this.arrow })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Operate Text' }),
          operateItemV2: new OperateItemV2({ text: 'Operate Text' })
        });
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}