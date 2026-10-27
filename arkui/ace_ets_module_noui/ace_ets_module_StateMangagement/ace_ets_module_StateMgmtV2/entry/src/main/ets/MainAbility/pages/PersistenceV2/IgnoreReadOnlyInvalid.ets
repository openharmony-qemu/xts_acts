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
class IgnoreFalseGetterClass {
  @Trace public value: number = 10;

  get readOnlyValue(): number {
    return this.value * 2;
  }
}

@ObservedV2
class IgnoreFalseComputedClass {
  @Trace public value: number = 5;

  @Computed
  get computedValue(): number {
    return this.value * 3;
  }
}

@ObservedV2
class IgnoreFalseParentB {
  @Trace public baseValue: number = 100;

  get bProp(): number {
    return this.baseValue;
  }

  set bProp(val: number) {
    this.baseValue = val;
  }
}

@ObservedV2
class IgnoreFalseChildA extends IgnoreFalseParentB {
  @Trace public childValue: number = 200;

  get aGetProp(): number {
    return this.childValue + this.baseValue;
  }
}

@Entry
@ComponentV2
struct IgnoreReadOnlyInvalid {
  @Local nullGetterResult: string = 'Not connected';
  @Local nullComputedResult: string = 'Not connected';
  @Local nullDerivedResult: string = 'Not connected';
  @Local undefinedGetterResult: string = 'Not connected';
  @Local undefinedComputedResult: string = 'Not connected';
  @Local undefinedDerivedResult: string = 'Not connected';

  build() {
    Column({ space: 10 }) {
      Text(this.nullGetterResult)
        .id('text_false_null_getter')
        .height('3%')
        .fontSize(16)

      Button('Connect Null Getter')
        .id('btn_false_null_getter')
        .height('3%')
        .onClick(() => {
          try {
            let obj: IgnoreFalseGetterClass = PersistenceV2.globalConnect({
              type: IgnoreFalseGetterClass,
              key: 'IgnoreFalseNullGetter',
              defaultCreator: () => new IgnoreFalseGetterClass(),
              ignoreReadOnlyProperties: null as ESObject as boolean
            })!;
            this.nullGetterResult = `SUCCESS: value=${obj.value}, readOnly=${obj.readOnlyValue}`;
          } catch (err) {
            this.nullGetterResult = `ERROR: ${(err as Error).message}`;
          }
        })

      Text(this.nullComputedResult)
        .id('text_false_null_computed')
        .height('3%')
        .fontSize(16)

      Button('Connect Null Computed')
        .id('btn_false_null_computed')
        .height('3%')
        .onClick(() => {
          try {
            let obj: IgnoreFalseComputedClass = PersistenceV2.globalConnect({
              type: IgnoreFalseComputedClass,
              key: 'IgnoreFalseNullComputed',
              defaultCreator: () => new IgnoreFalseComputedClass(),
              ignoreReadOnlyProperties: null
            })!;
            this.nullComputedResult = `SUCCESS: value=${obj.value}, computed=${obj.computedValue}`;
          } catch (err) {
            this.nullComputedResult = `ERROR: ${(err as Error).message}`;
          }
        })

      Text(this.nullDerivedResult)
        .id('text_false_null_derived')
        .height('3%')
        .fontSize(16)

      Button('Connect Null Derived')
        .id('btn_false_null_derived')
        .height('3%')
        .onClick(() => {
          try {
            let obj: IgnoreFalseChildA = PersistenceV2.globalConnect({
              type: IgnoreFalseChildA,
              key: 'IgnoreFalseNullChild',
              defaultCreator: () => new IgnoreFalseChildA(),
              ignoreReadOnlyProperties: null
            })!;
            this.nullDerivedResult = `SUCCESS: child=${obj.childValue}, base=${obj.baseValue}, readOnly=${obj.aGetProp}`;
          } catch (err) {
            this.nullDerivedResult = `ERROR: ${(err as Error).message}`;
          }
        })

      Text(this.undefinedGetterResult)
        .id('text_false_undefined_getter')
        .height('3%')
        .fontSize(16)

      Button('Connect Undefined Getter')
        .id('btn_false_undefined_getter')
        .height('3%')
        .onClick(() => {
          try {
            let obj: IgnoreFalseGetterClass = PersistenceV2.globalConnect({
              type: IgnoreFalseGetterClass,
              key: 'IgnoreFalseUndefinedGetter',
              defaultCreator: () => new IgnoreFalseGetterClass(),
              ignoreReadOnlyProperties: undefined
            })!;
            this.undefinedGetterResult = `SUCCESS: value=${obj.value}, readOnly=${obj.readOnlyValue}`;
          } catch (err) {
            this.undefinedGetterResult = `ERROR: ${(err as Error).message}`;
          }
        })

      Text(this.undefinedComputedResult)
        .id('text_false_undefined_computed')
        .height('3%')
        .fontSize(16)

      Button('Connect Undefined Computed')
        .id('btn_false_undefined_computed')
        .height('3%')
        .onClick(() => {
          try {
            let obj: IgnoreFalseComputedClass = PersistenceV2.globalConnect({
              type: IgnoreFalseComputedClass,
              key: 'IgnoreFalseUndefinedComputed',
              defaultCreator: () => new IgnoreFalseComputedClass(),
              ignoreReadOnlyProperties: undefined
            })!;
            this.undefinedComputedResult = `SUCCESS: value=${obj.value}, computed=${obj.computedValue}`;
          } catch (err) {
            this.undefinedComputedResult = `ERROR: ${(err as Error).message}`;
          }
        })

      Text(this.undefinedDerivedResult)
        .id('text_false_undefined_derived')
        .height('3%')
        .fontSize(16)

      Button('Connect Undefined Derived')
        .id('btn_false_undefined_derived')
        .height('3%')
        .onClick(() => {
          try {
            let obj: IgnoreFalseChildA = PersistenceV2.globalConnect({
              type: IgnoreFalseChildA,
              key: 'IgnoreFalseUndefinedChild',
              defaultCreator: () => new IgnoreFalseChildA(),
              ignoreReadOnlyProperties: undefined
            })!;
            this.undefinedDerivedResult = `SUCCESS: child=${obj.childValue}, base=${obj.baseValue}, readOnly=${obj.aGetProp}`;
          } catch (err) {
            this.undefinedDerivedResult = `ERROR: ${(err as Error).message}`;
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
