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

class A_1 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
    this._publicVar = 3;
  }
}

class B_1 extends A_1 {
  constructor() {
    super();
  }
}

class C_1 extends B_1 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(3);
  }
}

class A_2 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B_2 extends A_2 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A_3 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B_3 extends A_3 {
  constructor() {
    super();
  }
}

class C_2 extends B_3 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A_4 {
}

class B_4 extends A_4 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class C_3 extends B_4 {

}

class D extends C_3 {
  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A_5 {
  public _publicVar: number;
}

class B_5 extends A_5 {
  constructor() {
    this._publicVar = 2;
  }
}

class C_4 extends B_5 {

}

class D_1 extends C_4 {
  constructor() {
    this._publicVar = 20;
  }
}

class E extends D_1 {

}

class A_6 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B_6 extends A_6 {

}

class C_5 extends B_6 {

}

class D_2 extends C_5 {

}

class E_1 extends D_2 {

}

class F extends E_1 {

}

class A_7 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B_7 extends A_7 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A_8 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B_8 extends A_8 {
  constructor() {
    super();
  }
}

class C_6 extends B_8 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A_9 {
}

class B_9 extends A_9 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class C_7 extends B_9 {

}

class D_3 extends C_7 {
  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A_10 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B_10 extends A_10 {

}

class C_8 extends B_10 {

}

class D_4 extends C_8 {
  constructor() {
    this._publicVar = 'aaa';
  }
}

class E_2 extends D_4 {

}

class A_11 {
  public _publicVar: string;
  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B_11 extends A_11 {

}

class C_9 extends B_11 {

}

class D_5 extends C_9 {

}

class E_3 extends D_5 {

}

class F_1 extends E_3 {

}

class A_12 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B_12 extends A_12 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A_13 {
  public _publicVar: null;
  constructor() {
    this._publicVar = null;
  }
}

class B_13 extends A_13 {
  constructor() {
    super();
  }
}

class C_10 extends B_13 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A_14 {

}

class B_14 extends A_14 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class C_11 extends B_14 {

}

class D_6 extends C_11 {
  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A_15 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B_15 extends A_15 {

}

class C_12 extends B_15 {

}

class D_7 extends C_12 {
  constructor() {
    this._publicVar = null;
  }
}

class E_4 extends D_7 {

}

class A_16 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B_16 extends A_16 {

}

class C_13 extends B_16 {

}

class D_8 extends C_13 {

}

class E_5 extends D_8 {

}

class F_2 extends E_5 {

}

class A_17 {
  public _publicVar:boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B_17 extends A_17 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A_18 {
  public _publicVar: boolean;
  constructor() {
    this._publicVar = true;
  }
}

class B_18 extends A_18 {
  constructor() {
    super();
  }
}

class C_14 extends B_18 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A_19 {

}

class B_19 extends A_19 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class C_15 extends B_19 {

}

class D_9 extends C_15 {
  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A_20 {
  public _publicVar: boolean;
  constructor() {
    this._publicVar = true;
  }
}

class B_20 extends A_20 {

}

class C_16 extends B_20 {

}

class D_10 extends C_16 {
  constructor() {
    this._publicVar = false;
  }
}

class E_6 extends D_10 {

}

class A_21 {
  public _publicVar: boolean;
  constructor() {
    this._publicVar = true;
  }
}

class B_21 extends A_21 {

}

class C_17 extends B_21 {

}

class D_11 extends C_17 {
  constructor() {
    this._publicVar = false;
  }
}

class E_7 extends D_11 {

}

class A_22 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B_22 extends A_22 {

}

class C_18 extends B_22 {

}

class D_12 extends C_18 {

}

class E_8 extends D_12 {

}

class F_3 extends E_8 {

}

class A_23 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B_23 extends A_23 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A_24 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B_24 extends A_24 {
  constructor() {
    super();
  }
}

class C_19 extends B_24 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A_25 {

}

class B_25 extends A_25 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class C_20 extends B_25 {

}

class D_13 extends C_20 {
  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A_26 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B_26 extends A_26 {

}

class C_21 extends B_26 {

}

class D_14 extends C_21 {
  constructor() {
    this._publicVar = [0];
  }
}

class E_9 extends D_14 {

}

class A_27 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B_27 extends A_27 {

}

class C_22 extends B_27 {

}

class D_15 extends C_22 {

}

class E_10 extends D_15 {

}

class F_4 extends E_10 {

}

class A_28 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B_28 extends A_28 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A_29 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B_29 extends A_29 {
  constructor() {
    super();
  }
}

class C_23 extends B_29 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A_30 {
}

class B_30 extends A_30 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class C_24 extends B_30 {

}

class D_16 extends C_24 {
  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A_31 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B_31 extends A_31 {

}

class C_25 extends B_31 {

}

class D_17 extends C_25 {
  constructor() {
    this._publicVar = [0];
  }
}

class E_11 extends D_17 {
  constructor() {
    super()
  }

  test() {
    expect(this._publicVar[0]).assertEqual(0);
  }
}

class A_32 {
  public _publicVar: number[];

  constructor() {
    this._publicVar = [1, 2, 3];
  }
}

class B_32 extends A_32 {

}

class C_26 extends B_32 {

}

class D_18 extends C_26 {

}

class E_12 extends D_18 {

}

class F_5 extends E_12 {
  constructor() {
    this._publicVar
    expect(this._publicVar[0]).assertEqual(1);
  }
  test() {
    expect(this._publicVar[0]).assertEqual(1);
  }
}

class A_33 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B_33 extends A_33 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A_34 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B_34 extends A_34 {
  constructor() {
    super();
  }
}

class C_27 extends B_34 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A_35 {
}

class B_35 extends A_35 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class C_28 extends B_35 {

}

class D_19 extends C_28 {
  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A_36 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B_36 extends A_36 {

}

class C_29 extends B_36 {

}

class D_20 extends C_29 {
  constructor() {
    this._publicVar = false;
  }
}

class E_13 extends D_20 {
  constructor() {
    expect(this._publicVar).assertEqual(false);
  }

  test() {
    expect(this._publicVar).assertEqual(false);
  }
}

class A_37 {
  public _publicVar: boolean;

  constructor() {
    this._publicVar = true;
  }
}

class B_37 extends A_37 {

}

class C_30 extends B_37 {

}

class D_21 extends C_30 {

}

class E_14 extends D_21 {

}

class F_6 extends E_14 {
  constructor() {
    expect(this._publicVar).assertEqual(true);
  }

  test() {
    expect(this._publicVar).assertEqual(true);
  }
}

class A_38 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
    this._publicVar = 3;
  }
}

class B_38 extends A_38 {
  constructor() {
    super();
  }
}

class C_31 extends B_38 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(3);
    expect(this._publicVar).assertEqual(2);
  }
}

class A_39 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B_39 extends A_39 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A_40 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B_40 extends A_40 {
  constructor() {
    super();
  }
}

class C_32 extends B_40 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A_41 {

}

class B_41 extends A_41 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class C_33 extends B_41 {

}

class D_22 extends C_33 {
  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A_42 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }
}

class B_42 extends A_42 {

}

class C_34 extends B_42 {

}

class D_23 extends C_34 {
  constructor() {
    this._publicVar = null;
  }
}

class E_15 extends D_23 {
  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A_43 {
  public _publicVar: null;

  constructor() {
    this._publicVar = null;
  }

}

class B_43 extends A_43 {

}

class C_35 extends B_43 {

}

class D_24 extends C_35 {

}

class E_16 extends D_24 {

}

class F_7 extends E_16 {
  test() {
    expect(this._publicVar).assertEqual(null);
  }
}

class A_44 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B_44 extends A_44 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A_45 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B_45 extends A_45 {
  constructor() {
    super();
  }
}

class C_36 extends B_45 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A_46 {

}

class B_46 extends A_46 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class C_37 extends B_46 {

}

class D_25 extends C_37 {
  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A_47 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }
}

class B_47 extends A_47 {

}

class C_38 extends B_47 {

}

class D_26 extends C_38 {
  constructor() {
    this._publicVar = 'aaa';
  }
}

class E_17 extends D_26 {
  test() {
    expect(this._publicVar).assertEqual('aaa');
  }
}

class A_48 {
  public _publicVar: string;

  constructor() {
    this._publicVar = 'Multi-level inheritance';
  }

}

class B_48 extends A_48 {

}

class C_39 extends B_48 {

}

class D_27 extends C_39 {

}

class E_18 extends D_27 {

}

class F_8 extends E_18 {
  test() {
    expect(this._publicVar).assertEqual('Multi-level inheritance');
  }
}

class A_49 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B_49 extends A_49 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(2)
  }
}

class A_50 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class B_50 extends A_50 {
  constructor() {
    super();
  }
}

class C_40 extends B_50 {
  constructor() {
    super();
  }

  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A_51 {

}

class B_51 extends A_51 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }
}

class C_41 extends B_51 {

}

class D_28 extends C_41 {
  test() {
    expect(this._publicVar).assertEqual(2);
  }
}

class A_52 {
  public _publicVar: number;
}

class B_52 extends A_52 {
  constructor() {
    this._publicVar = 2;
  }
}

class C_42 extends B_52 {

}

class D_29 extends C_42 {
  constructor() {
    this._publicVar = 20;
  }
}

class E_19 extends D_29 {
  test() {
    expect(this._publicVar).assertEqual(20);
  }
}

class A_53 {
  public _publicVar: number;

  constructor() {
    this._publicVar = 2;
  }

}

class B_53 extends A_53 {

}

class C_43 extends B_53 {

}

class D_30 extends C_43 {

}

class E_20 extends D_30 {

}

class F_9 extends E_20 {
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
     * @tc.name      testMultiLevelInheritance0001
     * @tc.desc      Verify that class C inherits public variable _publicVar with value 3 from class A through class B
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0001';
      let test: C = new C();
      expect(test._publicVar).assertEqual(3);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0200
     * @tc.name      testMultiLevelInheritance0002
     * @tc.desc      Test whether class c can correctly obtain the initial value of the public variable _publicVar
     * in class a after indirectly inheriting class a from class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0002';
      let test: C_1 = new C_1();
      expect(test._publicVar).assertEqual(3);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0300
     * @tc.name      testMultiLevelInheritance0003
     * @tc.desc      Verify that class C_1 inherits public variable _publicVar with value 3 from class A_1 through class B_1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0003';
      let test: B_2 = new B_2();
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0400
     * @tc.name      testMultiLevelInheritance0004
     * @tc.desc      To verify whether the instance of class c can accurately obtain the initial value of the public
     * variable _publicVar in class a after class c indirectly inherits class a through class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0004';
      let test: C_2 = new C_2();
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0500
     * @tc.name      testMultiLevelInheritance0005
     * @tc.desc      Test whether class d indirectly inherits class b through class c to correctly obtain the initial
     * value of the public variable _publicVar in class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0005';
      let test: D = new D();
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0600
     * @tc.name      testMultiLevelInheritance0006
     * @tc.desc      Verify that class E inherits overridden _publicVar with value 20 from class D_1 in multi-level inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0006';
      let test: E = new E();
      expect(test._publicVar).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0700
     * @tc.name      testMultiLevelInheritance0007
     * @tc.desc      Check whether the instance of class f can accurately obtain the initial value of the public
     * variable _publicVar in class a after multiple layers of inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0007';
      let test: F = new F();
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0800
     * @tc.name      testMultiLevelInheritance0008
     * @tc.desc      Verify that the instance of class b inherits from class a can correctly obtain the initial string
     * value of the public variable _publicVar in class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0008';
      let test: B_7 = new B_7();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_0900
     * @tc.name      testMultiLevelInheritance0009
     * @tc.desc      Multi-level inheritance verifies that the public member variable _publicVar in class a is passed
     * correctly in subclass c and maintains its initial value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0009';
      let test: C_6 = new C_6();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1000
     * @tc.name      testMultiLevelInheritance0010
     * @tc.desc      Multi-level inheritance verifies that the public member variable _publicVar in class b is
     * correctly initialized to a specific string value in subclass d
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0010';
      let test: D_3 = new D_3();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1100
     * @tc.name      testMultiLevelInheritance0011
     * @tc.desc      Verify that class E_2 inherits overridden _publicVar with value 'aaa' from class D_4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0011';
      let test: E_2 = new E_2();
      expect(test._publicVar).assertEqual('aaa');
    });
    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1200
     * @tc.name      testMultiLevelInheritance0012
     * @tc.desc      Verify that class F_1 inherits _publicVar with value 'Multi-level inheritance' through 4-level inheritance chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0012';
      let test: F_1 = new F_1();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1300
     * @tc.name      testMultiLevelInheritance0013
     * @tc.desc      Verify that class B_12 inherits _publicVar initialized to null from class A_12
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0013';
      let test: B_12 = new B_12();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1400
     * @tc.name      testMultiLevelInheritance0014
     * @tc.desc      Verify that the public member variable _publicVar inherited from class a is correctly initialized
     * to null in subclass c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0014';
      let test: C_10 = new C_10();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1500
     * @tc.name      testMultiLevelInheritance0015
     * @tc.desc      Class d inherits class c and indirectly inherits class b can the actual instance correctly obtain
     * the initial null value of the public variable _publicVar in class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0015';
      let test: D_6 = new D_6();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1600
     * @tc.name      testMultiLevelInheritance0016
     * @tc.desc      Verify that the instance of class e can correctly obtain the null value of the variable after
     * multiple layers of inheritance and class d resets the value of the inherited variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0016';
      let test: E_4 = new E_4();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1700
     * @tc.name      testMultiLevelInheritance0017
     * @tc.desc      Check whether the instance of class b inherits class a and class b can accurately obtain the
     * initial value of the public variable _publicVar in class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0017';
      let test: B_17 = new B_17();
      expect(test._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1800
     * @tc.name      testMultiLevelInheritance0018
     * @tc.desc      To verify that class c indirectly inherits class a from class b and can correctly obtain the
     * initial value of the public variable _publicVar defined by class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0018';
      let test: C_14 = new C_14();
      expect(test._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_1900
     * @tc.name      testMultiLevelInheritance0019
     * @tc.desc      Test whether class d can correctly obtain the initial value of the public variable _publicVar
     * defined in class b by inheriting class C
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0019';
      let test: D_9 = new D_9();
      expect(test._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2000
     * @tc.name      testMultiLevelInheritance0020
     * @tc.desc      Test whether the instance of class e can obtain the overridden value of the variable _public_var
     * inherited from class a by overriding the multi-layer inheritance class d
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0020';
      let test: E_7 = new E_7();
      expect(test._publicVar).assertEqual(false);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2100
     * @tc.name      testMultiLevelInheritance0021
     * @tc.desc      Verify that the instance of the multi-layer inheritance class f can correctly access and obtain
     * the initial value of the public boolean variable _publicVar defined in class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0021';
      let test: F_3 = new F_3();
      expect(test._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2200
     * @tc.name      testMultiLevelInheritance0022
     * @tc.desc      Test whether class b can correctly access the public variable _publicVar defined in class a and
     * obtain the value of its first element after inheriting class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0022';
      let test: B_23 = new B_23();
      expect(test._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2300
     * @tc.name      testMultiLevelInheritance0023
     * @tc.desc      Test whether class c can correctly access the public variable _publicVar defined in class a and
     * obtain the value of its first element after inheriting class b and indirectly inheriting class a
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0023';
      let test: C_19 = new C_19();
      expect(test._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2400
     * @tc.name      testMultiLevelInheritance0024
     * @tc.desc      Test whether class d can correctly access the public variable _publicVar defined in class b and
     * obtain the value of its first element after inheriting from class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0024';
      let test: D_13 = new D_13();
      expect(test._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2500
     * @tc.name      testMultiLevelInheritance0025
     * @tc.desc      Verify that class E_9 inherits overridden _publicVar with first element 0 from class D_14
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0025';
      let test: E_9 = new E_9();
      expect(test._publicVar[0]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2600
     * @tc.name      testMultiLevelInheritance0026
     * @tc.desc      Verify that class F_5 inherits public _publicVar with first element 1 from class A_28 through 4-level chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0026';
      let test: F_4 = new F_4();
      expect(test._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2700
     * @tc.name      testMultiLevelInheritance0027
     * @tc.desc      Verify that class B_28 inherits public _publicVar with first element 1 from class A_28
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0027';
      let b: B_28 = new B_28();
      expect(b._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2800
     * @tc.name      testMultiLevelInheritance0028
     * @tc.desc      Verify that class C_23 inherits public _publicVar with first element 1 from class A_29 through class B_29
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0028';
      let c: C_23 = new C_23();
      expect(c._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_2900
     * @tc.name      testMultiLevelInheritance0029
     * @tc.desc      Verify that class D_16 inherits public _publicVar with first element 1 from class A_30 through class B_30 and class C_24
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0029';
      let d: D_16 = new D_16();
      expect(d._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3000
     * @tc.name      testMultiLevelInheritance0030
     * @tc.desc      Verify that class E_11 inherits overridden public _publicVar with first element 0 from class D_17
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0030';
      let e: E_11 = new E_11();
      expect(e._publicVar[0]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3100
     * @tc.name      testMultiLevelInheritance0031
     * @tc.desc      Verify that class F_5 inherits public _publicVar with first element 1 from class A_28 through 5-level chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0031';
      let f: F_5 = new F_5();
      expect(f._publicVar[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3200
     * @tc.name      testMultiLevelInheritance0032
     * @tc.desc      Verify that class B_33 inherits public _publicVar with value true from class A_33
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0032';
      let b: B_33 = new B_33();
      expect(b._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3300
     * @tc.name      testMultiLevelInheritance0033
     * @tc.desc      Make sure that the public member variable _publicVar is properly initialized in base class a and
     * that the value remains unchanged in the lowest subclass c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0033';
      let c: C_27 = new C_27();
      expect(c._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3400
     * @tc.name      testMultiLevelInheritance0034
     * @tc.desc      Verify that class D_19 inherits public _publicVar with value true from class B_35 through class C_28
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0034';
      let d: D_19 = new D_19();
      expect(d._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3500
     * @tc.name      testMultiLevelInheritance0035
     * @tc.desc      Verify that class E_13 inherits overridden _publicVar with value false from class D_20
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0035';
      let e: E_13 = new E_13();
      expect(e._publicVar).assertEqual(false);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3600
     * @tc.name      testMultiLevelInheritance0036
     * @tc.desc      Verify that class F_6 inherits public _publicVar with value true from class A_21 through 4-level chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0036';
      let f: F_6 = new F_6();
      expect(f._publicVar).assertEqual(true);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3700
     * @tc.name      testMultiLevelInheritance0037
     * @tc.desc      Verify that class C_31 inherits public _publicVar with value 2 and public _publicVar with value 3 from class A_38 through class B_38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0037';
      let c: C_31 = new C_31();
      expect(c._publicVar).assertEqual(3);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3800
     * @tc.name      testMultiLevelInheritance0038
     * @tc.desc      Verify that the public member variable _public_var, inherited from the parent class a,
     * is correctly initialized to null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0038';
      let test: B_39 = new B_39;
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_3900
     * @tc.name      testMultiLevelInheritance0039
     * @tc.desc      Create an inheritance chain a -> b -> c and verify that the public property _public_var
     * inherited from class a is null in the test method of class c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0039';
      let test: C_32 = new C_32();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4000
     * @tc.name      testMultiLevelInheritance0040
     * @tc.desc      Verify that class d inherits from class c and accesses the public property _public_var with a
     * value of null through class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0040';
      let test: D_22 = new D_22();
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4100
     * @tc.name      testMultiLevelInheritance0041
     * @tc.desc      Verify that class e inherits from class d and accesses the public property _public_var through
     * the inheritance chain to be null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0041';
      let test: E_15 = new E_15;
      expect(test._publicVar).assertEqual(null);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4200
     * @tc.name      testMultiLevelInheritance0042
     * @tc.desc      Whether the public member variable _public_var passed from class a to class f through a
     * multi-level inheritance chain is correctly initialized to null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0042';
      let test: F_7 = new F_7;
      expect(test._publicVar).assertEqual(null);
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4300
     * @tc.name      testMultiLevelInheritance0043
     * @tc.desc       Verify that the public member variable _public_var, which is inherited from the parent class a,
     * is correctly initialized to the string'multi-level inheritance'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0043';
      let test: B_44 = new B_44;
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4400
     * @tc.name      testMultiLevelInheritance0044
     * @tc.desc      Verify that the public property _public_var inherited from class a is'multi-level inheritance'
     * in the test method of class c
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0044';
      let test: C_36 = new C_36;
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4500
     * @tc.name      testMultiLevelInheritance0045
     * @tc.desc      Whether the public member variable _public_var passed from class b to class d in the multi-level
     * inheritance chain is correctly initialized to the string'multi-level inheritance'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0045';
      let test: D_25 = new D_25();
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4600
     * @tc.name      testMultiLevelInheritance0046
     * @tc.desc      Change the public property _public_var inherited from class a to'aa' in class d, and verify
     * that the property value is'aa' in the test method of class e
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0046';
      let test: E_17 = new E_17;
      expect(test._publicVar).assertEqual('aaa');
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4700
     * @tc.name      testMultiLevelInheritance0047
     * @tc.desc      Verify that the public member variable _public_var inherited from class a to class f is
     * correctly initialized to the string'multi-level inheritance' after multi-level inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0047';
      let test: F_8 = new F_8;
      expect(test._publicVar).assertEqual('Multi-level inheritance');
    });


    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4800
     * @tc.name      testMultiLevelInheritance0048
     * @tc.desc      Verify that the public property _public_var inherited from class a is two in the test method
     * of class b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0048';
      let test: B_49 = new B_49;
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_4900
     * @tc.name      testMultiLevelInheritance0049
     * @tc.desc      Verify that the public member variable _public_var, inherited from the parent class a,
     * is correctly initialized to the value two
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0049';
      let test: C_40 = new C_40;
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_5000
     * @tc.name      testMultiLevelInheritance0050
     * @tc.desc      Whether the public member variable _public_var passed from class b to class d through a
     * multi-level inheritance chain is correctly initialized to the value two
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0050';
      let test: D_28 = new D_28;
      expect(test._publicVar).assertEqual(2);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_5100
     * @tc.name      testMultiLevelInheritance0051
     * @tc.desc      This test scenario verifies that subclasses d and e correctly reinitialize the public member
     * variable _public_var to the number 20 in a multi-level inheritance chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0051';
      let test: E_19 = new E_19;
      expect(test._publicVar).assertEqual(20);
    });

    /**
     * @tc.number    SUB_MULTI_LEVEL_INHERITANCE_TEST_5200
     * @tc.name      testMultiLevelInheritance0052
     * @tc.desc      Verify that the public property _public_var inherited from class a is two
    in the test method of class f
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMultiLevelInheritance0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testMultiLevelInheritance0052';
      let test: F_9 = new F_9;
      expect(test._publicVar).assertEqual(2);
    });
  })
}
