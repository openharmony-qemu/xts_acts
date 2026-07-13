'use static';
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
  from '@ohos/hypium-binary/src/main/indexStatic';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Animal_1 {}
class Cat_1 extends Animal_1 {v_1: string = "cat"}
class Dog_1 extends Animal_1 {v_1: bigint = 123n}
class Frog_1 extends Animal_1 {v_1: int = 5}
function check_cat_1(a: Any) {
  expect(a instanceof Cat_1).assertEqual(true)
  expect((a as Cat_1).v_1).assertEqual("cat")
}
function check_dog_1(a: Any) {
  expect(a instanceof Dog_1).assertEqual(true)
  expect((a as Dog_1).v_1).assertEqual(123n)
}
function check_frog_1(a: Any) {
  expect(a instanceof Frog_1).assertEqual(true)
  expect((a as Frog_1).v_1).assertEqual(5)
}
function check_number_1(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function check_bigint_1(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_1(v: Any, v_id_1: int): void {
  if (v_id_1 == 1) {
    check_dog_1(v)
    check_dog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    check_dog_1(v as number | Dog_1 | bigint)
  }
  else if (v_id_1 == 2) {
    check_cat_1(v)
    check_cat_1(v as Cat_1 | Dog_1 | Frog_1 | number)
  }
  else {
    check_bigint_1(v)
    check_bigint_1(v as number | Dog_1 | bigint)
  }
}
function check_value_as_type_T_1(v: Cat_1 | Dog_1 | Frog_1 | number | int, v_id_1: int): void {
  expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number ||
    v instanceof number | Dog_1 | bigint).assertEqual(true)
  check_value_1(v, v_id_1)
}
function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | number | Dog_1 | bigint,
  v_id_1: int): boolean {
  check_value_1(v, v_id_1)
  if (v instanceof Cat_1 | Dog_1 | Frog_1 | number) {
    check_value_1(v, v_id_1)
    if (v instanceof number | Dog_1 | bigint) {
      expect(v_id_1).assertEqual(1)
      check_value_1(v, v_id_1)
      expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number).assertEqual(true)
      expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number | int).assertEqual(true)
      if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id_1).assertEqual(2)
      check_value_1(v, v_id_1)
      if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id_1).assertEqual(3)
    check_value_1(v, v_id_1)
    if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
      check_value_as_type_T_1(v, v_id_1)
      return true
    } else {
      return false
    }
  }
}

abstract class A_2 {}
abstract class B1_2 extends A_2 {}
class B2_2 extends A_2 {v_2: bigint = 123n}
class C1_2 extends B1_2 {v_2: int = 321}
class C2_2 extends B1_2 {v_2: number = 6.7}
class Other_2 {v_2: string = "other"}
function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertEqual(true)
  expect((a as C1_2).v_2).assertEqual(321)
}
function check_C2_2(a: Any) {
  expect(a instanceof C2_2).assertEqual(true)
  expect((a as C2_2).v_2).assertEqual(6.7)
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertEqual(true)
  expect((a as B2_2).v_2).assertEqual(123n)
}
function check_Other_2(a: Any) {
  expect(a instanceof Other_2).assertEqual(true)
  expect((a as Other_2).v_2).assertEqual("other")
}
function check_bigint_2(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_2(v: Any, v_id_2: int): void {
  if (v_id_2 == 1) {
    check_C1_2(v)
    check_C1_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    check_C1_2(v as B1_2 | Other_2 | bigint)
  }
  else if (v_id_2 == 2) {
    check_B2_2(v)
    check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
  }
  else {
    check_bigint_2(v)
    check_bigint_2(v as B1_2 | Other_2 | bigint)
  }
}
function check_value_as_type_T_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number, v_id_2: int): void {
  expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
    v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
  check_value_2(v, v_id_2)
}
function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | Other_2 | bigint,
  v_id_2: int): boolean {
  check_value_2(v, v_id_2)
  if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
    check_value_2(v, v_id_2)
    if (v instanceof B1_2 | Other_2 | bigint) {
      expect(v_id_2).assertEqual(1)
      check_value_2(v, v_id_2)
      expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
      expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(true)
      if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id_2).assertEqual(2)
      check_value_2(v, v_id_2)
      if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id_2).assertEqual(3)
    check_value_2(v, v_id_2)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
      check_value_as_type_T_2(v, v_id_2)
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeTOnNonGenTest(): void {
  describe('InterTypeIsSubOfTypeTOnNonGenTest', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0100
     * @tc.name      testInterTypeIsSubOfTypeTOnNonGen0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on non generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res1_1: boolean = check_is_in_T_type_1(
        new Dog_1(), 1)
      let res2_1: boolean = check_is_in_T_type_1(
        new Cat_1(), 2)
      let res3_1: boolean = check_is_in_T_type_1(
        5n, 3)
      expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)
    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0200
     * @tc.name      testInterTypeIsSubOfTypeTOnNonGen0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on non generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnNonGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let res1_2: boolean = check_is_in_T_type_2(
        new C1_2(), 1)
      let res2_2: boolean = check_is_in_T_type_2(
        new B2_2(), 2)
      let res3_2: boolean = check_is_in_T_type_2(
        5n, 3)
      expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)
    });
  })
}
