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

@ObservedV2
class ItemInfo {
  @Trace public info: string;
  @Trace public color: string;
  public key: string;
  constructor(info: string, color: string) {
    this.info = info;
    this.color = color;
    this.key = info;
  }
}

@ComponentV2
struct AnimGridItemContent {
  @Param @Require info: string;
  @Param @Require color: string;
  @Param @Require index: number;
  @Consumer() createCount: number = 0;
  private myId: number = -1;

  aboutToAppear(): void {
    this.createCount = this.createCount + 1;
    this.myId = this.createCount;
  }

  build() {
    Text(this.info)
      .id(`item_${this.index}`)
      .fontSize(10)
      .backgroundColor(this.color)
      .width(150)
      .height(50)
      .border({ width: 1 })
      .transition(TransitionEffect.translate({ x: 300 }))
  }
}

@Entry
@ComponentV2
struct RepeatAllowReuseInAnimationGrid {
  @Local dataArray: Array<ItemInfo> = [];
  private count: number = 0;
  @Provider() createCount: number = 0;

  aboutToAppear(): void {
    for (let i = 0; i < 5; i++) {
      this.dataArray.push(new ItemInfo(`Item ${i}`, `#FFFFFF`));
    }
  }

  build() {
    Column({ space: 3 }) {
      // 操作按钮区
      Row({ space: 2 }) {
        Button('Add')
          .id('addBtn')
          .width(80)
          .onClick(() => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              this.dataArray.splice(0, 0, new ItemInfo(`New item ${this.count++}`, `#FFFFFF`))
            })
          })
        Button('Delete')
          .id('deleteBtn')
          .width(80)
          .onClick(() => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              this.dataArray.splice(0, 1)
            })
          })
      }
      .height('6%')

      Row({ space: 2 }) {
        Button('Exchange')
          .id('exchangeBtn')
          .width(70)
          .onClick(() => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              let temp = this.dataArray[1];
              this.dataArray[1] = this.dataArray[0]
              this.dataArray[0] = temp;
            })
          })
        Button('UpdateSameKey')
          .id('updateSameKeyBtn')
          .width(70)
          .onClick(() => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              this.dataArray[0].info = 'Item updated';
              this.dataArray[0].color = '#86C5E3';
            })
          })
        Button('UpdateNewKey')
          .id('updateNewKeyBtn')
          .width(70)
          .onClick(() => {
            this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              this.dataArray[0] = new ItemInfo(`Replaced ${this.count++}`, '#86C5E3');
            })
          })
      }
      .height('6%')

      // 复用计数显示
      Text(`createCount: ${this.createCount.toString()}`)
        .id('createCountText')
        .fontSize(10)
        .height('3%')

      // Grid 容器
      Grid() {
        Repeat(this.dataArray, { allowReuseInAnimation: true })
          .each((repeatItem: RepeatItem<ItemInfo>) => {
            GridItem() {
              AnimGridItemContent({ info: repeatItem.item.info, color: repeatItem.item.color, index: repeatItem.index })
            }
          })
          .key((item: ItemInfo, index: number) => item.key)
          .virtualScroll()
      }
      .columnsTemplate('1fr')
      .id('animReuseGrid')
      .height('55%')
      .width('80%')
      .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}
