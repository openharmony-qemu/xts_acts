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

import {Chip, ChipSize} from '@kit.ArkUI';
@Entry
@Component
struct ChipFontSize {

  build() {
    Column({ space: 10 }) {
      Chip({
        label: {
          text: 'fontSize 10vp',
        },
        fontSize: '10px'
      })
      Chip({
        label: {
          text: 'NORMAL',
        },
        size: ChipSize.NORMAL,
        fontSize: undefined
      })
      Chip({
        label: {
          text: 'SMALL',
        },
        size: ChipSize.SMALL,
        fontSize: undefined
      })
      Chip({
        label: {
          text: 'chip_normalFont_size',
        },
        fontSize: $r('sys.float.chip_normal_font_size')
      })
      Chip({
        label: {
          text: 'chip_smallFont_size',
        },
        fontSize: $r('sys.float.chip_small_font_size')
      })
      Button('get')
        .id('getChipFontSize').onClick(() =>{
        let result: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
        let chip1FontSize:string  = result.$children[0].$children[0].$children[0].$children[0].$attrs.fontSize;
        AppStorage.setOrCreate<string>('chip1FontSize', chip1FontSize)
        let chip2FontSize:string  = result.$children[0].$children[1].$children[0].$children[0].$attrs.fontSize;
        AppStorage.setOrCreate<string>('chip2FontSize', chip2FontSize)
        let chip3FontSize:string  = result.$children[0].$children[2].$children[0].$children[0].$attrs.fontSize;
        AppStorage.setOrCreate<string>('chip3FontSize', chip3FontSize)
        let chip4FontSize:string  = result.$children[0].$children[3].$children[0].$children[0].$attrs.fontSize;
        AppStorage.setOrCreate<string>('chip4FontSize', chip4FontSize)
        let chip5FontSize:string  = result.$children[0].$children[4].$children[0].$children[0].$attrs.fontSize;
        AppStorage.setOrCreate<string>('chip5FontSize', chip5FontSize)
      })
    }
    .height('90%')
    .margin({top: '2%', bottom: '2%', left: '5%', right: '5%'})
  }
}