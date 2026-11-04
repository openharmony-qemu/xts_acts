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

// A [5.0.3, 6.0.0) calls the same B [5.0.5, 6.0.2) at two statement positions
@Styles({ minApiVersion: 17, maxApiVersion: 22 })
function styleB8() {
  .height(300)
}

@Styles({ minApiVersion: 15, maxApiVersion: 20 })
function styleA8() {
  .styleB8()
  .backgroundColor(Color.Red)
  .styleB8()
}

@Entry
@Component
struct Styles0080 {
  build() {
    Column({ space: 20 }) {
      Text('Styles0080')
        .id('tv_styles0080')
        .height('5%')
        .backgroundColor(Color.Gray)
        .styleA8()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
