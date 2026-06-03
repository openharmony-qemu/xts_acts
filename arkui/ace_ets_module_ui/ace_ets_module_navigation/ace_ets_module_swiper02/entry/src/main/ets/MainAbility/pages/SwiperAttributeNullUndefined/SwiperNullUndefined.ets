/*
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
struct SwiperAttributesNullUndefined {
  build() {
    Column() {
      Text('Swiper 属性 Null/Undefined 测试')
      Scroll() {
        Column() {
          // 1. index 属性测试 - number类型，需要覆盖null/undefined
          Text('1. index 属性测试')
          Row(){
            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#FFE0B2')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_index_default')

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#C8E6C9')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_index_null')
            .index(null)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#BBDEFB')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_index_undefined')
            .index(undefined)
          }
          .height('15%')

          // 2. interval 属性测试 - number类型，需要覆盖null/undefined
          Text('2. interval 属性测试')
          Row(){
            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#F8BBD0')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_interval_default')
            .autoPlay(true)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#D1C4E9')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_interval_null')
            .interval(null)
            .autoPlay(true)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#FFF9C4')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_interval_undefined')
            .interval(undefined)
            .autoPlay(true)
          }
          .height('15%')

          // 3. duration 属性测试 - number类型，需要覆盖null/undefined
          Text('3. duration 属性测试')
          Row(){
            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#E1BEE7')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_duration_default')

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#FFCCBC')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_duration_null')
            .duration(null)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#C5CAE9')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_duration_undefined')
            .duration(undefined)
          }
          .height('15%')

          // 4. itemSpace 属性测试 - number | string类型，需要覆盖null/undefined，string空值
          Text('4. itemSpace 属性测试')
          Row(){
            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('23%')
                  .height('100%')
                  .backgroundColor('#B2DFDB')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_itemSpace_default')
            .displayCount(2)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('23%')
                  .height('100%')
                  .backgroundColor('#DCEDC8')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_itemSpace_null')
            .itemSpace(null)
            .displayCount(2)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('23%')
                  .height('100%')
                  .backgroundColor('#FFF9C4')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_itemSpace_undefined')
            .itemSpace(undefined)
            .displayCount(2)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('23%')
                  .height('100%')
                  .backgroundColor('#FFECB3')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_itemSpace_empty_string')
            .itemSpace('')
            .displayCount(2)
          }
          .height('15%')

          // 5. curve 属性测试 - Curve | string | ICurve类型
          Text('5. curve 属性测试')
          Row(){
            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('20%')
                  .height('100%')
                  .backgroundColor('#FFE0B2')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_curve_default')

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('20%')
                  .height('100%')
                  .backgroundColor('#C8E6C9')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_curve_null')
            .curve(null)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('20%')
                  .height('100%')
                  .backgroundColor('#BBDEFB')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_curve_undefined')
            .curve(undefined)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('20%')
                  .height('100%')
                  .backgroundColor('#F8BBD0')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_curve_string')
            .curve('ease-in-out')

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('20%')
                  .height('100%')
                  .backgroundColor('#D1C4E9')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_curve_empty_string')
            .curve('')
          }
          .height('15%')

          // 6. indicatorInteractive 属性测试 - boolean类型，需要覆盖false值
          Text('6. indicatorInteractive 属性测试')
          Row(){
            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#FFF9C4')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_indicatorInteractive_default')
            .indicator(true)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#E1BEE7')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_indicatorInteractive_true')
            .indicatorInteractive(true)
            .indicator(true)

            Swiper() {
              ForEach([1, 2, 3, 4], (item: number) => {
                Text('Page ' + item.toString())
                  .width('30%')
                  .height('100%')
                  .backgroundColor('#FFCCBC')
                  .textAlign(TextAlign.Center)
              })
            }
            .id('swiper_indicatorInteractive_false')
            .indicatorInteractive(false)
            .indicator(true)
          }
          .height('15%')

        }
      }
      .height('100%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}