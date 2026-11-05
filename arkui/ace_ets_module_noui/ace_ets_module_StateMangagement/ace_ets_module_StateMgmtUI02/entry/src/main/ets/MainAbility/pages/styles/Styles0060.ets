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

// three-layer nesting: A [5.0.3, 6.1.1) -> B [5.0.5, 6.0.2) -> C [5.1.0, 6.0.0)
// final effective interval of C statements is the intersection [5.1.0, 6.0.0) (encoded [50100, 60000))
@Styles({ minApiVersion: 18, maxApiVersion: 20 })
function styleC() {
  .borderWidth(2)
}

@Styles({ minApiVersion: 17, maxApiVersion: 22 })
function styleB() {
  .height('10%')
  .styleC()
}

@Styles({ minApiVersion: 15, maxApiVersion: 24 })
function styleA() {
  .backgroundColor(Color.Red)
  .styleB()
}

@Entry
@Component
struct Styles0060 {
  build() {
    Column({ space: 20 }) {
      Text('Styles0060 nested A B C')
        .id('tv_styles0060')
        .height('5%')
        .borderWidth(0)
        .backgroundColor(Color.Gray)
        .styleA()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
