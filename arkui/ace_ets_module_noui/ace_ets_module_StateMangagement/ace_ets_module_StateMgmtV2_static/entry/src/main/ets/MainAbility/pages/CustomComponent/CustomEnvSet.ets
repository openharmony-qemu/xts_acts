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

const custom = CustomEnvKey.create<Set<string>>();

@Entry
@ComponentV2
struct CustomEnvSet {
  @CustomEnv('custom') fruits: Set<string> = new Set<string>(['apple', 'banana']);

  build() {
    Row() {
      Column() {
        ForEach([...this.fruits], (item: string) => {
          Text(`${item}`)
            .id('customEnvSet_001')
            .height('5%')
        })
        // 新增元素，触发UI刷新
        Button('Add element')
          .id('customEnvSet_002')
          .height('5%')
          .onClick(() => {
            this.fruits.add('cherry');
          })
        // 删除元素，触发UI刷新
        Button('Delete element apple')
          .id('customEnvSet_003')
          .height('5%')
          .onClick(() => {
            this.fruits.delete('apple');
          })
        // 清空Set，触发UI刷新
        Button('Clear set')
          .id('customEnvSet_004')
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
