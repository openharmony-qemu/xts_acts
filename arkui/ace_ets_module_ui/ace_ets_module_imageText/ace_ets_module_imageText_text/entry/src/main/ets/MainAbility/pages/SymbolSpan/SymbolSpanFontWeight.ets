import { symbolSpanFontWeightModifier } from '../../common/SymbolSpanFontWeightCompat';

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
struct SymbolSpanFontWeight {
  build() {
    Scroll() {
      Column() {
        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(100)
            .fontSize(48)
            .id('symbolSpan_fontWeight_100')
            .key('symbolSpan_fontWeight_100')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(400)
            .fontSize(48)
            .id('symbolSpan_fontWeight_400')
            .key('symbolSpan_fontWeight_400')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(900)
            .fontSize(48)
            .id('symbolSpan_fontWeight_900')
            .key('symbolSpan_fontWeight_900')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(700)
            .fontSize(48)
            .id('symbolSpan_fontWeight_700')
            .key('symbolSpan_fontWeight_700')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Lighter)
            .fontSize(48)
            .id('symbolSpan_fontWeight_Lighter')
            .key('symbolSpan_fontWeight_Lighter')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Normal)
            .fontSize(48)
            .id('symbolSpan_fontWeight_Normal')
            .key('symbolSpan_fontWeight_Normal')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Regular)
            .fontSize(48)
            .id('symbolSpan_fontWeight_Regular')
            .key('symbolSpan_fontWeight_Regular')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Medium)
            .fontSize(48)
            .id('symbolSpan_fontWeight_Medium')
            .key('symbolSpan_fontWeight_Medium')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Bold)
            .fontSize(48)
            .id('symbolSpan_fontWeight_Bold')
            .key('symbolSpan_fontWeight_Bold')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Bolder)
            .fontSize(48)
            .id('symbolSpan_fontWeight_Bolder')
            .key('symbolSpan_fontWeight_Bolder')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight('400')
            .fontSize(48)
            .id('symbolSpan_fontWeight_string_400')
            .key('symbolSpan_fontWeight_string_400')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight('bold')
            .fontSize(48)
            .id('symbolSpan_fontWeight_string_bold')
            .key('symbolSpan_fontWeight_string_bold')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight('bolder')
            .fontSize(48)
            .id('symbolSpan_fontWeight_string_bolder')
            .key('symbolSpan_fontWeight_string_bolder')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight('lighter')
            .fontSize(48)
            .id('symbolSpan_fontWeight_string_lighter')
            .key('symbolSpan_fontWeight_string_lighter')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight('regular')
            .fontSize(48)
            .id('symbolSpan_fontWeight_string_regular')
            .key('symbolSpan_fontWeight_string_regular')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight('medium')
            .fontSize(48)
            .id('symbolSpan_fontWeight_string_medium')
            .key('symbolSpan_fontWeight_string_medium')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight('')
            .fontSize(48)
            .id('symbolSpan_fontWeight_empty_string')
            .key('symbolSpan_fontWeight_empty_string')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontSize(48)
            .id('symbolSpan_fontWeight_default')
            .key('symbolSpan_fontWeight_default')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .attributeModifier(symbolSpanFontWeightModifier(220, { enableVariableFontWeight: true }))
            .fontSize(48)
            .id('symbolSpan_fontWeight_variable_220')
            .key('symbolSpan_fontWeight_variable_220')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .attributeModifier(symbolSpanFontWeightModifier(660, { enableVariableFontWeight: true }))
            .fontSize(48)
            .id('symbolSpan_fontWeight_variable_660')
            .key('symbolSpan_fontWeight_variable_660')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .attributeModifier(symbolSpanFontWeightModifier(400, { enableVariableFontWeight: false }))
            .fontSize(48)
            .id('symbolSpan_fontWeight_variable_false')
            .key('symbolSpan_fontWeight_variable_false')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .attributeModifier(symbolSpanFontWeightModifier(
              FontWeight.Normal, { enableDeviceFontWeightCategory: true }))
            .fontSize(48)
            .id('symbolSpan_fontWeight_device_true')
            .key('symbolSpan_fontWeight_device_true')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .attributeModifier(symbolSpanFontWeightModifier(
              FontWeight.Normal, { enableDeviceFontWeightCategory: false }))
            .fontSize(48)
            .id('symbolSpan_fontWeight_device_false')
            .key('symbolSpan_fontWeight_device_false')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .attributeModifier(symbolSpanFontWeightModifier(500, {
              enableVariableFontWeight: true,
              enableDeviceFontWeightCategory: true
            }))
            .fontSize(48)
            .id('symbolSpan_fontWeight_configs_both')
            .key('symbolSpan_fontWeight_configs_both')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .attributeModifier(symbolSpanFontWeightModifier(300, undefined))
            .fontSize(48)
            .id('symbolSpan_fontWeight_configs_undefined')
            .key('symbolSpan_fontWeight_configs_undefined')
        }

        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(300)
            .fontSize(48)
            .id('symbolSpan_fontWeight_configs_null')
            .key('symbolSpan_fontWeight_configs_null')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(500)
            .fontSize(48)
            .id('symbolSpan_fontWeight_configs_default')
            .key('symbolSpan_fontWeight_configs_default')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(50)
            .fontSize(48)
            .id('symbolSpan_fontWeight_out_range_low')
            .key('symbolSpan_fontWeight_out_range_low')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(1000)
            .fontSize(48)
            .id('symbolSpan_fontWeight_out_range_high')
            .key('symbolSpan_fontWeight_out_range_high')
        }


        Text() {
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(-100)
            .fontSize(48)
            .id('symbolSpan_fontWeight_negative')
            .key('symbolSpan_fontWeight_negative')
        }

      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}