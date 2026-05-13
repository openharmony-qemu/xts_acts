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

namespace testNS1_11 {
  function check_value_11(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | bigint).assertEqual(5n);
      expect(v as bigint | string).assertEqual(5n);
    }
    else if (v_id == 2) {
      expect(v as float | bigint).assertEqual(1.7f);
    }
    else {
      expect(v as bigint | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_11(v: float | bigint | boolean, v_id: int): void {
    expect(v instanceof float | bigint || v instanceof bigint | string).assertEqual(true);
    check_value_11(v, v_id);
  }
  function check_is_in_T_type_11(v: float | bigint | bigint | string, v_id: int): boolean {
    check_value_11(v, v_id);
    if (v instanceof float | bigint) {
      check_value_11(v, v_id);
      if (v instanceof bigint | string) {
        expect(v_id).assertEqual(1);
        check_value_11(v, v_id);
        expect(v).assertEqual(5n);
        expect(v instanceof float | bigint).assertEqual(true);
        expect(v instanceof float | bigint | boolean).assertEqual(true);
        if (v instanceof float | bigint | boolean) {
          check_value_as_type_T_11(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_11(v, v_id);
        expect(v).assertEqual(1.7f);
        if (v instanceof float | bigint | boolean) {
          check_value_as_type_T_11(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_11(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof float | bigint | boolean) {
        check_value_as_type_T_11(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_11(): boolean {
    let res1_11: boolean = check_is_in_T_type_11(5n, 1);
    let res2_11: boolean = check_is_in_T_type_11(1.7f, 2);
    let res3_11: boolean = check_is_in_T_type_11("abc", 3);
    expect(res1_11 && (res2_11 || res3_11)).assertEqual(true);
    return true;
  }
}

namespace testNS2_11 {
  function check_value_11(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | bigint).assertEqual(723n);
      expect(v as bigint | string).assertEqual(723n);
    }
    else if (v_id == 2) {
      expect(v as float | bigint).assertEqual(12.8f);
    }
    else {
      expect(v as bigint | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_11(v: bigint | string | char, v_id: int): void {
    expect(v instanceof float | bigint || v instanceof bigint | string).assertEqual(true);
    check_value_11(v, v_id);
  }
  function check_is_in_T_type_11(v: float | bigint | bigint | string, v_id: int): boolean {
    check_value_11(v, v_id);
    if (v instanceof float | bigint) {
      check_value_11(v, v_id);
      if (v instanceof bigint | string) {
        expect(v_id).assertEqual(1);
        check_value_11(v, v_id);
        expect(v).assertEqual(723n);
        expect(v instanceof float | bigint).assertEqual(true);
        expect(v instanceof bigint | string | char).assertEqual(true);
        if (v instanceof bigint | string | char) {
          check_value_as_type_T_11(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_11(v, v_id);
        expect(v).assertEqual(12.8f);
        if (v instanceof bigint | string | char) {
          check_value_as_type_T_11(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_11(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof bigint | string | char) {
        check_value_as_type_T_11(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_11(): boolean {
    let res1_11: boolean = check_is_in_T_type_11(723n, 1);
    let res2_11: boolean = check_is_in_T_type_11(12.8f, 2);
    let res3_11: boolean = check_is_in_T_type_11("efg", 3);
    expect(res1_11 && (res2_11 || res3_11)).assertEqual(true);
    return true;
  }
}

namespace testNS3_11 {
  function check_value_11(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | bigint).assertEqual(723n);
      expect(v as bigint | string).assertEqual(723n);
    }
    else if (v_id == 2) {
      expect(v as float | bigint).assertEqual(12.8f);
    }
    else {
      expect(v as bigint | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_11(v: Any, v_id: int): void {
    expect(v instanceof float | bigint || v instanceof bigint | string).assertEqual(true);
    check_value_11(v, v_id);
  }
  function check_is_in_T_type_11(v: float | bigint | bigint | string, v_id: int): boolean {
    check_value_11(v, v_id);
    if (v instanceof float | bigint) {
      check_value_11(v, v_id);
      if (v instanceof bigint | string) {
        expect(v_id).assertEqual(1);
        check_value_11(v, v_id);
        expect(v).assertEqual(723n);
        expect(v instanceof float | bigint).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_11(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_11(v, v_id);
        expect(v).assertEqual(12.8f);
        if (v instanceof Any) {
          check_value_as_type_T_11(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_11(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof Any) {
        check_value_as_type_T_11(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_11(): boolean {
    let res1_11: boolean = check_is_in_T_type_11(723n, 1);
    let res2_11: boolean = check_is_in_T_type_11(12.8f, 2);
    let res3_11: boolean = check_is_in_T_type_11("efg", 3);
    expect(res1_11 && (res2_11 || res3_11)).assertEqual(true);
    return true;
  }
}

function check_value_11(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as float | bigint).assertEqual(5n);
    expect(v as bigint | string).assertEqual(5n);
  }
  else if (v_id == 2) {
    expect(v as float | bigint).assertEqual(1.7f);
  }
  else {
    expect(v as bigint | string).assertEqual("abc");
  }
}
function check_value_as_type_T_11(v: float | bigint | boolean, v_id: int): void {
  expect(v instanceof float | bigint || v instanceof bigint | string).assertEqual(true);
  check_value_11(v, v_id);
}
function check_is_in_T_type_11(v: float | bigint | bigint | string, v_id: int): boolean {
  check_value_11(v, v_id);
  if (v instanceof float | bigint) {
    check_value_11(v, v_id);
    if (v instanceof bigint | string) {
      expect(v_id).assertEqual(1);
      check_value_11(v, v_id);
      expect(v).assertEqual(5n);
      expect(v instanceof float | bigint).assertEqual(true);
      expect(v instanceof float | bigint | boolean).assertEqual(true);
      if (v instanceof float | bigint | boolean) {
        check_value_as_type_T_11(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_11(v, v_id);
      expect(v).assertEqual(1.7f);
      if (v instanceof float | bigint | boolean) {
        check_value_as_type_T_11(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_11(v, v_id);
    expect(v).assertEqual("abc");
    if (v instanceof float | bigint | boolean) {
      check_value_as_type_T_11(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_12 {
  function check_value_12(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | string).assertEqual("abc");
      expect(v as string | bigint).assertEqual("abc");
    }
    else if (v_id == 2) {
      expect(v as float | string).assertEqual(1.7f);
    }
    else {
      expect(v as string | bigint).assertEqual(5n);
    }
  }
  function check_value_as_type_T_12(v: float | string | boolean, v_id: int): void {
    expect(v instanceof float | string || v instanceof string | bigint).assertEqual(true);
    check_value_12(v, v_id);
  }
  function check_is_in_T_type_12(v: float | string | string | bigint, v_id: int): boolean {
    check_value_12(v, v_id);
    if (v instanceof float | string) {
      check_value_12(v, v_id);
      if (v instanceof string | bigint) {
        expect(v_id).assertEqual(1);
        check_value_12(v, v_id);
        expect(v).assertEqual("abc");
        expect(v instanceof float | string).assertEqual(true);
        expect(v instanceof float | string | boolean).assertEqual(true);
        if (v instanceof float | string | boolean) {
          check_value_as_type_T_12(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_12(v, v_id);
        expect(v).assertEqual(1.7f);
        if (v instanceof float | string | boolean) {
          check_value_as_type_T_12(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_12(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof float | string | boolean) {
        check_value_as_type_T_12(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_12(): boolean {
    let res1_12: boolean = check_is_in_T_type_12("abc", 1);
    let res2_12: boolean = check_is_in_T_type_12(1.7f, 2);
    let res3_12: boolean = check_is_in_T_type_12(5n, 3);
    expect(res1_12 && (res2_12 || res3_12)).assertEqual(true);
    return true;
  }
}

namespace testNS2_12 {
  function check_value_12(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | string).assertEqual("efg");
      expect(v as string | bigint).assertEqual("efg");
    }
    else if (v_id == 2) {
      expect(v as float | string).assertEqual(12.8f);
    }
    else {
      expect(v as string | bigint).assertEqual(7n);
    }
  }
  function check_value_as_type_T_12(v: string | bigint | char, v_id: int): void {
    expect(v instanceof float | string || v instanceof string | bigint).assertEqual(true);
    check_value_12(v, v_id);
  }
  function check_is_in_T_type_12(v: float | string | string | bigint, v_id: int): boolean {
    check_value_12(v, v_id);
    if (v instanceof float | string) {
      check_value_12(v, v_id);
      if (v instanceof string | bigint) {
        expect(v_id).assertEqual(1);
        check_value_12(v, v_id);
        expect(v).assertEqual("efg");
        expect(v instanceof float | string).assertEqual(true);
        expect(v instanceof string | bigint | char).assertEqual(true);
        if (v instanceof string | bigint | char) {
          check_value_as_type_T_12(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_12(v, v_id);
        expect(v).assertEqual(12.8f);
        if (v instanceof string | bigint | char) {
          check_value_as_type_T_12(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_12(v, v_id);
      expect(v).assertEqual(7n);
      if (v instanceof string | bigint | char) {
        check_value_as_type_T_12(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_12(): boolean {
    let res1_12: boolean = check_is_in_T_type_12("efg", 1);
    let res2_12: boolean = check_is_in_T_type_12(12.8f, 2);
    let res3_12: boolean = check_is_in_T_type_12(7n, 3);
    expect(res1_12 && (res2_12 || res3_12)).assertEqual(true);
    return true;
  }
}

namespace testNS3_12 {
  function check_value_12(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | string).assertEqual("efg");
      expect(v as string | bigint).assertEqual("efg");
    }
    else if (v_id == 2) {
      expect(v as float | string).assertEqual(12.8f);
    }
    else {
      expect(v as string | bigint).assertEqual(7n);
    }
  }
  function check_value_as_type_T_12(v: Any, v_id: int): void {
    expect(v instanceof float | string || v instanceof string | bigint).assertEqual(true);
    check_value_12(v, v_id);
  }
  function check_is_in_T_type_12(v: float | string | string | bigint, v_id: int): boolean {
    check_value_12(v, v_id);
    if (v instanceof float | string) {
      check_value_12(v, v_id);
      if (v instanceof string | bigint) {
        expect(v_id).assertEqual(1);
        check_value_12(v, v_id);
        expect(v).assertEqual("efg");
        expect(v instanceof float | string).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_12(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_12(v, v_id);
        expect(v).assertEqual(12.8f);
        if (v instanceof Any) {
          check_value_as_type_T_12(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_12(v, v_id);
      expect(v).assertEqual(7n);
      if (v instanceof Any) {
        check_value_as_type_T_12(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_12(): boolean {
    let res1_12: boolean = check_is_in_T_type_12("efg", 1);
    let res2_12: boolean = check_is_in_T_type_12(12.8f, 2);
    let res3_12: boolean = check_is_in_T_type_12(7n, 3);
    expect(res1_12 && (res2_12 || res3_12)).assertEqual(true);
    return true;
  }
}

function check_value_12(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as float | string).assertEqual("abc");
    expect(v as string | bigint).assertEqual("abc");
  }
  else if (v_id == 2) {
    expect(v as float | string).assertEqual(1.7f);
  }
  else {
    expect(v as string | bigint).assertEqual(5n);
  }
}
function check_value_as_type_T_12(v: float | string | boolean, v_id: int): void {
  expect(v instanceof float | string || v instanceof string | bigint).assertEqual(true);
  check_value_12(v, v_id);
}
function check_is_in_T_type_12(v: float | string | string | bigint, v_id: int): boolean {
  check_value_12(v, v_id);
  if (v instanceof float | string) {
    check_value_12(v, v_id);
    if (v instanceof string | bigint) {
      expect(v_id).assertEqual(1);
      check_value_12(v, v_id);
      expect(v).assertEqual("abc");
      expect(v instanceof float | string).assertEqual(true);
      expect(v instanceof float | string | boolean).assertEqual(true);
      if (v instanceof float | string | boolean) {
        check_value_as_type_T_12(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_12(v, v_id);
      expect(v).assertEqual(1.7f);
      if (v instanceof float | string | boolean) {
        check_value_as_type_T_12(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_12(v, v_id);
    expect(v).assertEqual(5n);
    if (v instanceof float | string | boolean) {
      check_value_as_type_T_12(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_13 {
  function check_value_13(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | char).assertEqual(c'a');
      expect(v as char | bigint).assertEqual(c'a');
    }
    else if (v_id == 2) {
      expect(v as float | char).assertEqual(1.7f);
    }
    else {
      expect(v as char | bigint).assertEqual(5n);
    }
  }
  function check_value_as_type_T_13(v: float | char | boolean, v_id: int): void {
    expect(v instanceof float | char || v instanceof char | bigint).assertEqual(true);
    check_value_13(v, v_id);
  }
  function check_is_in_T_type_13(v: float | char | char | bigint, v_id: int): boolean {
    check_value_13(v, v_id);
    if (v instanceof float | char) {
      check_value_13(v, v_id);
      if (v instanceof char | bigint) {
        expect(v_id).assertEqual(1);
        check_value_13(v, v_id);
        expect(v).assertEqual(c'a');
        expect(v instanceof float | char).assertEqual(true);
        expect(v instanceof float | char | boolean).assertEqual(true);
        if (v instanceof float | char | boolean) {
          check_value_as_type_T_13(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_13(v, v_id);
        expect(v).assertEqual(1.7f);
        if (v instanceof float | char | boolean) {
          check_value_as_type_T_13(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_13(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof float | char | boolean) {
        check_value_as_type_T_13(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_13(): boolean {
    let res1_13: boolean = check_is_in_T_type_13(c'a', 1);
    let res2_13: boolean = check_is_in_T_type_13(1.7f, 2);
    let res3_13: boolean = check_is_in_T_type_13(5n, 3);
    expect(res1_13 && (res2_13 || res3_13)).assertEqual(true);
    return true;
  }
}

namespace testNS2_13 {
  function check_value_13(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | char).assertEqual(c'b');
      expect(v as char | bigint).assertEqual(c'b');
    }
    else if (v_id == 2) {
      expect(v as float | char).assertEqual(12.8f);
    }
    else {
      expect(v as char | bigint).assertEqual(7n);
    }
  }
  function check_value_as_type_T_13(v: char | bigint | number, v_id: int): void {
    expect(v instanceof float | char || v instanceof char | bigint).assertEqual(true);
    check_value_13(v, v_id);
  }
  function check_is_in_T_type_13(v: float | char | char | bigint, v_id: int): boolean {
    check_value_13(v, v_id);
    if (v instanceof float | char) {
      check_value_13(v, v_id);
      if (v instanceof char | bigint) {
        expect(v_id).assertEqual(1);
        check_value_13(v, v_id);
        expect(v).assertEqual(c'b');
        expect(v instanceof float | char).assertEqual(true);
        expect(v instanceof char | bigint | number).assertEqual(true);
        if (v instanceof char | bigint | number) {
          check_value_as_type_T_13(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_13(v, v_id);
        expect(v).assertEqual(12.8f);
        if (v instanceof char | bigint | number) {
          check_value_as_type_T_13(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_13(v, v_id);
      expect(v).assertEqual(7n);
      if (v instanceof char | bigint | number) {
        check_value_as_type_T_13(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_13(): boolean {
    let res1_13: boolean = check_is_in_T_type_13(c'b', 1);
    let res2_13: boolean = check_is_in_T_type_13(12.8f, 2);
    let res3_13: boolean = check_is_in_T_type_13(7n, 3);
    expect(res1_13 && (res2_13 || res3_13)).assertEqual(true);
    return true;
  }
}

namespace testNS3_13 {
  function check_value_13(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as float | char).assertEqual(c'b');
      expect(v as char | bigint).assertEqual(c'b');
    }
    else if (v_id == 2) {
      expect(v as float | char).assertEqual(12.8f);
    }
    else {
      expect(v as char | bigint).assertEqual(7n);
    }
  }
  function check_value_as_type_T_13(v: Any, v_id: int): void {
    expect(v instanceof float | char || v instanceof char | bigint).assertEqual(true);
    check_value_13(v, v_id);
  }
  function check_is_in_T_type_13(v: float | char | char | bigint, v_id: int): boolean {
    check_value_13(v, v_id);
    if (v instanceof float | char) {
      check_value_13(v, v_id);
      if (v instanceof char | bigint) {
        expect(v_id).assertEqual(1);
        check_value_13(v, v_id);
        expect(v).assertEqual(c'b');
        expect(v instanceof float | char).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_13(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_13(v, v_id);
        expect(v).assertEqual(12.8f);
        if (v instanceof Any) {
          check_value_as_type_T_13(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_13(v, v_id);
      expect(v).assertEqual(7n);
      if (v instanceof Any) {
        check_value_as_type_T_13(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_13(): boolean {
    let res1_13: boolean = check_is_in_T_type_13(c'b', 1);
    let res2_13: boolean = check_is_in_T_type_13(12.8f, 2);
    let res3_13: boolean = check_is_in_T_type_13(7n, 3);
    expect(res1_13 && (res2_13 || res3_13)).assertEqual(true);
    return true;
  }
}

function check_value_13(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as float | char).assertEqual(c'a');
    expect(v as char | bigint).assertEqual(c'a');
  }
  else if (v_id == 2) {
    expect(v as float | char).assertEqual(1.7f);
  }
  else {
    expect(v as char | bigint).assertEqual(5n);
  }
}
function check_value_as_type_T_13(v: float | char | boolean, v_id: int): void {
  expect(v instanceof float | char || v instanceof char | bigint).assertEqual(true);
  check_value_13(v, v_id);
}
function check_is_in_T_type_13(v: float | char | char | bigint, v_id: int): boolean {
  check_value_13(v, v_id);
  if (v instanceof float | char) {
    check_value_13(v, v_id);
    if (v instanceof char | bigint) {
      expect(v_id).assertEqual(1);
      check_value_13(v, v_id);
      expect(v).assertEqual(c'a');
      expect(v instanceof float | char).assertEqual(true);
      expect(v instanceof float | char | boolean).assertEqual(true);
      if (v instanceof float | char | boolean) {
        check_value_as_type_T_13(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_13(v, v_id);
      expect(v).assertEqual(1.7f);
      if (v instanceof float | char | boolean) {
        check_value_as_type_T_13(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_13(v, v_id);
    expect(v).assertEqual(5n);
    if (v instanceof float | char | boolean) {
      check_value_as_type_T_13(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_14 {
  function check_value_14(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | boolean).assertEqual(true);
      expect(v as boolean | string).assertEqual(true);
    }
    else if (v_id == 2) {
      expect(v as number | boolean).assertEqual(7.8);
    }
    else {
      expect(v as boolean | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_14(v: number | boolean | bigint, v_id: int): void {
    expect(v instanceof number | boolean || v instanceof boolean | string).assertEqual(true);
    check_value_14(v, v_id);
  }
  function check_is_in_T_type_14(v: number | boolean | boolean | string, v_id: int): boolean {
    check_value_14(v, v_id);
    if (v instanceof number | boolean) {
      check_value_14(v, v_id);
      if (v instanceof boolean | string) {
        expect(v_id).assertEqual(1);
        check_value_14(v, v_id);
        expect(v).assertEqual(true);
        expect(v instanceof number | boolean).assertEqual(true);
        expect(v instanceof number | boolean | bigint).assertEqual(true);
        if (v instanceof number | boolean | bigint) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_14(v, v_id);
        expect(v).assertEqual(7.8);
        if (v instanceof number | boolean | bigint) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_14(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof number | boolean | bigint) {
        check_value_as_type_T_14(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_14(): boolean {
    let res1_14: boolean = check_is_in_T_type_14(true, 1);
    let res2_14: boolean = check_is_in_T_type_14(7.8, 2);
    let res3_14: boolean = check_is_in_T_type_14("abc", 3);
    expect(res1_14 && (res2_14 || res3_14)).assertEqual(true);
    return true;
  }
}

namespace testNS2_14 {
  function check_value_14(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | boolean).assertEqual(false);
      expect(v as boolean | string).assertEqual(false);
    }
    else if (v_id == 2) {
      expect(v as number | boolean).assertEqual(7.8);
    }
    else {
      expect(v as boolean | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_14(v: boolean | string | int, v_id: int): void {
    expect(v instanceof number | boolean || v instanceof boolean | string).assertEqual(true);
    check_value_14(v, v_id);
  }
  function check_is_in_T_type_14(v: number | boolean | boolean | string, v_id: int): boolean {
    check_value_14(v, v_id);
    if (v instanceof number | boolean) {
      check_value_14(v, v_id);
      if (v instanceof boolean | string) {
        expect(v_id).assertEqual(1);
        check_value_14(v, v_id);
        expect(v).assertEqual(false);
        expect(v instanceof number | boolean).assertEqual(true);
        expect(v instanceof boolean | string | int).assertEqual(true);
        if (v instanceof boolean | string | int) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_14(v, v_id);
        expect(v).assertEqual(7.8);
        if (v instanceof boolean | string | int) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_14(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof boolean | string | int) {
        check_value_as_type_T_14(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_14(): boolean {
    let res1_14: boolean = check_is_in_T_type_14(false, 1);
    let res2_14: boolean = check_is_in_T_type_14(7.8, 2);
    let res3_14: boolean = check_is_in_T_type_14("abc", 3);
    expect(res1_14 && (res2_14 || res3_14)).assertEqual(true);
    return true;
  }
}

namespace testNS3_14 {
  function check_value_14(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | boolean).assertEqual(true);
      expect(v as boolean | string).assertEqual(true);
    }
    else if (v_id == 2) {
      expect(v as number | boolean).assertEqual(7.8);
    }
    else {
      expect(v as boolean | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_14(v: number | boolean | undefined, v_id: int): void {
    expect(v instanceof number | boolean || v instanceof boolean | string).assertEqual(true);
    check_value_14(v, v_id);
  }
  function check_is_in_T_type_14(v: number | boolean | boolean | string, v_id: int): boolean {
    check_value_14(v, v_id);
    if (v instanceof number | boolean) {
      check_value_14(v, v_id);
      if (v instanceof boolean | string) {
        expect(v_id).assertEqual(1);
        check_value_14(v, v_id);
        expect(v).assertEqual(true);
        expect(v instanceof number | boolean).assertEqual(true);
        expect(v instanceof number | boolean | undefined).assertEqual(true);
        if (v instanceof number | boolean | undefined) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_14(v, v_id);
        expect(v).assertEqual(7.8);
        if (v instanceof number | boolean | undefined) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_14(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof number | boolean | undefined) {
        check_value_as_type_T_14(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_14(): boolean {
    let res1_14: boolean = check_is_in_T_type_14(true, 1);
    let res2_14: boolean = check_is_in_T_type_14(7.8, 2);
    let res3_14: boolean = check_is_in_T_type_14("abc", 3);
    expect(res1_14 && (res2_14 || res3_14)).assertEqual(true);
    return true;
  }
}

namespace testNS4_14 {
  function check_value_14(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | boolean).assertEqual(true);
      expect(v as boolean | string).assertEqual(true);
    }
    else if (v_id == 2) {
      expect(v as number | boolean).assertEqual(7.8);
    }
    else {
      expect(v as boolean | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_14(v: boolean | string | null, v_id: int): void {
    expect(v instanceof number | boolean || v instanceof boolean | string).assertEqual(true);
    check_value_14(v, v_id);
  }
  function check_is_in_T_type_14(v: number | boolean | boolean | string, v_id: int): boolean {
    check_value_14(v, v_id);
    if (v instanceof number | boolean) {
      check_value_14(v, v_id);
      if (v instanceof boolean | string) {
        expect(v_id).assertEqual(1);
        check_value_14(v, v_id);
        expect(v).assertEqual(true);
        expect(v instanceof number | boolean).assertEqual(true);
        expect(v instanceof boolean | string | null).assertEqual(true);
        if (v instanceof boolean | string | null) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_14(v, v_id);
        expect(v).assertEqual(7.8);
        if (v instanceof boolean | string | null) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_14(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof boolean | string | null) {
        check_value_as_type_T_14(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_14(): boolean {
    let res1_14: boolean = check_is_in_T_type_14(true, 1);
    let res2_14: boolean = check_is_in_T_type_14(7.8, 2);
    let res3_14: boolean = check_is_in_T_type_14("abc", 3);
    expect(res1_14 && (res2_14 || res3_14)).assertEqual(true);
    return true;
  }
}

namespace testNS5_14 {
  function check_value_14(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as number | boolean).assertEqual(true);
      expect(v as boolean | string).assertEqual(true);
    }
    else if (v_id == 2) {
      expect(v as number | boolean).assertEqual(7.8);
    }
    else {
      expect(v as boolean | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_14(v: Any, v_id: int): void {
    expect(v instanceof number | boolean || v instanceof boolean | string).assertEqual(true);
    check_value_14(v, v_id);
  }
  function check_is_in_T_type_14(v: number | boolean | boolean | string, v_id: int): boolean {
    check_value_14(v, v_id);
    if (v instanceof number | boolean) {
      check_value_14(v, v_id);
      if (v instanceof boolean | string) {
        expect(v_id).assertEqual(1);
        check_value_14(v, v_id);
        expect(v).assertEqual(true);
        expect(v instanceof number | boolean).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_14(v, v_id);
        expect(v).assertEqual(7.8);
        if (v instanceof Any) {
          check_value_as_type_T_14(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_14(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof Any) {
        check_value_as_type_T_14(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_14(): boolean {
    let res1_14: boolean = check_is_in_T_type_14(true, 1);
    let res2_14: boolean = check_is_in_T_type_14(7.8, 2);
    let res3_14: boolean = check_is_in_T_type_14("abc", 3);
    expect(res1_14 && (res2_14 || res3_14)).assertEqual(true);
    return true;
  }
}

function check_value_14(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as number | boolean).assertEqual(true);
    expect(v as boolean | string).assertEqual(true);
  }
  else if (v_id == 2) {
    expect(v as number | boolean).assertEqual(7.8);
  }
  else {
    expect(v as boolean | string).assertEqual("abc");
  }
}
function check_value_as_type_T_14(v: number | boolean | bigint, v_id: int): void {
  expect(v instanceof number | boolean || v instanceof boolean | string).assertEqual(true);
  check_value_14(v, v_id);
}
function check_is_in_T_type_14(v: number | boolean | boolean | string, v_id: int): boolean {
  check_value_14(v, v_id);
  if (v instanceof number | boolean) {
    check_value_14(v, v_id);
    if (v instanceof boolean | string) {
      expect(v_id).assertEqual(1);
      check_value_14(v, v_id);
      expect(v).assertEqual(true);
      expect(v instanceof number | boolean).assertEqual(true);
      expect(v instanceof number | boolean | bigint).assertEqual(true);
      if (v instanceof number | boolean | bigint) {
        check_value_as_type_T_14(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_14(v, v_id);
      expect(v).assertEqual(7.8);
      if (v instanceof number | boolean | bigint) {
        check_value_as_type_T_14(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_14(v, v_id);
    expect(v).assertEqual("abc");
    if (v instanceof number | boolean | bigint) {
      check_value_as_type_T_14(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

export default function InterTypeIsSubOfTypeTOnPredefinedTest03(): void {
  describe('InterTypeIsSubOfTypeTOnPredefinedTest03', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1100
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0011
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0011';
      

      let res1_11: boolean = check_is_in_T_type_11(5n, 1)
      let res2_11: boolean = check_is_in_T_type_11(1.7f, 2)
      let res3_11: boolean = check_is_in_T_type_11("abc", 3)
      expect(res1_11 && (res2_11 || res3_11)).assertEqual(true)

      expect(testNS1_11.runTest_11()).assertEqual(true)
      expect(testNS2_11.runTest_11()).assertEqual(true)
      expect(testNS3_11.runTest_11()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1200
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0012
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined typest
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0012';
      

      let res1_12: boolean = check_is_in_T_type_12("abc", 1)
      let res2_12: boolean = check_is_in_T_type_12(1.7f, 2)
      let res3_12: boolean = check_is_in_T_type_12(5n, 3)
      expect(res1_12 && (res2_12 || res3_12)).assertEqual(true)

      expect(testNS1_12.runTest_12()).assertEqual(true)
      expect(testNS2_12.runTest_12()).assertEqual(true)
      expect(testNS3_12.runTest_12()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1300
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0013
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0013';
      

      let res1_13: boolean = check_is_in_T_type_13(c'a', 1)
      let res2_13: boolean = check_is_in_T_type_13(1.7f, 2)
      let res3_13: boolean = check_is_in_T_type_13(5n, 3)
      expect(res1_13 && (res2_13 || res3_13)).assertEqual(true)

      expect(testNS1_13.runTest_13()).assertEqual(true)
      expect(testNS2_13.runTest_13()).assertEqual(true)
      expect(testNS3_13.runTest_13()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1400
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0014
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0014';
      

      let res1_14: boolean = check_is_in_T_type_14(true, 1)
      let res2_14: boolean = check_is_in_T_type_14(7.8, 2)
      let res3_14: boolean = check_is_in_T_type_14("abc", 3)
      expect(res1_14 && (res2_14 || res3_14)).assertEqual(true)

      expect(testNS1_14.runTest_14()).assertEqual(true)
      expect(testNS2_14.runTest_14()).assertEqual(true)
      expect(testNS3_14.runTest_14()).assertEqual(true)
      expect(testNS4_14.runTest_14()).assertEqual(true)
      expect(testNS5_14.runTest_14()).assertEqual(true)

    });
  })
}