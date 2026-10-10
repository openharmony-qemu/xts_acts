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
import { definePlainGetter, getValue } from './getter-classes';

@ObservedV2
class AC08Parent {
  @Trace public other: number = 0;
  set value(v: number) { this.other = v; }
}

@ObservedV2
class AC08Child extends AC08Parent {
  constructor() {
    super();
    definePlainGetter(this, 'value', () => this.other + 1);
  }
}

@Entry
@ComponentV2
struct PersistenceV2IgnoreReadOnlyPropertiesSet {
  @Local data: AC08Child = PersistenceV2.globalConnect({
    type: AC08Child, key: 'ac81', defaultCreator: () => new AC08Child(),
    ignoreReadOnlyProperties: true,
  })!;

  build() {
    Column({ space: 8 }) {
      Text('AC-8.1: 子类 getter 遮蔽父类 setter + true').fontSize(16).fontWeight(FontWeight.Bold)
      Text(`other = ${this.data.other}`).fontSize(14)
        .id('IgnoreReadOnlyPropertiesSet_001')
      Text(`value = ${getValue(this.data)}`).fontSize(14)
        .id('IgnoreReadOnlyPropertiesSet_002')
      Button('设置 other=50 并保存')
        .id('IgnoreReadOnlyPropertiesSet_003')
        .onClick(() => {
          this.data.other = 50;
          PersistenceV2.save('ac81');
        })
    }.margin(20).alignItems(HorizontalAlign.Start)
  }
}