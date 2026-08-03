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
  OperateIconV2Options, OperateCheckV2Options, OperateButtonV2Options, OperateItemV2Options, ContentItemV2Options
} from '@ohos.arkui.advanced.ComposeListItemV2';
import { SymbolGlyphModifier } from '@kit.ArkUI'

@Entry
@ComponentV2
struct ComposeListItemV2Page02 {
  @Local isToggleChecked: boolean = false;
  @Local isCheckboxChecked: boolean = false;
  @Local isRadioChecked: boolean = false;

  @Local iconOptions:OperateIconV2Options = {
    value: 'icon',
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
    action: () => {
      this.getUIContext().getPromptAction().showToast({ message: 'clicked' });
    },
    accessibilityDescription: '描述',
    accessibilityLevel: 'auto',
    accessibilityText: '文本',
  }
  @Local icon:OperateIconV2 = new OperateIconV2(this.iconOptions)

  @Local radioOptions:OperateCheckV2Options = {
    isCheck: false,
    onChange: ()=>{
      this.getUIContext().getPromptAction().showToast({ message: 'radio1 is changed' });
    },
    accessibilityText: '这是一个单选框',
    accessibilityLevel: 'yes',
    accessibilityDescription: '单指双击即可选中',
  }
  @Local radio:OperateCheckV2 = new OperateCheckV2(this.radioOptions)

  @Local buttonV2Options:OperateButtonV2Options = {
    text: 'button2',
    accessibilityDescription: '描述',
    accessibilityLevel: 'yes',
    accessibilityText: '文本',
  }
  @Local button:OperateButtonV2 = new OperateButtonV2(this.buttonV2Options)

  @Local contentItemV2Options:ContentItemV2Options = {
    iconStyle: IconTypeV2.NORMAL_ICON,
    icon: $r('sys.symbol.phone'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Blue]),
    primaryText: '',
    secondaryText: 'operate image',
    description: ''
  }
  @Local contentItemV2_03: ContentItemV2 = new ContentItemV2(this.contentItemV2Options);

  build() {
    Column() {
      Scroll() {
        Column() {
          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.NORMAL_ICON,
              icon: $r('sys.symbol.phone'),
              primaryText: '',
              secondaryText: 'operate arrow text',
              description: 'iconStyle NORMAL_ICON',
            }),
            operateItemV2: new OperateItemV2({
              text: 'arrow文本',
              arrow: new OperateIconV2({
                value: $r('sys.symbol.chevron_right'),
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
                action: () => {
                  this.getUIContext().getPromptAction().showToast({ message: 'arrow is click' });
                },
                accessibilityDescription: '描述',
                accessibilityLevel: 'yes',
                accessibilityText: '文本',
              })
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              iconStyle: IconTypeV2.APP_ICON,
              icon: $r('sys.symbol.phone'),
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
              primaryText: '',
              secondaryText: 'operate icon subIcon',
              description: 'iconStyle NORMAL_ICON',
            }),
            operateItemV2: new OperateItemV2({
              icon: this.icon,
              subIcon: new OperateIconV2({
                value: 'icon',
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
                action: () => {
                  this.getUIContext().getPromptAction().showToast({ message: 'clicked' });
                },
                accessibilityDescription: '描述',
                accessibilityLevel: 'auto',
                accessibilityText: '文本',
              })
            })
          })

          ComposeListItemV2({
            contentItemV2: this.contentItemV2_03,
            operateItemV2: new OperateItemV2({
              text: 'image',
              image: $r('sys.media.ohos_app_icon'),
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              icon: $r('sys.symbol.phone'),
              iconStyle: IconTypeV2.VERTICAL,
              primaryText: '',
              secondaryText: 'operate button'
            }),
            operateItemV2: new OperateItemV2({
              button: this.button
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              icon: $r('sys.symbol.phone'),
              iconStyle: IconTypeV2.BADGE,
              primaryText: '',
              secondaryText: 'operate checkbox'
            }),
            operateItemV2: new OperateItemV2({
              checkbox: new OperateCheckV2({
                isCheck: false,
                onChange: ()=>{
                  this.getUIContext().getPromptAction().showToast({ message: 'checkbox is changed' });
                },
                accessibilityText: '这是一个复选框',
                accessibilityLevel: 'yes',
                accessibilityDescription: '单指双击即可选中',
              })
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              icon: $r('sys.symbol.phone'),
              iconStyle: IconTypeV2.HEAD_SCULPTURE,
              primaryText: '',
              secondaryText: 'operate radio 1'
            }),
            operateItemV2: new OperateItemV2({
              radio: this.radio
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              icon: $r('sys.symbol.phone'),
              iconStyle: IconTypeV2.SYSTEM_ICON,
              primaryText: '',
              secondaryText: 'operate radio 2'
            }),
            operateItemV2: new OperateItemV2({
              radio: new OperateCheckV2({
                isCheck: true,
                onChange: ()=>{
                  this.getUIContext().getPromptAction().showToast({ message: 'radio2 is changed' });
                },
                accessibilityText: '这是一个单选框',
                accessibilityLevel: 'yes',
                accessibilityDescription: '单指双击即可选中',
              })
            })
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              icon: $r('sys.symbol.phone'),
              primaryText: '',
              secondaryText: 'operate toggle'
            }),
            operateItemV2: new OperateItemV2({
              toggle: new OperateCheckV2({
                isCheck: true,
                onChange: ()=>{
                  this.getUIContext().getPromptAction().showToast({ message: 'toggle is changed' });
                },
                accessibilityText: 'toggle',
                accessibilityLevel: 'auto',
                accessibilityDescription: '单指双击即可选中',
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