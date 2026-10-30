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
 * 本页面验证通过AttributeModifier方式设置.enableScrollWithKeyboard(true)后，
 * 纵向Scroll组件获焦后可响应键盘方向键(上/下)滚动。
 */
class MyScrollKeyboardModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.enableScrollWithKeyboard(true);
  }
}

@Entry
@Component
struct ScrollKeyboardModifier {
  private readonly ten: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @State modifier: MyScrollKeyboardModifier = new MyScrollKeyboardModifier();
  @State vOff: string = '0';
  private vScroller: Scroller = new Scroller();

  build() {
    Column({ space: 5 }) {
      Text('enableScrollWithKeyboard: true (modifier)')
        .id('SCROLL_KB_MOD_STATE')
        .fontSize(12)
        .fontColor('#666666')
        .height('4%')

      Row() {
        Button('reset')
          .id('SCROLL_KB_MOD_RESET')
          .fontSize(14)
          .onClick(() => {
            this.vScroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }
      .height('6%')

      Text(`offset=${this.vOff}`)
        .id('SCROLL_KB_MOD_OFFSET')
        .fontSize(12)
        .height('4%')

      Scroll(this.vScroller) {
        Column() {
          ForEach(this.ten, (item: number) => {
            Text(`${item}`)
              .width('100%')
              .height(60)
              .textAlign(TextAlign.Center)
              .fontSize(12)
              .backgroundColor(item % 2 === 0 ? '#E8F3FF' : '#D6E4FF')
              .borderRadius(6)
              .focusable(true)
          }, (item: number) => `mkb_${item}`)
        }
      }
      .id('SCROLL_KB_MOD')
      .attributeModifier(this.modifier)
      .scrollable(ScrollDirection.Vertical)
      .focusOnTouch(true)
      .backgroundColor('#E3E8F0')
      .borderRadius(6)
      .width('100%')
      .height('60%')
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
