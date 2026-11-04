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

// conditional outer A [5.0.3, 6.0.0) calls unconditional inner B (bare legacy form)
// only A produces version condition wrapping, B statements are inlined without own wrap
@Styles
function plainB9() {
  .height(200)
}

@Styles({ minApiVersion: 15, maxApiVersion: 20 })
function condA9() {
  .backgroundColor(Color.Red)
  .plainB9()
}

@Entry
@Component
struct Styles0090 {
  build() {
    Column({ space: 20 }) {
      Text('Styles0090')
        .id('tv_styles0090')
        .height('5%')
        .backgroundColor(Color.Gray)
        .condA9()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
