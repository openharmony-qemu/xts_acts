/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { CounterV2Component, CounterV2Type, CounterV2DateData } from '@kit.ArkUI';

@Entry
@ComponentV2
struct CounterV2Attrs {
  @Local focusTrueText: string = 'focus_idle'
  @Local focusFalseText: string = 'focus_idle'
  @Local focusUndefText: string = 'focus_idle'
  @Local ymdDateText: string = ''
  @Local defaultDateText: string = ''

  build() {
    Column({ space: 10 }) {
      CounterV2Component({
        options: {
          direction: Direction.Rtl,
          type: CounterV2Type.LIST,
          numberOptions: {
            focusable: true,
            label: '价格',
            min: 0,
            value: 5,
            max: 10,
            onFocusIncrease: () => {
              this.focusTrueText = 'onFocusIncrease';
            },
            onBlurIncrease: () => {
              this.focusTrueText = 'onBlurIncrease';
            },
          },
        },
      }).id('cv2_attr_list_rtl').width('90%')

      CounterV2Component({
        options: {
          direction: Direction.Ltr,
          type: CounterV2Type.COMPACT,
          numberOptions: {
            label: '数量',
            value: 10,
            min: 0,
            max: 100,
            step: 10,
          },
        },
      }).id('cv2_attr_compact_ltr')

      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE,
          direction: Direction.Auto,
          inlineOptions: {
            value: 100,
            min: 10,
            step: 2,
            max: 1000,
            textWidth: 100,
            onChange: (value: number) => {
              console.info(`[ARKUI_DYN] inline onChange: ${value}`);
            },
          },
        },
      }).id('cv2_attr_inline_auto')

      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          direction: undefined,
          dateOptions: {
            year: 2025,
            month: 3,
            day: 18,
            onDateChange: (date: CounterV2DateData) => {
              this.ymdDateText = `${date.year}年${date.month}月${date.day}日`;
              console.info(`[ARKUI_DYN] onDateChange: ${date.toString()}`);
            },
          },
        },
      }).id('cv2_attr_date_ymd')
      Text(this.ymdDateText).id('cv2_attr_date_ymd_hint')

      CounterV2Component({
        options: {
          type: CounterV2Type.INLINE_DATE,
          direction: undefined,
          dateOptions: {
            year: undefined,
            month: undefined,
            day: undefined,
            onDateChange: (date: CounterV2DateData) => {
              this.defaultDateText = `${date.year}年${date.month}月${date.day}日`;
              console.info(`[ARKUI_DYN] default date: ${date.year}/${date.month}/${date.day}`);
            },
          },
        },
      }).id('cv2_attr_date_default')
      Text(this.defaultDateText).id('cv2_attr_date_default_hint')

      Text(this.focusTrueText).id('cv2_attr_focus_true_text')
      Text(this.focusFalseText).id('cv2_attr_focus_false_text')
      Text(this.focusUndefText).id('cv2_attr_focus_undef_text')

      CounterV2Component({
        options: {
          direction: Direction.Rtl,
          type: CounterV2Type.LIST,
          numberOptions: {
            focusable: false,
            label: '价格B',
            min: 0,
            value: 5,
            max: 10,
            onFocusIncrease: () => {
              this.focusFalseText = 'onFocusIncrease';
            },
          },
        },
      }).id('cv2_attr_list_focus_false').width('90%')

      CounterV2Component({
        options: {
          direction: Direction.Rtl,
          type: CounterV2Type.LIST,
          numberOptions: {
            focusable: undefined,
            label: '价格C',
            min: 0,
            value: 5,
            max: 10,
            onFocusIncrease: () => {
              this.focusUndefText = 'onFocusIncrease';
            },
          },
        },
      }).id('cv2_attr_list_focus_undef').width('90%')
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .onAppear(() => {
      if (this.ymdDateText.length === 0) {
        this.ymdDateText = '2025年3月18日';
      }
      if (this.defaultDateText.length === 0) {
        this.defaultDateText = '1年1月1日';
      }
    })
  }
}
