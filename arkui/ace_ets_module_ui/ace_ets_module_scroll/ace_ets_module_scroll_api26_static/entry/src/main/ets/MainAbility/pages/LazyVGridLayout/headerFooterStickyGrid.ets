'use static';
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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Row,
  RowOptions,
  Button,
  Text,
  Scroll,
  Scroller,
  LazyVGridLayout,
  LazyForEach,
  ForEach,
  Color,
  StickyStyle,
  FontWeight,
  TextAlign,
  FlexAlign,
  HorizontalAlign,
  ScrollState,
  ScrollSource,
  ItemFillPolicy,
  PresetFillType,
  BorderStyle
} from '@ohos.arkui.component'
import { State, AppStorage, Local, Param } from '@ohos.arkui.stateManagement'
import { LengthMetrics } from '@ohos.arkui.node'

@Entry
@Component
struct LazyVGridLayoutHeaderFooterSticky {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6] as number[]

  @Builder
  HeaderBuilder() {
    Column() {
      Text('Header')
        .id('lazy_grid_header')
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
        .id('lazy_grid_footer')
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
      Text('LazyVGridLayout header/footer/sticky')

      Scroll() {
        Column() {
          // 1. header 属性测试
          Text('1. header 属性测试').fontSize(10)
          Row() {
            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_header_default')
              .columnsTemplate('1fr 1fr')
              .sticky(StickyStyle.Header)
            }
            .width('30%')

            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_header_builder')
              .columnsTemplate('1fr 1fr')
              .sticky(StickyStyle.Header)
              .header(this.HeaderBuilder)
            }
            .width('30%')

            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_header_undefined')
              .columnsTemplate('1fr 1fr')
              .sticky(StickyStyle.Header)
              .header(undefined)
            }
            .width('30%')
          }
          .height('20%')

          // 2. footer 属性测试
          Text('2. footer 属性测试').fontSize(10)
          Row() {
            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_footer_default')
              .columnsTemplate('1fr 1fr')
              .sticky(StickyStyle.Footer)
            }
            .width('30%')

            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_footer_builder')
              .columnsTemplate('1fr 1fr')
              .sticky(StickyStyle.Footer)
              .footer(this.FooterBuilder)
            }
            .width('30%')

            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_footer_undefined')
              .columnsTemplate('1fr 1fr')
              .sticky(StickyStyle.Footer)
              .footer(undefined)
            }
            .width('30%')
          }
          .height('20%')

          // 3. sticky 属性测试
          Text('3. sticky 属性测试').fontSize(10)
          Row() {
            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_sticky_default')
              .columnsTemplate('1fr 1fr')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
            }
            .width('25%')

            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_sticky_none')
              .columnsTemplate('1fr 1fr')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(StickyStyle.None)
            }
            .width('25%')

            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_sticky_header')
              .columnsTemplate('1fr 1fr')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(StickyStyle.Header)
            }
            .width('25%')

            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_sticky_footer')
              .columnsTemplate('1fr 1fr')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(StickyStyle.Footer)
            }
            .width('25%')
          }
          .height('20%')

          Row() {
            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_sticky_both')
              .columnsTemplate('1fr 1fr')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(StickyStyle.BOTH)
            }
            .width('45%')

            Scroll() {
              LazyVGridLayout() {
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
              .id('lazyVGrid_sticky_undefined')
              .columnsTemplate('1fr 1fr')
              .header(this.HeaderBuilder)
              .footer(this.FooterBuilder)
              .sticky(undefined)
            }
            .width('45%')
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