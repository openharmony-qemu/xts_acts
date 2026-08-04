'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '../../../../../hypium/index';

import Utils from '../../Util.test'

class CastA<T> {
    cast(p: Object): T {
        return p as T
    }
}

class CastB<T> {
    value: T | null = null
    get(): T {
        return this.value as T
    }
    set(v: Object): void {
        this.value = v as T
    }
}

class CastC<T> {
    wrap(p: Object): T {
        return p as T
    }
}

class CastD<T> {
    inner: T | null = null
    getInner(): T {
        return this.inner as T
    }
}

class CastE<T> {
    handle(p: Object | null): T | null {
        return p as T
    }
}

class CastF<T> {
    extract(p: Object): T {
        return p as T
    }
}

class CastG<T, U> {
    first: T | null = null
    getFirst(): T {
        return this.first as T
    }
}

class CastH<T> {
    register(cb: (p: number) => number): T {
        return cb as T
    }
}

class CastI<T> {
    private _value: Object = new Object()
    get value(): T {
        return this._value as T
    }
    set value(v: Object) {
        this._value = v
    }
}

let x0: Array<string> = ['']
class MyClass {}
class Base {}
class Derived extends Base {}
class Animal {}
class Dog extends Animal {}
class A {}
class B {}

enum Color { Red, Green, Blue }

// instanceof_0: Generic class instanceof
class A_InstanceOf<T> {
  name: string = 'A'
}
class B_InstanceOf extends A_InstanceOf<number> {
  age: number = 10
}

// instanceof_1: Generic class with multiple type parameters
class G1<T, U> {}
class G2 extends G1<number, string> {}

// instanceof_2: Generic interface implementation
interface IPerson<T> {}
class Person<T> implements IPerson<T> {}
class Student extends Person<string> {}

// instanceof_3: Nested generic inheritance
class Base3<T> {}
class Derived3<T> extends Base3<T> {}
class MoreDerived3 extends Derived3<number> {}

// instanceof_4: Generic class with method
class A4<T> {
  value: T | null = null
  get(): T {
    return this.value as T
  }
  set(v: T): void {
    this.value = v
  }
}
class B4 extends A4<number> {}

// instanceof_5: Generic class with array type
class A5<T> {}
class B5 extends A5<string[]> {}

// instanceof_6: Generic class with union type
class A6<T> {}
class B6 extends A6<number | string> {}

// instanceof_7: Generic interface with multiple implementations
interface IContainer<T> {}
class Container<T> implements IContainer<T> {}
class IntContainer extends Container<number> {}
class StringContainer extends Container<string> {}

// instanceof_8: Generic class with constructor
class A8<T> {
  value: T | null = null
  constructor(p: T) {
    this.value = p
  }
}
class B8 extends A8<number> {
  constructor(p: number) {
    super(p)
  }
}

// instanceof_9: Generic class with static method
class A9<T> {
  static create(): A9<number> {
    return new A9<number>()
  }
}
class B9 extends A9<number> {}

// instanceof_10: Generic class with property
class A10<T> {
  prop: T | null = null
}
class B10 extends A10<number> {}

// instanceof_11: Generic class with multiple properties
class A11<T, U> {
  prop1: T | null = null
  prop2: U | null = null
}
class B11 extends A11<number, string> {}

// instanceof_12: Generic class with method
class A12<T> {
  process(p: T): string {
    return 'processed'
  }
}
class B12 extends A12<number> {}

// instanceof_13: Generic class with getter
class A13<T> {
  private _value: T | null = null
  get value(): T {
    return this._value as T
  }
}
class B13 extends A13<number> {}

// instanceof_14: Generic class with setter
class A14<T> {
  private _value: T | null = null
  set value(v: T) {
    this._value = v
  }
}
class B14 extends A14<number> {}

export default function TypeErasureTest():void {
  describe('TypeErasureTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0100
     * @tc.name      testCastExpression0001
     * @tc.desc      Cast with generic class - type T affected by type erasure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj0: Object = new Error('abc')
      let x = new CastA<Error>().cast(obj0)
      expect(x instanceof Error).assertTrue();
      expect(x.message).assertEqual('abc');
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0200
     * @tc.name      testCastExpression0002
     * @tc.desc      ClassCastError when casting incompatible type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new CastA<Error>()
      try {
        let result = a.cast('abc')
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof ClassCastError).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0300
     * @tc.name      testCastExpression0003
     * @tc.desc      Cast between erased generic types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new CastB<number>()
      c.set(42.0 as Object)
      let result = c.get()
      expect(result == 42.0).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0400
     * @tc.name      testCastExpression0004
     * @tc.desc      Cast with union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new CastC<string | number>()
      let result: Object = d.wrap(123.0 as Object)
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0500
     * @tc.name      testCastExpression0005
     * @tc.desc      Multiple level generics casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e = new CastD<Array<number>>()
      e.inner = [1, 2, 3] as Array<number>
      expect(e.getInner().length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0600
     * @tc.name      testCastExpression0006
     * @tc.desc      Cast from null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g = new CastE<string>()
      let result = g.handle(null)
      expect(result == null).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0700
     * @tc.name      testCastExpression0007
     * @tc.desc      Multiple type parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = new CastG<number, string>()
      i.first = 1 as number
      expect(i.getFirst()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0800
     * @tc.name      testCastExpression0008
     * @tc.desc      FixedArray type casting
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj2: FixedArray<'a'|'b'> = ['a']
      let x = ((): Object => obj2)() as FixedArray<string>
      expect(x[0]).assertEqual('a');
      x[0] = 'c'
      expect(x[0]).assertEqual('c');
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_0900
     * @tc.name      testCastExpression0009
     * @tc.desc      Cast with string literal types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj3: 'a'|'bb' = 'bb'
      let x = ((): Object => obj3)() as string
      expect(x).assertEqual('bb');
      x = 'c'
      expect(x).assertEqual('c');
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_1000
     * @tc.name      testCastExpression0010
     * @tc.desc      Cast with getter/setter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new CastI<number>()
      ab.value = 42.0 as Object
      let result: Object = ab.value
      expect(result == 42.0).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_1100
     * @tc.name      testCastExpression0011
     * @tc.desc      Cast with class inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d = new CastF<Derived>()
      let result = d.extract(new Derived() as Object)
      expect(result instanceof Derived).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_CAST_1200
     * @tc.name      testCastExpression0012
     * @tc.desc      Cast with Error type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCastExpression0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l = new CastF<Error>()
      let e = l.extract(new Error('test') as Object)
      expect(e.message).assertEqual('test');
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0100
     * @tc.name      testInstanceofBasic0001
     * @tc.desc      instanceof with Array type - type preserved
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((): Object => x0)() instanceof Array).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0200
     * @tc.name      testInstanceofBasic0002
     * @tc.desc      instanceof with basic class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MyClass = new MyClass()
      expect(obj instanceof MyClass).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0300
     * @tc.name      testInstanceofBasic0003
     * @tc.desc      instanceof with inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived = new Derived()
      expect(d instanceof Derived).assertTrue();
      expect(d instanceof Base).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0400
     * @tc.name      testInstanceofBasic0004
     * @tc.desc      instanceof with Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('test')
      expect(s instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0500
     * @tc.name      testInstanceofBasic0005
     * @tc.desc      instanceof with Number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: Number = new Number(42)
      expect(n instanceof Number).assertTrue();
      expect(n instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0600
     * @tc.name      testInstanceofBasic0006
     * @tc.desc      instanceof with Boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Boolean = new Boolean(true)
      expect(b instanceof Boolean).assertTrue();
      expect(b instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0700
     * @tc.name      testInstanceofBasic0007
     * @tc.desc      instanceof with custom object hierarchy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dog: Dog = new Dog()
      expect(dog instanceof Dog).assertTrue();
      expect(dog instanceof Animal).assertTrue();
      expect(dog instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0800
     * @tc.name      testInstanceofBasic0008
     * @tc.desc      instanceof with union type object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: A | B = new A()
      expect(obj instanceof A).assertTrue();
      expect((obj instanceof B)).assertFalse();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_BASIC_0900
     * @tc.name      testInstanceofBasic0009
     * @tc.desc      instanceof with Error types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceofBasic0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('test')
      expect(e instanceof Error).assertTrue();
      expect(e instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0100
     * @tc.name      testTypeErasureInstanceOf0001
     * @tc.desc      Array instanceof test - instanceof_0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Array<string> = ['']
      let result: Object = x
      expect(result instanceof Array).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0200
     * @tc.name      testTypeErasureInstanceOf0002
     * @tc.desc      FixedArray instanceof test without erased type arguments - instanceof_gen_0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x : FixedArray<string> = ["a", "b", "c"]
      let result: FixedArray<string> = x
      expect(result instanceof FixedArray<string | undefined>).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0300
     * @tc.name      testTypeErasureInstanceOf0003
     * @tc.desc      Generic class instanceof - instanceof_1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_InstanceOf = new B_InstanceOf()
      expect(b instanceof B_InstanceOf).assertTrue()
      expect(b instanceof A_InstanceOf).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0400
     * @tc.name      testTypeErasureInstanceOf0004
     * @tc.desc      Generic class with multiple type parameters - instanceof_2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: G2 = new G2()
      expect(g instanceof G2).assertTrue()
      expect(g instanceof G1).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0500
     * @tc.name      testTypeErasureInstanceOf0005
     * @tc.desc      Generic interface implementation - instanceof_3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Student = new Student()
      expect(s instanceof Student).assertTrue()
      expect(s instanceof Person).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0600
     * @tc.name      testTypeErasureInstanceOf0006
     * @tc.desc      Nested generic inheritance - instanceof_4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: MoreDerived3 = new MoreDerived3()
      expect(m instanceof MoreDerived3).assertTrue()
      expect(m instanceof Derived3).assertTrue()
      expect(m instanceof Base3).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0700
     * @tc.name      testTypeErasureInstanceOf0007
     * @tc.desc      Generic class with method - instanceof_5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B4 = new B4()
      expect(b instanceof B4).assertTrue()
      expect(b instanceof A4).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0800
     * @tc.name      testTypeErasureInstanceOf0008
     * @tc.desc      Generic class with array type - instanceof_6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B5 = new B5()
      expect(b instanceof B5).assertTrue()
      expect(b instanceof A5).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_0900
     * @tc.name      testTypeErasureInstanceOf0009
     * @tc.desc      Generic class with union type - instanceof_7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B6 = new B6()
      expect(b instanceof B6).assertTrue()
      expect(b instanceof A6).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_1000
     * @tc.name      testTypeErasureInstanceOf0010
     * @tc.desc      Generic interface with multiple implementations - instanceof_8
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ic: IntContainer = new IntContainer()
      let sc: StringContainer = new StringContainer()
      expect(ic instanceof IntContainer).assertTrue()
      expect(ic instanceof Container).assertTrue()
      expect(sc instanceof StringContainer).assertTrue()
      expect(sc instanceof Container).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_1100
     * @tc.name      testTypeErasureInstanceOf0011
     * @tc.desc      Generic class with constructor - instanceof_9
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B8 = new B8(10)
      expect(b instanceof B8).assertTrue()
      expect(b instanceof A8).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_1200
     * @tc.name      testTypeErasureInstanceOf0012
     * @tc.desc      Generic class with static method - instanceof_10
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B9 = new B9()
      expect(b instanceof B9).assertTrue()
      expect(b instanceof A9).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_1300
     * @tc.name      testTypeErasureInstanceOf0013
     * @tc.desc      Generic class with property - instanceof_11
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B10 = new B10()
      expect(b instanceof B10).assertTrue()
      expect(b instanceof A10).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_1400
     * @tc.name      testTypeErasureInstanceOf0014
     * @tc.desc      Generic class with multiple properties - instanceof_12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B11 = new B11()
      expect(b instanceof B11).assertTrue()
      expect(b instanceof A11).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_1500
     * @tc.name      testTypeErasureInstanceOf0015
     * @tc.desc      Generic class with method - instanceof_13
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B12 = new B12()
      expect(b instanceof B12).assertTrue()
      expect(b instanceof A12).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_1600
     * @tc.name      testTypeErasureInstanceOf0016
     * @tc.desc      Generic class with getter - instanceof_14
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B13 = new B13()
      expect(b instanceof B13).assertTrue()
      expect(b instanceof A13).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_ERASURE_TEST_INSTANCEOF_1700
     * @tc.name      testTypeErasureInstanceOf0017
     * @tc.desc      Generic class with setter - instanceof_15
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeErasureInstanceOf0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B14 = new B14()
      expect(b instanceof B14).assertTrue()
      expect(b instanceof A14).assertTrue()
    });
  })
}
