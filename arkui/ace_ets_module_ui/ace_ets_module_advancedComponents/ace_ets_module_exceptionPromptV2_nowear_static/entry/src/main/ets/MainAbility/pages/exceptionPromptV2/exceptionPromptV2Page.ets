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

import { Entry, ComponentV2, $r, Column, Scroll, Text, FontWeight, Button } from '@kit.ArkUI';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { ExceptionPromptV2, PromptOptionsV2, PromptOptionsV2Config, MarginTypeV2 } from '@ohos.arkui.advanced.ExceptionPromptV2';
import { Local } from '@ohos.arkui.stateManagement';

@Entry
@ComponentV2
struct ExceptionPromptV2Page {
  @Local callbackResult: string = '';

  aboutToAppear(): void {
    console.info('ExceptionPromptV2Page aboutToAppear');
  }

  build(): void {
    Scroll() {
      Column() {
        // 基本功能 + MarginType测试
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 10,
            tip: '网络未连接',
            isShown: true
          })
        });
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 70,
            tip: '默认边距',
            isShown: true
          })
        });
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.FIT_MARGIN,
            marginTop: 130,
            tip: '自适应边距',
            isShown: true
          })
        });

        // Icon和Symbol测试
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 190,
            icon: $r('sys.media.ohos_ic_public_ok'),
            tip: '图标提示',
            isShown: true
          })
        });
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 250,
            symbolStyle: new SymbolGlyphModifier($r('sys.symbol.wifi')),
            tip: 'Symbol图标提示',
            isShown: true
          })
        });

        // Tip和ActionText测试
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 310,
            tip: '网络连接不稳定',
            isShown: true
          })
        });
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 370,
            tip: '网络未连接',
            actionText: '重新连接',
            isShown: true
          })
        });
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 430,
            tip: '服务器连接失败',
            actionText: '重试',
            isShown: true
          })
        });

        // Visibility测试
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 490,
            tip: '显示的提示',
            isShown: true
          })
        });
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 550,
            tip: '隐藏的提示',
            isShown: false
          })
        });

        // Callback测试
        ExceptionPromptV2({
          options: new PromptOptionsV2({
            marginType: MarginTypeV2.DEFAULT_MARGIN,
            marginTop: 610,
            tip: '点击提示文本',
            actionText: '点击操作',
            isShown: true
          }),
          onTipClick: () => {
            this.callbackResult = 'Tip Clicked';
          },
          onActionTextClick: () => {
            this.callbackResult = 'Action Clicked';
          }
        });

        if (this.callbackResult !== '') {
          Text(this.callbackResult).fontSize(16).fontWeight(FontWeight.Bold).fontColor('#FF0000').margin({ top: 670 });
        }

      }
      .width('100%')
      .padding({ top: 20, left: 20, right: 20 })
      .height('100%');
    }
    .width('100%')
    // .height('100%');
  }
}