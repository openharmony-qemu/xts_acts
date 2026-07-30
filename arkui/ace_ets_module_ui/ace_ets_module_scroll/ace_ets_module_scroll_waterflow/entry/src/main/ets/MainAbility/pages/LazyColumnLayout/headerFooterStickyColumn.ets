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
struct LazyColumnLayoutHeaderFooterSticky {
  @State arr: number[] = []

  aboutToAppear() {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i)
    }
  }
  @Builder
  HeaderBuilder() {
    Column() {
      Text('Header')
        .id('lazy_column_header')
        .fontSize(14)
        .fontColor(Color.Black)
    }
    .height('10%')
    .width('100%')
    .backgroundColor('#BBDEFB')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  FooterBuilder() {
    Column() {
      Text('Footer')
        .id('lazy_column_footer')
        .fontSize(14)
        .fontColor(Color.Black)
    }
    .height('10%')
    .width('100%')
    .backgroundColor('#D1C4E9')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Text('LazyColumnLayout header/footer/sticky')

      Scroll() {
        Column() {
          // 1. header 属性测试
          Text('1. header 属性测试').fontSize(10)
          Row() {
            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFE0B2')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_header_default')
              .sticky(StickyStyle.Header)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#C8E6C9')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_header_builder')
              .sticky(StickyStyle.Header)
              .header(this.HeaderBuilder)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#BBDEFB')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_header_null')
              .sticky(StickyStyle.Header)
              .header(null)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#F8BBD0')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_header_undefined')
              .sticky(StickyStyle.Header)
              .header(undefined)
            }
            .width('25%')
          }
          .height('20%')

          // 2. footer 属性测试
          Text('2. footer 属性测试').fontSize(10)
          Row() {
            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#D1C4E9')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_footer_default')
              .sticky(StickyStyle.Footer)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFF9C4')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_footer_builder')
              .sticky(StickyStyle.Footer)
              .footer(this.FooterBuilder)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#E1BEE7')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_footer_null')
              .sticky(StickyStyle.Footer)
              .footer(null)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFCCBC')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_footer_undefined')
              .sticky(StickyStyle.Footer)
              .footer(undefined)
            }
            .width('25%')
          }
          .height('20%')

          // 3. sticky 属性测试
          Text('3. sticky 属性测试').fontSize(10)
          Row() {
            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#C5CAE9')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_sticky_default')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#B2DFDB')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_sticky_none')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(StickyStyle.None)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#DCEDC8')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_sticky_header')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(StickyStyle.Header)
            }
            .width('25%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFF9C4')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_sticky_footer')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(StickyStyle.Footer)
            }
            .width('25%')
          }
          .height('20%')

          Row() {
            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFECB3')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_sticky_both')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(StickyStyle.BOTH)
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#FFE0B2')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_sticky_null')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(null)
            }
            .width('30%')

            Scroll() {
              LazyColumnLayout() {
                ForEach(this.arr, (item: number) => {
                  Column() {
                    Text('item ' + item.toString())
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .height('30%')
                  .width('100%')
                  .backgroundColor('#C8E6C9')
                  .justifyContent(FlexAlign.Center)
                })
              }
              .id('lazyColumn_sticky_undefined')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(undefined)
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
    .backgroundColor('#C0C0C0')
  }
}