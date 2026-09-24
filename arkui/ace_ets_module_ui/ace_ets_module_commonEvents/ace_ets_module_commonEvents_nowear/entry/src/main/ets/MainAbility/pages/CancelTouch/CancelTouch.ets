/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

@Entry
@Component
struct CancelTouchPage {
  @State cancelResult: string = ''
  scroller: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  private childRecognizer: GestureRecognizer = new GestureRecognizer();
  private currentRecognizer: GestureRecognizer = new GestureRecognizer();
  private lastOffset: number = 0;

  build() {
    Column() {
      Text('CancelTouch Ready')
        .fontSize(20)
        .fontColor(Color.Black)
        .margin({ top: 10 })

      Column() {
        Stack({ alignContent: Alignment.TopStart }) {
          Scroll(this.scroller) {
            Column() {
              Text('Scroll Area -- 父组件')
                .width('90%')
                .fontColor(Color.Black)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .fontSize(16)
                .id('fatherScrollText')
                .textAlign(TextAlign.Center)
                .margin({ top: '5%' })

              Scroll(this.scroller2) {
                Column() {
                  Text('Scroll Area -- 子组件')
                    .width('90%')
                    .fontColor(Color.Black)
                    .backgroundColor(0xFFFFFF)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .margin({ top: '5%' })

                  Column() {
                    ForEach(this.arr, (item: number) => {
                      Text(item.toString())
                        .width('90%')
                        .fontColor(Color.Black)
                        .backgroundColor(0xFFFFFF)
                        .borderRadius(15)
                        .fontSize(16)
                        .textAlign(TextAlign.Center)
                        .margin({ top: '5%' })
                    }, (item: string) => item)
                  }
                  .width('100%')
                }
              }
              .id('inner')
              .width('100%')
              .height('80%')
              .onTouch((event) => {
                console.log('===fy=== inner onTouch, id is: ' + event.target.id)
                console.log('===fy=== inner onTouch, type is: ' + event.type)
              })
            }
            .width('100%')
          }
          .id('outer')
          .height('60%')
          .scrollable(ScrollDirection.Vertical)
          .scrollBar(BarState.On)
          .scrollBarColor(Color.Gray)
          .scrollBarWidth('5%')
          .edgeEffect(EdgeEffect.None)
          .shouldBuiltInRecognizerParallelWith((current: GestureRecognizer, others: Array<GestureRecognizer>) => {
            for (let i = 0; i < others.length; i++) {
              let target = others[i].getEventTargetInfo();
              if (target) {
                if (target.getId() == 'inner' && others[i].isBuiltIn() &&
                  others[i].getType() == GestureControl.GestureType.LONG_PRESS_GESTURE) {
                  this.currentRecognizer = current;
                  this.childRecognizer = others[i];
                  return others[i];
                }
              }
            }
            return undefined;
          })
          .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
            others: Array<GestureRecognizer>,
            touchRecognizers?: Array<TouchRecognizer>) => {
            if (current && touchRecognizers) {
              let target = current.getEventTargetInfo();
              if (target) {
                if (target.getId() == 'outer' && current.isBuiltIn() &&
                  current.getType() == GestureControl.GestureType.LONG_PRESS_GESTURE) {
                  return GestureJudgeResult.CONTINUE
                }
                console.log('===fy=== onGestureRecognizerJudgeBegin touchRecognizers.length is: ' +
                  touchRecognizers.length)
                for (let index = 0; index < touchRecognizers.length; index++) {
                  const element = touchRecognizers[index];
                  let touchTarget = element.getEventTargetInfo()
                  console.log('===fy=== onGestureRecognizerJudgeBegin element id is: ' + touchTarget.getId())
                  if (touchTarget && touchTarget.getId() == 'inner') {
                    console.log('===fy=== onGestureRecognizerJudgeBegin %s will cancelTouch', touchTarget.getId())
                    element.cancelTouch()
                    console.log('===fy=== 长按事件触发成功 子组件的touch事件已被阻止')
                    this.cancelResult = '长按事件触发成功 子组件的touch事件已被阻止'
                  }
                }
              }
            }
            return GestureJudgeResult.CONTINUE;
          })
          .onTouch((event) => {
            console.log('===fy=== outer onTouch, id is: ' + event.target.id)
            AppStorage.setOrCreate('outer',event.target.id)
            console.log('===fy=== outer onTouch, type is: ' + event.type)
          })
          .parallelGesture(
            LongPressGesture()
              .onAction((event: GestureEvent) => {
                if (this.childRecognizer.getState() != GestureRecognizerState.SUCCESSFUL ||
                  this.currentRecognizer.getState() != GestureRecognizerState.SUCCESSFUL) {
                  return;
                }
                let target = this.childRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
                let currentTarget = this.currentRecognizer.getEventTargetInfo() as ScrollableTargetInfo;
                if (target instanceof ScrollableTargetInfo && currentTarget instanceof ScrollableTargetInfo) {
                  if (target.isEnd()) {
                    if ((event.offsetY - this.lastOffset) < 0) {
                      this.childRecognizer.setEnabled(false)
                      if (currentTarget.isEnd()) {
                        this.currentRecognizer.setEnabled(false)
                      } else {
                        this.currentRecognizer.setEnabled(true)
                      }
                    } else {
                      this.childRecognizer.setEnabled(true)
                      this.currentRecognizer.setEnabled(false)
                    }
                  } else if (target.isBegin()) {
                    if ((event.offsetY - this.lastOffset) > 0) {
                      this.childRecognizer.setEnabled(false)
                      if (currentTarget.isBegin()) {
                        this.currentRecognizer.setEnabled(false)
                      } else {
                        this.currentRecognizer.setEnabled(true)
                      }
                    } else {
                      this.childRecognizer.setEnabled(true)
                      this.currentRecognizer.setEnabled(false)
                    }
                  } else {
                    this.childRecognizer.setEnabled(true)
                    this.currentRecognizer.setEnabled(false)
                  }
                }
                this.lastOffset = event.offsetY
              })
          )
        }
      }
      .height('80%')
      .width('100%')
      .backgroundColor(Color.White)

      Text(this.cancelResult)
        .id('cancelTouchResult')
        .fontSize(14)
        .fontColor(Color.Black)
        .width('90%')
        .padding(5)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
