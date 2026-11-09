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

@Entry
@Component
struct RectRadiusNullArray {
  build() {
    Column({space:3}) {
      Rect({ width: 80, height: 50 })
        .radiusWidth(20)
        .radiusHeight(20)
        .radius([])
        .fill(Color.Pink)
        .id('RectRadiusNullArray')
      Rect({ width: 80, height: 50 })
        .radiusWidth(20)
        .radiusHeight(20)
        .radius('')
        .fill(Color.Pink)
        .id('RectRadiusNullString')
    }
    .width('100%')
    .height('100%')
  }
}
