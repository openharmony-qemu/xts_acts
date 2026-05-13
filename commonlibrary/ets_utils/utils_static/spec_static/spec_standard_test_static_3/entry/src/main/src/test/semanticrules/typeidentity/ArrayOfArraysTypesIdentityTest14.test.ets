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

class C {
  data: number = 0
}

namespace testNS_1 {
  class C_1 {
    data_1: number = 0
  }

  function cast_1(p: Object): Array<Array<C_1>> {
    return p as Array<Array<C_1>>
  }

  export function runTest_1(): boolean {
    let a_1: C_1[][] = [[{data_1: 1} as C_1, {data_1: 3} as C_1], [{data_1: 5} as C_1, {data_1: 7} as C_1]]
    let b_1: Array<Array<C_1>> = cast_1(a_1)
    expect(a_1 instanceof Array).assertEqual(true)
    expect(a_1[0] instanceof Array).assertEqual(true)
    expect(a_1[1] instanceof Array).assertEqual(true)
    expect(b_1 instanceof Array).assertEqual(true)
    expect(b_1[0] instanceof Array).assertEqual(true)
    expect(b_1[1] instanceof Array).assertEqual(true)
    expect(b_1.length).assertEqual(2)
    expect(b_1[0].length).assertEqual(2)
    expect(b_1[1].length).assertEqual(2)
    expect(b_1[0][0] instanceof C_1).assertEqual(true)
    expect(typeof b_1[0][0].data_1 === 'number').assertEqual(true)
    expect(b_1[0][0].data_1).assertEqual(1)
    expect(b_1[0][1] instanceof C_1).assertEqual(true)
    expect(typeof b_1[0][1].data_1 === 'number').assertEqual(true)
    expect(b_1[0][1].data_1).assertEqual(3)
    expect(b_1[1][0] instanceof C_1).assertEqual(true)
    expect(typeof b_1[1][0].data_1 === 'number').assertEqual(true)
    expect(b_1[1][0].data_1).assertEqual(5)
    expect(b_1[1][1] instanceof C_1).assertEqual(true)
    expect(typeof b_1[1][1].data_1 === 'number').assertEqual(true)
    expect(b_1[1][1].data_1).assertEqual(7)
    a_1 = b_1
    expect(a_1 instanceof Array).assertEqual(true)
    expect(a_1[0] instanceof Array).assertEqual(true)
    expect(a_1[1] instanceof Array).assertEqual(true)
    expect(a_1.length).assertEqual(2)
    expect(a_1[0].length).assertEqual(2)
    expect(a_1[1].length).assertEqual(2)
    expect(a_1[0][0] instanceof C_1).assertEqual(true)
    expect(typeof a_1[0][0].data_1 === 'number').assertEqual(true)
    expect(a_1[0][0].data_1).assertEqual(1)
    expect(a_1[0][1] instanceof C_1).assertEqual(true)
    expect(typeof a_1[0][1].data_1 === 'number').assertEqual(true)
    expect(a_1[0][1].data_1).assertEqual(3)
    expect(a_1[1][0] instanceof C_1).assertEqual(true)
    expect(typeof a_1[1][0].data_1 === 'number').assertEqual(true)
    expect(a_1[1][0].data_1).assertEqual(5)
    expect(a_1[1][1] instanceof C_1).assertEqual(true)
    expect(typeof a_1[1][1].data_1 === 'number').assertEqual(true)
    expect(a_1[1][1].data_1).assertEqual(7)
    return true
  }
}

function cast1(p: Object): Array<Array<C>> {
  return p as Array<Array<C>>
}

namespace testNS_2 {
  class C_2 {
    data_2: number = 0
  }

  function cast_2(p: Object): C_2[][] {
    return p as C_2[][]
  }

  export function runTest_2(): boolean {
    let a_2: C_2[][] = [[{data_2: 1} as C_2, {data_2: 3} as C_2], [{data_2: 5} as C_2, {data_2: 7} as C_2]]
    let b_2: Array<Array<C_2>> = cast_2(a_2)
    expect(a_2 instanceof Array).assertEqual(true)
    expect(a_2[0] instanceof Array).assertEqual(true)
    expect(a_2[1] instanceof Array).assertEqual(true)
    expect(b_2 instanceof Array).assertEqual(true)
    expect(b_2[0] instanceof Array).assertEqual(true)
    expect(b_2[1] instanceof Array).assertEqual(true)
    expect(b_2.length).assertEqual(2)
    expect(b_2[0].length).assertEqual(2)
    expect(b_2[1].length).assertEqual(2)
    expect(b_2[0][0] instanceof C_2).assertEqual(true)
    expect(typeof b_2[0][0].data_2 === 'number').assertEqual(true)
    expect(b_2[0][0].data_2).assertEqual(1)
    expect(b_2[0][1] instanceof C_2).assertEqual(true)
    expect(typeof b_2[0][1].data_2 === 'number').assertEqual(true)
    expect(b_2[0][1].data_2).assertEqual(3)
    expect(b_2[1][0] instanceof C_2).assertEqual(true)
    expect(typeof b_2[1][0].data_2 === 'number').assertEqual(true)
    expect(b_2[1][0].data_2).assertEqual(5)
    expect(b_2[1][1] instanceof C_2).assertEqual(true)
    expect(typeof b_2[1][1].data_2 === 'number').assertEqual(true)
    expect(b_2[1][1].data_2).assertEqual(7)
    a_2 = b_2
    expect(a_2 instanceof Array).assertEqual(true)
    expect(a_2[0] instanceof Array).assertEqual(true)
    expect(a_2[1] instanceof Array).assertEqual(true)
    expect(a_2.length).assertEqual(2)
    expect(a_2[0].length).assertEqual(2)
    expect(a_2[1].length).assertEqual(2)
    expect(a_2[0][0] instanceof C_2).assertEqual(true)
    expect(typeof a_2[0][0].data_2 === 'number').assertEqual(true)
    expect(a_2[0][0].data_2).assertEqual(1)
    expect(a_2[0][1] instanceof C_2).assertEqual(true)
    expect(typeof a_2[0][1].data_2 === 'number').assertEqual(true)
    expect(a_2[0][1].data_2).assertEqual(3)
    expect(a_2[1][0] instanceof C_2).assertEqual(true)
    expect(typeof a_2[1][0].data_2 === 'number').assertEqual(true)
    expect(a_2[1][0].data_2).assertEqual(5)
    expect(a_2[1][1] instanceof C_2).assertEqual(true)
    expect(typeof a_2[1][1].data_2 === 'number').assertEqual(true)
    expect(a_2[1][1].data_2).assertEqual(7)
    return true
  }
}
class C2 {data: int = 0}
function cast2(p: Object) {
  return p as C[][]
}


export default function ArrayOfArraysTypesIdentityTest14(): void {
  describe('ArrayOfArraysTypesIdentityTest14', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_3300
     * @tc.name      testArrayOfArraysTypesIdentity0033
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0033';

      let a: C[][] = [[{data: 1} as C, {data: 3} as C], [{data: 5} as C, {data: 7} as C]]
      let b: Array<Array<C>> = cast1(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_3400
     * @tc.name      testArrayOfArraysTypesIdentity0034
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0034';

      let a: C[][] = [[{data: 1} as C, {data: 3} as C], [{data: 5} as C, {data: 7} as C]]
      let b: Array<Array<C>> = cast2(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_2.runTest_2()).assertEqual(true)

    });
  })
}