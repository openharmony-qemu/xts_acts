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

class C1 {
  data: number = 0
}

namespace testNS_1 {
  class C_1 {
    data_1: number = 0
  }

  function cast_1(p: Object): Array<C_1>[] {
    return p as Array<C_1>[]
  }

  export function runTest_1(): boolean {
    let a_1: Array<C_1[]> = [[{data_1: 1} as C_1, {data_1: 3} as C_1], [{data_1: 5} as C_1, {data_1: 7} as C_1]]
    let b_1: Array<C_1>[] = cast_1(a_1)
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

function cast1(p: Object): Array<C1>[] {
  return p as Array<C1>[]
}

class C2 {
  data: number = 0
}

namespace testNS_2 {
  class C_2 {
    data_2: number = 0
  }

  function cast_2(p: Object): Array<C_2[]> {
    return p as Array<C_2[]>
  }

  export function runTest_2(): boolean {
    let a_2: Array<C_2[]> = [[{data_2: 1} as C_2, {data_2: 3} as C_2], [{data_2: 5} as C_2, {data_2: 7} as C_2]]
    let b_2: Array<C_2>[] = cast_2(a_2)
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

function cast2(p: Object): Array<C2[]> {
  return p as Array<C2[]>
}

class C3 {
  data: number = 0
}

namespace testNS_3 {
  class C_3 {
    data_3: number = 0
  }

  function cast_3(p: Object): Array<C_3[]> {
    return p as Array<C_3>[]
  }

  export function runTest_3(): boolean {
    let a_3: Array<C_3[]> = [[{data_3: 1} as C_3, {data_3: 3} as C_3], [{data_3: 5} as C_3, {data_3: 7} as C_3]]
    let b_3: Array<C_3>[] = cast_3(a_3)
    expect(a_3 instanceof Array).assertEqual(true)
    expect(a_3[0] instanceof Array).assertEqual(true)
    expect(a_3[1] instanceof Array).assertEqual(true)
    expect(b_3 instanceof Array).assertEqual(true)
    expect(b_3[0] instanceof Array).assertEqual(true)
    expect(b_3[1] instanceof Array).assertEqual(true)
    expect(b_3.length).assertEqual(2)
    expect(b_3[0].length).assertEqual(2)
    expect(b_3[1].length).assertEqual(2)
    expect(b_3[0][0] instanceof C_3).assertEqual(true)
    expect(typeof b_3[0][0].data_3 === 'number').assertEqual(true)
    expect(b_3[0][0].data_3).assertEqual(1)
    expect(b_3[0][1] instanceof C_3).assertEqual(true)
    expect(typeof b_3[0][1].data_3 === 'number').assertEqual(true)
    expect(b_3[0][1].data_3).assertEqual(3)
    expect(b_3[1][0] instanceof C_3).assertEqual(true)
    expect(typeof b_3[1][0].data_3 === 'number').assertEqual(true)
    expect(b_3[1][0].data_3).assertEqual(5)
    expect(b_3[1][1] instanceof C_3).assertEqual(true)
    expect(typeof b_3[1][1].data_3 === 'number').assertEqual(true)
    expect(b_3[1][1].data_3).assertEqual(7)
    a_3 = b_3
    expect(a_3 instanceof Array).assertEqual(true)
    expect(a_3[0] instanceof Array).assertEqual(true)
    expect(a_3[1] instanceof Array).assertEqual(true)
    expect(a_3.length).assertEqual(2)
    expect(a_3[0].length).assertEqual(2)
    expect(a_3[1].length).assertEqual(2)
    expect(a_3[0][0] instanceof C_3).assertEqual(true)
    expect(typeof a_3[0][0].data_3 === 'number').assertEqual(true)
    expect(a_3[0][0].data_3).assertEqual(1)
    expect(a_3[0][1] instanceof C_3).assertEqual(true)
    expect(typeof a_3[0][1].data_3 === 'number').assertEqual(true)
    expect(a_3[0][1].data_3).assertEqual(3)
    expect(a_3[1][0] instanceof C_3).assertEqual(true)
    expect(typeof a_3[1][0].data_3 === 'number').assertEqual(true)
    expect(a_3[1][0].data_3).assertEqual(5)
    expect(a_3[1][1] instanceof C_3).assertEqual(true)
    expect(typeof a_3[1][1].data_3 === 'number').assertEqual(true)
    expect(a_3[1][1].data_3).assertEqual(7)
    return true
  }
}

function cast3(p: Object): Array<C3[]> {
  return p as Array<C3>[]
}

class C4 {
  data: number = 0
}

namespace testNS_4 {
  class C_4 {
    data_4: number = 0
  }

  function cast_4(p: Object): Array<C_4>[] {
    return p as Array<C_4[]>
  }

  export function runTest_4(): boolean {
    let a_4: Array<C_4[]> = [[{data_4: 1} as C_4, {data_4: 3} as C_4], [{data_4: 5} as C_4, {data_4: 7} as C_4]]
    let b_4: Array<C_4>[] = cast_4(a_4)
    expect(a_4 instanceof Array).assertEqual(true)
    expect(a_4[0] instanceof Array).assertEqual(true)
    expect(a_4[1] instanceof Array).assertEqual(true)
    expect(b_4 instanceof Array).assertEqual(true)
    expect(b_4[0] instanceof Array).assertEqual(true)
    expect(b_4[1] instanceof Array).assertEqual(true)
    expect(b_4.length).assertEqual(2)
    expect(b_4[0].length).assertEqual(2)
    expect(b_4[1].length).assertEqual(2)
    expect(b_4[0][0] instanceof C_4).assertEqual(true)
    expect(typeof b_4[0][0].data_4 === 'number').assertEqual(true)
    expect(b_4[0][0].data_4).assertEqual(1)
    expect(b_4[0][1] instanceof C_4).assertEqual(true)
    expect(typeof b_4[0][1].data_4 === 'number').assertEqual(true)
    expect(b_4[0][1].data_4).assertEqual(3)
    expect(b_4[1][0] instanceof C_4).assertEqual(true)
    expect(typeof b_4[1][0].data_4 === 'number').assertEqual(true)
    expect(b_4[1][0].data_4).assertEqual(5)
    expect(b_4[1][1] instanceof C_4).assertEqual(true)
    expect(typeof b_4[1][1].data_4 === 'number').assertEqual(true)
    expect(b_4[1][1].data_4).assertEqual(7)
    a_4 = b_4
    expect(a_4 instanceof Array).assertEqual(true)
    expect(a_4[0] instanceof Array).assertEqual(true)
    expect(a_4[1] instanceof Array).assertEqual(true)
    expect(a_4.length).assertEqual(2)
    expect(a_4[0].length).assertEqual(2)
    expect(a_4[1].length).assertEqual(2)
    expect(a_4[0][0] instanceof C_4).assertEqual(true)
    expect(typeof a_4[0][0].data_4 === 'number').assertEqual(true)
    expect(a_4[0][0].data_4).assertEqual(1)
    expect(a_4[0][1] instanceof C_4).assertEqual(true)
    expect(typeof a_4[0][1].data_4 === 'number').assertEqual(true)
    expect(a_4[0][1].data_4).assertEqual(3)
    expect(a_4[1][0] instanceof C_4).assertEqual(true)
    expect(typeof a_4[1][0].data_4 === 'number').assertEqual(true)
    expect(a_4[1][0].data_4).assertEqual(5)
    expect(a_4[1][1] instanceof C_4).assertEqual(true)
    expect(typeof a_4[1][1].data_4 === 'number').assertEqual(true)
    expect(a_4[1][1].data_4).assertEqual(7)
    return true
  }
}

function cast4(p: Object): Array<C4>[] {
  return p as Array<C4[]>
}

class C5 {
  data: number = 0
}

namespace testNS_5 {
  class C_5 {
    data_5: number = 0
  }

  function cast_5(p: Object): Array<Array<C_5>> {
    return p as Array<Array<C_5>>
  }

  export function runTest_5(): boolean {
    let a_5: Array<C_5>[] = [[{data_5: 1} as C_5, {data_5: 3} as C_5], [{data_5: 5} as C_5, {data_5: 7} as C_5]]
    let b_5: Array<C_5[]> = cast_5(a_5)
    expect(a_5 instanceof Array).assertEqual(true)
    expect(a_5[0] instanceof Array).assertEqual(true)
    expect(a_5[1] instanceof Array).assertEqual(true)
    expect(b_5 instanceof Array).assertEqual(true)
    expect(b_5[0] instanceof Array).assertEqual(true)
    expect(b_5[1] instanceof Array).assertEqual(true)
    expect(b_5.length).assertEqual(2)
    expect(b_5[0].length).assertEqual(2)
    expect(b_5[1].length).assertEqual(2)
    expect(b_5[0][0] instanceof C_5).assertEqual(true)
    expect(typeof b_5[0][0].data_5 === 'number').assertEqual(true)
    expect(b_5[0][0].data_5).assertEqual(1)
    expect(b_5[0][1] instanceof C_5).assertEqual(true)
    expect(typeof b_5[0][1].data_5 === 'number').assertEqual(true)
    expect(b_5[0][1].data_5).assertEqual(3)
    expect(b_5[1][0] instanceof C_5).assertEqual(true)
    expect(typeof b_5[1][0].data_5 === 'number').assertEqual(true)
    expect(b_5[1][0].data_5).assertEqual(5)
    expect(b_5[1][1] instanceof C_5).assertEqual(true)
    expect(typeof b_5[1][1].data_5 === 'number').assertEqual(true)
    expect(b_5[1][1].data_5).assertEqual(7)
    a_5 = b_5
    expect(a_5 instanceof Array).assertEqual(true)
    expect(a_5[0] instanceof Array).assertEqual(true)
    expect(a_5[1] instanceof Array).assertEqual(true)
    expect(a_5.length).assertEqual(2)
    expect(a_5[0].length).assertEqual(2)
    expect(a_5[1].length).assertEqual(2)
    expect(a_5[0][0] instanceof C_5).assertEqual(true)
    expect(typeof a_5[0][0].data_5 === 'number').assertEqual(true)
    expect(a_5[0][0].data_5).assertEqual(1)
    expect(a_5[0][1] instanceof C_5).assertEqual(true)
    expect(typeof a_5[0][1].data_5 === 'number').assertEqual(true)
    expect(a_5[0][1].data_5).assertEqual(3)
    expect(a_5[1][0] instanceof C_5).assertEqual(true)
    expect(typeof a_5[1][0].data_5 === 'number').assertEqual(true)
    expect(a_5[1][0].data_5).assertEqual(5)
    expect(a_5[1][1] instanceof C_5).assertEqual(true)
    expect(typeof a_5[1][1].data_5 === 'number').assertEqual(true)
    expect(a_5[1][1].data_5).assertEqual(7)
    return true
  }
}

function cast5(p: Object): Array<Array<C5>> {
  return p as Array<Array<C5>>
}

class C6 {
  data: number = 0
}

namespace testNS_6 {
  class C_6 {
    data_6: number = 0
  }

  function cast_6(p: Object): C_6[][] {
    return p as C_6[][]
  }

  export function runTest_6(): boolean {
    let a_6: Array<C_6>[] = [[{data_6: 1} as C_6, {data_6: 3} as C_6], [{data_6: 5} as C_6, {data_6: 7} as C_6]]
    let b_6: Array<C_6[]> = cast_6(a_6)
    expect(a_6 instanceof Array).assertEqual(true)
    expect(a_6[0] instanceof Array).assertEqual(true)
    expect(a_6[1] instanceof Array).assertEqual(true)
    expect(b_6 instanceof Array).assertEqual(true)
    expect(b_6[0] instanceof Array).assertEqual(true)
    expect(b_6[1] instanceof Array).assertEqual(true)
    expect(b_6.length).assertEqual(2)
    expect(b_6[0].length).assertEqual(2)
    expect(b_6[1].length).assertEqual(2)
    expect(b_6[0][0] instanceof C_6).assertEqual(true)
    expect(typeof b_6[0][0].data_6 === 'number').assertEqual(true)
    expect(b_6[0][0].data_6).assertEqual(1)
    expect(b_6[0][1] instanceof C_6).assertEqual(true)
    expect(typeof b_6[0][1].data_6 === 'number').assertEqual(true)
    expect(b_6[0][1].data_6).assertEqual(3)
    expect(b_6[1][0] instanceof C_6).assertEqual(true)
    expect(typeof b_6[1][0].data_6 === 'number').assertEqual(true)
    expect(b_6[1][0].data_6).assertEqual(5)
    expect(b_6[1][1] instanceof C_6).assertEqual(true)
    expect(typeof b_6[1][1].data_6 === 'number').assertEqual(true)
    expect(b_6[1][1].data_6).assertEqual(7)
    a_6 = b_6
    expect(a_6 instanceof Array).assertEqual(true)
    expect(a_6[0] instanceof Array).assertEqual(true)
    expect(a_6[1] instanceof Array).assertEqual(true)
    expect(a_6.length).assertEqual(2)
    expect(a_6[0].length).assertEqual(2)
    expect(a_6[1].length).assertEqual(2)
    expect(a_6[0][0] instanceof C_6).assertEqual(true)
    expect(typeof a_6[0][0].data_6 === 'number').assertEqual(true)
    expect(a_6[0][0].data_6).assertEqual(1)
    expect(a_6[0][1] instanceof C_6).assertEqual(true)
    expect(typeof a_6[0][1].data_6 === 'number').assertEqual(true)
    expect(a_6[0][1].data_6).assertEqual(3)
    expect(a_6[1][0] instanceof C_6).assertEqual(true)
    expect(typeof a_6[1][0].data_6 === 'number').assertEqual(true)
    expect(a_6[1][0].data_6).assertEqual(5)
    expect(a_6[1][1] instanceof C_6).assertEqual(true)
    expect(typeof a_6[1][1].data_6 === 'number').assertEqual(true)
    expect(a_6[1][1].data_6).assertEqual(7)
    return true
  }
}

function cast6(p: Object): C6[][] {
  return p as C6[][]
}

class C7 {
  data: number = 0
}

namespace testNS_7 {
  class C_7 {
    data_7: number = 0
  }

  function cast_7(p: Object): Array<C_7>[] {
    return p as Array<C_7>[]
  }

  export function runTest_7(): boolean {
    let a_7: Array<C_7>[] = [[{data_7: 1} as C_7, {data_7: 3} as C_7], [{data_7: 5} as C_7, {data_7: 7} as C_7]]
    let b_7: Array<C_7[]> = cast_7(a_7)
    expect(a_7 instanceof Array).assertEqual(true)
    expect(a_7[0] instanceof Array).assertEqual(true)
    expect(a_7[1] instanceof Array).assertEqual(true)
    expect(b_7 instanceof Array).assertEqual(true)
    expect(b_7[0] instanceof Array).assertEqual(true)
    expect(b_7[1] instanceof Array).assertEqual(true)
    expect(b_7.length).assertEqual(2)
    expect(b_7[0].length).assertEqual(2)
    expect(b_7[1].length).assertEqual(2)
    expect(b_7[0][0] instanceof C_7).assertEqual(true)
    expect(typeof b_7[0][0].data_7 === 'number').assertEqual(true)
    expect(b_7[0][0].data_7).assertEqual(1)
    expect(b_7[0][1] instanceof C_7).assertEqual(true)
    expect(typeof b_7[0][1].data_7 === 'number').assertEqual(true)
    expect(b_7[0][1].data_7).assertEqual(3)
    expect(b_7[1][0] instanceof C_7).assertEqual(true)
    expect(typeof b_7[1][0].data_7 === 'number').assertEqual(true)
    expect(b_7[1][0].data_7).assertEqual(5)
    expect(b_7[1][1] instanceof C_7).assertEqual(true)
    expect(typeof b_7[1][1].data_7 === 'number').assertEqual(true)
    expect(b_7[1][1].data_7).assertEqual(7)
    a_7 = b_7
    expect(a_7 instanceof Array).assertEqual(true)
    expect(a_7[0] instanceof Array).assertEqual(true)
    expect(a_7[1] instanceof Array).assertEqual(true)
    expect(a_7.length).assertEqual(2)
    expect(a_7[0].length).assertEqual(2)
    expect(a_7[1].length).assertEqual(2)
    expect(a_7[0][0] instanceof C_7).assertEqual(true)
    expect(typeof a_7[0][0].data_7 === 'number').assertEqual(true)
    expect(a_7[0][0].data_7).assertEqual(1)
    expect(a_7[0][1] instanceof C_7).assertEqual(true)
    expect(typeof a_7[0][1].data_7 === 'number').assertEqual(true)
    expect(a_7[0][1].data_7).assertEqual(3)
    expect(a_7[1][0] instanceof C_7).assertEqual(true)
    expect(typeof a_7[1][0].data_7 === 'number').assertEqual(true)
    expect(a_7[1][0].data_7).assertEqual(5)
    expect(a_7[1][1] instanceof C_7).assertEqual(true)
    expect(typeof a_7[1][1].data_7 === 'number').assertEqual(true)
    expect(a_7[1][1].data_7).assertEqual(7)
    return true
  }
}

class C {data: int = 0}
function cast(p: Object) {
  return p as Array<C[]>
}
export default function ArrayOfArraysTypesIdentityTest17(): void {
  describe('ArrayOfArraysTypesIdentityTest17', () => {
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
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4700
     * @tc.name      testArrayOfArraysTypesIdentity0047
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0047';

      let a: Array<C1[]> = [[{data: 1} as C1, {data: 3} as C1], [{data: 5} as C1, {data: 7} as C1]]
      let b: Array<C1>[] = cast1(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C1).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C1).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C1).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C1).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C1).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C1).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C1).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C1).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4800
     * @tc.name      testArrayOfArraysTypesIdentity0048
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0048';

      let a: Array<C2[]> = [[{data: 1} as C2, {data: 3} as C2], [{data: 5} as C2, {data: 7} as C2]]
      let b: Array<C2>[] = cast2(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C2).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C2).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C2).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C2).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C2).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C2).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C2).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C2).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_2.runTest_2()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_4900
     * @tc.name      testArrayOfArraysTypesIdentity0049
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0049';

      let a: Array<C3[]> = [[{data: 1} as C3, {data: 3} as C3], [{data: 5} as C3, {data: 7} as C3]]
      let b: Array<C3>[] = cast3(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C3).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C3).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C3).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C3).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C3).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C3).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C3).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C3).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_3.runTest_3()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_5000
     * @tc.name      testArrayOfArraysTypesIdentity0050
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0050';

      let a: Array<C4[]> = [[{data: 1} as C4, {data: 3} as C4], [{data: 5} as C4, {data: 7} as C4]]
      let b: Array<C4>[] = cast4(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C4).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C4).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C4).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C4).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C4).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C4).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C4).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C4).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_4.runTest_4()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_5100
     * @tc.name      testArrayOfArraysTypesIdentity0051
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0051';

      let a: Array<C5>[] = [[{data: 1} as C5, {data: 3} as C5], [{data: 5} as C5, {data: 7} as C5]]
      let b: Array<C5[]> = cast5(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C5).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C5).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C5).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C5).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C5).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C5).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C5).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C5).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_5.runTest_5()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_5200
     * @tc.name      testArrayOfArraysTypesIdentity0006
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0052';

      let a: Array<C6>[] = [[{data: 1} as C6, {data: 3} as C6], [{data: 5} as C6, {data: 7} as C6]]
      let b: Array<C6[]> = cast6(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C6).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C6).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C6).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C6).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C6).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C6).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C6).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C6).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_6.runTest_6()).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ARRAY_OF_ARRAYS_TYPES_IDENTITY_5300
     * @tc.name      testArrayOfArraysTypesIdentity0053
     * @tc.desc      Checking for 2d Arrays with mix of types T[] and Array<T> are identical on custom
     *               types by using cast expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayOfArraysTypesIdentity0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testArrayOfArraysTypesIdentity0053';

      let a: Array<C1>[] = [[{data: 1} as C1, {data: 3} as C1], [{data: 5} as C1, {data: 7} as C1]]
      let b: Array<C1[]> = cast1(a)
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(b instanceof Array).assertEqual(true)
      expect(b[0] instanceof Array).assertEqual(true)
      expect(b[1] instanceof Array).assertEqual(true)
      expect(b.length).assertEqual(2)
      expect(b[0].length).assertEqual(2)
      expect(b[1].length).assertEqual(2)
      expect(b[0][0] instanceof C1).assertEqual(true)
      expect(typeof b[0][0].data === 'number').assertEqual(true)
      expect(b[0][0].data).assertEqual(1)
      expect(b[0][1] instanceof C1).assertEqual(true)
      expect(typeof b[0][1].data === 'number').assertEqual(true)
      expect(b[0][1].data).assertEqual(3)
      expect(b[1][0] instanceof C1).assertEqual(true)
      expect(typeof b[1][0].data === 'number').assertEqual(true)
      expect(b[1][0].data).assertEqual(5)
      expect(b[1][1] instanceof C1).assertEqual(true)
      expect(typeof b[1][1].data === 'number').assertEqual(true)
      expect(b[1][1].data).assertEqual(7)
      a = b
      expect(a instanceof Array).assertEqual(true)
      expect(a[0] instanceof Array).assertEqual(true)
      expect(a[1] instanceof Array).assertEqual(true)
      expect(a.length).assertEqual(2)
      expect(a[0].length).assertEqual(2)
      expect(a[1].length).assertEqual(2)
      expect(a[0][0] instanceof C1).assertEqual(true)
      expect(typeof a[0][0].data === 'number').assertEqual(true)
      expect(a[0][0].data).assertEqual(1)
      expect(a[0][1] instanceof C1).assertEqual(true)
      expect(typeof a[0][1].data === 'number').assertEqual(true)
      expect(a[0][1].data).assertEqual(3)
      expect(a[1][0] instanceof C1).assertEqual(true)
      expect(typeof a[1][0].data === 'number').assertEqual(true)
      expect(a[1][0].data).assertEqual(5)
      expect(a[1][1] instanceof C1).assertEqual(true)
      expect(typeof a[1][1].data === 'number').assertEqual(true)
      expect(a[1][1].data).assertEqual(7)

      expect(testNS_1.runTest_1()).assertEqual(true)

    });
  })
}