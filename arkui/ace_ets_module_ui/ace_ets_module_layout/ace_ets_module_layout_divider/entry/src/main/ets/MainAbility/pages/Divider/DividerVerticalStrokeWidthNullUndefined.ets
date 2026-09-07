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

@Entry
@Component
struct DividerVerticalStrokeWidthNullUndefined {
  build() {
    Column({space:3}) {
      Divider()
        .width(100)
        .height(30)
        .backgroundColor(Color.Blue)
        .vertical(true)
        .strokeWidth('10')
        .id('DividerVerticalStrokeWidthNullUndefined1')
      Divider()
        .width(100)
        .height(30)
        .backgroundColor(Color.Blue)
        .vertical(false)
        .strokeWidth('')
        .id('DividerVerticalStrokeWidthNullUndefined2')
      Divider()
        .width(100)
        .height(30)
        .backgroundColor(Color.Blue)
        .vertical(null)
        .strokeWidth(null)
        .id('DividerVerticalStrokeWidthNullUndefined3')
      Divider()
        .width(100)
        .height(30)
        .backgroundColor(Color.Blue)
        .vertical(undefined)
        .strokeWidth(undefined)
        .id('DividerVerticalStrokeWidthNullUndefined4')
    }
    .width('100%')
    .height('100%')
  }
}
