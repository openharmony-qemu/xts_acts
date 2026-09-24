/*
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

@Entry
@Component
struct RecognizerAndTouchableNullAndUndefined {
  @State result: string = 'Init';
  @State touchableMode: number = 0;

  build() {
    Column() {
      Text('Recognizer And Touchable Null And Undefined Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.result)
        .id('gestureResultText')
        .width('100%')
        .height('5%')
        .backgroundColor('#FFCCCCCC')
        .textAlign(TextAlign.Center)

      Scroll() {
        Column() {
          Text('GestureRecognizer setEnabled')
          Text('host for setEnabled null')
            .id('gestureHostNull')
            .width('80%')
            .height('8%')
            .backgroundColor('#FFAAAAAA')
            .textAlign(TextAlign.Center)
            .gesture(TapGesture())
            .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
              others: Array<GestureRecognizer>) => {
              try {
                current.setEnabled(null);
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
              return GestureJudgeResult.CONTINUE;
            })
          Text('host for setEnabled undefined')
            .id('gestureHostUndefined')
            .width('80%')
            .height('8%')
            .backgroundColor('#FFBBBBBB')
            .textAlign(TextAlign.Center)
            .gesture(TapGesture())
            .onGestureRecognizerJudgeBegin((event: BaseGestureEvent, current: GestureRecognizer,
              others: Array<GestureRecognizer>) => {
              try {
                current.setEnabled(undefined);
                this.result = 'Success';
              } catch (err) {
                this.result = 'Error: ' + err.code;
              }
              return GestureJudgeResult.CONTINUE;
            })

          Text('CommonMethod touchable')
          Button('set touchable null').id('btnTouchableNull').width('100%').height('5%').onClick(() => {
            this.touchableMode = 1;
          })
          Button('set touchable undefined').id('btnTouchableUndefined').width('100%').height('5%').onClick(() => {
            this.touchableMode = 2;
          })

          if (this.touchableMode === 1) {
            Button('touchable target').id('touchableBtn').width('80%').height('6%').touchable(null)
          } else if (this.touchableMode === 2) {
            Button('touchable target').id('touchableBtn').width('80%').height('6%').touchable(undefined)
          } else {
            Button('touchable target').id('touchableBtn').width('80%').height('6%').touchable(true)
          }
        }
      }
      .width('100%')
      .height('75%')
    }
  }
}
