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

const customMap: CustomEnvKey<Map<string, number>> = CustomEnvKey.create<Map<string, number>>();

@Entry
@ComponentV2
struct CustomEnvMap {
  @CustomEnv(customMap) fruits: Map<string, number> = new Map([['apple', 1], ['banana', 2]]);

  build() {
    Column() {
      ForEach(Array.from(this.fruits.entries()), (item: [string, number]) => {
        Text(`key: ${item[0]}, value: ${item[1]}`)
          .id('customEnvMap_dynamic_001')
          .height('5%')
          .margin(5)
      })

      Button('Set entry cherry')
        .id('customEnvMap_dynamic_002')
        .height('5%')
        .onClick(() => {
          this.fruits.set('cherry', 3);
        });

      Button('Update entry apple')
        .id('customEnvMap_dynamic_003')
        .height('5%')
        .onClick(() => {
          this.fruits.set('apple', 4);
        });

      Button('Delete entry apple')
        .id('customEnvMap_dynamic_004')
        .height('5%')
        .onClick(() => {
          this.fruits.delete('apple');
        });

      Button('Clear map')
        .id('customEnvMap_dynamic_005')
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
