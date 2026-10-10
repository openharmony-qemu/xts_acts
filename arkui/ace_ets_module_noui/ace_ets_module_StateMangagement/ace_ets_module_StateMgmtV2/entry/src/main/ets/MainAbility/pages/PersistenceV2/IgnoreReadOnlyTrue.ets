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
class IgnoreTrueGetterClass {
  @Trace public value: number = 10;

  get readOnlyValue(): number {
    return this.value * 2;
  }
}

@ObservedV2
class IgnoreTrueComputedClass {
  @Trace public value: number = 5;

  @Computed
  get computedValue(): number {
    return this.value * 3;
  }
}

@ObservedV2
class IgnoreTrueParentB {
  @Trace public baseValue: number = 100;

  get bProp(): number {
    return this.baseValue;
  }

  set bProp(val: number) {
    this.baseValue = val;
  }
}

@ObservedV2
class IgnoreTrueChildA extends IgnoreTrueParentB {
  @Trace public childValue: number = 200;

  get aGetProp(): number {
    return this.childValue + this.baseValue;
  }
}

@Entry
@ComponentV2
struct IgnoreReadOnlyTrue {
  @Local getterResult: string = 'Not connected';
  @Local computedResult: string = 'Not connected';
  @Local derivedResult: string = 'Not connected';

  build() {
    Column({ space: 10 }) {
      Text(this.getterResult)
        .id('text_true_getter')
        .height('5%')
        .fontSize(16)

      Button('Connect Getter')
        .id('btn_true_getter')
        .height('5%')
        .onClick(() => {
          try {
            let obj: IgnoreTrueGetterClass = PersistenceV2.globalConnect({
              type: IgnoreTrueGetterClass,
              key: 'IgnoreTrueGetter',
              defaultCreator: () => new IgnoreTrueGetterClass(),
              ignoreReadOnlyProperties: true
            })!;
            this.getterResult = `SUCCESS: value=${obj.value}, readOnly=${obj.readOnlyValue}`;
          } catch (err) {
            this.getterResult = `ERROR: ${(err as Error).message}`;
          }
        })

      Text(this.computedResult)
        .id('text_true_computed')
        .height('5%')
        .fontSize(16)

      Button('Connect Computed')
        .id('btn_true_computed')
        .height('5%')
        .onClick(() => {
          try {
            let obj: IgnoreTrueComputedClass = PersistenceV2.globalConnect({
              type: IgnoreTrueComputedClass,
              key: 'IgnoreTrueComputed',
              defaultCreator: () => new IgnoreTrueComputedClass(),
              ignoreReadOnlyProperties: true
            })!;
            this.computedResult = `SUCCESS: value=${obj.value}, computed=${obj.computedValue}`;
          } catch (err) {
            this.computedResult = `ERROR: ${(err as Error).message}`;
          }
        })

      Text(this.derivedResult)
        .id('text_true_derived')
        .height('5%')
        .fontSize(16)

      Button('Connect Derived')
        .id('btn_true_derived')
        .height('5%')
        .onClick(() => {
          try {
            let obj: IgnoreTrueChildA = PersistenceV2.globalConnect({
              type: IgnoreTrueChildA,
              key: 'IgnoreTrueChild',
              defaultCreator: () => new IgnoreTrueChildA(),
              ignoreReadOnlyProperties: true
            })!;
            this.derivedResult = `SUCCESS: child=${obj.childValue}, base=${obj.baseValue}, readOnly=${obj.aGetProp}`;
          } catch (err) {
            this.derivedResult = `ERROR: ${(err as Error).message}`;
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
