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
  OperateItemV2,
  OperateIconV2, OperateIconV2Options,
  OperateButtonV2, OperateButtonV2Options,
  OperateCheckV2, OperateCheckV2Options,
  IconTypeV2
} from '@ohos.arkui.advanced.ComposeListItemV2';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';

@Entry
@ComponentV2
struct ComposeListItemV2OperateExample {
  @Local contentItem: ContentItemV2 = new ContentItemV2({ primaryText: 'Primary Text' });
  @Local operateIcon: OperateIconV2 = new OperateIconV2({
    value: $r('sys.media.ohos_ic_public_more')
  });
  @Local operateButton: OperateButtonV2 = new OperateButtonV2({
    text: 'Button',
    accessibilityDescription: '描述',
    accessibilityLevel: 'auto',
    accessibilityText: '文本'
  });

  @Local operateButtonV2Options: OperateButtonV2Options = {
    text: 'Button2',
    accessibilityDescription: '描述',
    accessibilityLevel: 'auto',
    accessibilityText: '文本'
  };
  @Local operateButton2: OperateButtonV2 = new OperateButtonV2(this.operateButtonV2Options);

  @Local isCheck1: boolean = false;
  @Local toggle: OperateCheckV2 = new OperateCheckV2({
    isCheck: false,
    onChange: (value: boolean)=>{
      this.isCheck1 = value;
    },
    accessibilityDescription: '描述',
    accessibilityLevel: 'auto',
    accessibilityText: '文本'
  });

  @Local isCheck2: boolean = false;
  @Local checkboxOptions:OperateCheckV2Options = {
    isCheck: false,
    onChange: (value: boolean)=>{
      this.isCheck2 = value;
    },
    accessibilityDescription: '描述',
    accessibilityLevel: 'auto',
    accessibilityText: '文本'
  }

  @Local checkbox: OperateCheckV2 = new OperateCheckV2(this.checkboxOptions);
  @Local radio: OperateCheckV2 = new OperateCheckV2({ isCheck: false });

  @Local arrow: OperateIconV2 = new OperateIconV2({
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
  });

  @Local iconOptions: OperateIconV2Options = {
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
  }
  @Local arrow2: OperateIconV2 = new OperateIconV2(this.iconOptions);

  aboutToAppear(): void {
    console.info('ComposeListItemV2OperateExample aboutToAppear');
  }

  build(): void {
    Scroll() {
      Column({ space: 2 } as ColumnOptions) {
        Text('OperateItemV2 Test')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 2, bottom: 2 })

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Operate Icon' }),
          operateItemV2: new OperateItemV2({
            icon: this.operateIcon,
            subIcon:{
              value: $r('sys.media.ohos_app_icon')
            },
          })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Button Test' }),
          operateItemV2: new OperateItemV2({ button: this.operateButton })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Button Test2' }),
          operateItemV2: new OperateItemV2({ button: this.operateButton2 })
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
          contentItemV2: new ContentItemV2({ primaryText: 'Arrow Test2' }),
          operateItemV2: new OperateItemV2({ arrow: this.arrow2 })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Operate Text' }),
          operateItemV2: new OperateItemV2({
            text: 'Operate Text'
          })
        });

        ComposeListItemV2({
          contentItemV2: new ContentItemV2({ primaryText: 'Operate image' }),
          operateItemV2: new OperateItemV2({
            image: $r('sys.symbol.car'),
            symbolStyle: new SymbolGlyphModifier($r('sys.symbol.heart')).fontColor([Color.Pink])
          })
        });

      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}