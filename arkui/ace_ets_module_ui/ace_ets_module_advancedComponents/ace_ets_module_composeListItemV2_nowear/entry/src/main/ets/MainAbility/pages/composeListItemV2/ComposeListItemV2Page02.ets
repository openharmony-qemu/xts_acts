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

import {
  ComposeListItemV2, ContentItemV2, OperateItemV2, OperateIconV2, OperateButtonV2,OperateCheckV2, IconTypeV2,
  OperateIconV2Options
} from '@ohos.arkui.advanced.ComposeListItemV2';
import { SymbolGlyphModifier } from '@kit.ArkUI'

@Entry
@ComponentV2
struct ComposeListItemV2Page02 {
  @Local isToggleChecked: boolean = false;
  @Local isCheckboxChecked: boolean = false;
  @Local isRadioChecked: boolean = false;

  @Local operateIconV2_options:OperateIconV2Options = {
    value: '',
    symbolStyle: undefined,
    action: undefined,
    accessibilityDescription: '',
    accessibilityLevel: '',
    accessibilityText: '',
  }

  build() {
    Column() {
      Scroll() {
        Column({ space: 12 }) {

          Text('ComposeListItemV2 with Button').fontSize(12).fontWeight(FontWeight.Bold).margin({ top: 5 })
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

          Text('ComposeListItemV2 with Description').fontSize(12).fontWeight(FontWeight.Bold).margin({ top: 5 })
          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.HEAD_SCULPTURE,
              icon: $r('sys.symbol.person'),
              primaryText: 'User Profile',
              secondaryText: 'User Name',
              description: 'This is a detailed description of the user profile item'
            })
          })

          Text('ComposeListItemV2 Complete Example').fontSize(12).fontWeight(FontWeight.Bold).margin({ top: 5 })
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

          Text('ComposeListItemV2 OperateItemV2 Example').fontSize(12).fontWeight(FontWeight.Bold).margin({ top: 5 })
          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              icon: $r('sys.symbol.phone'),
              iconStyle: IconTypeV2.LONGITUDINAL,
              primaryText: '',
              secondaryText: 'operate symbolStyle'
            }),
            operateItemV2: new OperateItemV2({
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.wifi_router_fill')).fontColor([Color.Blue]),
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.PREVIEW,
              icon: $r('sys.symbol.phone'),
              primaryText: '',
              secondaryText: 'operate button'
            }),
            operateItemV2: new OperateItemV2({
              button: new OperateButtonV2({
                text: '按钮',
                accessibilityDescription: '描述',
                accessibilityLevel: 'yes',
                accessibilityText: '文本',
              })
            })
          })



        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Auto)
    }
     .width(1320)
     .height(2120)
  }
}