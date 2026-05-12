/*
* Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}


//1-1 null—class
//2-2
//3-3
//4-4
//5-5
//6-6
//7-7
//8-8
//9-9
let res: number = 0;
function foo(arg: number): number {
  res++;
  return arg;
}

//10-10
let res1: number = 0;
function foo1(arg: number): number {
  res1++;
  return arg;
}

//16-11
function fixed_array(): FixedArray<number> {
  return [1,2,3,4,5];
}

//17-12
function fixed_array1(): FixedArray<number> {
  return [1,2,3,4,5];
}

//18-13
function fixed_array2(): FixedArray<number> {
  return [1,2,3,4,5];
}

//19-14
function fixed_array3(): FixedArray<number> {
  return [1,2,3,4,5];
}

//20-15
function fixed_array4(): FixedArray<number> {
  return [1,2,3,4,5];
}

//21-16
function fixed_array5(): FixedArray<number> {
  return [1,2,3,4,5];
}

//22-17
function fixed_array6(): FixedArray<number> {
  return [1,2,3,4,5];
}

//37-18
function resizable_array(): number[] {
  return [1,2,3,4,5];
}

//38-19
function resizable_array1(): number[] {
  return [1,2,3,4,5];
}

//39-20
function resizable_array2(): number[] {
  return [1,2,3,4,5];
}

//40-21
function resizable_array3(): number[] {
  return [1,2,3,4,5];
}

//41-22
function resizable_array4(): number[] {
  return [1,2,3,4,5];
}

//42-23
function resizable_array5(): number[] {
  return [1,2,3,4,5];
}

//43-24
function resizable_array6(): number[] {
  return [1,2,3,4,5];
}

//44-25
let tpl: [number, string] = [1.5, "str"];

//45-26
let tpl1: [number, string] = [1.5, "str"];

//46-27
let tpl2: [number, string, undefined, Object] = [1.5, "str", undefined, new Object()];

//47-28
let tpl3: [number, string, undefined, Object, number] = [1.5, "str", undefined, new Object(), 2.5];

export default function DestructuringAssignmentTest(): void {
  describe('DestructuringAssignmentTest', () => {
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
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0100
     * @tc.name      testDestructuringAssignment0001
     * @tc.desc      desc: Destructuring Assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      [n,s] = [1.5, "str"];
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0200
     * @tc.name      testDestructuringAssignment0002
     * @tc.desc      desc: Destructuring Assignment - trailing omitted elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      [n,s] = [1.5, "str"];
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");

    });
    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0300
     * @tc.name      testDestructuringAssignment0003
     * @tc.desc      desc: Destructuring Assignment - mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      [n,s] = [1.5, "str", undefined, new Object()];
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");
    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0400
     * @tc.name      testDestructuringAssignment0004
     * @tc.desc      desc: Destructuring Assignment - mixed types, omitted elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 1;
      let n2: number = 1;
      let s: string = "a";
      let o: Object = new Object();
      [n1,s,,,n2] = [1.5, "str", undefined, new Object(), 2.5];
      expect(n1).assertEqual(1.5);
      expect(s).assertEqual("str");
      expect(n2).assertEqual(2.5);
    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0500
     * @tc.name      testDestructuringAssignment0005
     * @tc.desc      desc: Destructuring Assignment - assign the expression to a variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      let ns = [n,s] = [1.5, "str" as string];
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");

      expect(ns[0]).assertEqual(1.5);
      expect(ns[1]).assertEqual("str");

      ns[0] = 2.5;
      ns[1] = "new str";
      expect(ns[0]).assertEqual(2.5);
      expect(ns[1]).assertEqual("new str");

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0600
     * @tc.name      testDestructuringAssignment0006
     * @tc.desc      desc: Destructuring Assignment - assign the expression to a variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      let ns = [n,s,,,] = [1.5, "str" as string];
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");

      expect(ns[0]).assertEqual(1.5);
      expect(ns[1]).assertEqual("str");

      ns[0] = 2.5;
      ns[1] = "new str";
      expect(ns[0]).assertEqual(2.5);
      expect(ns[1]).assertEqual("new str");

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0700
     * @tc.name      testDestructuringAssignment0007
     * @tc.desc      desc: Destructuring Assignment - assign the expression to a variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      let ns = [n,s] = [1.5, "str" as string, undefined, new Object()];
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");

      expect(ns[0]).assertEqual(1.5);
      expect(ns[1]).assertEqual("str");

      ns[0] = 2.5;
      ns[1] = "new str";
      expect(ns[0]).assertEqual(2.5);
      expect(ns[1]).assertEqual("new str");
    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0800
     * @tc.name      testDestructuringAssignment0008
     * @tc.desc      desc: Destructuring Assignment - assign the expression to a variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 1;
      let n2: number = 1;
      let s: string = "a";
      let o: Object = new Object();
      let ns = [n1,s,,,n2] = [1.5, "str" as string, undefined, o, 2.5];
      expect(n1).assertEqual(1.5);
      expect(s).assertEqual("str");
      expect(n2).assertEqual(2.5);

      expect(ns[0]).assertEqual(1.5);
      expect(ns[1]).assertEqual("str");
      expect(ns[2]).assertEqual(undefined);
      expect(ns[3]).assertEqual(o);
      expect(ns[4]).assertEqual(2.5);

      let o2: Object = new Object();
      ns[0] = 3.1;
      ns[1] = "new str";
      ns[2] = undefined;
      ns[3] = o2
      ns[4] = 4.1;
      expect(ns[0]).assertEqual(3.1);
      expect(ns[1]).assertEqual("new str");
      expect(ns[2]).assertEqual(undefined);
      expect(ns[3]).assertEqual(o2);
      expect(ns[4]).assertEqual(4.1);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_0900
     * @tc.name      testDestructuringAssignment0009
     * @tc.desc      desc: Destructuring Assignment - rhs must be eagarly evaluated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      res = 0;
      [n1, n2] = [foo(1), foo(2), foo(3), foo(4)];
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);
      expect(res).assertEqual(4);
    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1000
     * @tc.name      testDestructuringAssignment0010
     * @tc.desc      desc: Destructuring Assignment - rhs must be eagarly evaluated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      res1 = 0;
      [] = [foo1(1), foo1(2), foo1(3)];
      expect(res1).assertEqual(3);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1100
     * @tc.name      testDestructuringAssignment0011
     * @tc.desc      desc: Destructuring Assignment - FixedArrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1] = fixed_array();
      expect(n1).assertEqual(1);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1200
     * @tc.name      testDestructuringAssignment0012
     * @tc.desc      desc: Destructuring Assignment - FixedArrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2] = fixed_array1();
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1300
     * @tc.name      testDestructuringAssignment0013
     * @tc.desc      desc: Destructuring Assignment - FixedArrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2, n3] = fixed_array2();
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);
      expect(n3).assertEqual(3);
    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1400
     * @tc.name      testDestructuringAssignment0014
     * @tc.desc      desc: Destructuring Assignment - FixedArrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2, n3, n4] = fixed_array3();
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);
      expect(n3).assertEqual(3);
      expect(n4).assertEqual(4);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1500
     * @tc.name      testDestructuringAssignment0015
     * @tc.desc      desc: Destructuring Assignment - FixedArrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2, n3, n4, n5] = fixed_array4();
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);
      expect(n3).assertEqual(3);
      expect(n4).assertEqual(4);
      expect(n5).assertEqual(5);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1600
     * @tc.name      testDestructuringAssignment0016
     * @tc.desc      desc: Destructuring Assignment - FixedArrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      let hasThrown = false;
      try {
        [n1, n2, n3, n4, n5, n6] = fixed_array5();
      } catch (e) {
        if (e instanceof ArrayIndexOutOfBoundsError) {
          hasThrown = true;
        }
      }

      expect(hasThrown).assertEqual(true);
    });


    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1700
     * @tc.name      testDestructuringAssignment0017
     * @tc.desc      desc: Destructuring Assignment - FixedArrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [, n2, , n4, , , , ] = fixed_array6();
      expect(n2).assertEqual(2);
      expect(n4).assertEqual(4);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1800
     * @tc.name      testDestructuringAssignment0018
     * @tc.desc      desc: Destructuring Assignment - Resizable Arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1] = resizable_array();
      expect(n1).assertEqual(1);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_1900
     * @tc.name      testDestructuringAssignment0019
     * @tc.desc      desc: Destructuring Assignment - Resizable Arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2] = resizable_array1();
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2000
     * @tc.name      testDestructuringAssignment0020
     * @tc.desc      desc: Destructuring Assignment - Resizable Arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2, n3] = resizable_array2();
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);
      expect(n3).assertEqual(3);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2100
     * @tc.name      testDestructuringAssignment0021
     * @tc.desc      desc: Destructuring Assignment - Resizable Arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2, n3, n4] = resizable_array3();
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);
      expect(n3).assertEqual(3);
      expect(n4).assertEqual(4);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2200
     * @tc.name      testDestructuringAssignment0022
     * @tc.desc      desc: Destructuring Assignment - Resizable Arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2, n3, n4, n5] = resizable_array4();
      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);
      expect(n3).assertEqual(3);
      expect(n4).assertEqual(4);
      expect(n5).assertEqual(5);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2300
     * @tc.name      testDestructuringAssignment0023
     * @tc.desc      desc: Destructuring Assignment - Resizable Arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [n1, n2, n3, n4, n5] = resizable_array5();

      expect(n1).assertEqual(1);
      expect(n2).assertEqual(2);
      expect(n3).assertEqual(3);
      expect(n4).assertEqual(4);
      expect(n5).assertEqual(5);
    });


    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2400
     * @tc.name      testDestructuringAssignment0024
     * @tc.desc      desc: Destructuring Assignment - Resizable Arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n1: number = 0;
      let n2: number = 0;
      let n3: number = 0;
      let n4: number = 0;
      let n5: number = 0;
      let n6: number = 0;

      [, n2, , n4, , , , ] = resizable_array6();
      expect(n2).assertEqual(2);
      expect(n4).assertEqual(4);

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2500
     * @tc.name      testDestructuringAssignment0025
     * @tc.desc      desc: Destructuring Assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      [n,s] = tpl;
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2600
     * @tc.name      testDestructuringAssignment0026
     * @tc.desc      desc: Destructuring Assignment - trailing omitted elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      [n,s,,,] = tpl1;
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2700
     * @tc.name      testDestructuringAssignment0027
     * @tc.desc      desc: Destructuring Assignment - mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it("testDestructuringAssignment0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let n: number = 1;
      let s: string = "a";
      [n,s] = tpl2;
      expect(n).assertEqual(1.5);
      expect(s).assertEqual("str");

    });

    /**
     * @tc.number    SUB_DESTRUCTURING_ASSIGNMENT_XTSTEST_2800
     * @tc.name      testDestructuringAssignment0028
     * @tc.desc      desc: Destructuring Assignment - mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

  it("testDestructuringAssignment0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
    let n: number = 1;
    let s: string = "a";
    [n,s] = tpl3;
    expect(n).assertEqual(1.5);
    expect(s).assertEqual("str");
  });
})
}
