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
  OperateIconV2Options, OperateCheckV2Options, OperateButtonV2Options, OperateItemV2Options
} from '@ohos.arkui.advanced.ComposeListItemV2';
import { SymbolGlyphModifier } from '@kit.ArkUI'

@Entry
@ComponentV2
struct ComposeListItemV2Page02 {


  @Local operateItemOptions01: OperateItemV2Options = {
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
  }
  @Local operateItem01:OperateItemV2 = new OperateItemV2(this.operateItemOptions01)

  @Local operateItemOptions02: OperateItemV2Options = {
    icon: new OperateIconV2({
      value: 'icon',
      symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
      action: () => {
        this.getUIContext().getPromptAction().showToast({ message: 'clicked' });
      },
      accessibilityDescription: '描述',
      accessibilityLevel: 'auto',
      accessibilityText: '文本',
    }),
    subIcon: new OperateIconV2({
      value: 'subIcon',
      symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Red]),
      action: () => {
        this.getUIContext().getPromptAction().showToast({ message: 'clicked' });
      },
      accessibilityDescription: '描述',
      accessibilityLevel: 'auto',
      accessibilityText: '文本',
    })
  }
  @Local operateItem02:OperateItemV2 = new OperateItemV2(this.operateItemOptions02)

  @Local operateItemOptions03: OperateItemV2Options = {
    text: 'image',
    image: $r('sys.media.ohos_app_icon'),
  }
  @Local operateItem03:OperateItemV2 = new OperateItemV2(this.operateItemOptions03)

  @Local operateItemOptions04: OperateItemV2Options = {
    button: new OperateButtonV2({
      text: '按钮',
      accessibilityDescription: '描述',
      accessibilityLevel: 'yes',
      accessibilityText: '文本',
    })
  }
  @Local operateItem04:OperateItemV2 = new OperateItemV2(this.operateItemOptions04)

  @Local operateItemOptions05: OperateItemV2Options = {
    checkbox: new OperateCheckV2({
      isCheck: false,
      onChange: ()=>{
        this.getUIContext().getPromptAction().showToast({ message: 'checkbox is changed' });
      },
      accessibilityText: '这是一个复选框',
      accessibilityLevel: 'yes',
      accessibilityDescription: '单指双击即可选中',
    })
  }
  @Local operateItem05:OperateItemV2 = new OperateItemV2(this.operateItemOptions05)

  @Local operateItemOptions06: OperateItemV2Options = {
    radio: new OperateCheckV2({
      isCheck: true,
      onChange: ()=>{
        this.getUIContext().getPromptAction().showToast({ message: 'radio2 is changed' });
      },
      accessibilityText: '这是一个单选框',
      accessibilityLevel: 'yes',
      accessibilityDescription: '单指双击即可选中',
    })
  }
  @Local operateItem06:OperateItemV2 = new OperateItemV2(this.operateItemOptions06)

  @Local operateItemOptions07: OperateItemV2Options = {
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.wifi_router_fill')).fontColor([Color.Blue]),
  }
  @Local operateItem07:OperateItemV2 = new OperateItemV2(this.operateItemOptions07)

  @Local operateItemOptions08: OperateItemV2Options = {
    toggle: new OperateCheckV2({
      isCheck: true,
      onChange: ()=>{
        this.getUIContext().getPromptAction().showToast({ message: 'toggle is changed' });
      },
      accessibilityText: 'toggle',
      accessibilityLevel: 'auto',
      accessibilityDescription: '单指双击即可选中',
    })
  }
  @Local operateItem08:OperateItemV2 = new OperateItemV2(this.operateItemOptions08)

  build() {
    Column() {
      Scroll() {
        Column() {
          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: '',
              secondaryText: 'operate options arrow text'
            }),
            operateItemV2: this.operateItem01
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: '',
              secondaryText: 'operate options icon subIcon'
            }),
            operateItemV2: this.operateItem02
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: '',
              secondaryText: 'operate options image'
            }),
            operateItemV2: this.operateItemOptions03
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: '',
              secondaryText: 'operate options button'
            }),
            operateItemV2: this.operateItemOptions04
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: '',
              secondaryText: 'operate options checkbox'
            }),
            operateItemV2: this.operateItem05
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: '',
              secondaryText: 'operate options radio'
            }),
            operateItemV2: this.operateItem06
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: '',
              secondaryText: 'operate options symbolStyle'
            }),
            operateItemV2: this.operateItem07
          })

          ComposeListItemV2({
            contentItemV2: new ContentItemV2({
              primaryText: '',
              secondaryText: 'operate options toggle'
            }),
            operateItemV2: this.operateItem08
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