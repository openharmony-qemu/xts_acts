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

// scenario a: A declares min only [5.0.3, +inf), A body calls B which declares max only (-inf, 6.0.0)
@Styles({ maxApiVersion: 20 })
function styleB7a() {
  .height(200)
}

@Styles({ minApiVersion: 15 })
function styleA7a() {
  .backgroundColor(Color.Red)
  .styleB7a()
}

// scenario b: A declares max only (-inf, 6.0.0), A body calls B which declares min only [5.0.3, +inf)
@Styles({ minApiVersion: 15 })
function styleB7b() {
  .height(300)
}

@Styles({ maxApiVersion: 20 })
function styleA7b() {
  .backgroundColor(Color.Blue)
  .styleB7b()
}

@Entry
@Component
struct Styles0070 {
  build() {
    Column({ space: 20 }) {
      Text('Styles0070 a')
        .id('tv_styles0070_a')
        .height('5%')
        .backgroundColor(Color.Gray)
        .styleA7a()
      Text('Styles0070 b')
        .id('tv_styles0070_b')
        .height('5%')
        .backgroundColor(Color.Gray)
        .styleA7b()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
