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
struct ComposeListItemV2Page02 {
  @Local isToggleChecked: boolean = false;
  @Local isCheckboxChecked: boolean = false;
  @Local isRadioChecked: boolean = false;

  build() {
    Column() {
      Scroll() {
        Column({ space: 20 }) {
          Text('ComposeListItemV2 with Button')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.NORMAL_ICON,
              icon: $r('sys.symbol.download'),
              primaryText: 'Item with Button',
              secondaryText: 'Operate: Button'
            }),
            operateItemV2: new OperateItemV2({
              button: new OperateButtonV2({
                text: 'Download'
              })
            })
          })

          Text('ComposeListItemV2 with Description')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.HEAD_SCULPTURE,
              icon: $r('sys.symbol.person'),
              primaryText: 'User Profile',
              secondaryText: 'User Name',
              description: 'This is a detailed description of the user profile item'
            })
          })

          Text('ComposeListItemV2 Complete Example')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.PREVIEW,
              icon: $r('sys.symbol.trash'),
              primaryText: 'Complete Item',
              secondaryText: 'All Features',
              description: 'This item demonstrates all available features'
            }),
            operateItemV2: new OperateItemV2({
              icon: new OperateIconV2({
                value: $r('sys.symbol.star'),
                action: () => {
                  console.info('Icon clicked');
                }
              }),
              arrow: new OperateIconV2({
                value: $r('sys.symbol.chevron_right')
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