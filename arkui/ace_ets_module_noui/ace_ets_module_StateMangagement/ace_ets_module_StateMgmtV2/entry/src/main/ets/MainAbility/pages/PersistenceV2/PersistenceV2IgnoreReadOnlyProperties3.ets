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


import { PersistenceV2 } from '@kit.ArkUI';

@ObservedV2
export class AC41Inner {
  @Trace innerVal: number = 3;
  @Computed
  get innerComputed(): number { return this.innerVal * 10; }
}

@ObservedV2
export class AC41Outer {
  @Trace outerVal: number = 7;
  @Trace nested: AC41Inner = new AC41Inner();
}

@Entry
@ComponentV2
struct PersistenceV2IgnoreReadOnlyProperties3 {
  @Local data: AC41Outer = PersistenceV2.globalConnect({
    type: AC41Outer, key: 'ac41', defaultCreator: () => new AC41Outer(),
    ignoreReadOnlyProperties: true,
  })!;

  build() {
    Column({ space: 8 }) {
      Text('嵌套对象 getter 递归过滤/跳过')
      Text(`outerVal = ${this.data.outerVal}`)
        .id('IgnoreReadOnlyProperties3_001')
        .height('5%')
      Text(`nested.innerVal = ${this.data.nested.innerVal}`)
        .id('IgnoreReadOnlyProperties3_002')
        .height('5%')
      Text(`nested.innerComputed = ${this.data.nested.innerComputed}`)
        .id('IgnoreReadOnlyProperties3_003')
        .height('5%')
      Button('设置 outerVal=100, innerVal=5 并保存')
        .id('IgnoreReadOnlyProperties3_004')
        .height('5%')
        .onClick(() => {
          this.data.outerVal = 100;
          this.data.nested.innerVal = 5;
          PersistenceV2.save('ac41');
        })
    }.margin(20).alignItems(HorizontalAlign.Start)
  }
}