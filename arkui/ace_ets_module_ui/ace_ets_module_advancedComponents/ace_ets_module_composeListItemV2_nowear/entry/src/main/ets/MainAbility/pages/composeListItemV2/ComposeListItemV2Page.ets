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

import { ComposeListItemV2, ContentItemV2, OperateItemV2, OperateIconV2, OperateButtonV2, OperateCheckV2, IconTypeV2 } from '@ohos.arkui.advanced.ComposeListItemV2';

@Entry
@ComponentV2
struct ComposeListItemV2Page {
  @Local isToggleChecked: boolean = false;
  @Local isCheckboxChecked: boolean = false;
  @Local isRadioChecked: boolean = false;

  build() {
    Column() {
      Scroll() {
        Column() {
          Text('ComposeListItemV2 Basic Test')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: 'Basic Item',
              secondaryText: 'Secondary Text'
            })
          })

          Text('ComposeListItemV2 with IconStyle')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.NORMAL_ICON,
              icon: $r('sys.symbol.computer'),
              primaryText: 'Item with Icon',
              secondaryText: 'Icon Type: NORMAL_ICON'
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.BADGE,
              icon: 'Badge',
              primaryText: 'Item with Badge',
              secondaryText: 'Icon Type: BADGE'
            })
          })

          Text('ComposeListItemV2 with OperateItem')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.NORMAL_ICON,
              icon: $r('sys.symbol.phone'),
              primaryText: 'Item with Arrow',
              secondaryText: 'Operate: Arrow'
            }),
            operateItemV2: new OperateItemV2({
              arrow: new OperateIconV2({
                value: $r('sys.symbol.chevron_right')
              })
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.NORMAL_ICON,
              icon: $r('sys.symbol.ai_edit'),
              primaryText: 'Item with Toggle',
              secondaryText: 'Operate: Toggle'
            }),
            operateItemV2: new OperateItemV2({
              toggle: new OperateCheckV2({
                isCheck: this.isToggleChecked,
                onChange: (value: boolean) => {
                  this.isToggleChecked = value;
                }
              })
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.NORMAL_ICON,
              icon: $r('sys.symbol.checkmark'),
              primaryText: 'Item with Checkbox',
              secondaryText: 'Operate: Checkbox'
            }),
            operateItemV2: new OperateItemV2({
              checkbox: new OperateCheckV2({
                isCheck: this.isCheckboxChecked,
                onChange: (value: boolean) => {
                  this.isCheckboxChecked = value;
                }
              })
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.NORMAL_ICON,
              icon: $r('sys.symbol.circle'),
              primaryText: 'Item with Radio',
              secondaryText: 'Operate: Radio'
            }),
            operateItemV2: new OperateItemV2({
              radio: new OperateCheckV2({
                isCheck: this.isRadioChecked,
                onChange: (value: boolean) => {
                  this.isRadioChecked = value;
                }
              })
            })
          })



        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
      }
    }
    .width('100%')
    .height('100%')
  }
}