'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Row, ComponentV2, Column, Text, Button, CustomEnv, CustomEnvKey, DatePicker } from '@kit.ArkUI';
import { WithEnv, WithEnvAttribute } from '@ohos.arkui.WithEnv';

const custom = CustomEnvKey.create<Date>();

@Entry
@ComponentV2
struct CustomEnvDate {
  @CustomEnv('custom') selectedDate: Date = new Date('2021-08-08');

  build() {
    Row() {
      Column() {
        Text('Selected Date: ' + `${this.selectedDate.toLocaleDateString()}`)
          .id('customEnvDate_001')
          .height('5%')
          .margin(5)
        // 调用Date的setFullYear接口修改年份，触发UI刷新
        Button('increase the year by 1')
          .id('customEnvDate_002')
          .height('5%')
          .onClick(() => {
            this.selectedDate.setFullYear(this.selectedDate.getFullYear() + 1);
          })
          .margin(5)
        // 调用Date的setMonth接口修改月份，触发UI刷新
        Button('increase the month by 1')
          .id('customEnvDate_003')
          .height('5%')
          .onClick(() => {
            this.selectedDate.setMonth(this.selectedDate.getMonth() + 1);
          })
          .margin(5)
        // 调用Date的setDate接口修改日期，触发UI刷新
        Button('increase the day by 1')
          .id('customEnvDate_004')
          .height('5%')
          .onClick(() => {
            this.selectedDate.setDate(this.selectedDate.getDate() + 1);
          })
          .margin(5)
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
          selected: this.selectedDate
        })
          .id('customEnvDate_005')
          .height('5%')
          .margin(5)
      }
      .width('100%')
    }
    .height('100%')
  }
}
