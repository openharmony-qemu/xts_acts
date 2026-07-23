/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { ExceptionPromptV2, PromptOptionsV2, MarginTypeV2, PromptOptionsV2Config } from '@ohos.arkui.advanced.ExceptionPromptV2';
import { SymbolGlyphModifier } from '@kit.ArkUI'

@Entry
@ComponentV2
struct ExceptionPromptV2Example {
  @Local isShown1: boolean = true;
  @Local isShown2: boolean = true;
  @Local isShown3: boolean = true;
  @Local isShown4: boolean = true;
  @Local tipClickCount: number = 0;
  @Local actionClickCount: number = 0;
  @Local promptOptions: PromptOptionsV2Config = {
    marginType: MarginTypeV2.DEFAULT_MARGIN,
    marginTop: 420,
    icon: $r('sys.media.ohos_ic_public_edit'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.wifi')),
    actionText: '设置',
    tip: '服务器连接失败',
    isShown: this.isShown3
  };
  @Local prompt: PromptOptionsV2 = new PromptOptionsV2(this.promptOptions)

  build() {
    Column() {
      Scroll() {
        Column({ space: 12 }) {
          Text('ExceptionPromptV2 测试页面')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)

          Row(){
            Text('测试1: 默认边距类型')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
            Button('切换显示状态1')
              .onClick(() => {
                this.isShown1 = !this.isShown1;
              })
          }

          ExceptionPromptV2({
            options: new PromptOptionsV2({
              marginType: MarginTypeV2.DEFAULT_MARGIN,
              marginTop: 320,
              icon: $r('sys.symbol.phone'),
              symbolStyle: new SymbolGlyphModifier($r('sys.symbol.bell')).fontColor([Color.Blue]),
              tip: '网络未连接',
              isShown: this.isShown1
            }),
            onTipClick: () => {
              console.info('onTipClick callback triggered');
              this.tipClickCount++;
            }
          })

          Row(){
            Text('测试2: 适配边距类型')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
            Button('切换显示状态2')
              .onClick(() => {
                this.isShown2 = !this.isShown2;
              })
          }

          ExceptionPromptV2({
            options: new PromptOptionsV2({
              marginType: MarginTypeV2.FIT_MARGIN,
              marginTop: 370,
              icon: $r('sys.symbol.phone'),
              tip: '网络连接不稳定',
              actionText: '设置',
              isShown: this.isShown2
            }),
            onActionTextClick: () => {
              console.info('onActionTextClick callback triggered');
              this.actionClickCount++;
            }
          })

          Row(){
            Text('测试3: 带图标')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
            Button('切换显示状态3')
              .onClick(() => {
                this.isShown3 = !this.isShown3;
              })
          }

          ExceptionPromptV2({
            options: this.prompt,
          })

          Row(){
            Text('测试4: 完整配置')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
            Button('切换显示状态4')
              .onClick(() => {
                this.isShown4 = !this.isShown4;
              })
          }

          ExceptionPromptV2({
            options: new PromptOptionsV2({
              marginType: MarginTypeV2.FIT_MARGIN,
              marginTop: 470,
              icon: $r('sys.media.ohos_ic_public_edit'),
              tip: '无法获取位置信息',
              actionText: '刷新',
              isShown: this.isShown4
            }),
            onTipClick: () => {
              this.tipClickCount++;
              console.info('Tip clicked, count: ' + this.tipClickCount);
            },
            onActionTextClick: () => {
              this.actionClickCount++;
              console.info('Action clicked, count: ' + this.actionClickCount);
            }
          })

          Text('事件统计:')
            .fontSize(16)
            .margin({ top: 5 })

          Text('tip点击次数: ' + this.tipClickCount)
            .fontSize(12)

          Text('action点击次数: ' + this.actionClickCount)
            .fontSize(12)
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .height('100%')
      }
    }
  }
}