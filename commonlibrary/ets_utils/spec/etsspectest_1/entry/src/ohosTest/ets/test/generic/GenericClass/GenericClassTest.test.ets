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
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '@ohos/hypium';
import {
  isTsGenericConstructorShared
} from './genericTsHelper'

class Box<T> {
  public value: T

  constructor(value: T) {
    this.value = value
  }
}

class Pair<A, B> {
  public first: A
  public second: B

  constructor(first: A, second: B) {
    this.first = first
    this.second = second
  }
}

class Animal {
  public name: string = 'animal'

  public speak(): string {
    return 'generic sound'
  }
}

class Cat extends Animal {
  public speak(): string {
    return 'meow'
  }

  public purr(): string {
    return 'purr'
  }
}

interface BoxMapper<T, R> {
  map(value: T): R
}

class NumberToLabelMapper implements BoxMapper<number, string> {
  public map(value: number): string {
    return 'value-' + value.toString()
  }
}

class GenericClassBox<T> {
  private current: T

  constructor(value: T) {
    this.current = value
  }

  public getValue(): T {
    return this.current
  }

  public get value(): T {
    return this.current
  }

  public set value(v: T) {
    this.current = v
  }

  public setValue(v: T): void {
    this.current = v
  }

  public map<R>(mapper: BoxMapper<T, R>): GenericClassBox<R> {
    return new GenericClassBox<R>(mapper.map(this.current))
  }

  public static create<T>(value: T): GenericClassBox<T> {
    return new GenericClassBox<T>(value)
  }
}

class GenericClassPair<A, B> {
  public first: A
  public second: B

  constructor(first: A, second: B) {
    this.first = first;
    this.second = second
  }
}

class AnimalBoxFactory<T extends Animal> {
  public create(value: T): GenericClassBox<T> {
    return new GenericClassBox<T>(value)
  }
}

function createWithClassFactory<T extends Animal>(factory: AnimalBoxFactory<T>, value: T): GenericClassBox<T> {
  return factory.create(value)
}

export default function GenericClassTest() {
  describe('GenericClassTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    describe('GenericClass', () => {
      beforeAll(() => {
      })
      beforeEach(async () => {
      })
      afterEach(() => {
      })
      afterAll(() => {
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_0100
       * @tc.name      testClassBasicDeclarationValue0001
       * @tc.desc      Verify generic class basic declaration stores constructor value (GTP-GC-001)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testClassBasicDeclarationValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let box: GenericClassBox<number> = new GenericClassBox<number>(11)
        expect(box.getValue()).assertEqual(11)
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_0300
       * @tc.name      testExplicitInstantiation0003
       * @tc.desc      Verify explicit type argument instantiation (GTP-GC-002)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testExplicitInstantiation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let box: GenericClassBox<string> = new GenericClassBox<string>('explicit')
        expect(box.getValue()).assertEqual('explicit')
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_0400
       * @tc.name      testConstructorInference0004
       * @tc.desc      Verify class type argument inferred from constructor parameter (GTP-GC-003)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testConstructorInference0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let box: GenericClassBox<number> = new GenericClassBox(22)
        expect(box.getValue()).assertEqual(22)
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_0500
       * @tc.name      testInstanceGetterSetter0005
       * @tc.desc      Verify generic class getter and setter use T consistently (GTP-GC-004)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInstanceGetterSetter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let box: GenericClassBox<string> = new GenericClassBox<string>('before')
        box.value = 'after'
        expect(box.value).assertEqual('after')
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_0600
       * @tc.name      testInstanceMethodUsesTypeParam0006
       * @tc.desc      Verify generic class instance method setValue uses T consistently (GTP-GC-004)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInstanceMethodUsesTypeParam0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let box: GenericClassBox<string> = new GenericClassBox<string>('before')
        box.setValue('final')
        expect(box.getValue()).assertEqual('final')
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_0700
       * @tc.name      testMultiTypeParamClassFirst0007
       * @tc.desc      Verify first type parameter in a generic class is stored independently (GTP-GC-005)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testMultiTypeParamClassFirst0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let pair: GenericClassPair<number, string> = new GenericClassPair<number, string>(25, 'pair')
        expect(pair.first).assertEqual(25)
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_0800
       * @tc.name      testMultiTypeParamClassSecond0008
       * @tc.desc      Verify second type parameter in a generic class is stored independently (GTP-GC-005)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testMultiTypeParamClassSecond0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let pair: GenericClassPair<number, string> = new GenericClassPair<number, string>(25, 'pair')
        expect(pair.second).assertEqual('pair')
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_0900
       * @tc.name      testIndependentMethod0009
       * @tc.desc      Verify independent generic method inside generic class maps T to R (GTP-GC-006)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testIndependentMethod0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let source: GenericClassBox<number> = new GenericClassBox<number>(26)
        let mapped: GenericClassBox<string> = source.map<string>(new NumberToLabelMapper())
        expect(mapped.getValue()).assertEqual('value-26')
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_1000
       * @tc.name      testStaticGenericMethod0010
       * @tc.desc      Verify static generic method declares its own type parameters (GTP-GC-008)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testStaticGenericMethod0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let created: GenericClassBox<string> = GenericClassBox.create<string>('static-create')
        expect(created.getValue()).assertEqual('static-create')
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_1200
       * @tc.name      testConstructorIdentityTsHelper0012
       * @tc.desc      Verify TS helper observes shared generic runtime constructor (GTP-GC-010)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testConstructorIdentityTsHelper0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(isTsGenericConstructorShared()).assertTrue()
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_1300
       * @tc.name      testGenericFactory0013
       * @tc.desc      Verify ArkTS class factory creates a generic class instance (GTP-GC-011)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testGenericFactory0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let factory: AnimalBoxFactory<Cat> = new AnimalBoxFactory<Cat>()
        let catBox: GenericClassBox<Cat> = createWithClassFactory<Cat>(factory, new Cat())
        expect(catBox.getValue().speak()).assertEqual('meow')
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_1400
       * @tc.name      testNestedGenericClassFirst0014
       * @tc.desc      Verify nested generic class preserves the first nested type argument (GTP-GC-012)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testNestedGenericClassFirst0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let pair: Pair<number, string> = new Pair<number, string>(32, 'nested')
        let box: GenericClassBox<Pair<number, string>> = new GenericClassBox<Pair<number, string>>(pair)
        expect(box.getValue().first).assertEqual(32)
      })

      /**
       * @tc.number    SUB_GENERIC_GC_CLASS_1500
       * @tc.name      testNestedGenericClassSecond0015
       * @tc.desc      Verify nested generic class preserves the second nested type argument (GTP-GC-012)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testNestedGenericClassSecond0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let pair: Pair<number, string> = new Pair<number, string>(32, 'nested')
        let box: GenericClassBox<Pair<number, string>> = new GenericClassBox<Pair<number, string>>(pair)
        expect(box.getValue().second).assertEqual('nested')
      })
    })
  })
}
