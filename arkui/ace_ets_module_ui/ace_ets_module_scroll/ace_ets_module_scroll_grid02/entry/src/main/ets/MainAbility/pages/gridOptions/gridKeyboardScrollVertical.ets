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
 * Grid组件enableScrollWithKeyboard从API 26.2.0开始新增，设置是否支持键盘方向键滚动：
 * 组件获焦且未激活焦点态时会响应键盘方向键滚动。
 * 属性值设置为undefined表示使用默认值；设置为null同样恢复默认值。默认值：true。
 * 本页面为纵向Grid响应方向键(上/下)滚动的验证页面。
 */
@Entry
@Component
struct GridKeyboardScrollVertical {
  private readonly twenty: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
  // enableScrollWithKeyboard属性值：0-true 1-false 2-undefined 3-null
  @State keyboardScroll: (boolean | undefined | null)[] = [true, false, undefined, null];
  @State changeIndex: number = 0;
  @State vOff: string = '0';
  private vScroller: Scroller = new Scroller();

  build() {
    Column({ space: 5 }) {
      Text(`enableScrollWithKeyboard: ${this.keyboardScroll[this.changeIndex]}`)
        .id('VKB_GRID_STATE')
        .fontSize(12)
        .fontColor('#666666')
        .height('4%')

      Row() {
        Button('true')
          .id('VKB_GRID_TRUE')
          .fontSize(14)
          .onClick(() => {
            this.changeIndex = 0;
          })

        Button('false')
          .id('VKB_GRID_FALSE')
          .fontSize(14)
          .onClick(() => {
            this.changeIndex = 1;
          })
      }
      .height('5%')

      Row() {
        Button('undefined')
          .id('VKB_GRID_UNDEF')
          .fontSize(14)
          .onClick(() => {
            this.changeIndex = 2;
          })

        Button('null')
          .id('VKB_GRID_NULL')
          .fontSize(14)
          .onClick(() => {
            this.changeIndex = 3;
          })

        Button('reset')
          .id('VKB_GRID_RESET')
          .fontSize(14)
          .onClick(() => {
            this.vScroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }
      .height('5%')

      Text(`offset=${this.vOff}`)
        .id('VKB_GRID_OFFSET')
        .fontSize(12)
        .height('4%')

      Grid(this.vScroller) {
        ForEach(this.twenty, (item: number) => {
          GridItem() {
            Text(`${item}`)
              .width('100%')
              .height('30%')
              .textAlign(TextAlign.Center)
              .fontSize(12)
              .backgroundColor(item % 2 === 0 ? '#E8F3FF' : '#D6E4FF')
              .focusable(true)
          }
        }, (item: number) => `vkb_${item}`)
      }
      .id('VKB_GRID')
      .columnsTemplate('1fr 1fr')
      .rowsGap(3)
      .enableScrollWithKeyboard(this.keyboardScroll[this.changeIndex])
      .focusOnTouch(true)
      .backgroundColor('#E3E8F0')
      .borderRadius(6)
      .width('100%')
      .height('55%')
      .onDidScroll(() => {
        this.vOff = `${Math.round(this.vScroller.currentOffset().yOffset)}`;
      })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}
