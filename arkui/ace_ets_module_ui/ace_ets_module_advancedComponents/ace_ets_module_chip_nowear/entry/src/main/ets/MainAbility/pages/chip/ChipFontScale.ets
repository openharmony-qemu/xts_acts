/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Chip } from '@kit.ArkUI';

@Entry
@Component
struct ChipFontScale {
  build() {
    Column({ space: 10 }) {
      Chip({
        label: {
          text: 'minFontScale:0 maxFontScale:1',
        },
        minFontScale: 0,
        maxFontScale: 1,
      })
      Chip({
        label: {
          text: 'minFontScale:1 maxFontScale:2',
        },
        minFontScale: 1,
        maxFontScale: 2,
      })
      Chip({
        label: {
          text: 'minFontScale:-1 maxFontScale:0',
        },
        minFontScale: -1,
        maxFontScale: 0,
      })

      Button('get')
        .id('getChip').onClick(() => {
        let result: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let chip1: ESObject = result.$children[0].$children[0].$children[0].$children[0].$attrs;
        AppStorage.setOrCreate<number>('chip1_minFontScale', Number.parseFloat(chip1.minFontScale))
        AppStorage.setOrCreate<number>('chip1_maxFontScale', Number.parseFloat(chip1.maxFontScale))
        let chip2: ESObject = result.$children[0].$children[1].$children[0].$children[0].$attrs;
        AppStorage.setOrCreate<number>('chip2_minFontScale', Number.parseFloat(chip2.minFontScale))
        AppStorage.setOrCreate<number>('chip2_maxFontScale', Number.parseFloat(chip2.maxFontScale))
        let chip3: ESObject = result.$children[0].$children[2].$children[0].$children[0].$attrs;
        AppStorage.setOrCreate<number>('chip3_minFontScale', Number.parseFloat(chip3.minFontScale))
        AppStorage.setOrCreate<number>('chip3_maxFontScale', Number.parseFloat(chip3.maxFontScale))
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