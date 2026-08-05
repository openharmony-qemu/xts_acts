/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';

class FeatureRecorder {
  private keys: string[] = []
  private called: boolean = false

  recordKey(key: string): void {
    this.keys.push(key)
  }

  markCalled(): void {
    this.called = true
  }

  lastKey(): string {
    return this.keys.length > 0 ? this.keys[this.keys.length - 1] : ''
  }

  wasCalled(): boolean {
    return this.called
  }
}

function markField(rec: FeatureRecorder): (target: Object, key: string) => void {
  return (target: Object, key: string): void => {
    void target
    rec.recordKey(key)
    rec.markCalled()
  }
}

function markMethod(rec: FeatureRecorder): (target: Object, key: string, descriptor?: Object) => void {
  return (target: Object, key: string, descriptor?: Object): void => {
    void target
    void descriptor
    rec.recordKey(key)
    rec.markCalled()
  }
}

function markClass(rec: FeatureRecorder): (ctor: Object) => void {
  return (ctor: Object): void => {
    void ctor
    rec.recordKey('class')
    rec.markCalled()
  }
}

export default function DecoratorWithClassFeaturesTest() {
  describe('DecoratorWithClassFeaturesTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })


    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0100
     * @tc.name      testClassStaticMethodReturnTypeDecorator0001
     * @tc.desc      Real @markMethod on static method; verified via recorder and return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassStaticMethodReturnTypeDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class ClassFeature0009 {
        @markMethod(rec)
        public static greet(): string {
          return 'hello_static'
        }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('greet')
      expect(ClassFeature0009.greet()).assertEqual('hello_static')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0200
     * @tc.name      testClassStaticMethodParamTypeDecorator0002
     * @tc.desc      Real @markMethod on static method with param type; verified via recorder and return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassStaticMethodParamTypeDecorator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class ClassFeature0010 {
        @markMethod(rec)
        public static greet(name: string): string {
          return 'hello ' + name
        }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('greet')
      expect(ClassFeature0010.greet('world')).assertEqual('hello world')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0300
     * @tc.name      testClassDecoratedFieldNoInit0003
     * @tc.desc      Real @markField on field without initializer; verified via recorder and field value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratedFieldNoInit0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class ClassFeature0026 {
        @markField(rec)
        public name: string

        public constructor() {
          this.name = 'filled'
        }
      }

      const instance: ClassFeature0026 = new ClassFeature0026()
      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('name')
      expect(instance.name).assertEqual('filled')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0400
     * @tc.name      testClassNumberInitDecorator0004
     * @tc.desc      Real @markField with number initializer; verified via recorder and field value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassNumberInitDecorator0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class ClassFeature0027 {
        @markField(rec)
        public value: number = 42
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('value')
      expect(new ClassFeature0027().value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0500
     * @tc.name      testClassStringInitDecorator0005
     * @tc.desc      Real @markField with string initializer; verified via recorder and field value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassStringInitDecorator0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class ClassFeature0028 {
        @markField(rec)
        public label: string = 'initialized_string'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('label')
      expect(new ClassFeature0028().label).assertEqual('initialized_string')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0600
     * @tc.name      testClassTypeInitDecorator0006
     * @tc.desc      Real @markField with class-type initializer; verified via recorder and field value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTypeInitDecorator0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class InnerClass0029 {
        public name: string = 'inner'
      }

      class ClassFeature0029 {
        @markField(rec)
        public inner: InnerClass0029 = new InnerClass0029()
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('inner')
      expect(new ClassFeature0029().inner.name).assertEqual('inner')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0700
     * @tc.name      testClassArrayInitDecorator0007
     * @tc.desc      Real @markField with array initializer; verified via recorder and field length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassArrayInitDecorator0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class ClassFeature0030 {
        @markField(rec)
        public items: number[] = [1, 2, 3]
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('items')
      expect(new ClassFeature0030().items.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0800
     * @tc.name      testClassDecoratedPublicAccess0008
     * @tc.desc      Real @markField on public field; verified via recorder and accessor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratedPublicAccess0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class ClassFeature0045 {
        @markField(rec)
        public name: string = 'public_access'

        public getName(): string {
          return this.name
        }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('name')
      expect(new ClassFeature0045().getName()).assertEqual('public_access')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_0900
     * @tc.name      testClassDecoratedConstructorNoArgs0009
     * @tc.desc      Real @markClass on no-arg constructor class; verified via recorder and instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratedConstructorNoArgs0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()
      @markClass(rec)
      class ClassFeature0053 {
        public name: string

        public constructor() {
          this.name = 'no_arg_constructor'
        }
      }
      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('class')
      expect(new ClassFeature0053().name).assertEqual('no_arg_constructor')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_1000
     * @tc.name      testClassDecoratedConstructorOneArg0010
     * @tc.desc      Real @markClass on one-arg constructor class; verified via recorder and instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratedConstructorOneArg0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()
      @markClass(rec)
      class ClassFeature0054 {
        public name: string

        public constructor(name: string) {
          this.name = name
        }
      }
      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('class')
      expect(new ClassFeature0054('one_arg').name).assertEqual('one_arg')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_1100
     * @tc.name      testClassDecoratedConstructorMultiArgs0011
     * @tc.desc      Real @markClass on multi-arg constructor class; verified via recorder and instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratedConstructorMultiArgs0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()
      @markClass(rec)
      class ClassFeature0055 {
        public firstName: string
        public lastName: string

        public constructor(firstName: string, lastName: string) {
          this.firstName = firstName
          this.lastName = lastName
        }
      }
      const instance: ClassFeature0055 = new ClassFeature0055('Alice', 'Smith')
      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('class')
      expect(instance.firstName + ' ' + instance.lastName).assertEqual('Alice Smith')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_1200
     * @tc.name      testClassDecoratorDoesNotExecCtor0012
     * @tc.desc      Real @markClass does not run constructor; verified via recorder and ctorCount.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorDoesNotExecCtor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()
      let ctorCount: number = 0
      @markClass(rec)
      class ClassFeature0057 {
        public name: string

        public constructor() {
          ctorCount++
          this.name = 'counted'
        }
      }
      expect(rec.wasCalled()).assertTrue()
      expect(ctorCount).assertEqual(0)
      const instance: ClassFeature0057 = new ClassFeature0057()
      void instance
      expect(ctorCount).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_1300
     * @tc.name      testClassPropertyDecoratorDoesNotExecCtor0013
     * @tc.desc      Real @markField does not run constructor; verified via recorder and ctorCount.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorDoesNotExecCtor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()
      let ctorCount: number = 0

      class ClassFeature0058 {
        @markField(rec)
        public value: number = 0

        public constructor() {
          ctorCount++
        }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('value')
      expect(ctorCount).assertEqual(0)
      const instance: ClassFeature0058 = new ClassFeature0058()
      void instance
      expect(ctorCount).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_1400
     * @tc.name      testClassMethodDecoratorDoesNotExecCtor0014
     * @tc.desc      Real @markMethod does not run constructor; verified via recorder and ctorCount.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorDoesNotExecCtor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()
      let ctorCount: number = 0

      class ClassFeature0059 {
        @markMethod(rec)
        public doWork(): string {
          return 'working'
        }

        public constructor() {
          ctorCount++
        }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('doWork')
      expect(ctorCount).assertEqual(0)
      const instance: ClassFeature0059 = new ClassFeature0059()
      void instance
      expect(ctorCount).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_1500
     * @tc.name      testClassConstructorBodyTypeValid0015
     * @tc.desc      Real @markClass keeps constructor body semantics; verified via recorder and getInfo.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassConstructorBodyTypeValid0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()
      @markClass(rec)
      class ClassFeature0060 {
        public name: string
        public code: number

        public constructor(name: string, code: number) {
          this.name = name
          this.code = code
        }

        public getInfo(): string {
          return this.name + ':' + String(this.code)
        }
      }
      expect(rec.wasCalled()).assertTrue()
      expect(new ClassFeature0060('valid', 200).getInfo()).assertEqual('valid:200')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_1600
     * @tc.name      testClassDecoratedOverrideParamMatch0016
     * @tc.desc      Real @markMethod on override with matching params; verified via recorder and return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratedOverrideParamMatch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class BaseClass0088 {
        public greet(name: string): string {
          return 'base: ' + name
        }
      }

      class DerivedClass0088 extends BaseClass0088 {
        @markMethod(rec)
        public greet(name: string): string {
          return 'derived: ' + name
        }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('greet')
      expect(new DerivedClass0088().greet('test')).assertEqual('derived: test')
    })

    /**
     * @tc.number    SUB_DECORATOR_CLASS_FEATURE_1700
     * @tc.name      testClassDecoratedOverrideReturnMatch0017
     * @tc.desc      Real @markMethod on override with matching return; verified via recorder and return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratedOverrideReturnMatch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec: FeatureRecorder = new FeatureRecorder()

      class BaseClass0090 {
        public getValue(): number {
          return 10
        }
      }

      class DerivedClass0090 extends BaseClass0090 {
        @markMethod(rec)
        public getValue(): number {
          return 20
        }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('getValue')
      expect(new DerivedClass0090().getValue()).assertEqual(20)
    })
  })
}
