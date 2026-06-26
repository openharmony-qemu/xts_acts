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

import { ExceptionPromptV2, PromptOptionsV2, MarginTypeV2 } from '@ohos.arkui.advanced.ExceptionPromptV2';

@Entry
@ComponentV2
struct ExceptionPromptV2Example {
  build() {
    Column() {
      Scroll() {
        Column({ space: 12 }) {
          Text('测试5: 动态更新属性')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .margin({ top: 20 })

          DynamicUpdateTest()
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .margin({ top: 50 })
      }
    }
  }
}

@ComponentV2
struct DynamicUpdateTest {
  @Local dynamicTip: string = '初始提示文本';
  @Local dynamicIsShown: boolean = true;

  build() {
    Column({ space: 10 }) {
      ExceptionPromptV2({
        options: new PromptOptionsV2({
          marginType: MarginTypeV2.DEFAULT_MARGIN,
          marginTop: 10,
          tip: this.dynamicTip,
          isShown: this.dynamicIsShown
        })
      })

      Button('更改提示文本')
        .onClick(() => {
          this.dynamicTip = '更新后的提示文本';
        })

      Button('隐藏组件')
        .onClick(() => {
          this.dynamicIsShown = false;
        })

      Button('显示组件')
        .onClick(() => {
          this.dynamicIsShown = true;
        })
    }
  }
}