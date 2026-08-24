/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct ImageAnimatorFixedSizeUndefinedAndNullTest {

  build() {
    Scroll() {
      Column({ space: 10 }) {
        ImageAnimator()
          .id('fixedSizeUndefined')
          .key('fixedSizeUndefined')
          .images([
            {
              src: $r('app.media.tree')
            }
          ])
          .fixedSize(undefined)
          .border({ width: 2, color: Color.Black })
          .width('80%')
          .aspectRatio(1)

        ImageAnimator()
          .id('fixedSizeNull')
          .key('fixedSizeNull')
          .images([
            {
              src: $r('app.media.tree')
            }
          ])
          .fixedSize(null)
          .border({ width: 2, color: Color.Black })
          .width('80%')
          .aspectRatio(1)
      }
      .width('100%')
      .padding(10)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
  }
}
