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
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';

@Entry
@Component
struct ScrollerGetFrameNodePage {
  private unboundScroller: Scroller = new Scroller();
  private scrollScroller: Scroller = new Scroller();
  private listScroller: Scroller = new Scroller();
  private gridScroller: Scroller = new Scroller();
  private dynamicScroller: Scroller = new Scroller();

  @State unboundResult: string = 'Not tested';
  @State scrollResult: string = 'Not tested';
  @State listResult: string = 'Not tested';
  @State gridResult: string = 'Not tested';
  @State dynamicResult: string = 'Not tested';
  @State bindResult: string = 'Not bound';

  private static readonly SCROLL_ID: string = 'SCROLL_COMPONENT_ID';
  private static readonly LIST_ID: string = 'LIST_COMPONENT_ID';
  private static readonly GRID_ID: string = 'GRID_COMPONENT_ID';

  @State scrollItems: number[] = [];
  @State listItems: number[] = [];
  @State gridItems: number[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      this.scrollItems.push(i);
      this.listItems.push(i);
      this.gridItems.push(i);
    }
  }

  onDidBuild(): void {
    this.testUnboundScroller();
    this.testScrollScroller();
    this.testListScroller();
    this.testGridScroller();
  }

  private testUnboundScroller(): void {
    const frameNode = this.unboundScroller.getFrameNode();
    if (frameNode === undefined) {
      this.unboundResult = 'getFrameNode returns undefined';
    } else {
      this.unboundResult = 'getFrameNode returns, type: ' + frameNode.getNodeType();
    }
  }

  private testScrollScroller(): void {
    const frameNode = this.scrollScroller.getFrameNode();
    if (frameNode === undefined) {
      this.scrollResult = 'getFrameNode returns undefined';
    } else {
      this.scrollResult = 'getFrameNode returns, type: ' + frameNode.getNodeType();
    }
  }

  private testListScroller(): void {
    const frameNode = this.listScroller.getFrameNode();
    if (frameNode === undefined) {
      this.listResult = 'getFrameNode returns undefined';
    } else {
      this.listResult = 'getFrameNode returns, type: ' + frameNode.getNodeType();
    }
  }

  private testGridScroller(): void {
    const frameNode = this.gridScroller.getFrameNode();
    if (frameNode === undefined) {
      this.gridResult = 'getFrameNode returns undefined';
    } else {
      this.gridResult = 'getFrameNode returns, type: ' + frameNode.getNodeType();
    }
  }

  private testDynamicScroller(): void {
    const frameNode = this.dynamicScroller.getFrameNode();
    if (frameNode === undefined) {
      this.dynamicResult = 'getFrameNode returns undefined';
    } else {
      this.dynamicResult = 'getFrameNode returns, type: ' + frameNode.getNodeType();
    }
  }

  private bindToScroll(): void {
    const frameNode = this.getUIContext().getFrameNodeById(ScrollerGetFrameNodePage.SCROLL_ID);
    if (!frameNode) {
      this.bindResult = 'Bind failed: FrameNode is null';
      return;
    }
    try {
      typeNode.bindController(frameNode, this.dynamicScroller, 'Scroll');
      this.bindResult = 'Bind success to Scroll';
      this.testDynamicScroller();
    } catch (e) {
      this.bindResult = 'Bind failed: ' + e.message;
    }
  }

  private bindToList(): void {
    const frameNode = this.getUIContext().getFrameNodeById(ScrollerGetFrameNodePage.LIST_ID);
    if (!frameNode) {
      this.bindResult = 'Bind failed: FrameNode is null';
      return;
    }
    try {
      typeNode.bindController(frameNode, this.dynamicScroller, 'List');
      this.bindResult = 'Bind success to List';
      this.testDynamicScroller();
    } catch (e) {
      this.bindResult = 'Bind failed: ' + e.message;
    }
  }

  private bindToGrid(): void {
    const frameNode = this.getUIContext().getFrameNodeById(ScrollerGetFrameNodePage.GRID_ID);
    if (!frameNode) {
      this.bindResult = 'Bind failed: FrameNode is null';
      return;
    }
    try {
      typeNode.bindController(frameNode, this.dynamicScroller, 'Grid');
      this.bindResult = 'Bind success to Grid';
      this.testDynamicScroller();
    } catch (e) {
      this.bindResult = 'Bind failed: ' + e.message;
    }
  }

  build() {
    Scroll() {
      Column() {
        Text('Scroller getFrameNode Tests')

        Text('Unbound Scroller: ' + this.unboundResult)
          .id('text_unbound_result')
          .fontSize(12)

        Text('Scroll Scroller: ' + this.scrollResult)
          .id('text_scroll_result')
          .fontSize(12)

        Text('List Scroller: ' + this.listResult)
          .id('text_list_result')
          .fontSize(12)

        Text('Grid Scroller: ' + this.gridResult)
          .id('text_grid_result')
          .fontSize(12)

        Text('Dynamic Scroller: ' + this.dynamicResult)
          .id('text_dynamic_result')
          .fontSize(12)

        Text('Bind Status: ' + this.bindResult)
          .id('text_bind_result')
          .fontSize(12)

        Row() {
          Button('Bind to Scroll')
            .width('30%')
            .id('button_bind_scroll')
            .onClick(() => {
              this.bindToScroll();
            })

          Button('Bind to List')
            .width('30%')
            .id('button_bind_list')
            .onClick(() => {
              this.bindToList();
            })

          Button('Bind to Grid')
            .width('30%')
            .id('button_bind_grid')
            .onClick(() => {
              this.bindToGrid();
            })
        }.height('6%')

        Divider()

        Text('Scroll Component')
          .fontSize(10)
          .fontWeight(FontWeight.Medium)

        Scroll(this.scrollScroller) {
          Column() {
            ForEach(this.scrollItems, (item: number) => {
              Text('Scroll Item ' + item)
                .width('100%')
                .height('20%')
                .backgroundColor('#F0F0F0')
                .borderRadius(5)
                .textAlign(TextAlign.Center)
            })
          }
        }
        .id(ScrollerGetFrameNodePage.SCROLL_ID)
        .width('100%')
        .height('15%')
        .scrollBar(BarState.On)

        Divider()

        Text('List Component')
          .fontSize(10)
          .fontWeight(FontWeight.Medium)

        List({ scroller: this.listScroller }) {
          ForEach(this.listItems, (item: number) => {
            ListItem() {
              Text('List Item ' + item)
                .width('100%')
                .height('20%')
                .backgroundColor('#E0E0E0')
                .borderRadius(5)
                .textAlign(TextAlign.Center)
            }
          })
        }
        .id(ScrollerGetFrameNodePage.LIST_ID)
        .width('100%')
        .height('15%')
        .scrollBar(BarState.On)

        Divider()

        Text('Grid Component')
          .fontSize(10)
          .fontWeight(FontWeight.Medium)

        Grid(this.gridScroller) {
          ForEach(this.gridItems, (item: number) => {
            GridItem() {
              Text('Grid ' + item)
                .width('100%')
                .height('20%')
                .backgroundColor('#D0D0D0')
                .borderRadius(5)
                .textAlign(TextAlign.Center)
            }
          })
        }
        .id(ScrollerGetFrameNodePage.GRID_ID)
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('100%')
        .height('15%')
        .scrollBar(BarState.On)
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}