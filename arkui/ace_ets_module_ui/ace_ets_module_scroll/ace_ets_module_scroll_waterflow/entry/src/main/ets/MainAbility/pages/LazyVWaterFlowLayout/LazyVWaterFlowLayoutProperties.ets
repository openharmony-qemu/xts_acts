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
import { LengthMetrics, LazyVWaterFlowLayout, LazyVWaterFlowLayoutAttribute } from '@kit.ArkUI';

@Entry
@Component
struct LazyVWaterFlowLayoutProperties {

  build() {
    Column() {
      Text('columnsTemplate 属性测试')
      Scroll() {
        Column() {
          Row(){
            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFE0B2')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsTemplate_default')
              .onVisibleIndexesChange((start: number, end: number) => {
                AppStorage.setOrCreate('LazyVWaterFlowLayout_onVisible', 'success');
                console.info('LazyVWaterFlowLayout visible indexes: start: ' + start + ', end: ' + end);
              })
            }
            .width('30%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#C8E6C9')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsTemplate_string')
              .columnsTemplate('1fr 1fr')
            }
            .width('30%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#BBDEFB')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsTemplate_itemFillPolicy')
              .columnsTemplate({ fillType: PresetFillType.BREAKPOINT_DEFAULT } as ItemFillPolicy)
            }
            .width('30%')
          }
          .height('15%')

          Row(){
            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#F8BBD0')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsTemplate_string2')
              .columnsTemplate('repeat(auto-fill, 100vp)')
            }
            .width('30%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#D1C4E9')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsTemplate_undefined')
              .columnsTemplate(undefined)
            }
            .width('30%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFF9C4')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsTemplate_null')
              .columnsTemplate(null)
              .onVisibleIndexesChange(null)
            }
            .width('30%')
          }
          .height('15%')

          Text('columnsGap 属性测试')
          Row(){
            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#E1BEE7')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsGap_default')
              .columnsTemplate('1fr 1fr')
              .onVisibleIndexesChange(undefined)
            }
            .width('30%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFCCBC')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsGap_vp')
              .columnsTemplate('1fr 1fr')
              .columnsGap(LengthMetrics.vp(10))
            }
            .width('30%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#C5CAE9')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsGap_px')
              .columnsTemplate('1fr 1fr')
              .columnsGap(LengthMetrics.px(20))
            }
            .width('30%')
          }
          .height('15%')

          Row(){
            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#B2DFDB')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsGap_undefined')
              .columnsTemplate('1fr 1fr')
              .columnsGap(undefined)
            }
            .width('40%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#DCEDC8')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_columnsGap_null')
              .columnsTemplate('1fr 1fr')
              .columnsGap(null)
            }
            .width('40%')
          }
          .height('15%')

          Text('rowsGap 属性测试')
          Row(){
            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFF9C4')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_rowsGap_default')
              .columnsTemplate('1fr 1fr')
              .onVisibleIndexesChange((start: number, end: number) => {
                console.info('LazyVWaterFlowLayout visible indexes: start: ' + start + ', end: ' + end);
              })
            }
            .width('30%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFECB3')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_rowsGap_vp')
              .columnsTemplate('1fr 1fr')
              .rowsGap(LengthMetrics.vp(10))
            }
            .width('30%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFE0B2')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_rowsGap_px')
              .columnsTemplate('1fr 1fr')
              .rowsGap(LengthMetrics.px(20))
            }
            .width('30%')
          }
          .height('15%')

          Row(){
            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#D7CCC8')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_rowsGap_undefined')
              .columnsTemplate('1fr 1fr')
              .rowsGap(undefined)
            }
            .width('40%')

            Scroll(){
              LazyVWaterFlowLayout() {
                ForEach([1, 2, 3, 4, 5], (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(16)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#CFD8DC')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyVWaterFlow_rowsGap_null')
              .columnsTemplate('1fr 1fr')
              .rowsGap(null)
            }
            .width('40%')
          }
          .height('15%')

        }
      }
      .height('100%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#DCDCDC')
  }
}