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

import { SwipeRefresherV2 } from '@ohos.arkui.advanced.SwipeRefresherV2';

@Entry
@ComponentV2
struct SwipeRefresherV2ContentIsLoading {
  @Local isLoading1: boolean = false;
  @Local isLoading2: boolean = true;
  @Local isLoading3: boolean = false;
  @Local contentValue: ResourceStr = '正在加载...';

  build() {
    Column() {
      Scroll() {
        Column({ space: 2 }) {
          Text('SwipeRefresherV2 测试页面')
            .fontSize(15)
            .fontWeight(FontWeight.Bold)

          Divider()

          Text('场景1: 基本用法 - isLoading为false')
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
          SwipeRefresherV2({
            isLoading: this.isLoading1
          })
            .width('100%')
            .height(50)

          Button('切换加载状态')
            .onClick(() => {
              this.isLoading1 = !this.isLoading1;
            })
            .height(20)

          Divider()

          Text('场景2: 带content属性 - isLoading为true')
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
          SwipeRefresherV2({
            isLoading: this.isLoading2,
            content: this.contentValue
          })
            .width('100%')
            .height(50)

          Divider()

          Text('场景3: content为空字符串')
            .fontSize(12)
            .fontWeight(FontWeight.Medium)

          SwipeRefresherV2({
            isLoading: this.isLoading3,
            content: ''
          })
            .width('100%')
            .height(50)

          Button('触发加载')
            .onClick(() => {
              this.isLoading3 = true;
            })
            .height(20)

          Divider()

          Text('场景4: content为undefined')
            .fontSize(12)
            .fontWeight(FontWeight.Medium)
          SwipeRefresherV2({
            isLoading: undefined,
            content: undefined
          })
            .width('100%')
            .height(50)

          Divider()

          Text('场景5: 动态切换isLoading')
            .fontSize(12)
            .fontWeight(FontWeight.Medium)

          SwipeRefresherV2({
            isLoading: this.isLoading2,
            content: '加载中，请稍候...'
          })
            .width('100%')
            .height(50)

          Button('停止加载')
            .onClick(() => {
              this.isLoading2 = false;
            })
            .height(20)

          Button('开始加载')
            .onClick(() => {
              this.isLoading2 = true;
            })
            .height(20)
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