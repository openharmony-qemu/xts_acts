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
struct ChipCloseOptions {
  build() {
    Column() {
      Chip({
        label: {
          text: 'padding',
        },
        closeOptions: { fontSize: '35px' }
      })

      Button('get')
        .id('getChipPadding').onClick(() => {
        let result: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let chip0CloseOptionsFontSize: string = result.$children[0].$children[0].$children[0].$children[1].$children[0].$attrs.fontSize;
        AppStorage.setOrCreate<string>('chip0CloseOptionsFontSize', chip0CloseOptionsFontSize)
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