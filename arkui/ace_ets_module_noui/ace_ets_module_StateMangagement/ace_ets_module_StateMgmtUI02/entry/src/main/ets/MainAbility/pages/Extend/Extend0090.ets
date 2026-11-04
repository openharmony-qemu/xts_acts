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

// nested @Extend with disjoint intervals:
// a [5.0.3, 5.1.0) calls b [6.0.0, 6.1.1), the intersection is empty so b statements never take effect at runtime,
// while compilation passes without any diagnosis
@Extend(Text, { minApiVersion: 20, maxApiVersion: 24 })
function extendB9() {
  .fontStyle(FontStyle.Italic)
}

@Extend(Text, { minApiVersion: 15, maxApiVersion: 18 })
function extendA9(colorValue: Color) {
  .fontColor(colorValue)
  .extendB9()
}

@Entry
@Component
struct Extend0090 {
  build() {
    Column({ space: 20 }) {
      Text('hello')
        .id('tv_extend0090')
        .height('5%')
        .fontColor(Color.Blue)
        .fontStyle(FontStyle.Normal)
        .extendA9(Color.Red)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
