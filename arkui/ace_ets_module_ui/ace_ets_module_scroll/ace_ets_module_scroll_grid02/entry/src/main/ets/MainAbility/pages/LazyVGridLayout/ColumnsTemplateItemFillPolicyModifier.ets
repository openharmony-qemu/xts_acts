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
import { LengthMetrics } from '@kit.ArkUI';
import { MyDataSource } from './MyDataSource';

class LazyVGridColumnsTemplateModifier implements AttributeModifier<LazyVGridLayoutAttribute> {
  public fillType: PresetFillType = PresetFillType.BREAKPOINT_SM1MD2LG3;

  applyNormalAttribute(instance: LazyVGridLayoutAttribute): void {
    instance.columnsTemplate({ fillType: this.fillType } as ItemFillPolicy);
  }
}

@Entry
@Component
struct ColumnsTemplateItemFillPolicyModifier {
  private arr: MyDataSource<number> = new MyDataSource<number>();
  @State columnsTemplateModifier: LazyVGridColumnsTemplateModifier = new LazyVGridColumnsTemplateModifier();

  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.arr.pushData(i);
    }
  }

  build() {
    Column() {
      // 测试1: 通过 attributeModifier 设置 columnsTemplate，
      // fillType 为 PresetFillType.BREAKPOINT_SM1MD2LG3：
      // sm及更小显示1列，md显示2列，lg及更大显示3列
      WaterFlow() {
        LazyVGridLayout() {
          LazyForEach(this.arr, (item: number) => {
            Text('item_' + item.toString())
              .id('modifier_' + item.toString())
              .width('100%')
              .height('20%')
              .borderRadius(5)
              .backgroundColor(0xF9CF93)
              .textAlign(TextAlign.Center)
          })
        }
        .id('lazyVGrid_columnsTemplate_modifier')
        .attributeModifier(this.columnsTemplateModifier)
        .rowsGap(LengthMetrics.vp(10))
        .columnsGap(LengthMetrics.vp(10))
        .backgroundColor(0xF0F0F0)
        .height('40%')
        .margin(5)
      }
      .padding(10)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#DCDCDC')
  }
}
