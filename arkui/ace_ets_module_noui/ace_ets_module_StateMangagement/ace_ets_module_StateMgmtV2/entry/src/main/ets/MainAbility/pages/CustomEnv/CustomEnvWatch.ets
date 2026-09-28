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
import { WithEnv, WithEnvAttribute } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const customWatch: CustomEnvKey<number> = CustomEnvKey.create<number>();

@Entry
@Component
struct CustomEnvWatch {
  @State message: number = 1;

  build() {
    Column() {
      Button('update')
        .id('customEnvWatch_dynamic_002')
        .height('5%')
        .onClick(() => {
          this.message++;
        })

      WithEnv() {
        WatchChild()
      }.customEnv(customWatch, this.message)
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@Component
struct WatchChild {
  @CustomEnv(customWatch) @Watch('onParentValChanged') parentVal: number = 100;
  @State num1: number = 1

  // Watch回调
  onParentValChanged() {
    this.num1++
    hilog.info(0x0000, 'testTag','@Watch message update');
  }

  build() {
    Column() {
      Text(`parentVal${this.num1} is: ` + this.parentVal)
        .id('customEnvWatch_dynamic_001')
        .height('5%')
        .fontSize(22);
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
