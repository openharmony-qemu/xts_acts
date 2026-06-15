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
struct TextClockPropertiesNullUndefinedTest {
  build() {

    Column() {
      Scroll(){
        Column(){
          // ========== fontColor tests ==========
          Text('fontColor Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontColor_default')
              .key('TextClock_fontColor_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontColor_null')
              .key('TextClock_fontColor_null')
              .fontColor(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontColor_undefined')
              .key('TextClock_fontColor_undefined')
              .fontColor(undefined)

            // Empty String
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontColor_empty')
              .key('TextClock_fontColor_empty')
              .fontColor('')
          }
          .width('100%')

          // ========== fontSize tests ==========
          Text('fontSize Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontSize_default')
              .key('TextClock_fontSize_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontSize_null')
              .key('TextClock_fontSize_null')
              .fontSize(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontSize_undefined')
              .key('TextClock_fontSize_undefined')
              .fontSize(undefined)

            // Empty String
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontSize_empty')
              .key('TextClock_fontSize_empty')
              .fontSize('')
          }
          .width('100%')

          // ========== fontStyle tests ==========
          Text('fontStyle Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontStyle_default')
              .key('TextClock_fontStyle_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontStyle_null')
              .key('TextClock_fontStyle_null')
              .fontStyle(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontStyle_undefined')
              .key('TextClock_fontStyle_undefined')
              .fontStyle(undefined)
          }
          .width('100%')

          // ========== fontWeight tests ==========
          Text('fontWeight Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontWeight_default')
              .key('TextClock_fontWeight_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontWeight_null')
              .key('TextClock_fontWeight_null')
              .fontWeight(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontWeight_undefined')
              .key('TextClock_fontWeight_undefined')
              .fontWeight(undefined)

            // Empty String
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontWeight_empty')
              .key('TextClock_fontWeight_empty')
              .fontWeight('')
          }
          .width('100%')

          // ========== fontFamily tests ==========
          Text('fontFamily Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontFamily_default')
              .key('TextClock_fontFamily_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontFamily_null')
              .key('TextClock_fontFamily_null')
              .fontFamily(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontFamily_undefined')
              .key('TextClock_fontFamily_undefined')
              .fontFamily(undefined)

            // Empty String
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontFamily_empty')
              .key('TextClock_fontFamily_empty')
              .fontFamily('')
          }
          .width('100%')

          // ========== textShadow tests ==========
          Text('textShadow Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_textShadow_default')
              .key('TextClock_textShadow_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_textShadow_null')
              .key('TextClock_textShadow_null')
              .textShadow(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_textShadow_undefined')
              .key('TextClock_textShadow_undefined')
              .textShadow(undefined)
          }
          .width('100%')

          // ========== contentModifier tests ==========
          Text('contentModifier Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_contentModifier_default')
              .key('TextClock_contentModifier_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_contentModifier_null')
              .key('TextClock_contentModifier_null')
              .contentModifier(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_contentModifier_undefined')
              .key('TextClock_contentModifier_undefined')
              .contentModifier(undefined)
          }
          .width('100%')

          // ========== fontFeature tests ==========
          Text('fontFeature Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontFeature_default')
              .key('TextClock_fontFeature_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontFeature_null')
              .key('TextClock_fontFeature_null')
              .fontFeature(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontFeature_undefined')
              .key('TextClock_fontFeature_undefined')
              .fontFeature(undefined)

            // Empty String
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_fontFeature_empty')
              .key('TextClock_fontFeature_empty')
              .fontFeature('')
          }
          .width('100%')

          // ========== dateTimeOptions tests ==========
          Text('dateTimeOptions Property Tests')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })

          Row() {
            // Default
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_dateTimeOptions_default')
              .key('TextClock_dateTimeOptions_default')

            // Null
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_dateTimeOptions_null')
              .key('TextClock_dateTimeOptions_null')
              .dateTimeOptions(null)

            // Undefined
            TextClock()
              .width('30%')
              .height('5%')
              .id('TextClock_dateTimeOptions_undefined')
              .key('TextClock_dateTimeOptions_undefined')
              .dateTimeOptions(undefined)
          }
          .width('100%')
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}
