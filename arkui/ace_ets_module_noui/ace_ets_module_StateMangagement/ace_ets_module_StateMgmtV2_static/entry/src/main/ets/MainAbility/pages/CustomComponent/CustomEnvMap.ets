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
import { Entry, Row, ComponentV2, Column, Text, Button, CustomEnv, CustomEnvKey, ForEach } from '@kit.ArkUI';
import { WithEnv, WithEnvAttribute } from '@ohos.arkui.WithEnv';

const custom = CustomEnvKey.create<Map<string, number>>();

@Entry
@ComponentV2
struct CustomEnvMap {
  @CustomEnv('custom') fruits: Map<string, number> = new Map<string, number>([['apple', 1], ['banana', 2]]);

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.fruits.entries()), (item: [string, number]) => {
          Text(`key: ${item[0]}, value: ${item[1]}`)
            .id('customEnvMap_001')
            .height('5%')
            .fontSize(20)
        })
        // 新增键值对，触发UI刷新
        Button('Set entry cherry')
          .id('customEnvMap_002')
          .height('5%')
          .onClick(() => {
            this.fruits.set('cherry', 3);
          })
        // 更新键值对，触发UI刷新
        Button('Update entry apple')
          .id('customEnvMap_003')
          .height('5%')
          .onClick(() => {
            this.fruits.set('apple', 4);
          })
        // 删除键值对，触发UI刷新
        Button('Delete entry apple')
          .id('customEnvMap_004')
          .height('5%')
          .onClick(() => {
            this.fruits.delete('apple');
          })
        // 清空Map，触发UI刷新
        Button('Clear map')
          .id('customEnvMap_005')
          .height('5%')
          .onClick(() => {
            this.fruits.clear();
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
