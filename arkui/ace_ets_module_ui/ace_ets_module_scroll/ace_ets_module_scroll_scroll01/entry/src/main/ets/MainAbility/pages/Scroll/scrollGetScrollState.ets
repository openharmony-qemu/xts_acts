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
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct ScrollGetScrollState {
  // 当前滚动状态（Idle：空闲中；Scroll：手指拖拽中；Fling：惯性滚动中）
  @State scrollStateStr: string = 'Idle';
  // 记录出现过的全部滚动状态，用于测试断言
  @State stateRecord: string = '';
  // 按钮触发的最近一次调用结果，用于测试断言
  @State lastResult: string = 'init';
  // 列表数据
  @State numbers: string[] = [];
  // 滚动控制器，用于绑定Scroll组件并查询滚动状态
  scroller: Scroller = new Scroller();
  // 未绑定任何组件的控制器，用于错误码测试
  unboundScroller: Scroller = new Scroller();
  // 定时器ID，页面销毁时清除定时器
  private timerId: number = -1;

  aboutToAppear() {
    for (let i = 1; i <= 30; i++) {
      this.numbers.push(i + '');
    }
    // 每4ms自动查询一次滚动状态，实现状态实时展示与记录
    this.timerId = setInterval(() => {
      this.queryScrollState();
    }, 4);
  }

  aboutToDisappear() {
    // 页面销毁时清除定时器，避免资源泄漏
    if (this.timerId !== -1) {
      clearInterval(this.timerId);
      this.timerId = -1;
    }
  }

  // 获取当前滚动状态并记录
  private queryScrollState(): void {
    try {
      // 通过调用getScrollState函数获取当前滚动状态
      const state: ScrollState = this.scroller.getScrollState();
      this.scrollStateStr = this.scrollStateToStr(state);
      this.recordState(this.scrollStateStr);
    } catch (error) {
      // 页面构建完成前Scroller尚未绑定组件，会抛100004异常，需要用try catch保护
      let err: BusinessError = error as BusinessError;
      console.error(`Failed to get scrollState. Code: ${err.code}, message: ${err.message}`);
    }
  }

  // 记录出现过的状态（去重）
  private recordState(name: string): void {
    if (!this.stateRecord.includes(name)) {
      this.stateRecord = this.stateRecord.length === 0 ? name : this.stateRecord + ',' + name;
      AppStorage.setOrCreate('getScrollState_stateRecord', this.stateRecord);
    }
  }

  // 将滚动状态枚举转换为可读的文本
  private scrollStateToStr(state: ScrollState): string {
    return state === ScrollState.Idle ? 'Idle' :
      state === ScrollState.Scroll ? 'Scroll' : 'Fling';
  }

  // 保存按钮触发的最近一次调用结果
  private setResult(result: string): void {
    this.lastResult = result;
    AppStorage.setOrCreate('getScrollState_lastResult', result);
  }

  // 无参正常调用getScrollState
  private queryWithNoParam(): void {
    try {
      const state: ScrollState = this.scroller.getScrollState();
      this.setResult(this.scrollStateToStr(state));
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      this.setResult('crash:' + err.code);
    }
  }

  // 未绑定组件的控制器无参调用getScrollState，预期抛出100004错误码
  private queryUnbound(): void {
    try {
      this.unboundScroller.getScrollState();
      this.setResult('no_error');
    } catch (error) {
      let err: BusinessError = error as BusinessError;
      this.setResult(`${err.code}`);
    }
  }

  build() {
    Column() {
      // 实时展示getScrollState获取到的滚动状态
      Text('State: ' + this.scrollStateStr)
        .id('getScrollState_currentState')
        .fontColor(Color.Black)
        .fontSize(14)

      // 展示出现过的全部滚动状态
      Text('Record: ' + this.stateRecord)
        .id('getScrollState_stateRecord')
        .fontColor(Color.Black)
        .fontSize(14)

      // 展示按钮触发的最近一次调用结果
      Text('Result: ' + this.lastResult)
        .id('getScrollState_result')
        .fontColor(Color.Black)
        .fontSize(14)

      // ========== no param / record reset / position reset ==========
      Row() {
        Button('default')
          .id('getScrollState_default')
          .fontSize(14)
          .onClick(() => {
            this.queryWithNoParam();
          })

        Button('resetRecord')
          .id('getScrollState_resetRecord')
          .fontSize(14)
          .onClick(() => {
            this.stateRecord = '';
            AppStorage.setOrCreate('getScrollState_stateRecord', '');
          })

        Button('reset')
          .id('getScrollState_reset')
          .fontSize(14)
          .onClick(() => {
            this.scroller.scrollTo({ xOffset: 0, yOffset: 0 });
          })
      }.height('5%')

      // ========== unbound scroller error code test ==========
      Row() {
        Button('unbound')
          .id('getScrollState_unbound')
          .fontSize(14)
          .onClick(() => {
            this.queryUnbound();
          })
      }.height('5%')

      Scroll(this.scroller) {
        Column() {
          ForEach(this.numbers, (item: string) => {
            Text('' + item)
              .width('100%')
              .height(80)
              .fontSize(14)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF9CF93)
          }, (item: string) => item.toString())
        }
      }
      .id('scrollGetScrollState_scroll')
      .width('90%')
      .height('45%')
      .backgroundColor(0xF0F0F0)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
    .padding({ top: 5 })
  }
}
