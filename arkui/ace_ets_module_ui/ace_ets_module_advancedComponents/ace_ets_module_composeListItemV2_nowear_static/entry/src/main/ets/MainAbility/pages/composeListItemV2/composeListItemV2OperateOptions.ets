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

import { Entry, ComponentV2, $r, Column, Scroll, Text, FontWeight, Local, ColumnOptions, Color } from '@kit.ArkUI';
import {
  ComposeListItemV2,
  ContentItemV2,
  OperateItemV2,OperateItemV2Options,
  OperateIconV2, OperateIconV2Options,
  OperateButtonV2, OperateButtonV2Options,
  OperateCheckV2, OperateCheckV2Options,
  IconTypeV2
} from '@ohos.arkui.advanced.ComposeListItemV2';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct ComposeListItemV2OperateOptionsExample {
  @Local arrowOptions:OperateItemV2Options = {
    text: 'arrow',
    arrow: new OperateIconV2({
      value: $r('sys.media.ohos_ic_public_arrow_right'),
      symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')),
      action: () => {
        this.getUIContext().getPromptAction().showToast({
          message: 'arrow'
        });
      },
      accessibilityDescription: '描述',
      accessibilityLevel: 'auto',
      accessibilityText: '文本'
    })
  }
  @Local operateArrow:OperateItemV2 = new OperateItemV2(this.arrowOptions)

  @Local buttonOptions:OperateItemV2Options = {
    button: new OperateButtonV2({
      text: 'Button',
      accessibilityDescription: '描述',
      accessibilityLevel: 'yes',
      accessibilityText: '文本'
    })
  }
  @Local operateButton:OperateItemV2 = new OperateItemV2(this.buttonOptions)

  @Local isCheck2: boolean = false;
  @Local checkboxOptions:OperateItemV2Options = {
    checkbox: new OperateCheckV2({
      isCheck: false,
      onChange: (value: boolean)=>{
        this.isCheck2 = value;
      },
      accessibilityDescription: '描述',
      accessibilityLevel: 'auto',
      accessibilityText: '文本'
    })
  }
  @Local operateCheckbox:OperateItemV2 = new OperateItemV2(this.checkboxOptions)

  @Local iconOptions:OperateItemV2Options = {
    icon: { value: $r('sys.media.ohos_ic_public_more') },
    subIcon:{ value: $r('sys.media.ohos_app_icon') },
  }
  @Local operateIcon:OperateItemV2 = new OperateItemV2(this.iconOptions)

  @Local imageOptions:OperateItemV2Options = {
    image: $r('sys.symbol.car'),
  }
  @Local operateImage:OperateItemV2 = new OperateItemV2(this.imageOptions)

  @Local radioOptions:OperateItemV2Options = {
    radio: new OperateCheckV2({
      isCheck: false,
      onChange: (value: boolean)=>{
        this.isCheck2 = value;
      },
      accessibilityDescription: '描述',
      accessibilityLevel: 'yes',
      accessibilityText: '文本'
    })
  }
  @Local operateRadio:OperateItemV2 = new OperateItemV2(this.radioOptions)

  @Local symbolOptions:OperateItemV2Options = {
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.heart')).fontColor([Color.Pink])
  }
  @Local operateSymbol:OperateItemV2 = new OperateItemV2(this.symbolOptions)

  @Local isCheck1: boolean = false;
  @Local toggleOptions:OperateItemV2Options = {
    toggle: new OperateCheckV2({
      isCheck: false,
      onChange: (value: boolean)=>{
        this.isCheck1 = value;
      },
      accessibilityDescription: '描述',
      accessibilityLevel: 'no',
      accessibilityText: '文本'
    })
  }
  @Local operateToggle:OperateItemV2 = new OperateItemV2(this.toggleOptions)



  aboutToAppear(): void {
    console.info('ComposeListItemV2OperateExample aboutToAppear');
  }

  build(): void {
    Scroll() {
      Column({ space: 8 } as ColumnOptions) {
        Text('OperateItemV2Options Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 2, bottom: 2 })

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'text arrow test' }),
          operateItemV2: this.operateArrow,
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'button test' }),
          operateItemV2: this.operateButton,
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'checkbox test' }),
          operateItemV2: this.operateCheckbox
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'icon sunIcon test' }),
          operateItemV2: this.operateIcon,
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'image test' }),
          operateItemV2: this.operateImage,
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'radio test' }),
          operateItemV2: this.operateRadio,
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'symbolStyle test' }),
          operateItemV2: this.operateSymbol,
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'toggle test' }),
          operateItemV2: this.operateToggle,
        });

      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}