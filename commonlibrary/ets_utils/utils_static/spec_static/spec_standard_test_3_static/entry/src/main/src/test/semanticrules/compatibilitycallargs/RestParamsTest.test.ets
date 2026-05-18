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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}
class A1 {
  field: Array<number>;

  constructor(...a: Array<number>) {
    this.field = a;
  }

  bar1(...callee: Array<number>): Array<number> {
    return callee;
  }
}

function foo1(...callee: Array<number>): Array<number> {
  return callee;
}
class A2 {
  field: Array<number>;
  constructor(...a: Array<number>) {
    this.field = a;
  }
  bar2(...callee: Array<number>): Array<number> {
    return callee;
  }
}
function foo2(...callee: Array<number>): Array<number> {
  return callee;
}
class A3 {
  field: Array<number>;
  constructor(...a: Array<number>) {
    this.field = a;
  }

  bar3(...callee: Array<number>): Array<number> {
    return callee;
  }
}

function foo3(...callee: Array<number>): Array<number> {
  return callee;
}
class A4 {
  field: Array<number>;
  constructor(...a: Array<number>) {
    this.field = a;
  }

  bar4(...callee: Array<number>): Array<number> {
    return callee;
  }
}

function foo4(...callee: Array<number>): Array<number> {
  return callee;
}
class A5 {
  field: Array<number>;
  constructor(...a: Array<number>) {
    this.field = a;
  }

  bar5(...callee: Array<number>): Array<number> {
    return callee;
  }
}

function foo5(...callee: Array<number>): Array<number> {
  return callee;
}
class A6 {
  field: number[];
  constructor(...a: number[]) {
    this.field = a;
  }

  bar6(...callee: number[]): number[] {
    return callee;
  }
}

function foo6(...callee: Array<number>): number[] {
  return callee;
}
class B7 {}
class C7 extends B7 {}

class A7 {
  field: B7[];
  constructor(...a: B7[]) {
    this.field = a;
  }

  bar7(...callee: B7[]): B7[] {
    return callee;
  }
}

function foo7(...callee: Array<B7>): B7[] {
  return callee;
}

interface B8 {}
class C8 implements B8 {}

class A8 {
  field: B8[];
  constructor(...a: B8[]) {
    this.field = a;
  }

  bar8(...callee: B8[]): B8[] {
    return callee;
  }
}

function foo8(...callee: Array<B8>): B8[] {
  return callee;
}


export default function RestParamsTest(): void {
  describe('RestParamsTest', () => {
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
     * @tc.number    SUB_REST_PARAMS_TEST_0100
     * @tc.name      testRestParams0001
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParams0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let a: A1 = new A1(0, -128, 127);
      let method_result = a.bar1(0, -128, 127);
      let func_result = foo1(0, -128, 127);
      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);
      expect(method_result[1]).assertEqual(-128);
      expect(func_result[1]).assertEqual(-128);
      expect(a.field[1]).assertEqual(-128);
      expect(method_result[2]).assertEqual(127);
      expect(func_result[2]).assertEqual(127);
      expect(a.field[2]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_REST_PARAMS_TEST_0200
     * @tc.name      testRestParams0002
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParams0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let a: A2 = new A2(0, -128, 127);
      let method_result = a.bar2(0, -128, 127);
      let func_result = foo2(0, -128, 127);
      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);
      expect(method_result[1]).assertEqual(-128);
      expect(func_result[1]).assertEqual(-128);
      expect(a.field[1]).assertEqual(-128);
      expect(method_result[2]).assertEqual(127);
      expect(func_result[2]).assertEqual(127);
      expect(a.field[2]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_REST_PARAMS_TEST_0300
     * @tc.name      testRestParams0003
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParams0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let a: A3 = new A3(0, -128, 127);
      let method_result = a.bar3(0, -128, 127);
      let func_result = foo3(0, -128, 127);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(-128);
      expect(func_result[1]).assertEqual(-128);
      expect(a.field[1]).assertEqual(-128);

      expect(method_result[2]).assertEqual(127);
      expect(func_result[2]).assertEqual(127);
      expect(a.field[2]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_REST_PARAMS_TEST_0400
     * @tc.name      testRestParams0004
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParams0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let a: A4 = new A4(0, -128, 127);
      let method_result = a.bar4(0, -128, 127);
      let func_result = foo4(0, -128, 127);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(-128);
      expect(func_result[1]).assertEqual(-128);
      expect(a.field[1]).assertEqual(-128);

      expect(method_result[2]).assertEqual(127);
      expect(func_result[2]).assertEqual(127);
      expect(a.field[2]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_REST_PARAMS_TEST_0500
     * @tc.name      testRestParams0005
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParams0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let a: A5 = new A5(0, -32768, 32767);
      let method_result = a.bar5(0, -32768, 32767);
      let func_result = foo5(0, -32768, 32767);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a.field[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(-32768);
      expect(func_result[1]).assertEqual(-32768);
      expect(a.field[1]).assertEqual(-32768);

      expect(method_result[2]).assertEqual(32767);
      expect(func_result[2]).assertEqual(32767);
      expect(a.field[2]).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_REST_PARAMS_TEST_0600
     * @tc.name      testRestParams0006
     * @tc.desc      Type of each argument corresponding to the rest parameter without the spread
     *               operator must be compatible with the element type of the array rest type parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRestParams0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      let a: A6 = new A6(0, -32768, 32767);
      let method_result = a.bar6(0, -32768, 32767);
      let func_result = foo6(0, -32768, 32767);

      expect(method_result[0]).assertEqual(0.0);
      expect(func_result[0]).assertEqual(0.0);
      expect(a.field[0]).assertEqual(0.0);

      expect(method_result[1]).assertEqual(-32768);
      expect(func_result[1]).assertEqual(-32768);
      expect(a.field[1]).assertEqual(-32768);

      expect(method_result[2]).assertEqual(32767);
      expect(func_result[2]).assertEqual(32767);
      expect(a.field[2]).assertEqual(32767);
    });
  })
}