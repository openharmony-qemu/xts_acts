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
  OperateCheckV2,
  IconTypeV2
} from '@ohos.arkui.advanced.ComposeListItemV2';

@Entry
@ComponentV2
struct ComposeListItemV2InteractionExample {
  @Local toggleValue: boolean = false;
  @Local checkboxValue: boolean = false;
  @Local radioValue: boolean = false;

  aboutToAppear(): void {
    console.info('ComposeListItemV2InteractionExample aboutToAppear');
  }

  build(): void {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Text('Interaction Test')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Action Icon' }),
          operateItemV2: new OperateItemV2({
            icon: new OperateIconV2({
              value: $r('sys.media.ohos_ic_public_more'),
              action: (): void => {
                this.getUIContext().getPromptAction().showToast({ message: 'Icon clicked' });
              }
            })
          })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Toggle Callback' }),
          operateItemV2: new OperateItemV2({
            toggle: new OperateCheckV2({
              isCheck: this.toggleValue,
              onChange: (value: boolean): void => {
                this.toggleValue = value;
                this.getUIContext().getPromptAction().showToast({ message: `Toggle: ${value}` });
              }
            })
          })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Checkbox Callback' }),
          operateItemV2: new OperateItemV2({
            checkbox: new OperateCheckV2({
              isCheck: this.checkboxValue,
              onChange: (value: boolean): void => {
                this.checkboxValue = value;
                this.getUIContext().getPromptAction().showToast({ message: `Checkbox: ${value}` });
              }
            })
          })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Radio Callback' }),
          operateItemV2: new OperateItemV2({
            radio: new OperateCheckV2({
              isCheck: this.radioValue,
              onChange: (value: boolean): void => {
                this.radioValue = value;
                this.getUIContext().getPromptAction().showToast({ message: `Radio: ${value}` });
              }
            })
          })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Ac Indicator' }),
          operateItemV2: new OperateItemV2({
            icon: new OperateIconV2({
              value: $r('sys.media.ohos_ic_public_more'),
              accessibilityText: 'More options',
              accessibilityDescription: 'Click to show more options',
              accessibilityLevel: 'important'
            })
          })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Ac Test' }),
          operateItemV2: new OperateItemV2({
            checkbox: new OperateCheckV2({
              isCheck: false,
              accessibilityText: 'Checkbox option',
              accessibilityDescription: 'Check this option',
              accessibilityLevel: 'important'
            })
          })
        });
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}