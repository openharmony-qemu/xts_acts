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
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  public static x: number = 42;

  public getX(): number {
    return A.x;
  }

  public addX(): void {
    A.x = A.x + 1;
  }
}

class B {}

let theInstance: B = new B();

class A1 {
  public static b1: B = theInstance;
  public b2: B = new B();
}

class A2 {
  public static x: number = 0;
}

class B1 extends A2 {
  public static y: number = 0;

  public static getX(): number {
    return A2.x;
  }

  public static setX(value: number): void {
    A2.x = value;
  }
}

type Func = (p: number) => number;

class A3 {
  private static f: Func = (p: number): number => { return 0 };

  public getF(): Func {
    return A3.f;
  }

  public setF(p: Func) {
    A3.f = p;
  }
}

export default function StaticAndInstanceFieldsTest():void {
  describe('StaticAndInstanceFieldsTest', () => {
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
     * @tc.number    SUB_STATIC_AND_INSTANCE_FIELDSTEST_0100
     * @tc.name      testStaticAndInstanceFields0001
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      A.x = 42;
      expect(A.x).assertEqual(42);
      let i1: A = new A();
      let i2: A = new A();
      expect(A.x).assertEqual(42);
      i2.addX();
      expect(i1.getX()).assertEqual(43);

      A.x = A.x + 5;
      expect(i2.getX()).assertEqual(48);
    });

    /**
     * @tc.number    SUB_STATIC_AND_INSTANCE_FIELDSTEST_0200
     * @tc.name      testStaticAndInstanceFields0002
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A1.b1 === theInstance).assertTrue();
      let i1: A1 = new A1();
      let i2: A1 = new A1();
      expect(A1.b1 === theInstance).assertTrue();
      expect(i1.b2 !== theInstance).assertTrue();
      expect(i2.b2 !== theInstance).assertTrue();
    });

    /**
     * @tc.number    SUB_STATIC_AND_INSTANCE_FIELDSTEST_0300
     * @tc.name      testStaticAndInstanceFields0003
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      B1.y = 10;
      B1.setX(5);
      expect(A2.x).assertEqual(5);
      expect(B1.getX()).assertEqual(5);
      expect(B1.y).assertEqual(10);

      B1.y++;
      A2.x++;
      expect(A2.x).assertEqual(6);
      expect(B1.getX()).assertEqual(6);
      expect(B1.y).assertEqual(11);
    });

    /**
     * @tc.number    SUB_STATIC_AND_INSTANCE_FIELDSTEST_0400
     * @tc.name      testStaticAndInstanceFields0004
     * @tc.desc      A static field is instantiated when the class is initialized. A static field
     *               can have only one instantiation, irrespective of how many instances of that class
     *               (even if zero) are eventually created.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = new A3();
      a1.setF((p: number): number => { return p + 33; });
      let f1: Func = a1.getF();
      expect(f1(11)).assertEqual(44);
      let a2 = new A3();
      let f2: Func = a2.getF();
      expect(f2(22)).assertEqual(55);
      expect(f1 === f2).assertTrue();

      a1.setF((p: number): number => { return p + 1; });
      f1 = a1.getF();
      expect(f1(11)).assertEqual(12);

      f2 = a2.getF();
      expect(f2(22)).assertEqual(23);
      expect(f1 === f2).assertTrue();
    });
  })
}