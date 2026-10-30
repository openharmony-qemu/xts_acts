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
  Text,
  Scroll,
  LazyVGridLayout,
  LazyForEach,
  FontWeight,
  TextAlign,
  HorizontalAlign,
  ScrollDirection,
  ItemFillPolicy,
  PresetFillType,
  Padding,
  BorderOptions
} from '@ohos.arkui.component'
import { LazyColumnLayout } from '@ohos.arkui.components.ArkLazyColumnLayout'
import { LengthMetrics } from '@ohos.arkui.node'
import { MyDataSource } from './MyDataSource'

@Entry
@Component
struct LazyVGridLayoutColumnsTemplateItemFillPolicy {
  private sm1Md2Lg3Data: MyDataSource<number> = new MyDataSource<number>();
  private sm2Md3Lg5Data: MyDataSource<number> = new MyDataSource<number>();
  private defaultData: MyDataSource<number> = new MyDataSource<number>();

  aboutToAppear(): void {
    for (let i = 0; i < 9; i++) {
      this.sm1Md2Lg3Data.pushData(i);
      this.sm2Md3Lg5Data.pushData(i);
      this.defaultData.pushData(i);
    }
  }

  @Builder
  ModeTitle(title: string) {
    Column() {
      Text(title)
        .fontSize(12)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182230')
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding({ bottom: 2 } as Padding)
  }

  @Builder
  ItemFillPolicySm1Md2Lg3Header() {
    this.ModeTitle('ItemFillPolicy: BREAKPOINT_SM1MD2LG3')
  }

  @Builder
  ItemFillPolicySm2Md3Lg5Header() {
    this.ModeTitle('ItemFillPolicy: BREAKPOINT_SM2MD3LG5')
  }

  @Builder
  ItemFillPolicyDefaultHeader() {
    this.ModeTitle('ItemFillPolicy: BREAKPOINT_DEFAULT')
  }

  @Builder
  GridItemBuilder(item: number, backgroundColor: string, itemId: string) {
    Text(item.toString())
      .id(itemId)
      .height(40)
      .width('100%')
      .borderRadius(6)
      .backgroundColor(backgroundColor)
      .fontColor('#182230')
      .textAlign(TextAlign.Center)
  }

  build() {
    Column() {
      Scroll() {
        LazyColumnLayout() {
          // ItemFillPolicy：根据内容区宽度对应的断点类型自动确定列数
          // sm及更小显示1列，md显示2列，lg及更大显示3列
          LazyVGridLayout() {
            LazyForEach(this.sm1Md2Lg3Data, (item: number) => {
              this.GridItemBuilder(item, '#E1D5F2', 'type1_' + item.toString())
            })
          }
          .id('lazyVGrid_columnsTemplate_sm1Md2Lg3')
          .columnsTemplate({ fillType: PresetFillType.BREAKPOINT_SM1MD2LG3 } as ItemFillPolicy)
          .rowsGap(LengthMetrics.vp(8))
          .columnsGap(LengthMetrics.vp(8))
          .header(this.ItemFillPolicySm1Md2Lg3Header)
          .backgroundColor('#F7F9FC')
          .borderRadius(8)

          // ItemFillPolicy：根据内容区宽度对应的断点类型自动确定列数
          // sm及更小显示2列，md显示3列，lg及更大显示5列
          LazyVGridLayout() {
            LazyForEach(this.sm2Md3Lg5Data, (item: number) => {
              this.GridItemBuilder(item, '#FFD9E0', 'type2_' + item.toString())
            })
          }
          .id('lazyVGrid_columnsTemplate_sm2Md3Lg5')
          .columnsTemplate({ fillType: PresetFillType.BREAKPOINT_SM2MD3LG5 } as ItemFillPolicy)
          .rowsGap(LengthMetrics.vp(8))
          .columnsGap(LengthMetrics.vp(8))
          .header(this.ItemFillPolicySm2Md3Lg5Header)
          .backgroundColor('#F7F9FC')
          .borderRadius(8)

          // ItemFillPolicy：根据内容区宽度对应的断点类型自动确定列数
          // sm及更小显示2列，md显示3列，lg及更大显示5列
          LazyVGridLayout() {
            LazyForEach(this.defaultData, (item: number) => {
              this.GridItemBuilder(item, '#D2F5F0', 'type3_' + item.toString())
            })
          }
          .id('lazyVGrid_columnsTemplate_default')
          .columnsTemplate({ fillType: PresetFillType.BREAKPOINT_DEFAULT } as ItemFillPolicy)
          .rowsGap(LengthMetrics.vp(8))
          .columnsGap(LengthMetrics.vp(8))
          .header(this.ItemFillPolicyDefaultHeader)
          .backgroundColor('#F7F9FC')
          .borderRadius(8)
        }
        .space(LengthMetrics.vp(5))
        .width('100%')
      }
      .width('100%')
      .scrollable(ScrollDirection.Vertical)
      .layoutWeight(1)
    }
    .padding(10)
    .margin(10)
    .width('100%')
    .height('100%')
  }
}
