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
 * Scroll组件enableScrollWithKeyboard从API 26.2.0开始新增，设置是否支持键盘方向键滚动：
 * 组件获焦且未激活焦点态时会响应键盘方向键滚动。
 * 属性值设置为undefined表示使用默认值；设置为null同样恢复默认值。默认值：true。
 * 本页面为横向Scroll响应方向键(左/右)滚动的验证页面。
 */
@Entry
@Component
struct ScrollKeyboardHorizontal {
  private readonly ten: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  // enableScrollWithKeyboard属性值：0-true 1-false 2-undefined 3-null
  @State keyboardScroll: (boolean | undefined | null)[] = [true, false, undefined, null];
  @State changeIndex: number = 0;
  @State hOff: string = '0';
  private hScroller: Scroller = new Scroller();

  build() {
    Column({ space: 5 }) {
      Text(`enableScrollWithKeyboard: ${this.keyboardScroll[this.changeIndex]}`)
        .id('H_SCROLL_KB_STATE')
        .fontSize(12)
        .fontColor('#666666')
        .height('4%')

      Row() {
        Button('true')
          .id('H_SCROLL_KB_TRUE')
          .fontSize(14)
          .onClick(() => {
            this.changeIndex = 0;
          })

        Button('false')
          .id('H_SCROLL_KB_FALSE')
          .fontSize(14)
          .onClick(() => {
            this.changeIndex = 1;
          })
      }
      .height('5%')

      Row() {
        Button('undefined')
          .id('H_SCROLL_KB_UNDEF')
          .fontSize(14)
          .onClick(() => {
            this.changeIndex = 2;
          })

        Button('null')
          .id('H_SCROLL_KB_NULL')
          .fontSize(14)
          .onClick(() => {
            this.changeIndex = 3;
          })

        Button('reset')
          .id('H_SCROLL_KB_RESET')
          .fontSize(14)
          .onClick(() => {
            this.hScroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }
      .height('5%')

      Text(`offset=${this.hOff}`)
        .id('H_SCROLL_KB_OFFSET')
        .fontSize(12)
        .height('4%')

      Scroll(this.hScroller) {
        Row({ space: 3 }) {
          ForEach(this.ten, (item: number) => {
            Text(`${item}`)
              .width(80)
              .height('100%')
              .textAlign(TextAlign.Center)
              .fontSize(12)
              .backgroundColor(item % 2 === 0 ? '#E8F3FF' : '#D6E4FF')
              .borderRadius(6)
              .focusable(true)
          }, (item: number) => `hkb_${item}`)
        }
      }
      .id('H_SCROLL_KB')
      .scrollable(ScrollDirection.Horizontal)
      .enableScrollWithKeyboard(this.keyboardScroll[this.changeIndex])
      .focusOnTouch(true)
      .backgroundColor('#E3E8F0')
      .borderRadius(6)
      .width('100%')
      .height('30%')
      .onDidScroll(() => {
        this.hOff = `${Math.round(this.hScroller.currentOffset().xOffset)}`;
      })
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}
