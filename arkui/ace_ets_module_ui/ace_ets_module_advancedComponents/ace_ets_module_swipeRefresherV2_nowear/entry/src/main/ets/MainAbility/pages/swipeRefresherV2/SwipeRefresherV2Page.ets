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

import { SwipeRefresherV2 } from '@ohos.arkui.advanced.SwipeRefresherV2';

@Entry
@ComponentV2
struct SwipeRefresherV2Page {
  @Local isLoading1: boolean = false;
  @Local isLoading2: boolean = true;
  @Local isLoading3: boolean = false;
  @Local contentValue: string = '正在加载...';

  build() {
    Column() {
      Scroll() {
        Column({ space: 20 }) {
          Text('SwipeRefresherV2 测试页面')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 20 })

          Divider()

          Text('场景1: 基本用法 - isLoading为false')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)

          SwipeRefresherV2({
            isLoading: this.isLoading1
          })
            .width('100%')
            .height(100)

          Button('切换加载状态')
            .onClick(() => {
              this.isLoading1 = !this.isLoading1;
            })

          Divider()

          Text('场景2: 带content属性 - isLoading为true')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)

          SwipeRefresherV2({
            isLoading: this.isLoading2,
            content: this.contentValue
          })
            .width('100%')
            .height(100)

          Divider()

          Text('场景3: content为空字符串')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)

          SwipeRefresherV2({
            isLoading: this.isLoading3,
            content: ''
          })
            .width('100%')
            .height(100)

          Button('触发加载')
            .onClick(() => {
              this.isLoading3 = true;
            })

          Divider()

          Text('场景4: content为undefined')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)

          SwipeRefresherV2({
            isLoading: false
          })
            .width('100%')
            .height(100)

          Divider()

          Text('场景5: 动态切换isLoading')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)

          SwipeRefresherV2({
            isLoading: this.isLoading2,
            content: '加载中，请稍候...'
          })
            .width('100%')
            .height(100)

          Button('停止加载')
            .onClick(() => {
              this.isLoading2 = false;
            })

          Button('开始加载')
            .onClick(() => {
              this.isLoading2 = true;
            })
            .margin({ top: 10 })
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .padding({ left: 20, right: 20, bottom: 50 })
      }
    }
    .width('100%')
    .height('100%')
  }
}