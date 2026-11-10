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

// @Styles({ maxApiVersion: 18 }) max-boundary only: effective when system version < 5.1.0 (encoded 50100)
@Styles({ maxApiVersion: 18 })
function maxStyle() {
  .height('10%')
}

@Entry
@Component
struct Styles0030 {
  build() {
    Column({ space: 20 }) {
      Text('Styles0030 maxApiVersion 18')
        .id('tv_styles0030')
        .height('5%')
        .maxStyle()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
