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

// @Extend with max bound only: effective when system version < 6.0.0 (encoded 60000)
@Extend(Text, { maxApiVersion: '6.0.0' })
function extendMax(colorValue: Color) {
  .fontColor(colorValue)
}

@Entry
@Component
struct Extend0040 {
  build() {
    Column({ space: 20 }) {
      Text('hello')
        .id('tv_extend0040')
        .height('5%')
        .fontColor(Color.Blue)
        .extendMax(Color.Red)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
