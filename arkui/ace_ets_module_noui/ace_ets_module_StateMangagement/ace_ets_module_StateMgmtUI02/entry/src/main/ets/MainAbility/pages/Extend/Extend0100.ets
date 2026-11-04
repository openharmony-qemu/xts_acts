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

// scenario a: conditional a [5.0.3, 6.0.0) calls unconditional b (single-param legacy form),
// only a produces version condition wrapping, b inherits it through the direct call inside a's function body
@Extend(Text)
function extendPlainB10a() {
  .fontStyle(FontStyle.Italic)
}

@Extend(Text, { minApiVersion: 15, maxApiVersion: 20 })
function extendCondA10a() {
  .fontColor(Color.Red)
  .extendPlainB10a()
}

// scenario b: unconditional a (single-param legacy form) calls conditional b [5.0.5, 6.0.2),
// a statements apply unconditionally, only b produces version condition wrapping in b's own function body
@Extend(Text, { minApiVersion: 17, maxApiVersion: 22 })
function extendCondB10b() {
  .fontStyle(FontStyle.Italic)
}

@Extend(Text)
function extendPlainA10b() {
  .fontColor(Color.Red)
  .extendCondB10b()
}

@Entry
@Component
struct Extend0100 {
  build() {
    Column({ space: 20 }) {
      Text('hello')
        .id('tv_extend0100_a')
        .height('5%')
        .fontColor(Color.Blue)
        .fontStyle(FontStyle.Normal)
        .extendCondA10a()
      Text('world')
        .id('tv_extend0100_b')
        .height('5%')
        .fontColor(Color.Blue)
        .fontStyle(FontStyle.Normal)
        .extendPlainA10b()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
