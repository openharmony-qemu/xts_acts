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

class Fruit {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }
}

const customArray = CustomEnvKey.create<Fruit[]>();

@Entry
@ComponentV2
struct CustomEnvArray {
  @CustomEnv(customArray) fruits: Fruit[] = [new Fruit('apple'), new Fruit('banana')]; // 使用@CustomEnv装饰Array类型变量

  build() {
    Row() {
      Column() {
        ForEach(this.fruits, (item: Fruit) => {
          Text(`${item.name}`)
            .id('customEnvArray_dynamic_001')
            .height('5%')
            .margin(5)
        })
        // 新增数组元素，触发UI刷新
        Button('Push element')
          .id('customEnvArray_dynamic_003')
          .height('5%')
          .onClick(() => {
            this.fruits.push(new Fruit('cherry'));
          })
          .margin(5)
        // 翻转数组元素，触发UI刷新
        Button('Reverse array')
          .id('customEnvArray_dynamic_004')
          .height('5%')
          .onClick(() => {
            this.fruits.reverse();
          })
          .margin(5)
        // 使用同一元素填充数组，触发UI刷新
        Button('Fill array')
          .id('customEnvArray_dynamic_005')
          .height('5%')
          .onClick(() => {
            this.fruits.fill(new Fruit('apple'));
          })
          .margin(5)
      }
      .width('100%')
    }
    .height('100%')
  }
}

