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
  from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test'


function check_value_2(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | int).assertEqual(123)
    expect(v as int | string).assertEqual(123)
  }
  else if (v_id == 2) {
    expect(v as bigint | int).assertEqual(5n)
  }
  else {
    expect(v as int | string).assertEqual("abc")
  }
}
function check_value_as_type_T_2(v: Object, v_id: int): void {
  expect(v instanceof bigint | int || v instanceof int | string).assertTrue()
  check_value_2(v, v_id)
}
function check_is_in_T_type_2(v: bigint | int | string, v_id: int): boolean {
  check_value_2(v, v_id)
  if (v instanceof bigint | int) {
    check_value_2(v, v_id)
    if (v instanceof int | string) {
      expect(v_id).assertEqual(1)
      check_value_2(v, v_id)
      expect(v).assertEqual(123)
      expect(v instanceof bigint | int).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_2(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_2(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_2(v, v_id)
      return true
    } else {
      return false
    }
  }
}

function check_value_3(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | number).assertEqual(123)
    expect(v as number | string).assertEqual(123)
  }
  else if (v_id == 2) {
    expect(v as bigint | number).assertEqual(5n)
  }
  else {
    expect(v as number | string).assertEqual("abc")
  }
}
function check_value_as_type_T_3(v: Object, v_id: int): void {
  expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
  check_value_3(v, v_id)
}
function check_is_in_T_type_3(v: bigint | number | string, v_id: int): boolean {
  check_value_3(v, v_id)
  if (v instanceof bigint | number) {
    check_value_3(v, v_id)
    if (v instanceof number | string) {
      expect(v_id).assertEqual(1)
      check_value_3(v, v_id)
      expect(v).assertEqual(123)
      expect(v instanceof bigint | number).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_3(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_3(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_3(v, v_id)
      return true
    } else {
      return false
    }
  }
}

function check_value_4(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | number).assertEqual(5)
    expect(v as number | string).assertEqual(5)
  }
  else if (v_id == 2) {
    expect(v as bigint | number).assertEqual(5n)
  }
  else {
    expect(v as number | string).assertEqual("abc")
  }
}
function check_value_as_type_T_4(v: Object, v_id: int): void {
  expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
  check_value_4(v, v_id)
}
function check_is_in_T_type_4(v: bigint | number | string, v_id: int): boolean {
  check_value_4(v, v_id)
  if (v instanceof bigint | number) {
    check_value_4(v, v_id)
    if (v instanceof number | string) {
      expect(v_id).assertEqual(1)
      check_value_4(v, v_id)
      expect(v).assertEqual(5)
      expect(v instanceof bigint | number).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_4(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_4(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_4(v, v_id)
      return true
    } else {
      return false
    }
  }
}

function check_value_5(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | number).assertEqual(17)
    expect(v as number | string).assertEqual(17)
  }
  else if (v_id == 2) {
    expect(v as bigint | number).assertEqual(5n)
  }
  else {
    expect(v as number | string).assertEqual("abc")
  }
}
function check_value_as_type_T_5(v: Object, v_id: int): void {
  expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
  check_value_5(v, v_id)
}
function check_is_in_T_type_5(v: bigint | number | string, v_id: int): boolean {
  check_value_5(v, v_id)
  if (v instanceof bigint | number) {
    check_value_5(v, v_id)
    if (v instanceof number | string) {
      expect(v_id).assertEqual(1)
      check_value_5(v, v_id)
      expect(v).assertEqual(17)
      expect(v instanceof bigint | number).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_5(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_5(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_5(v, v_id)
      return true
    } else {
      return false
    }
  }
}

function check_value_6(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | number).assertEqual(1.7)
    expect(v as number | string).assertEqual(1.7)
  }
  else if (v_id == 2) {
    expect(v as bigint | number).assertEqual(5n)
  }
  else {
    expect(v as number | string).assertEqual("abc")
  }
}
function check_value_as_type_T_6(v: Object, v_id: int): void {
  expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
  check_value_6(v, v_id)
}
function check_is_in_T_type_6(v: bigint | number | string, v_id: int): boolean {
  check_value_6(v, v_id)
  if (v instanceof bigint | number) {
    check_value_6(v, v_id)
    if (v instanceof number | string) {
      expect(v_id).assertEqual(1)
      check_value_6(v, v_id)
      expect(v).assertEqual(1.7)
      expect(v instanceof bigint | number).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_6(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_6(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_6(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_6(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_6(v, v_id)
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeObjOnPredefinedTest(): void {
  describe('InterTypeIsSubOfTypeObjOnPredefinedTest', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0200
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });
  })
}
