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

namespace testNS1_7 {
  function check_value_7(v: Any, v_id: int): void {
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
  function check_value_as_type_T_7(v: Object, v_id: int): void {
    expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
    check_value_7(v, v_id)
  }
  function check_is_in_T_type_7(v: bigint | number | string, v_id: int): boolean {
    check_value_7(v, v_id)
    if (v instanceof bigint | number) {
      check_value_7(v, v_id)
      if (v instanceof number | string) {
        expect(v_id).assertEqual(1)
        check_value_7(v, v_id)
        expect(v).assertEqual(1.7)
        expect(v instanceof bigint | number).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_7(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_7(v, v_id)
        expect(v).assertEqual(5n)
        if (v instanceof Object) {
          check_value_as_type_T_7(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_7(v, v_id)
      expect(v).assertEqual("abc")
      if (v instanceof Object) {
        check_value_as_type_T_7(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_7(): boolean {
    let res1: boolean = check_is_in_T_type_7(1.7, 1)
    let res2: boolean = check_is_in_T_type_7(5n, 2)
    let res3: boolean = check_is_in_T_type_7("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_7 {
  function check_value_7(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | number).assertEqual(12.8)
      expect(v as number | string).assertEqual(12.8)
    }
    else if (v_id == 2) {
      expect(v as bigint | number).assertEqual(723n)
    }
    else {
      expect(v as number | string).assertEqual("efg")
    }
  }
  function check_value_as_type_T_7(v: Object, v_id: int): void {
    expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
    check_value_7(v, v_id)
  }
  function check_is_in_T_type_7(v: bigint | number | string, v_id: int): boolean {
    check_value_7(v, v_id)
    if (v instanceof bigint | number) {
      check_value_7(v, v_id)
      if (v instanceof number | string) {
        expect(v_id).assertEqual(1)
        check_value_7(v, v_id)
        expect(v).assertEqual(12.8)
        expect(v instanceof bigint | number).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_7(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_7(v, v_id)
        expect(v).assertEqual(723n)
        if (v instanceof Object) {
          check_value_as_type_T_7(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_7(v, v_id)
      expect(v).assertEqual("efg")
      if (v instanceof Object) {
        check_value_as_type_T_7(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_7(): boolean {
    let res1: boolean = check_is_in_T_type_7(12.8, 1)
    let res2: boolean = check_is_in_T_type_7(723n, 2)
    let res3: boolean = check_is_in_T_type_7("efg", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_7(v: Any, v_id: int): void {
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
function check_value_as_type_T_7(v: Object, v_id: int): void {
  expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
  check_value_7(v, v_id)
}
function check_is_in_T_type_7(v: bigint | number | string, v_id: int): boolean {
  check_value_7(v, v_id)
  if (v instanceof bigint | number) {
    check_value_7(v, v_id)
    if (v instanceof number | string) {
      expect(v_id).assertEqual(1)
      check_value_7(v, v_id)
      expect(v).assertEqual(1.7)
      expect(v instanceof bigint | number).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_7(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_7(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_7(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_7(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_7(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_8 {
  function check_value_8(v: Any, v_id: int): void {
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
  function check_value_as_type_T_8(v: Object, v_id: int): void {
    expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(v: bigint | number | string, v_id: int): boolean {
    check_value_8(v, v_id)
    if (v instanceof bigint | number) {
      check_value_8(v, v_id)
      if (v instanceof number | string) {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v).assertEqual(1.7)
        expect(v instanceof bigint | number).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_8(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        expect(v).assertEqual(5n)
        if (v instanceof Object) {
          check_value_as_type_T_8(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      expect(v).assertEqual("abc")
      if (v instanceof Object) {
        check_value_as_type_T_8(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(1.7, 1)
    let res2: boolean = check_is_in_T_type_8(5n, 2)
    let res3: boolean = check_is_in_T_type_8("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_8 {
  function check_value_8(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | number).assertEqual(12.8)
      expect(v as number | string).assertEqual(12.8)
    }
    else if (v_id == 2) {
      expect(v as bigint | number).assertEqual(723n)
    }
    else {
      expect(v as number | string).assertEqual("efg")
    }
  }
  function check_value_as_type_T_8(v: Object, v_id: int): void {
    expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
    check_value_8(v, v_id)
  }
  function check_is_in_T_type_8(v: bigint | number | string, v_id: int): boolean {
    check_value_8(v, v_id)
    if (v instanceof bigint | number) {
      check_value_8(v, v_id)
      if (v instanceof number | string) {
        expect(v_id).assertEqual(1)
        check_value_8(v, v_id)
        expect(v).assertEqual(12.8)
        expect(v instanceof bigint | number).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_8(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_8(v, v_id)
        expect(v).assertEqual(723n)
        if (v instanceof Object) {
          check_value_as_type_T_8(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_8(v, v_id)
      expect(v).assertEqual("efg")
      if (v instanceof Object) {
        check_value_as_type_T_8(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_8(): boolean {
    let res1: boolean = check_is_in_T_type_8(12.8, 1)
    let res2: boolean = check_is_in_T_type_8(723n, 2)
    let res3: boolean = check_is_in_T_type_8("efg", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_8(v: Any, v_id: int): void {
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
function check_value_as_type_T_8(v: Object, v_id: int): void {
  expect(v instanceof bigint | number || v instanceof number | string).assertTrue()
  check_value_8(v, v_id)
}
function check_is_in_T_type_8(v: bigint | number | string, v_id: int): boolean {
  check_value_8(v, v_id)
  if (v instanceof bigint | number) {
    check_value_8(v, v_id)
    if (v instanceof number | string) {
      expect(v_id).assertEqual(1)
      check_value_8(v, v_id)
      expect(v).assertEqual(1.7)
      expect(v instanceof bigint | number).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_8(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_8(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_8(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_8(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_8(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_9 {
  function check_value_9(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | bigint).assertEqual(5n)
      expect(v as bigint | string).assertEqual(5n)
    }
    else if (v_id == 2) {
      expect(v as number | bigint).assertEqual(1.7)
    }
    else {
      expect(v as bigint | string).assertEqual("abc")
    }
  }
  function check_value_as_type_T_9(v: Object, v_id: int): void {
    expect(v instanceof number | bigint || v instanceof bigint | string).assertTrue()
    check_value_9(v, v_id)
  }
  function check_is_in_T_type_9(v: number | bigint | string, v_id: int): boolean {
    check_value_9(v, v_id)
    if (v instanceof number | bigint) {
      check_value_9(v, v_id)
      if (v instanceof bigint | string) {
        expect(v_id).assertEqual(1)
        check_value_9(v, v_id)
        expect(v).assertEqual(5n)
        expect(v instanceof number | bigint).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_9(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_9(v, v_id)
        expect(v).assertEqual(1.7)
        if (v instanceof Object) {
          check_value_as_type_T_9(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_9(v, v_id)
      expect(v).assertEqual("abc")
      if (v instanceof Object) {
        check_value_as_type_T_9(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_9(): boolean {
    let res1: boolean = check_is_in_T_type_9(5n, 1)
    let res2: boolean = check_is_in_T_type_9(1.7, 2)
    let res3: boolean = check_is_in_T_type_9("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_9 {
  function check_value_9(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | bigint).assertEqual(723n)
      expect(v as bigint | string).assertEqual(723n)
    }
    else if (v_id == 2) {
      expect(v as number | bigint).assertEqual(12.8)
    }
    else {
      expect(v as bigint | string).assertEqual("efg")
    }
  }
  function check_value_as_type_T_9(v: Object, v_id: int): void {
    expect(v instanceof number | bigint || v instanceof bigint | string).assertTrue()
    check_value_9(v, v_id)
  }
  function check_is_in_T_type_9(v: number | bigint | string, v_id: int): boolean {
    check_value_9(v, v_id)
    if (v instanceof number | bigint) {
      check_value_9(v, v_id)
      if (v instanceof bigint | string) {
        expect(v_id).assertEqual(1)
        check_value_9(v, v_id)
        expect(v).assertEqual(723n)
        expect(v instanceof number | bigint).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_9(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_9(v, v_id)
        expect(v).assertEqual(12.8)
        if (v instanceof Object) {
          check_value_as_type_T_9(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_9(v, v_id)
      expect(v).assertEqual("efg")
      if (v instanceof Object) {
        check_value_as_type_T_9(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_9(): boolean {
    let res1: boolean = check_is_in_T_type_9(723n, 1)
    let res2: boolean = check_is_in_T_type_9(12.8, 2)
    let res3: boolean = check_is_in_T_type_9("efg", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_9(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as number | bigint).assertEqual(5n)
    expect(v as bigint | string).assertEqual(5n)
  }
  else if (v_id == 2) {
    expect(v as number | bigint).assertEqual(1.7)
  }
  else {
    expect(v as bigint | string).assertEqual("abc")
  }
}
function check_value_as_type_T_9(v: Object, v_id: int): void {
  expect(v instanceof number | bigint || v instanceof bigint | string).assertTrue()
  check_value_9(v, v_id)
}
function check_is_in_T_type_9(v: number | bigint | string, v_id: int): boolean {
  check_value_9(v, v_id)
  if (v instanceof number | bigint) {
    check_value_9(v, v_id)
    if (v instanceof bigint | string) {
      expect(v_id).assertEqual(1)
      check_value_9(v, v_id)
      expect(v).assertEqual(5n)
      expect(v instanceof number | bigint).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_9(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_9(v, v_id)
      expect(v).assertEqual(1.7)
      if (v instanceof Object) {
        check_value_as_type_T_9(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_9(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_9(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_10 {
  function check_value_10(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | string).assertEqual("abc")
      expect(v as string | bigint).assertEqual("abc")
    }
    else if (v_id == 2) {
      expect(v as number | string).assertEqual(1.7)
    }
    else {
      expect(v as string | bigint).assertEqual(5n)
    }
  }
  function check_value_as_type_T_10(v: Object, v_id: int): void {
    expect(v instanceof number | string || v instanceof string | bigint).assertTrue()
    check_value_10(v, v_id)
  }
  function check_is_in_T_type_10(v: number | string | bigint, v_id: int): boolean {
    check_value_10(v, v_id)
    if (v instanceof number | string) {
      check_value_10(v, v_id)
      if (v instanceof string | bigint) {
        expect(v_id).assertEqual(1)
        check_value_10(v, v_id)
        expect(v).assertEqual("abc")
        expect(v instanceof number | string).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_10(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_10(v, v_id)
        expect(v).assertEqual(1.7)
        if (v instanceof Object) {
          check_value_as_type_T_10(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_10(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_10(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_10(): boolean {
    let res1: boolean = check_is_in_T_type_10("abc", 1)
    let res2: boolean = check_is_in_T_type_10(1.7, 2)
    let res3: boolean = check_is_in_T_type_10(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_10 {
  function check_value_10(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | string).assertEqual("efg")
      expect(v as string | bigint).assertEqual("efg")
    }
    else if (v_id == 2) {
      expect(v as number | string).assertEqual(12.8)
    }
    else {
      expect(v as string | bigint).assertEqual(7n)
    }
  }
  function check_value_as_type_T_10(v: Object, v_id: int): void {
    expect(v instanceof number | string || v instanceof string | bigint).assertTrue()
    check_value_10(v, v_id)
  }
  function check_is_in_T_type_10(v: number | string | bigint, v_id: int): boolean {
    check_value_10(v, v_id)
    if (v instanceof number | string) {
      check_value_10(v, v_id)
      if (v instanceof string | bigint) {
        expect(v_id).assertEqual(1)
        check_value_10(v, v_id)
        expect(v).assertEqual("efg")
        expect(v instanceof number | string).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_10(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_10(v, v_id)
        expect(v).assertEqual(12.8)
        if (v instanceof Object) {
          check_value_as_type_T_10(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_10(v, v_id)
      expect(v).assertEqual(7n)
      if (v instanceof Object) {
        check_value_as_type_T_10(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_10(): boolean {
    let res1: boolean = check_is_in_T_type_10("efg", 1)
    let res2: boolean = check_is_in_T_type_10(12.8, 2)
    let res3: boolean = check_is_in_T_type_10(7n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_10(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as number | string).assertEqual("abc")
    expect(v as string | bigint).assertEqual("abc")
  }
  else if (v_id == 2) {
    expect(v as number | string).assertEqual(1.7)
  }
  else {
    expect(v as string | bigint).assertEqual(5n)
  }
}
function check_value_as_type_T_10(v: Object, v_id: int): void {
  expect(v instanceof number | string || v instanceof string | bigint).assertTrue()
  check_value_10(v, v_id)
}
function check_is_in_T_type_10(v: number | string | bigint, v_id: int): boolean {
  check_value_10(v, v_id)
  if (v instanceof number | string) {
    check_value_10(v, v_id)
    if (v instanceof string | bigint) {
      expect(v_id).assertEqual(1)
      check_value_10(v, v_id)
      expect(v).assertEqual("abc")
      expect(v instanceof number | string).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_10(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_10(v, v_id)
      expect(v).assertEqual(1.7)
      if (v instanceof Object) {
        check_value_as_type_T_10(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_10(v, v_id)
    expect(v).assertEqual(5n)
    if (v instanceof Object) {
      check_value_as_type_T_10(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_11 {
  function check_value_11(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | string).assertEqual('a')
      expect(v as string | bigint).assertEqual('a')
    }
    else if (v_id == 2) {
      expect(v as number | string).assertEqual(1.7)
    }
    else {
      expect(v as string | bigint).assertEqual(5n)
    }
  }
  function check_value_as_type_T_11(v: Object, v_id: int): void {
    expect(v instanceof number | string || v instanceof string | bigint).assertTrue()
    check_value_11(v, v_id)
  }
  function check_is_in_T_type_11(v: number | string | bigint, v_id: int): boolean {
    check_value_11(v, v_id)
    if (v instanceof number | string) {
      check_value_11(v, v_id)
      if (v instanceof string | bigint) {
        expect(v_id).assertEqual(1)
        check_value_11(v, v_id)
        expect(v).assertEqual('a')
        expect(v instanceof number | string).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_11(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_11(v, v_id)
        expect(v).assertEqual(1.7)
        if (v instanceof Object) {
          check_value_as_type_T_11(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_11(v, v_id)
      expect(v).assertEqual(5n)
      if (v instanceof Object) {
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_11(): boolean {
    let res1: boolean = check_is_in_T_type_11('a', 1)
    let res2: boolean = check_is_in_T_type_11(1.7, 2)
    let res3: boolean = check_is_in_T_type_11(5n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_11 {
  function check_value_11(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | string).assertEqual('b')
      expect(v as string | bigint).assertEqual('b')
    }
    else if (v_id == 2) {
      expect(v as number | string).assertEqual(12.8)
    }
    else {
      expect(v as string | bigint).assertEqual(7n)
    }
  }
  function check_value_as_type_T_11(v: Object, v_id: int): void {
    expect(v instanceof number | string || v instanceof string | bigint).assertTrue()
    check_value_11(v, v_id)
  }
  function check_is_in_T_type_11(v: number | string | bigint, v_id: int): boolean {
    check_value_11(v, v_id)
    if (v instanceof number | string) {
      check_value_11(v, v_id)
      if (v instanceof string | bigint) {
        expect(v_id).assertEqual(1)
        check_value_11(v, v_id)
        expect(v).assertEqual('b')
        expect(v instanceof number | string).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_11(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_11(v, v_id)
        expect(v).assertEqual(12.8)
        if (v instanceof Object) {
          check_value_as_type_T_11(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_11(v, v_id)
      expect(v).assertEqual(7n)
      if (v instanceof Object) {
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_11(): boolean {
    let res1: boolean = check_is_in_T_type_11('b', 1)
    let res2: boolean = check_is_in_T_type_11(12.8, 2)
    let res3: boolean = check_is_in_T_type_11(7n, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_11(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as number | string).assertEqual('a')
    expect(v as string | bigint).assertEqual('a')
  }
  else if (v_id == 2) {
    expect(v as number | string).assertEqual(1.7)
  }
  else {
    expect(v as string | bigint).assertEqual(5n)
  }
}
function check_value_as_type_T_11(v: Object, v_id: int): void {
  expect(v instanceof number | string || v instanceof string | bigint).assertTrue()
  check_value_11(v, v_id)
}
function check_is_in_T_type_11(v: number | string | bigint, v_id: int): boolean {
  check_value_11(v, v_id)
  if (v instanceof number | string) {
    check_value_11(v, v_id)
    if (v instanceof string | bigint) {
      expect(v_id).assertEqual(1)
      check_value_11(v, v_id)
      expect(v).assertEqual('a')
      expect(v instanceof number | string).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_11(v, v_id)
      expect(v).assertEqual(1.7)
      if (v instanceof Object) {
        check_value_as_type_T_11(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_11(v, v_id)
    expect(v).assertEqual(5n)
    if (v instanceof Object) {
      check_value_as_type_T_11(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_12 {
  function check_value_12(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | boolean).assertEqual(true)
      expect(v as boolean | string).assertEqual(true)
    }
    else if (v_id == 2) {
      expect(v as number | boolean).assertEqual(7.8)
    }
    else {
      expect(v as boolean | string).assertEqual("abc")
    }
  }
  function check_value_as_type_T_12(v: Object, v_id: int): void {
    expect(v instanceof number | boolean || v instanceof boolean | string).assertTrue()
    check_value_12(v, v_id)
  }
  function check_is_in_T_type_12(v: number | boolean | string, v_id: int): boolean {
    check_value_12(v, v_id)
    if (v instanceof number | boolean) {
      check_value_12(v, v_id)
      if (v instanceof boolean | string) {
        expect(v_id).assertEqual(1)
        check_value_12(v, v_id)
        expect(v).assertEqual(true)
        expect(v instanceof number | boolean).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_12(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_12(v, v_id)
        expect(v).assertEqual(7.8)
        if (v instanceof Object) {
          check_value_as_type_T_12(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_12(v, v_id)
      expect(v).assertEqual("abc")
      if (v instanceof Object) {
        check_value_as_type_T_12(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_12(): boolean {
    let res1: boolean = check_is_in_T_type_12(true, 1)
    let res2: boolean = check_is_in_T_type_12(7.8, 2)
    let res3: boolean = check_is_in_T_type_12("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_12 {
  function check_value_12(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | boolean).assertEqual(false)
      expect(v as boolean | string).assertEqual(false)
    }
    else if (v_id == 2) {
      expect(v as number | boolean).assertEqual(7.8)
    }
    else {
      expect(v as boolean | string).assertEqual("abc")
    }
  }
  function check_value_as_type_T_12(v: Object, v_id: int): void {
    expect(v instanceof number | boolean || v instanceof boolean | string).assertTrue()
    check_value_12(v, v_id)
  }
  function check_is_in_T_type_12(v: number | boolean | string, v_id: int): boolean {
    check_value_12(v, v_id)
    if (v instanceof number | boolean) {
      check_value_12(v, v_id)
      if (v instanceof boolean | string) {
        expect(v_id).assertEqual(1)
        check_value_12(v, v_id)
        expect(v).assertEqual(false)
        expect(v instanceof number | boolean).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_12(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_12(v, v_id)
        expect(v).assertEqual(7.8)
        if (v instanceof Object) {
          check_value_as_type_T_12(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_12(v, v_id)
      expect(v).assertEqual("abc")
      if (v instanceof Object) {
        check_value_as_type_T_12(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_12(): boolean {
    let res1: boolean = check_is_in_T_type_12(false, 1)
    let res2: boolean = check_is_in_T_type_12(7.8, 2)
    let res3: boolean = check_is_in_T_type_12("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_12(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as number | boolean).assertEqual(true)
    expect(v as boolean | string).assertEqual(true)
  }
  else if (v_id == 2) {
    expect(v as number | boolean).assertEqual(7.8)
  }
  else {
    expect(v as boolean | string).assertEqual("abc")
  }
}
function check_value_as_type_T_12(v: Object, v_id: int): void {
  expect(v instanceof number | boolean || v instanceof boolean | string).assertTrue()
  check_value_12(v, v_id)
}
function check_is_in_T_type_12(v: number | boolean | string, v_id: int): boolean {
  check_value_12(v, v_id)
  if (v instanceof number | boolean) {
    check_value_12(v, v_id)
    if (v instanceof boolean | string) {
      expect(v_id).assertEqual(1)
      check_value_12(v, v_id)
      expect(v).assertEqual(true)
      expect(v instanceof number | boolean).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_12(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_12(v, v_id)
      expect(v).assertEqual(7.8)
      if (v instanceof Object) {
        check_value_as_type_T_12(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_12(v, v_id)
    expect(v).assertEqual("abc")
    if (v instanceof Object) {
      check_value_as_type_T_12(v, v_id)
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeObjOnPredefinedTest(): void {
  describe('InterTypeIsSubOfTypeObjOnPredefinedTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0700
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0007
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0007';
      

      let res1: boolean = check_is_in_T_type_7(1.7, 1)
      let res2: boolean = check_is_in_T_type_7(5n, 2)
      let res3: boolean = check_is_in_T_type_7("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_7.runTest_7()).assertTrue()
      expect(testNS2_7.runTest_7()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0800
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0008
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0008';
      

      let res1: boolean = check_is_in_T_type_8(1.7, 1)
      let res2: boolean = check_is_in_T_type_8(5n, 2)
      let res3: boolean = check_is_in_T_type_8("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_8.runTest_8()).assertTrue()
      expect(testNS2_8.runTest_8()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0900
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0009
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0009';
      

      let res1: boolean = check_is_in_T_type_9(5n, 1)
      let res2: boolean = check_is_in_T_type_9(1.7, 2)
      let res3: boolean = check_is_in_T_type_9("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_9.runTest_9()).assertTrue()
      expect(testNS2_9.runTest_9()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_1000
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0010
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0010';
      

      let res1: boolean = check_is_in_T_type_10("abc", 1)
      let res2: boolean = check_is_in_T_type_10(1.7, 2)
      let res3: boolean = check_is_in_T_type_10(5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_10.runTest_10()).assertTrue()
      expect(testNS2_10.runTest_10()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_1100
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0011
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0011';
      

      let res1: boolean = check_is_in_T_type_11('a', 1)
      let res2: boolean = check_is_in_T_type_11(1.7, 2)
      let res3: boolean = check_is_in_T_type_11(5n, 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_11.runTest_11()).assertTrue()
      expect(testNS2_11.runTest_11()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_1200
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0012
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0012';
      

      let res1: boolean = check_is_in_T_type_12(true, 1)
      let res2: boolean = check_is_in_T_type_12(7.8, 2)
      let res3: boolean = check_is_in_T_type_12("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_12.runTest_12()).assertTrue()
      expect(testNS2_12.runTest_12()).assertTrue()

    });
  })
}