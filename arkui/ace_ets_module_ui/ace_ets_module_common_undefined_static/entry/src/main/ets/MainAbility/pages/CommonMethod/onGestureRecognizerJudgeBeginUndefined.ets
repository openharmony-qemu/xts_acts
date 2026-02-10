'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Margin,
  FontWeight,
  Scroller,
  Stack,
  BaseGestureEvent,
  GestureRecognizer,
  ClickEvent,
  Alignment,
  Scroll,
  TextAlign,
  ForEach,
  BarState,
  Color,
  GestureJudgeResult
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct FatherControlChild {
  scroller: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  @State change: boolean = true;
  @State count: Int = 0;
  @State arr: Int[] = [0, 1];

  build() {
      Scroll(this.scroller) {
        Column() {
          Text('Scroll Area')
            .width('92%')
            .height(100)
            .borderRadius(12)
            .fontSize(16)
            .margin({ top: 8 } as Margin)
          Scroll(this.scroller2) {
            Column() {
              Text('count' + this.count)
                .width('90%')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 10 } as Margin)
                .id('commonmethod_onGestureRecognizerJudgeBegin2')
              Column() {
                ForEach(this.arr, (item: Int) => {
                  Text('item' + item)
                    .width('90%')
                    .height(150)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .focusable(true)
                    .focusOnTouch(true)
                })
              }.width('100%')
            }
          }
          .width('100%')
          .height('60%')
          Text('Scroll Area2')
            .width('90%')
            .height(150)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 } as Margin)
            .height('10%')
            .id('commonmethod_onGestureRecognizerJudgeBegin3')
          Text('Scroll Area3')
            .width('90%')
            .height(150)
            .borderRadius(15)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .margin({ top: 10 } as Margin)
            .height('10%')
        }
        .width('100%')
        .height('80%')
      }
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .onGestureRecognizerJudgeBegin(this.change ? (event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        this.count += 1;
        return GestureJudgeResult.CONTINUE;
      }:undefined)

      Button('undefined' + this.change)
        .onClick((e: ClickEvent) => {
          this.change = !this.change;
        })
        .id('button_onGestureRecognizerJudgeBegin')

  }
}