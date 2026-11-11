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
class GridSnapStrategyModifier implements AttributeModifier<GridAttribute> {
  public snapStrategy: ScrollSnapAlign = ScrollSnapAlign.CENTER;

  applyNormalAttribute(instance: GridAttribute): void {
    instance.scrollSnapStrategy(this.snapStrategy);
  }
}

@Entry
@Component
struct GridSnapStrategyModifierExample {
  @State arr: string[] = [];
  @State snapStrategyModifier: GridSnapStrategyModifier = new GridSnapStrategyModifier();

  aboutToAppear() {
    let list: string[] = [];
    for (let i = 0; i < 20; i++) {
      list.push(i.toString());
    }
    this.arr = list;
  }

  build() {
    Column({ space: 2 }) {
      // 测试1: 通过 attributeModifier 设置 scrollSnapStrategy 为 ScrollSnapAlign.CENTER
      Grid() {
        ForEach(this.arr, (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(20)
              .backgroundColor(0xF9CF93)
              .width('100%')
              .height('20%')
              .textAlign(TextAlign.Center)
          }
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr')
      .columnsGap(10)
      .rowsGap(20)
      .width('90%')
      .backgroundColor(0xFAEEE0)
      .height('40%')
      .attributeModifier(this.snapStrategyModifier)
      .id('grid_snapStrategy_modifier')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
