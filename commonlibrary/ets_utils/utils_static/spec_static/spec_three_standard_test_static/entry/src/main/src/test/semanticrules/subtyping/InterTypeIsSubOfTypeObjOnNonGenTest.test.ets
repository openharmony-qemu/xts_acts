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

namespace testNS2_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 { v: string = "cat" }
  class Dog_1 extends Animal_1 { v: bigint = 123n }
  class Frog_1 extends Animal_1 { v: int = 5 }

  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_number_1(v)
      check_number_1(v as Cat_1 | Dog_1 | Frog_1 | number)
      check_number_1(v as number | Dog_1 | bigint)
    } else if (v_id == 2) {
      check_frog_1(v)
      check_frog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    } else {
      check_bigint_1(v)
      check_bigint_1(v as number | Dog_1 | bigint)
    }
  }

  function check_value_as_type_T_1(v: Object, v_id: int): void {
    expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number || v instanceof bigint).assertEqual(true)
    check_value_1(v, v_id)
  }

  function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | bigint, v_id: int): boolean {
    check_value_1(v, v_id)
    if (v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number) {
      check_value_1(v, v_id)
      if (v instanceof number || v instanceof Dog_1 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      } else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1(7.8, 1)
    let res2: boolean = check_is_in_T_type_1(new Frog_1(), 2)
    let res3: boolean = check_is_in_T_type_1(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

class Animal_1 {}
class Cat_1 extends Animal_1 { v: string = "cat" }
class Dog_1 extends Animal_1 { v: bigint = 123n }
class Frog_1 extends Animal_1 { v: int = 5 }

function check_cat_1(a: Any) {
  expect(a instanceof Cat_1).assertEqual(true)
  expect((a as Cat_1).v).assertEqual("cat")
}
function check_dog_1(a: Any) {
  expect(a instanceof Dog_1).assertEqual(true)
  expect((a as Dog_1).v).assertEqual(123n)
}
function check_frog_1(a: Any) {
  expect(a instanceof Frog_1).assertEqual(true)
  expect((a as Frog_1).v).assertEqual(5)
}
function check_number_1(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function check_bigint_1(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}

function check_value_1(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_dog_1(v)
    check_dog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    check_dog_1(v as number | Dog_1 | bigint)
  } else if (v_id == 2) {
    check_cat_1(v)
    check_cat_1(v as Cat_1 | Dog_1 | Frog_1 | number)
  } else {
    check_bigint_1(v)
    check_bigint_1(v as number | Dog_1 | bigint)
  }
}

function check_value_as_type_T_1(v: Object, v_id: int): void {
  expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number || v instanceof bigint).assertEqual(true)
  check_value_1(v, v_id)
}

function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | bigint, v_id: int): boolean {
  check_value_1(v, v_id)
  if (v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number) {
    check_value_1(v, v_id)
    if (v instanceof number || v instanceof Dog_1 || v instanceof bigint) {
      expect(v_id).assertEqual(1)
      check_value_1(v, v_id)
      expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    } else {
      expect(v_id).assertEqual(2)
      check_value_1(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_1(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_1(v, v_id)
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeObjOnNonGenTest(): void {
  describe('InterTypeIsSubOfTypeObjOnNonGenTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0100
     * @tc.name      testInterTypeIsSubOfTypeObjOnNonGen0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on non
     *               generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res1_1: boolean = check_is_in_T_type_1(
        new Dog_1(), 1)
      let res2_1: boolean = check_is_in_T_type_1(
        new Cat_1(), 2)
      let res3_1: boolean = check_is_in_T_type_1(
        5n, 3)
      expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)

      expect(testNS2_1.runTest_1()).assertEqual(true)

    });

  })
}