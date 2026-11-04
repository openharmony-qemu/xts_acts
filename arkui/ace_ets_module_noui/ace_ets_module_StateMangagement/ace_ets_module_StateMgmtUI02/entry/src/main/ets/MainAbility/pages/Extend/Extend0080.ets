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

// nested @Extend with partially overlapped intervals:
// a [5.0.3, 6.1.1) calls b [5.0.5, 6.0.0), effective interval of b statements is the intersection [5.0.5, 6.0.0)
@Extend(Text, { minApiVersion: 17, maxApiVersion: 20 })
function extendB8() {
  .fontStyle(FontStyle.Italic)
}

@Extend(Text, { minApiVersion: 15, maxApiVersion: 24 })
function extendA8(colorValue: Color) {
  .fontColor(colorValue)
  .extendB8()
}

@Entry
@Component
struct Extend0080 {
  build() {
    Column({ space: 20 }) {
      Text('hello')
        .id('tv_extend0080')
        .height('5%')
        .fontColor(Color.Blue)
        .fontStyle(FontStyle.Normal)
        .extendA8(Color.Red)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
