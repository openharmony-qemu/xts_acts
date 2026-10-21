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
struct WaterFlowWithMouse {
  private readonly ten: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  // enableScrollWithMouse属性值：undefined表示使用默认值
  @State horizontalMouseScroll: boolean | undefined = undefined;
  @State wfOff: string = '0';
  private wfScroller: Scroller = new Scroller();
 
  build() {
    Column() {
      Text(`enableScrollWithMouse: ${this.horizontalMouseScroll}`)
        .id('WF_MOUSE_STATE')
        .fontSize(12)
        .fontColor('#666666')
 
      Row() {
        Button('default')
          .id('WF_MOUSE_DEFAULT')
          .fontSize(14)
          .onClick(() => {
            this.horizontalMouseScroll = undefined;
          })
 
        Button('reset')
          .id('WF_MOUSE_RESET')
          .fontSize(14)
          .onClick(() => {
            this.wfScroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }
      .height('5%')
 
      Row() {
        Button('true')
          .id('WF_MOUSE_TRUE')
          .fontSize(14)
          .onClick(() => {
            this.horizontalMouseScroll = true;
          })
 
        Button('false')
          .id('WF_MOUSE_FALSE')
          .fontSize(14)
          .onClick(() => {
            this.horizontalMouseScroll = false;
          })
 
        Button('reset')
          .id('WF_MOUSE_RESET')
          .fontSize(14)
          .onClick(() => {
            this.wfScroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }
      .height('5%')
 
      Text(`offset=${this.wfOff}`).id('WF_MOUSE_OFFSET').fontSize(10)
      Column({ space: 2 }) {
        Text('WaterFlow').fontSize(10).fontColor('#666666')
        WaterFlow({ scroller: this.wfScroller }) {
          ForEach(this.ten, (i: number) => {
            FlowItem() {
              Text(`${i}`)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
                .fontSize(12)
                .backgroundColor('#FFFFFF')
                .borderRadius(6)
            }
            .width('30%')
            .height('100%')
          }, (i: number) => `wm_${i}`)
        }
        .id('WF_MOUSE_FLOW')
        .rowsTemplate('1fr')
        .columnsGap(3)
        .layoutDirection(FlexDirection.Row)
        .enableScrollWithMouse(this.horizontalMouseScroll)
        .backgroundColor('#E3E8F0')
        .borderRadius(6)
        .width('100%')
        .height('40%')
        .onDidScroll(() => {
          this.wfOff = `${Math.round(this.wfScroller.currentOffset().xOffset)}`;
        })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}
