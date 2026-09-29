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

const customFreeze: CustomEnvKey<number> = CustomEnvKey.create<number>();

@Entry
@ComponentV2
struct CustomEnvFreeze {
  @Local message: number = 20;
  @Local data: number[] = [0, 1];

  build() {
    Column() {
      Button('change message')
        .id('customEnvFreeze_dynamic_003')
        .height('5%')
        .onClick(() => {
          this.message++;
        })

      WithEnv() {
        Tabs() {
          ForEach(this.data, (item: number) => {
            TabContent() {
              FreezeChild({ index: item })
            }.tabBar(`tab${item}`)
          }, (item: number) => item.toString())
        }
      }.customEnv(customFreeze, this.message)
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

@ComponentV2({ freezeWhenInactive: true })
struct FreezeChild {
  @CustomEnv(customFreeze) message: number = 0;
  @Param index: number = 0;
  @Local num1: number = 1;

  @Monitor('message')
  onStrChange(monitor: IMonitor) {
    this.num1++;
    monitor.dirty.forEach((path: string) => {
      hilog.info(0x0000, 'testTag',
        `${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`);
    });
  }

  build() {
    Column() {
      Text(`message${this.num1}:${this.message}, index: ${this.index}`)
        .id(`customEnvFreeze_dynamic_00${this.index + 1}`)
        .height('5%')
        .fontSize(22);
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
