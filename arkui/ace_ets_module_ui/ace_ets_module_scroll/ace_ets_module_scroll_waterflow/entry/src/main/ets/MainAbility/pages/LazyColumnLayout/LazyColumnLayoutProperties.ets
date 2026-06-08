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
import { LengthMetrics, LazyColumnLayout, LazyColumnLayoutAttribute } from '@kit.ArkUI';

@Entry
@Component
struct LazyColumnLayoutProperties {
  build() {
    Column() {
      Text('LazyColumnLayout 属性测试')
      Scroll() {
        Column() {
          Text('space 属性测试')
          Row(){
            Scroll() {
              LazyColumnLayout() {
                ForEach([1, 2, 3, 4], (item: number) => {
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
              .id('lazyColumn_space_default')
              .onVisibleIndexesChange((start: number, end: number) => {
                AppStorage.setOrCreate('LazyColumnLayout_onVisible', 'success');
                console.info('LazyColumnLayout visible indexes: start: ' + start + ', end: ' + end);
              })
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                ForEach([1, 2, 3, 4], (item: number) => {
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
              .id('lazyColumn_space_vp')
              .space(LengthMetrics.vp(10))
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                ForEach([1, 2, 3, 4], (item: number) => {
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
              .id('lazyColumn_space_px')
              .space(LengthMetrics.px(20))
            }
            .width('30%')
          }
          .height('20%')

          Row(){
            Scroll() {
              LazyColumnLayout() {
                ForEach([1, 2, 3, 4], (item: number) => {
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
              .id('lazyColumn_space_negative')
              .space(LengthMetrics.vp(-10))
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                ForEach([1, 2, 3, 4], (item: number) => {
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
              .id('lazyColumn_space_undefined')
              .space(undefined)
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                ForEach([1, 2, 3, 4], (item: number) => {
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
              .id('lazyColumn_space_null')
              .space(null)
              .onVisibleIndexesChange(null)
            }
            .width('30%')
          }
          .height('20%')

          Text('alignItems 属性测试')
          Row(){
            Scroll() {
              LazyColumnLayout() {
                ForEach([1, 2, 3], (item: number) => {
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
              .id('lazyColumn_alignItems_default')
              .onVisibleIndexesChange(undefined)
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                Text('Start')
                ForEach([1, 2, 3], (item: number) => {
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
              .id('lazyColumn_alignItems_start')
              .alignItems(HorizontalAlign.Start)
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                Text('Center')
                ForEach([1, 2, 3], (item: number) => {
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
              .id('lazyColumn_alignItems_center')
              .alignItems(HorizontalAlign.Center)
            }
            .width('30%')
          }
          .height('20%')

          Row(){
            Scroll() {
              LazyColumnLayout() {
                Text('End')
                ForEach([1, 2, 3], (item: number) => {
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
              .id('lazyColumn_alignItems_end')
              .alignItems(HorizontalAlign.End)
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                Text('undefined')
                ForEach([1, 2, 3], (item: number) => {
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
              .id('lazyColumn_alignItems_undefined')
              .alignItems(undefined)
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                Text('null')
                ForEach([1, 2, 3], (item: number) => {
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
              .id('lazyColumn_alignItems_null')
              .alignItems(null)
            }
            .width('30%')
          }
          .height('20%')

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