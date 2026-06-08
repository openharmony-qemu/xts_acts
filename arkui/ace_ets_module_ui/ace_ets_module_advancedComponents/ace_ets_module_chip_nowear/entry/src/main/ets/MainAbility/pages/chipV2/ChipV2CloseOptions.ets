/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  ChipV2,
  ChipV2Options,
  ChipV2Label,
  ChipV2CloseIcon,
  LengthMetrics
} from '@kit.ArkUI';

@Entry
@ComponentV2
struct ChipV2CloseOptions {
  build() {
    Column() {
      ChipV2({
        chipV2Options: new ChipV2Options({
          label: new ChipV2Label({
            text: 'padding',
          }),
          closeIcon: new ChipV2CloseIcon({
            fontSize: LengthMetrics.vp(35)
          })
        })
      })

    }
    .height('90%')
    .margin({
      top: '2%',
      bottom: '2%',
      left: '5%',
      right: '5%'
    })

  }
}