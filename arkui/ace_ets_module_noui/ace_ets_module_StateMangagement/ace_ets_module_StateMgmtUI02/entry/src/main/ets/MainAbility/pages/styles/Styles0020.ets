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

// @Styles({ minApiVersion: 12 }) min-boundary only: effective when system version >= 5.0.0 (encoded 50000)
@Styles({ minApiVersion: 12 })
function minStyleGlobal() {
  .backgroundColor(Color.Red)
}

@Entry
@Component
struct Styles0020 {

  @Styles({ minApiVersion: 12 })
  minStyleInner() {
    .height(80)
  }

  build() {
    Column({ space: 20 }) {
      Text('Styles0020 global')
        .id('tv_styles0020_global')
        .height('5%')
        .backgroundColor(Color.Gray)
        .minStyleGlobal()
      Text('Styles0020 inner')
        .id('tv_styles0020_inner')
        .height('5%')
        .minStyleInner()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
