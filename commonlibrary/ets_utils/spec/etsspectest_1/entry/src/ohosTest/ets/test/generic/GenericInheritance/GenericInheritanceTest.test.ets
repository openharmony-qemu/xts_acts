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
  CrossModuleBase
} from './crossModuleBase'

class CrossModuleDerived<T> extends CrossModuleBase<T> {
  constructor(v: T) {
    super(v)
  }
}

class Box<T> {
  value: T

  constructor(value: T) {
    this.value = value
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

interface Store<K, V> {
  get(key: K): V;

  set(key: K, value: V): void
}

interface NumberKeyStore<T> extends Store<number, T> {
  getSize(): number
}

class NumberKeyStoreImpl<T> implements NumberKeyStore<T> {
  private data: Map<number, T> = new Map()

  get(key: number): T {
    return this.data.get(key)!
  }

  set(key: number, value: T): void {
    this.data.set(key, value)
  }

  getSize(): number {
    return this.data.size
  }
}

interface StringStringStore extends Store<string, string> {
  getAll(): string[]
}

class StringStringStoreImpl implements StringStringStore {
  private data: Map<string, string> = new Map()

  get(key: string): string {
    return this.data.get(key)!
  }

  set(key: string, value: string): void {
    this.data.set(key, value)
  }

  getAll(): string[] {
    return Array.from(this.data.values())
  }
}

class GenericBase<T> {
  value: T

  constructor(value: T) {
    this.value = value
  }
}

class GenericDerived<T> extends GenericBase<T> {
  extra: string = 'extra'
}

class StringBox extends Box<string> {
  log(): string {
    return `Box contains: ${this.value}`
  }
}

class MultiParamBase<A, B> {
  first: A
  second: B

  constructor(first: A, second: B) {
    this.first = first
    this.second = second
  }
}

class MultiParamDerived<B, A, C> extends MultiParamBase<A, B> {
  third: C

  constructor(first: A, second: B, third: C) {
    super(first, second)
    this.third = third
  }
}

interface InterfaceA<T> {
  value: T
}

interface InterfaceB<T> {
  value: T
}

interface CombinedInterface<T> extends InterfaceA<T>, InterfaceB<T> {
  extra: string
}

class CombinedImpl<T> implements CombinedInterface<T> {
  value: T
  extra: string

  constructor(value: T) {
    this.value = value
    this.extra = 'combined'
  }
}

class GenericMethodBase<T> {
  value: T

  constructor(value: T) {
    this.value = value
  }

  getValue(): T {
    return this.value
  }
}

class GenericMethodDerived<T> extends GenericMethodBase<T> {
}

export default function GenericInheritanceTest() {
  describe('GenericInheritanceTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0100
       * @tc.name      testInterfaceExtendsPassT0001
       * @tc.desc      Verify generic interface extends Store<number, T>
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInterfaceExtendsPassT0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let store: NumberKeyStore<Animal> = new NumberKeyStoreImpl<Animal>()
        store.set(1, new Cat())
        expect(store.get(1).speak()).assertEqual('meow')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0200
       * @tc.name      testInterfaceExtendsPassT0002
       * @tc.desc      Verify generic interface extends Store<number, T> size method
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInterfaceExtendsPassT0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let store: NumberKeyStore<string> = new NumberKeyStoreImpl<string>()
        store.set(1, 'a')
        store.set(2, 'b')
        expect(store.getSize()).assertEqual(2)
        expect(store.get(1)).assertEqual('a')
        expect(store.get(2)).assertEqual('b')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0300
       * @tc.name      testInterfaceExtendsConcrete0001
       * @tc.desc      Verify interface extends Store<string, string>
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInterfaceExtendsConcrete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let store: StringStringStore = new StringStringStoreImpl()
        store.set('key', 'value')
        expect(store.get('key')).assertEqual('value')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0400
       * @tc.name      testInterfaceExtendsConcrete0002
       * @tc.desc      Verify interface extends Store<string, string> getAll method
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInterfaceExtendsConcrete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let store: StringStringStore = new StringStringStoreImpl()
        store.set('a', '1')
        store.set('b', '2')
        expect(store.getAll().length).assertEqual(2)
        expect(store.get('a')).assertEqual('1')
        expect(store.get('b')).assertEqual('2')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0500
       * @tc.name      testClassExtendsPassT0001
       * @tc.desc      Verify generic class extends GenericBase<T>
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testClassExtendsPassT0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: GenericDerived<number> = new GenericDerived<number>(42)
        expect(derived.value).assertEqual(42)
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0600
       * @tc.name      testClassExtendsPassT0002
       * @tc.desc      Verify generic class extends GenericBase<T> with string
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testClassExtendsPassT0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: GenericDerived<string> = new GenericDerived<string>('test')
        expect(derived.extra).assertEqual('extra')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0700
       * @tc.name      testNonGenericSubclass0001
       * @tc.desc      Verify non-generic StringBox extends Box<string>
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testNonGenericSubclass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let box: StringBox = new StringBox('hello')
        expect(box.value).assertEqual('hello')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0800
       * @tc.name      testNonGenericSubclass0002
       * @tc.desc      Verify non-generic StringBox log method
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testNonGenericSubclass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let box: StringBox = new StringBox('world')
        expect(box.log()).assertEqual('Box contains: world')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_0900
       * @tc.name      testSubclassNewTypeParam0001
       * @tc.desc      Verify MultiParamDerived reorders parent params
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testSubclassNewTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: MultiParamDerived<string, number, boolean> =
          new MultiParamDerived<string, number, boolean>(100, 'str', true)
        expect(derived.first).assertEqual(100)
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1000
       * @tc.name      testSubclassNewTypeParam0002
       * @tc.desc      Verify MultiParamDerived second param
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testSubclassNewTypeParam0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: MultiParamDerived<string, number, boolean> =
          new MultiParamDerived<string, number, boolean>(100, 'str', true)
        expect(derived.second).assertEqual('str')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1100
       * @tc.name      testSubclassNewTypeParam0003
       * @tc.desc      Verify MultiParamDerived introduces new param C
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testSubclassNewTypeParam0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: MultiParamDerived<string, number, boolean> =
          new MultiParamDerived<string, number, boolean>(100, 'str', true)
        expect(derived.third).assertEqual(true)
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1200
       * @tc.name      testMultipleInterfaceInheritance0001
       * @tc.desc      Verify interface extends two interfaces with same member
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testMultipleInterfaceInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let combined: CombinedInterface<number> = new CombinedImpl<number>(42)
        expect(combined.value).assertEqual(42)
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1300
       * @tc.name      testMultipleInterfaceInheritance0002
       * @tc.desc      Verify interface extends two interfaces extra field
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testMultipleInterfaceInheritance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let combined: CombinedInterface<string> = new CombinedImpl<string>('test')
        expect(combined.extra).assertEqual('combined')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1400
       * @tc.name      testInheritedMethodConcreteType0001
       * @tc.desc      Verify inherited getValue returns correct type at runtime
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInheritedMethodConcreteType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: GenericMethodDerived<Cat> = new GenericMethodDerived<Cat>(new Cat())
        expect(derived.getValue().speak()).assertEqual('meow')
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1500
       * @tc.name      testInheritedMethodConcreteType0002
       * @tc.desc      Verify inherited getValue returns number type
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInheritedMethodConcreteType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: GenericMethodDerived<number> = new GenericMethodDerived<number>(123)
        expect(derived.getValue()).assertEqual(123)
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1700
       * @tc.name      testParentChildAssignability0002
       * @tc.desc      Verify GenericDerived<number> assignable to GenericBase<number>
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testParentChildAssignability0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: GenericDerived<number> = new GenericDerived<number>(42)
        let base: GenericBase<number> = derived
        expect(base.value).assertEqual(42)
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1800
       * @tc.name      testCrossModuleInheritance0001
       * @tc.desc      Verify cross-module generic class inheritance — Base in separate .ets, Derived extends in test file (GTP-IH-009)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testCrossModuleInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: CrossModuleDerived<number> = new CrossModuleDerived<number>(99)
        expect(derived.getValue()).assertEqual(99)
      })

      /**
       * @tc.number    SUB_GENERIC_IH_INHERITANCE_1900
       * @tc.name      testCrossModuleInheritance0002
       * @tc.desc      Verify cross-module generic class inheritance with string type arg (GTP-IH-009)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testCrossModuleInheritance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let derived: CrossModuleDerived<string> = new CrossModuleDerived<string>('cross')
        expect(derived.getValue()).assertEqual('cross')
      })
    })
}
