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
import { WithEnv } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const customDeepWatch = CustomEnvKey.create<number[][]>();

@Entry
@Component
struct CustomEnvDeepWatch {
  @State message: number[][] = [[1, 2]];

  build() {
    Column() {
      Button('update')
        .id('customEnvDeepWatch_dynamic_002')
        .height('5%')
        .onClick(() => {
          this.message[0][0]++;
        })

      WithEnv() {
        DeepWatchChild()
      }.customEnv(customDeepWatch, this.message)
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct DeepWatchChild {
  @Watch('onMsgChanged') @CustomEnv(customDeepWatch) msg: number[][] = [[3, 4]];
  @State num1: number = 1

  // Watch回调，当@CustomEnv装饰的变量其内部属性的变化时，也会触发回调
  onMsgChanged() {
    this.num1++
    hilog.info(0x0000, 'testTag', 'TabContent message callback func ' + JSON.stringify(this.msg));
  }

  build() {
    Column() {
      Text(`message${this.num1}:`+this.msg[0][0] + '')
        .id('customEnvDeepWatch_dynamic_001')
        .height('5%')
        .fontSize(22);
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
