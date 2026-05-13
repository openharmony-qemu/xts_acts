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

class A {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
    this._publicVar = 3;
  }
}

class B extends A {
  constructor() {
    super();
  }
}

class C extends B {
  constructor() {
    super();
  }

  test(): void {
    expect(this._publicVar).assertEqual(3);
  }
}

class A1 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
    this._publicVar = 3;
  }
}

class B1 extends A1 {
  constructor() {
    super();
  }
}

class C1 extends B1 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(3);
  }
}

class A2 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B2 extends A2 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A3 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B3 extends A3 {
  constructor() {
    super();
  }
}

class C2 extends B3 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A4 {
}

class B4 extends A4 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class C3 extends B4 {

}

class D extends C3 {
  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A5 {
  public _publicVar: number;
}

class B5 extends A5 {
  constructor() {
    this._publicVar = 2;
  }
}

class C4 extends B5 {

}

class D1 extends C4 {
  constructor() {
    this._publicVar = 20;
  }
}

class E extends D1 {

}

class A6 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B6 extends A6 {

}

class C5 extends B6 {

}

class D2 extends C5 {

}

class E1 extends D2 {

}

class F extends E1 {

}

class A7 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B7 extends A7 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A8 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B8 extends A8 {
  constructor() {
    super();
  }
}

class C6 extends B8 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A9 {
}

class B9 extends A9 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class C7 extends B9 {

}

class D3 extends C7 {
  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A10 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B10 extends A10 {

}

class C8 extends B10 {

}

class D4 extends C8 {
  constructor() {
    this._publicVar = 'aaa';
  }
}

class E2 extends D4 {

}

class A11 {
  public _publicVar: string;
  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B11 extends A11 {

}

class C9 extends B11 {

}

class D5 extends C9 {

}

class E3 extends D5 {

}

class F1 extends E3 {

}

class A12 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B12 extends A12 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A13 {
  public _publicVar: null;
  constructor() {
    this._publicVar = null;
  }
}

class B13 extends A13 {
  constructor() {
    super();
  }
}

class C10 extends B13 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A14 {

}

class B14 extends A14 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class C11 extends B14 {

}

class D6 extends C11 {
  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A15 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B15 extends A15 {

}

class C12 extends B15 {

}

class D7 extends C12 {
  constructor() {
    this._publicVar = null;
  }
}

class E4 extends D7 {

}

class A16 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B16 extends A16 {

}

class C13 extends B16 {

}

class D8 extends C13 {

}

class E5 extends D8 {

}

class F2 extends E5 {

}

class A17 {
  public _publicVar:boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B17 extends A17 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A18 {
  public _publicVar: boolean;
  constructor() {
    this._publicVar = true;
  }
}

class B18 extends A18 {
  constructor() {
    super();
  }
}

class C14 extends B18 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A19 {

}

class B19 extends A19 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class C15 extends B19 {

}

class D9 extends C15 {
  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A20 {
  public _publicVar: boolean;
  constructor() {
    this._publicVar = true;
  }
}

class B20 extends A20 {

}

class C16 extends B20 {

}

class D10 extends C16 {
  constructor() {
    this._publicVar = false;
  }
}

class E6 extends D10 {

}

class A21 {
  public _publicVar: boolean;
  constructor() {
    this._publicVar = true;
  }
}

class B21 extends A21 {

}

class C17 extends B21 {

}

class D11 extends C17 {
  constructor() {
    this._publicVar = false;
  }
}

class E7 extends D11 {

}

class A22 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B22 extends A22 {

}

class C18 extends B22 {

}

class D12 extends C18 {

}

class E8 extends D12 {

}

class F3 extends E8 {

}

class A23 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B23 extends A23 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A24 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B24 extends A24 {
  constructor() {
    super();
  }
}

class C19 extends B24 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A25 {

}

class B25 extends A25 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class C20 extends B25 {

}

class D13 extends C20 {
  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A26 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B26 extends A26 {

}

class C21 extends B26 {

}

class D14 extends C21 {
  constructor() {
    this._publicVar = [0];
  }
}

class E9 extends D14 {

}

class A27 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B27 extends A27 {

}

class C22 extends B27 {

}

class D15 extends C22 {

}

class E10 extends D15 {

}

class F4 extends E10 {

}

class A28 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B28 extends A28 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A29 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B29 extends A29 {
  constructor() {
    super();
  }
}

class C23 extends B29 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A30 {
}

class B30 extends A30 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class C24 extends B30 {

}

class D16 extends C24 {
  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A31 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B31 extends A31 {

}

class C25 extends B31 {

}

class D17 extends C25 {
  constructor() {
    this._publicVar = [0];
  }
}

class E11 extends D17 {
  constructor() {
  }

  test() {
    expect(this._publicVar[0]).assertEqual(0);
  }
}

class A32 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B32 extends A32 {

}

class C26 extends B32 {

}

class D18 extends C26 {

}

class E12 extends D18 {

}

class F5 extends E12 {
  constructor() {
    this._publicVar
    expect(this._publicVar[0]).assertEqual(1);
  }
  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A33 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B33 extends A33 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A34 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B34 extends A34 {
  constructor() {
    super();
  }
}

class C27 extends B34 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A35 {
}

class B35 extends A35 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class C28 extends B35 {

}

class D19 extends C28 {
  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A36 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B36 extends A36 {

}

class C29 extends B36 {

}

class D20 extends C29 {
  constructor() {
    this._publicVar = false;
  }
}

class E13 extends D20 {
  constructor() {
    expect(this._publicVar).assertEqual(false);
  }

  test() {
    expect(this._publicVar).assertEqual(false);
  }
}

class A37 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B37 extends A37 {

}

class C30 extends B37 {

}

class D21 extends C30 {

}

class E14 extends D21 {

}

class F6 extends E14 {
  constructor() {
    expect(this._publicVar).assertEqual(true);
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A38 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
    this._publicVar = 3;
  }
}

class B38 extends A38 {
  constructor() {
    super();
  }
}

class C31 extends B38 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(3);
    expect(this._publicVar).assertEqual(2);
  }
}

class A39 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B39 extends A39 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A40 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B40 extends A40 {
  constructor() {
    super();
  }
}

class C32 extends B40 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A41 {

}

class B41 extends A41 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class C33 extends B41 {

}

class D22 extends C33 {
  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A42 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B42 extends A42 {

}

class C34 extends B42 {

}

class D23 extends C34 {
  constructor() {
    this._publicVar = null;
  }
}

class E15 extends D23 {
  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A43 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }

}

class B43 extends A43 {

}

class C35 extends B43 {

}

class D24 extends C35 {

}

class E16 extends D24 {

}

class F7 extends E16 {
  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A44 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B44 extends A44 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A45 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B45 extends A45 {
  constructor() {
    super();
  }
}

class C36 extends B45 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A46 {

}

class B46 extends A46 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class C37 extends B46 {

}

class D25 extends C37 {
  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A47 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B47 extends A47 {

}

class C38 extends B47 {

}

class D26 extends C38 {
  constructor() {
    this._publicVar = 'aaa';
  }
}

class E17 extends D26 {
  test() {
    expect(this._publicVar).assertEqual('aaa');
  }
}

class A48 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }

}

class B48 extends A48 {

}

class C39 extends B48 {

}

class D27 extends C39 {

}

class E18 extends D27 {

}

class F8 extends E18 {
  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A49 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B49 extends A49 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(2)
  }
}

class A50 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B50 extends A50 {
  constructor() {
    super();
  }
}

class C40 extends B50 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A51 {

}

class B51 extends A51 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class C41 extends B51 {

}

class D28 extends C41 {
  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A52 {
  public _publicVar: number;
}

class B52 extends A52 {
  constructor() {
    this._publicVar = 2;
  }
}

class C42 extends B52 {

}

class D29 extends C42 {
  constructor() {
    this._publicVar = 20;
  }
}

class E19 extends D29 {
  test() {
    expect(this._publicVar).assertEqual(20);
  }
}

class A53 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }

}

class B53 extends A53 {

}

class C43 extends B53 {

}

class D30 extends C43 {

}

class E20 extends D30 {

}

class F9 extends E20 {
  test() {
    expect(this._publicVar).assertEqual(2)
  }
}



export default function MultiLevelInheritanceTest():void {
  describe('MultiLevelInheritanceTest', () => {
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
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0100
     * @tc.name      tesMultiLevelInheritance0001
     * @tc.desc      Verify that class C inherits public variable _publicVar with value 3 from class A through class B
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterfaceChildConstVer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterfaceChildConstVer0001';
      let test: C = new C();
      expect(test._publicVar).assertEqual(3);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0200
     * @tc.name      tesMultiLevelInheritance0002
     * @tc.desc      Test whether class c can correctly obtain the initial value of the public variable _publicVar
     * in class a after indirectly inheriting class a from class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0002';
      let test: C1 = new C1();
      expect(test._publicVar).assertEqual(3);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0300
     * @tc.name      tesMultiLevelInheritance0003
     * @tc.desc      Verify that class C1 inherits public variable _publicVar with value 3 from class A1 through class B1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0003';
      let test: B2 = new B2();
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0400
     * @tc.name      tesMultiLevelInheritance0004
     * @tc.desc      To verify whether the instance of class c can accurately obtain the initial value of the public
     * variable _publicVar in class a after class c indirectly inherits class a through class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0004';
      let test: C2 = new C2();
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0500
     * @tc.name      tesMultiLevelInheritance0005
     * @tc.desc      Test whether class d indirectly inherits class b through class c to correctly obtain the initial
     * value of the public variable _publicVar in class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0005';
      let test: D = new D();
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0600
     * @tc.name      tesMultiLevelInheritance0006
     * @tc.desc      Verify that class E inherits overridden _publicVar with value 20 from class D1 in multi-level inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0006';
      let test: E = new E();
      expect(test._publicVar).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0700
     * @tc.name      tesMultiLevelInheritance0007
     * @tc.desc      Check whether the instance of class f can accurately obtain the initial value of the public
     * variable _publicVar in class a after multiple layers of inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0007';
      let test: F = new F();
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0800
     * @tc.name      tesMultiLevelInheritance0008
     * @tc.desc      Verify that the instance of class b inherits from class a can correctly obtain the initial string
     * value of the public variable _publicVar in class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0008';
      let test: B7 = new B7();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0900
     * @tc.name      tesMultiLevelInheritance0009
     * @tc.desc      Multi-level inheritance verifies that the public member variable _publicVar in class a is passed
     * correctly in subclass c and maintains its initial value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0009';
      let test: C6 = new C6();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1000
     * @tc.name      tesMultiLevelInheritance0010
     * @tc.desc      Multi-level inheritance verifies that the public member variable _publicVar in class b is
     * correctly initialized to a specific string value in subclass d
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0010';
      let test: D3 = new D3();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1100
     * @tc.name      tesMultiLevelInheritance0011
     * @tc.desc      Verify that class E2 inherits overridden _publicVar with value 'aaa' from class D4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0011';
      let test: E2 = new E2();
      expect(test._publicVar).assertEqual('aaa');
    });
    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1200
     * @tc.name      tesMultiLevelInheritance0012
     * @tc.desc      Verify that class F1 inherits _publicVar with value 'Multi-level inheritance' through 4-level inheritance chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0012';
      let test: F1 = new F1();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1300
     * @tc.name      tesMultiLevelInheritance0013
     * @tc.desc      Verify that class B12 inherits _publicVar initialized to null from class A12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0013';
      let test: B12 = new B12();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1400
     * @tc.name      tesMultiLevelInheritance0014
     * @tc.desc      Verify that the public member variable _publicVar inherited from class a is correctly initialized
     * to null in subclass c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0014';
      let test: C10 = new C10();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1500
     * @tc.name      tesMultiLevelInheritance0015
     * @tc.desc      Class d inherits class c and indirectly inherits class b can the actual instance correctly obtain
     * the initial null value of the public variable _publicVar in class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0015';
      let test: D6 = new D6();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1600
     * @tc.name      tesMultiLevelInheritance0016
     * @tc.desc      Verify that the instance of class e can correctly obtain the null value of the variable after
     * multiple layers of inheritance and class d resets the value of the inherited variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0016';
      let test: E4 = new E4();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1800
     * @tc.name      tesMultiLevelInheritance0018
     * @tc.desc      Check whether the instance of class b inherits class a and class b can accurately obtain the
     * initial value of the public variable _publicVar in class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0018';
      let test: B17 = new B17();
      expect(test._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1900
     * @tc.name      tesMultiLevelInheritance0019
     * @tc.desc      To verify that class c indirectly inherits class a from class b and can correctly obtain the
     * initial value of the public variable _publicVar defined by class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0019';
      let test: C14 = new C14();
      expect(test._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2000
     * @tc.name      tesMultiLevelInheritance0020
     * @tc.desc      Test whether class d can correctly obtain the initial value of the public variable _publicVar
     * defined in class b by inheriting class C
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0020';
      let test: D9 = new D9();
      expect(test._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2100
     * @tc.name      tesMultiLevelInheritance0021
     * @tc.desc      Test whether the instance of class e can obtain the overridden value of the variable _public_var
     * inherited from class a by overriding the multi-layer inheritance class d
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0021';
      let test: E7 = new E7();
      expect(test._publicVar).assertEqual(false);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2200
     * @tc.name      tesMultiLevelInheritance0022
     * @tc.desc      Verify that the instance of the multi-layer inheritance class f can correctly access and obtain
     * the initial value of the public boolean variable _publicVar defined in class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0022';
      let test: F3 = new F3();
      expect(test._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2300
     * @tc.name      tesMultiLevelInheritance0023
     * @tc.desc      Test whether class b can correctly access the public variable _publicVar defined in class a and
     * obtain the value of its first element after inheriting class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0023';
      let test: B23 = new B23();
      expect(test._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2400
     * @tc.name      tesMultiLevelInheritance0024
     * @tc.desc      Test whether class c can correctly access the public variable _publicVar defined in class a and
     * obtain the value of its first element after inheriting class b and indirectly inheriting class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0024';
      let test: C19 = new C19();
      expect(test._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2500
     * @tc.name      tesMultiLevelInheritance0025
     * @tc.desc      Test whether class d can correctly access the public variable _publicVar defined in class b and
     * obtain the value of its first element after inheriting from class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0025';
      let test: D13 = new D13();
      expect(test._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2600
     * @tc.name      tesMultiLevelInheritance0026
     * @tc.desc      Verify that class E9 inherits overridden _publicVar with first element 0 from class D14
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0026';
      let test: E9 = new E9();
      expect(test._publicVar[0]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2700
     * @tc.name      tesMultiLevelInheritance0027
     * @tc.desc      Verify that class F5 inherits public _publicVar with first element 1 from class A28 through 4-level chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0027';
      let test: F4 = new F4();
      expect(test._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2800
     * @tc.name      tesMultiLevelInheritance0028
     * @tc.desc      Verify that class B28 inherits public _publicVar with first element 1 from class A28
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0028';
      let b: B28 = new B28();
      expect(b._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2900
     * @tc.name      tesMultiLevelInheritance0029
     * @tc.desc      Verify that class C23 inherits public _publicVar with first element 1 from class A29 through class B29
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0029';
      let c: C23 = new C23();
      expect(c._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3000
     * @tc.name      tesMultiLevelInheritance0030
     * @tc.desc      Verify that class D16 inherits public _publicVar with first element 1 from class A30 through class B30 and class C24
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0030';
      let d: D16 = new D16();
      expect(d._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3100
     * @tc.name      tesMultiLevelInheritance0031
     * @tc.desc      Verify that class E11 inherits overridden public _publicVar with first element 0 from class D17
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0031';
      let e: E11 = new E11();
      expect(e._publicVar[0]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3200
     * @tc.name      tesMultiLevelInheritance0032
     * @tc.desc      Verify that class F5 inherits public _publicVar with first element 1 from class A28 through 5-level chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0032';
      let f: F5 = new F5();
      expect(f._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3300
     * @tc.name      tesMultiLevelInheritance0033
     * @tc.desc      Verify that class B33 inherits public _publicVar with value true from class A33
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0033';
      let b: B33 = new B33();
      expect(b._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3400
     * @tc.name      tesMultiLevelInheritance0034
     * @tc.desc      Make sure that the public member variable _publicVar is properly initialized in base class a and
     * that the value remains unchanged in the lowest subclass c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0034';
      let c: C27 = new C27();
      expect(c._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3500
     * @tc.name      tesMultiLevelInheritance0035
     * @tc.desc      Verify that class D19 inherits public _publicVar with value true from class B35 through class C28
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0035';
      let d: D19 = new D19();
      expect(d._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3600
     * @tc.name      tesMultiLevelInheritance0036
     * @tc.desc      Verify that class E13 inherits overridden _publicVar with value false from class D20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0036';
      let e: E13 = new E13();
      expect(e._publicVar).assertEqual(false);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3700
     * @tc.name      tesMultiLevelInheritance0037
     * @tc.desc      Verify that class F6 inherits public _publicVar with value true from class A21 through 4-level chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0037';
      let f: F6 = new F6();
      expect(f._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3800
     * @tc.name      tesMultiLevelInheritance0038
     * @tc.desc      Verify that class C31 inherits public _publicVar with value 2 and public _publicVar with value 3 from class A38 through class B38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0038';
      let c: C31 = new C31();
      expect(c._publicVar).assertEqual(3);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3900
     * @tc.name      tesMultiLevelInheritance0039
     * @tc.desc      Verify that the public member variable _public_var, inherited from the parent class a,
     * is correctly initialized to null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0039';
      let test: B39 = new B39;
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4000
     * @tc.name      tesMultiLevelInheritance0040
     * @tc.desc      Create an inheritance chain a -> b -> c and verify that the public property _public_var
     * inherited from class a is null in the test method of class c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0040';
      let test: C32 = new C32();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4100
     * @tc.name      tesMultiLevelInheritance0041
     * @tc.desc      Verify that class d inherits from class c and accesses the public property _public_var with a
     * value of null through class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0041';
      let test: D22 = new D22();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4200
     * @tc.name      tesMultiLevelInheritance0042
     * @tc.desc      Verify that class e inherits from class d and accesses the public property _public_var through
     * the inheritance chain to be null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0042';
      let test: E15 = new E15;
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4300
     * @tc.name      tesMultiLevelInheritance0043
     * @tc.desc      Whether the public member variable _public_var passed from class a to class f through a
     * multi-level inheritance chain is correctly initialized to null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0043';
      let test: F7 = new F7;
      expect(test._publicVar).assertEqual(null);
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4400
     * @tc.name      tesMultiLevelInheritance0044
     * @tc.desc       Verify that the public member variable _public_var, which is inherited from the parent class a,
     * is correctly initialized to the string'multi-level inheritance'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0044';
      let test: B44 = new B44;
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4500
     * @tc.name      tesMultiLevelInheritance0045
     * @tc.desc      Verify that the public property _public_var inherited from class a is'multi-level inheritance'
     * in the test method of class c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0045';
      let test: C36 = new C36;
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4600
     * @tc.name      tesMultiLevelInheritance0046
     * @tc.desc      Whether the public member variable _public_var passed from class b to class d in the multi-level
     * inheritance chain is correctly initialized to the string'multi-level inheritance'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0046';
      let test: D25 = new D25();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4700
     * @tc.name      tesMultiLevelInheritance0047
     * @tc.desc      Change the public property _public_var inherited from class a to'aa' in class d, and verify
     * that the property value is'aa' in the test method of class e
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0047';
      let test: E17 = new E17;
      expect(test._publicVar).assertEqual('aaa');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4800
     * @tc.name      tesMultiLevelInheritance0048
     * @tc.desc      Verify that the public member variable _public_var inherited from class a to class f is
     * correctly initialized to the string'multi-level inheritance' after multi-level inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0048';
      let test: F8 = new F8;
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4900
     * @tc.name      tesMultiLevelInheritance0049
     * @tc.desc      Verify that the public property _public_var inherited from class a is two in the test method
     * of class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0049';
      let test: B49 = new B49;
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_5000
     * @tc.name      tesMultiLevelInheritance0050
     * @tc.desc      Verify that the public member variable _public_var, inherited from the parent class a,
     * is correctly initialized to the value two
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0042';
      let test: C40 = new C40;
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_5100
     * @tc.name      tesMultiLevelInheritance0051
     * @tc.desc      Whether the public member variable _public_var passed from class b to class d through a
     * multi-level inheritance chain is correctly initialized to the value two
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0051';
      let test: D28 = new D28;
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_5200
     * @tc.name      tesMultiLevelInheritance0052
     * @tc.desc      This test scenario verifies that subclasses d and e correctly reinitialize the public member
     * variable _public_var to the number 20 in a multi-level inheritance chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0052';
      let test: E19 = new E19;
      expect(test._publicVar).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_5300
     * @tc.name      tesMultiLevelInheritance0053
     * @tc.desc      Verify that the public property _public_var inherited from class a is two
    in the test method of class f
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("tesMultiLevelInheritance0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'tesMultiLevelInheritance0053';
      let test: F9 = new F9;
      expect(test._publicVar).assertEqual(2);
    });
  })
}
