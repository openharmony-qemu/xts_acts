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

/**
 * enableScrollWithMouse从API 26.0.0开始新增，属性值设置为undefined表示使用默认值：
 * API版本26.2.0之前默认为false；从API版本26.2.0开始，水平滚动组件默认为true。
 */
@Entry
@Component
struct gridScrollWithMouse {
  private readonly ten: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  // enableScrollWithMouse属性值：undefined表示使用默认值
  @State horizontalMouseScroll: boolean | undefined = undefined;
  @State hsOff: string = '0';
  private hsScroller: Scroller = new Scroller();

  build() {
    Column() {
      Text(`enableScrollWithMouse: ${this.horizontalMouseScroll}`)
        .id('H_GRID_STATE')
        .fontSize(12)
        .fontColor('#666666')

      Row() {
        Button('default')
          .id('H_GRID_DEFAULT')
          .fontSize(14)
          .onClick(() => {
            this.horizontalMouseScroll = undefined;
          })

        Button('true')
          .id('H_GRID_TRUE')
          .fontSize(14)
          .onClick(() => {
            this.horizontalMouseScroll = true;
          })

        Button('false')
          .id('H_GRID_FALSE')
          .fontSize(14)
          .onClick(() => {
            this.horizontalMouseScroll = false;
          })

        Button('reset')
          .id('H_GRID_RESET')
          .fontSize(14)
          .onClick(() => {
            this.hsScroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }
      .height('8%')

      Text(`offset=${this.hsOff}`).id('H_GRID_OFFSET').fontSize(10)
      Column({ space: 2 }) {
        Text('Grid').fontSize(10).fontColor('#666666')
        Grid(this.hsScroller) {
          ForEach(this.ten, (i: number) => {
            GridItem() {
              Text(`${i}`)
                .width(120)
                .height('100%')
                .textAlign(TextAlign.Center)
                .fontSize(12)
                .backgroundColor('#FFFFFF')
                .borderRadius(6)
            }
          }, (i: number) => `hs_${i}`)
        }
        .id('H_GRID')
        .rowsTemplate('1fr')
        .columnsGap(3)
        .enableScrollWithMouse(this.horizontalMouseScroll)
        .backgroundColor('#E3E8F0')
        .borderRadius(6)
        .width('100%')
        .height('40%')
        .onDidScroll(() => {
          this.hsOff = `${Math.round(this.hsScroller.currentOffset().xOffset)}`;
        })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}
