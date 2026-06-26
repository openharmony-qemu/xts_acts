'use static';
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
import { Button, Column, ComponentV2, Entry, IMonitor, IMonitorDecoratedVariable, Local, Text, UIUtils } from '@kit.ArkUI';


@Entry
@ComponentV2
struct AddMonitorWildcard2 {
  @Local value1: int = 0;
  @Local value2: int = 0;
  @Local num1: number = 0;
  @Local num2: number = 0;
  valueMonitor1?: IMonitorDecoratedVariable;
  valueMonitor2?: IMonitorDecoratedVariable;

  aboutToAppear() {
    this.valueMonitor1 = UIUtils.addMonitor(() => this.value1, this.onChange1, { owner: this,isSynchronous: true });
    this.valueMonitor2 = UIUtils.addMonitor(() => this.value2, this.onChange2, { owner: this,isSynchronous: false });
  }

  onChange1(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      this.num1++
    })
  }

  onChange2(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      this.num2++
    })
  }

  build() {
    Column() {
      Text(`Synchronous monitoring value:${this.value1},${this.num1}`)
        .height('5%')
        .id('synchronous_text')
      Text(`Asynchronous monitoring value:${this.value2},${this.num2}`)
        .height('5%')
        .id('asynchronous_text')
      Button('Synchronous_monitoring')
        .height('5%')
        .id('synchronous_monitoring_001')
        .onClick(() => {
          this.value1++;
          this.value1++;
        })
      Button('Asynchronous_monitoring')
        .height('5%')
        .id('asynchronous_monitoring_001')
        .onClick(() => {
          this.value2++;
          this.value2++;
        })
    }
  }
}
