import { Entry, Column, Component,Text, List, ForEach, ListItem, TextAlign, ScrollSource, ScrollState, ScrollResult,OnScrollFrameBeginHandlerResult,
  Axis, BarState, EdgeEffect, VisibleListContentInfo, Padding, Scroller, Flex, Scroll, Color} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct NestedScroll {
  @State listPosition: number = 0; // 0代表滚动到List顶部，1代表中间值，2代表滚动到List底部。
  private arr:Array<number> = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  private scrollerForScroll: Scroller = new Scroller()
  private scrollerForList: Scroller = new Scroller()
  @State scrollStateValue: number = 0

  build() {
    Flex() {
      Scroll(this.scrollerForScroll) {
        Column() {
          List({ space: 20, scroller: this.scrollerForList }) {
            ForEach(this.arr, (item: number) => {
              ListItem() {
                Text("ListItem" + item)
                  .width("100%")
                  .height("100%")
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(Color.White)
              }.width("100%").height(100)
            }, (item: number) => item.toString())
          }
          .id('list_offsetRemain')
          .width("100%")
          .height("80%")
          .edgeEffect(EdgeEffect.None)
          .friction(0.6)
          .onReachStart(() => {
            this.listPosition = 0
          })
          .onReachEnd(() => {
            this.listPosition = 2
          })
          .onScrollFrameBegin((offset: number, state: ScrollState):OnScrollFrameBeginHandlerResult => {
            this.listPosition = 1
            this.scrollStateValue = offset
            return { offsetRemain: offset };
          })
          Text((this.scrollStateValue).toString())
            .id("offsetRemain")
            .width("100%")
            .height("20%")
            .backgroundColor(0X330000FF)
            .fontSize(16)
            .textAlign(TextAlign.Center)
        }
      }
      .width("100%").height("100%")
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding(20)
  }
}