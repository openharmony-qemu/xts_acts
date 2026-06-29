/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { LengthMetrics } from '@kit.ArkUI';

class MyScrollBarHeightModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scrollBarHeight(LengthMetrics.vp(50));
  }
}

@Entry
@Component
struct ScrollScrollBarHeightModifier {
  scroller: Scroller = new Scroller();
  @State modifier: MyScrollBarHeightModifier = new MyScrollBarHeightModifier();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  build() {
    Column() {
      Text('scrollBarHeight test').fontSize(14)
      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height('30%')
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 })
          }, (item: number) => item.toString())
        }.width('100%')
      }
      .id('scroll_scrollBarHeight_modifier')
      .attributeModifier(this.modifier)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .friction(0.6)
      .edgeEffect(EdgeEffect.None)
      .height('60%')
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info(xOffset + ', ' + yOffset);
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge');
      })
      .onScrollStop(() => {
        console.info('Scroll Stop');
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}