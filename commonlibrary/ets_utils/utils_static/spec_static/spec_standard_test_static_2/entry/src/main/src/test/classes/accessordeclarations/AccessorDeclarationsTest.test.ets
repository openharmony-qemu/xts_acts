/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Base {
  get field(): Base { return new Base }
  set field(a_field: Derived) {}
}

class Derived extends Base {
  override get field(): Derived { return new Derived }
  override set field(a_field: Base) {}
}

function foo (base: Base) {
  base.field = new Derived // setter is called
  let b: Base = base.field // getter is called
  expect(base.field instanceof Derived).assertTrue();
  expect(b instanceof Base).assertTrue();
}

class TestError extends Error {}

class A {
  private _age: int = 0;

  get age(): int {
    if (this._age == 0) {
      throw new TestError();
    }

    return this._age;
  }
}

class A1 {
  protected _age: int = 5;

  get age(): int {
    return this._age;
  }
}

class B extends A1 {
}

class A2 {
  protected _age: int = 5;

  get age(): int {
    return this._age;
  }
}

class B1 extends A2 {
  override get age(): int {
    return this._age + 5;
  }
}

class A3 {
  private _age: int = 5;

  private get age(): int {
    return this._age;
  }

  public getAge(): int {
    return this.age;
  }
}

class A4 {
  private _age: int;

  get age(): int {
    return this._age;
  }

  set age(value: int) {
    this._age = value;
  }
}

class A5 {
  private static _age: int = 5;

  static get age(): int {
    return A5._age;
  }
}

class A6 {}

class B2 {
  private _obj: A6 = new A6();

  get obj(): A6 {
    return this._obj;
  }
}

class A7 {
  private _age: int = 0;

  get age(): int {
    return this._age;
  }
}

class A8 {
  private _age: int = 0;

  set age(value: int) {
    if (value < 0) {
      throw new TestError();
    }

    this._age = value;
  }
}

class A9 {
  protected _age: int = 0;

  set age(value: int) {
    this._age = value;
  }

  public getAge(): Int {
    return this._age;
  }
}

class B3 extends A9 {
  override set age(value: int) {
    this._age = value + 5;
  }
}

class A10 {
  private _age: int = 0;

  private set age(value: int) {
    this._age = value;
  }

  public setAge(value: int): void {
    this.age = value;
  }

  public getAge(): int {
    return this._age;
  }
}

class A11 {
  private static _age: int = 0;

  static set age(value: int) {
    A11._age = value;
  }

  static getAge(): int {
    return A11._age;
  }
}

class A12 {}

class B4 {
  private _obj: A12 = new A12();

  set obj(value: A12) {
    this._obj = value;
  }

  get obj(): A12 {
    return this._obj;
  }
}

class A13 {
  private _age: int = 0;

  set age(value: int) {
    this._age = value;
  }

  get age(): int {
    return this._age;
  }
}




export default function AccessorDeclarationsTest():void {
  describe('AccessorDeclarationsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0100
     * @tc.name      testAccessorDeclarations0001
     * @tc.desc      In the process of inheriting and overriding, accessors behave as methods. The getter parameter
     * type follows the covariance pattern, and the setter parameter type follows the contravariance pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived = new Derived()
      d.field = new Derived
      let b: Base = d.field
      expect(d.field instanceof Derived).assertTrue()
      expect(b instanceof Base).assertTrue()
    });

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0200
     * @tc.name      testAccessorDeclarations0002
     * @tc.desc      Getter throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A = new A();
      try {
        let a = instance.age;
      } catch (e) {
        expect(e instanceof TestError).assertTrue()
        return
      }
    });

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0300
     * @tc.name      testAccessorDeclarations0003
     * @tc.desc      Field getter inheritance by child class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B = new B();
      expect(instance.age).assertEqual( 5 );
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0400
     * @tc.name      testAccessorDeclarations0004
     * @tc.desc      Field getter with override modifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B1 = new B1();
      expect( instance.age).assertEqual(10 );
      let instance2: A2 = new B1();
      expect( instance2.age).assertEqual(10);
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0500
     * @tc.name      testAccessorDeclarations0005
     * @tc.desc      Field getter with private modifier call in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A3 = new A3();
      expect( instance.getAge()).assertEqual(5);
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0600
     * @tc.name      testAccessorDeclarations0006
     * @tc.desc      Field getter and setter declaration with value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A4 = new A4();
      instance.age = 15;
      expect( instance.age).assertEqual(15 );
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0700
     * @tc.name      testAccessorDeclarations0007
     * @tc.desc      Field getter with static modifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( A5.age).assertEqual(5);
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0800
     * @tc.name      testAccessorDeclarations0008
     * @tc.desc      Field getter declaration with reference type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B2 = new B2();
      expect( instance.obj instanceof A6 ).assertTrue();
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_0900
     * @tc.name      testAccessorDeclarations0009
     * @tc.desc      Field getter declaration with value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A7 = new A7();
      expect(instance.age).assertEqual(0);
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_1000
     * @tc.name      testAccessorDeclarations0010
     * @tc.desc      Setter throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A8 = new A8();
      try {
        instance.age = -5;
      } catch (e) {
        expect(e instanceof TestError).assertTrue();
        return
      }
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_1100
     * @tc.name      testAccessorDeclarations0011
     * @tc.desc      Field setter with override modifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B3 = new B3();
      instance.age = 5;
      expect( instance.getAge()).assertEqual(10 );
      let instance2: A9 = new B3();
      instance2.age = 5;
      expect( instance2.getAge()).assertEqual(10 );
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_1200
     * @tc.name      testAccessorDeclarations0012
     * @tc.desc      Field setter with private modifier call in class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A10 = new A10();
      instance.setAge(5);
      expect( instance.getAge()).assertEqual(5 );
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_1300
     * @tc.name      testAccessorDeclarations0013
     * @tc.desc      Field setter with static modifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      A11.age = 5;
      expect( A11.getAge()).assertEqual(5 );
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_1400
     * @tc.name      testAccessorDeclarations0014
     * @tc.desc      Field setter declaration with reference type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B4 = new B4();
      instance.obj = new A12();
      expect( instance.obj instanceof A12 ).assertTrue();
    })

    /**
     * @tc.number    SUB_ACCESSOR_DECLARATIONS_TEST_1500
     * @tc.name      testAccessorDeclarations0015
     * @tc.desc      Field setter declaration with value type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAccessorDeclarations0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A13 = new A13();
      instance.age = 10;
      expect( instance.age).assertEqual(10 );
    })
  })
}