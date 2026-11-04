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

// OS version string bounds: effective when system version in [5.0.0, 6.1.1) (encoded [50000, 60101))
@Extend(Text, { minApiVersion: '5.0.0', maxApiVersion: '6.1.1' })
function extendOsString(colorValue: Color) {
  .fontColor(colorValue)
}

@Entry
@Component
struct Extend0060 {
  build() {
    Column({ space: 20 }) {
      Text('Extend0060 os 5.0.0 6.1.1')
        .id('tv_extend0060')
        .height('5%')
        .fontColor(Color.Blue)
        .extendOsString(Color.Red)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
