'use static';
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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test.ets'

class A {
}

class B extends A {
}

class C extends B {
}


class A1 {
  constructor() {
  }
}

class A2 {
  public constructor() {
  }
}

class Base {
  count: int = 0;

  public constructor(i?: int) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived extends Base {
}


class Base1 {
  count: int = 0;

  public constructor(i?: int) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived1 extends Base1 {
  constructor() {
  }
}


class Base2 {
  count: int = 0;

  public constructor(i?: int) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived2 extends Base2 {
  constructor() {
    super()
  }
}

class Base3 {
  count: int = 0;

  protected constructor(i?: int) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived3 extends Base3 {
}

class Base4 {
  count: int = 0;

  protected constructor(i?: int) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived4 extends Base4 {
  constructor() {
  }
}

class Base5 {
  count: number = 0;

  protected constructor(i?: number) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived5 extends Base5 {
  constructor() {
    super()
  }
}

class Base6 {
  count: int = 0;

  public constructor(i: int = 5) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived6 extends Base6 {
}

class Base7 {
  count: int = 0;

  public constructor(i: int = 5) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived7 extends Base7 {
  constructor() {
  }
}

class Base8 {
  count: int = 0;

  public constructor(i: int = 5) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived8 extends Base8 {
  constructor() {
    super()
  }
}

class Base9 {
  count: int = 0;

  protected constructor(i: int = 5) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived9 extends Base9 {
}

class Base10 {
  count: int = 0;

  protected constructor(i: int = 5) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived10 extends Base10 {
  constructor() {
  }
}

class Base11 {
  count: int = 0;

  protected constructor(i: int = 5) {
    super();
    this.count = i != undefined ? i : -1;
  }
}

class Derived11 extends Base11 {
  constructor() {
    super()
  }
}

class A3 {
  isCalled: boolean = false;

  protected constructor() {
    this.isCalled = true;
  }
}

class B1 extends A3 {
}


class A4 {
  isCalled: boolean = false;

  protected constructor() {
    this.isCalled = true;
  }
}

class B2 extends A4 {
  constructor() {
  }
}


class A5 {
  isCalled: boolean = false;

  protected constructor() {
    this.isCalled = true;
  }
}

class B3 extends A5 {
  constructor() {
    super()
  }
}

class A6 {
  public x: int;
  public b1: B | undefined;
  public b2: B | null = null;
}

class B4 {
}

class Base12 {
  isCalled: boolean = false;

  constructor() {
    super()
    this.isCalled = true;
  }
}

class Derived12 extends Base12 {
  constructor() {
    super();
  }
}


class A7 {
  public x: int;
  public b1: B | undefined;
  public b2: B | null = null;
}

class B5 extends A7 {
}

let recoil: string = '';

function sf(input: string): string {
  recoil += input
  return input;
}

class OT {
  t0: string = sf('T')
  e: string = sf('e')
  s: string = sf('s')
  t1: string = sf('t')
}

function sf1(input: string): string {
  recoil += input
  return input;
}

class BT {
  t0: string = sf('T')
  e: string = sf('e')
}

class OT1 extends BT {
  s: string = sf('s')
  t1: string = sf('t')
}

export default function DefaultConstructorTest(): void {
  describe('DefaultConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0100
     * @tc.name      testDefaultConstructor0001
     * @tc.desc      If a class contains no constructor declaration, then a default constructor isimplicitly declared.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A();
      let b: B = new B();
      let c: C = new C();
      expect(a instanceof A).assertTrue();
      expect(b instanceof B).assertTrue();
      expect(c instanceof C).assertTrue();
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0200
     * @tc.name      testDefaultConstructor0002
     * @tc.desc      Class declarations with default constructors declared implicitly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A1 = new A1();
      expect(a instanceof A1).assertTrue();
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0300
     * @tc.name      testDefaultConstructor0003
     * @tc.desc      Class declarations with default constructors declared implicitly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A2 = new A2();
      expect(a instanceof A2).assertTrue();
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0400
     * @tc.name      testDefaultConstructor0004
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived = new Derived();
      expect(-1).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0500
     * @tc.name      testDefaultConstructor0005
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived1 = new Derived1();
      expect(-1).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0600
     * @tc.name      testDefaultConstructor0006
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived2 = new Derived2();
      expect(-1).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0700
     * @tc.name      testDefaultConstructor0007
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived3 = new Derived3();
      expect(-1).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0800
     * @tc.name      testDefaultConstructor0008
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived4 = new Derived4();
      expect(-1).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_0900
     * @tc.name      testDefaultConstructor0009
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived5 = new Derived5();
      expect(-1).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1000
     * @tc.name      testDefaultConstructor0010
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived6 = new Derived6();
      expect(5).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1100
     * @tc.name      testDefaultConstructor0011
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived7 = new Derived7();
      expect(5).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1200
     * @tc.name      testDefaultConstructor0012
     * @tc.desc      Default constructors added, superclass with optional parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived8 = new Derived8();
      expect(5).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1300
     * @tc.name      testDefaultConstructor0013
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived9 = new Derived9();
      expect(5).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1400
     * @tc.name      testDefaultConstructor0014
     * @tc.desc      Default constructors added, superclass with optional parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived10 = new Derived10();
      expect(5).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1500
     * @tc.name      testDefaultConstructor0015
     * @tc.desc      Default constructors added, superclass with optional parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Derived11 = new Derived11();
      expect(5).assertEqual(d.count);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1600
     * @tc.name      testDefaultConstructor0016
     * @tc.desc      Class default constructor invokes the protected or private default constructor of superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B1 = new B1();
      expect(b.isCalled).assertTrue();
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1700
     * @tc.name      testDefaultConstructor0017
     * @tc.desc      Class default constructor invokes the protected or private default constructor of superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B2 = new B2();
      expect(b.isCalled).assertTrue();
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1800
     * @tc.name      testDefaultConstructor0018
     * @tc.desc      Class default constructor invokes the protected or private default constructor of superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B3 = new B3();
      expect(b.isCalled).assertTrue();
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_1900
     * @tc.name      testDefaultConstructor0019
     * @tc.desc      Default class constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A6 = new A6();
      expect(instance.x).assertEqual(0);
      expect(instance.b1).assertEqual(undefined);
      expect(instance.b2).assertEqual(null);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_2000
     * @tc.name      testDefaultConstructor0020
     * @tc.desc      Class default constructor invokes default constructor of superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b: Base12 = new Base12();
      let d: Derived12 = new Derived12();
      expect(b.isCalled).assertTrue();
      expect(d.isCalled).assertTrue();
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_2100
     * @tc.name      testDefaultConstructor0021
     * @tc.desc      Default class constructor invoke default constructor of superclass.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: B5 = new B5();
      expect(instance.x).assertEqual(0);
      expect(instance.b1).assertEqual(undefined);
      expect(instance.b2).assertEqual(null);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_2200
     * @tc.name      testDefaultConstructor0022
     * @tc.desc      Mandatory execution of field initializers (if any) in the order they appear in a class body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      recoil = ''
      let ot = new OT;
      expect('Test').assertEqual(recoil);
    });
    /**
     * @tc.number    SUB_DEFAULT_CONSTRUCTOR_TEST_2300
     * @tc.name      testDefaultConstructor0023
     * @tc.desc      Mandatory execution of field initializers (if any) in the order they appear in a class body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDefaultConstructor0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      recoil = ''
      let ot = new OT1;
      expect('Test').assertEqual(recoil);
    });
  })
}
