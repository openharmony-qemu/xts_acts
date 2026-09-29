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

const customSet: CustomEnvKey<Set<string>> = CustomEnvKey.create<Set<string>>();

@Entry
@ComponentV2
struct CustomEnvSet {
  @CustomEnv(customSet) fruits: Set<string> = new Set(['apple', 'banana']);

  build() {
    Column() {
      ForEach(Array.from(this.fruits.entries()), (item: [string, string]) => {
        Text(`${item[0]}`)
          .id('customEnvSet_dynamic_001')
          .height('5%')
          .fontSize(20)
          .margin(10)
      })

      Button('Add element')
        .id('customEnvSet_dynamic_002')
        .height('5%')
        .onClick(() => {
          this.fruits.add('cherry');
        });

      Button('Delete element apple')
        .id('customEnvSet_dynamic_003')
        .height('5%')
        .onClick(() => {
          this.fruits.delete('apple');
        });

      Button('Clear set')
        .id('customEnvSet_dynamic_004')
        .height('5%')
        .onClick(() => {
          this.fruits.clear();
        });
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
