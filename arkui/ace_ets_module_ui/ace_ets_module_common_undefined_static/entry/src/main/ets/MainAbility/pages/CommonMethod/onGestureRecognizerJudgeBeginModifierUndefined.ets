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
  GestureJudgeResult,
  AttributeModifier,
  CommonAttribute,
  ColumnOptions,
  ScrollDirection,
  HorizontalAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
class MyGestureRecognizerModifier implements AttributeModifier<CommonAttribute> {
  @State public change: boolean = true;
  private childRecognizer: GestureRecognizer = new GestureRecognizer();
  private currentRecognizer: GestureRecognizer = new GestureRecognizer();
  @State public count: Int = 0;

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.change) {
      instance.onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
        others: Array<GestureRecognizer>) => {
        this.count += 1;
        return GestureJudgeResult.CONTINUE;
      });
    } else {
      instance.onGestureRecognizerJudgeBegin(undefined);
    }
  }
}

@Entry
@Component
struct DemoPage {
  @State modDynamic: MyGestureRecognizerModifier = new MyGestureRecognizerModifier()
  private outerScroller: Scroller = new Scroller();
  private innerScroller: Scroller = new Scroller();

  aboutToAppear() {
    this.modDynamic.change = true;
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
        Scroll(this.outerScroller) {
          Column() {
            Text('Scroll Area')
              .width('92%')
              .height(100)
              .borderRadius(12)
              .fontSize(16)
              .margin({ top: 8 } as Margin)
            Scroll(this.innerScroller) {
              Column() {
                Text('count' + this.modDynamic.count)
                  .width('90%')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 10 } as Margin)
                  .id('commonmethod_onGestureRecognizerJudgeBeginModifier2')
                for (let i = 0; i < 6; i++) {
                  Text(`item ${i}`)
                    .width('90%')
                    .height(150)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .focusable(true)
                    .focusOnTouch(true)
                }
              }
              .width('100%')
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
              .id('commonmethod_onGestureRecognizerJudgeBeginModifier3')
            Text('Scroll Area3')
              .width('90%')
              .height(150)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
              .height('10%')
          }
          .width('100%').padding(8)
          .alignItems(HorizontalAlign.Center)
        }
        .attributeModifier(this.modDynamic)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Gray)
        .scrollBarWidth(10)

        Column() {
          Button('undefined' + this.modDynamic.change)
            .onClick(() => {
              this.modDynamic.change = !this.modDynamic.change
            })
            .id('button_onGestureRecognizerJudgeBeginModifier')
        }
      }
    .width('100%').height('100%')
  }
}
