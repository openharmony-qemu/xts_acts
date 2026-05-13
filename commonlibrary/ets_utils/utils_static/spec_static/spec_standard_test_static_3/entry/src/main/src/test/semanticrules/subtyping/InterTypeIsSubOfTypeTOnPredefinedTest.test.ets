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

namespace testNS1_1 {
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(5n);
    }
    else {
      expect(v as undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_1(v: undefined | null | int, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof undefined | null).assertEqual(true);
    check_value_1(v, v_id);
  }
  function check_is_in_T_type_1(v: Object | undefined | undefined | null, v_id: int): boolean {
    check_value_1(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_1(v, v_id);
      if (v instanceof undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_1(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof undefined | null | int).assertEqual(true);
        if (v instanceof undefined | null | int) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_1(v, v_id);
        expect(v).assertEqual(5n);
        if (v instanceof undefined | null | int) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_1(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof undefined | null | int) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(undefined, 1);
    let res2_1: boolean = check_is_in_T_type_1(5n, 2);
    let res3_1: boolean = check_is_in_T_type_1(null, 3);
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true);
    return true;
  }
}

namespace testNS2_1 {
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_1(v: Object | undefined | bigint, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof undefined | null).assertEqual(true);
    check_value_1(v, v_id);
  }
  function check_is_in_T_type_1(v: Object | undefined | undefined | null, v_id: int): boolean {
    check_value_1(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_1(v, v_id);
      if (v instanceof undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_1(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Object | undefined | bigint).assertEqual(true);
        if (v instanceof Object | undefined | bigint) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_1(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof Object | undefined | bigint) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_1(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Object | undefined | bigint) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(undefined, 1);
    let res2_1: boolean = check_is_in_T_type_1(123, 2);
    let res3_1: boolean = check_is_in_T_type_1(null, 3);
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true);
    return true;
  }
}

namespace testNS3_1 {
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_1(v: Object | undefined | null, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof undefined | null).assertEqual(true);
    check_value_1(v, v_id);
  }
  function check_is_in_T_type_1(v: Object | undefined | undefined | null, v_id: int): boolean {
    check_value_1(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_1(v, v_id);
      if (v instanceof undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_1(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Object | undefined | null).assertEqual(true);
        if (v instanceof Object | undefined | null) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_1(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof Object | undefined | null) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_1(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Object | undefined | null) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(undefined, 1);
    let res2_1: boolean = check_is_in_T_type_1(123, 2);
    let res3_1: boolean = check_is_in_T_type_1(null, 3);
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true);
    return true;
  }
}

namespace testNS4_1 {
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual("abc");
    }
    else {
      expect(v as undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_1(v: Any, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof undefined | null).assertEqual(true);
    check_value_1(v, v_id);
  }
  function check_is_in_T_type_1(v: Object | undefined | undefined | null, v_id: int): boolean {
    check_value_1(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_1(v, v_id);
      if (v instanceof undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_1(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_1(v, v_id);
        expect(v).assertEqual("abc");
        if (v instanceof Any) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_1(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Any) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(undefined, 1);
    let res2_1: boolean = check_is_in_T_type_1("abc", 2);
    let res3_1: boolean = check_is_in_T_type_1(null, 3);
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true);
    return true;
  }
}

namespace testNS5_1 {
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_1(v: Object | null | Any, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof undefined | null).assertEqual(true);
    check_value_1(v, v_id);
  }
  function check_is_in_T_type_1(v: Object | undefined | undefined | null, v_id: int): boolean {
    check_value_1(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_1(v, v_id);
      if (v instanceof undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_1(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Object | null | Any).assertEqual(true);
        if (v instanceof Object | null | Any) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_1(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof Object | null | Any) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_1(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Object | null | Any) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(undefined, 1);
    let res2_1: boolean = check_is_in_T_type_1(123, 2);
    let res3_1: boolean = check_is_in_T_type_1(null, 3);
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true);
    return true;
  }
}

function check_value_1(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as Object | undefined).assertEqual(undefined);
    expect(v as undefined | null).assertEqual(undefined);
  }
  else if (v_id == 2) {
    expect(v as Object | undefined).assertEqual(5n);
  }
  else {
    expect(v as undefined | null).assertEqual(null);
  }
}
function check_value_as_type_T_1(v: undefined | null | int, v_id: int): void {
  expect(v instanceof Object | undefined || v instanceof undefined | null).assertEqual(true);
  check_value_1(v, v_id);
}
function check_is_in_T_type_1(v: Object | undefined | undefined | null, v_id: int): boolean {
  check_value_1(v, v_id);
  if (v instanceof Object | undefined) {
    check_value_1(v, v_id);
    if (v instanceof undefined | null) {
      expect(v_id).assertEqual(1);
      check_value_1(v, v_id);
      expect(v).assertEqual(undefined);
      expect(v instanceof Object | undefined).assertEqual(true);
      expect(v instanceof undefined | null | int).assertEqual(true);
      if (v instanceof undefined | null | int) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_1(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof undefined | null | int) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_1(v, v_id);
    expect(v).assertEqual(null);
    if (v instanceof undefined | null | int) {
      check_value_as_type_T_1(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(5n);
      expect(v as bigint | undefined | null).assertEqual(5n);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual("abc");
    }
    else {
      expect(v as bigint | undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_2(v: bigint | undefined | null | int, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
    check_value_2(v, v_id);
  }
  function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
    check_value_2(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_2(v, v_id);
      if (v instanceof bigint | undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(v).assertEqual(5n);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof bigint | undefined | null | int).assertEqual(true);
        if (v instanceof bigint | undefined | null | int) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual("abc");
        if (v instanceof bigint | undefined | null | int) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof bigint | undefined | null | int) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(5n, 1);
    let res2_2: boolean = check_is_in_T_type_2("abc", 2);
    let res3_2: boolean = check_is_in_T_type_2(null, 3);
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true);
    return true;
  }
}

namespace testNS2_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as bigint | undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as bigint | undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_2(v: bigint | undefined | null | int, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
    check_value_2(v, v_id);
  }
  function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
    check_value_2(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_2(v, v_id);
      if (v instanceof bigint | undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof bigint | undefined | null | int).assertEqual(true);
        if (v instanceof bigint | undefined | null | int) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof bigint | undefined | null | int) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof bigint | undefined | null | int) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(undefined, 1);
    let res2_2: boolean = check_is_in_T_type_2(123, 2);
    let res3_2: boolean = check_is_in_T_type_2(null, 3);
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true);
    return true;
  }
}

namespace testNS3_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(5n);
      expect(v as bigint | undefined | null).assertEqual(5n);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as bigint | undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_2(v: Object | undefined | bigint, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
    check_value_2(v, v_id);
  }
  function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
    check_value_2(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_2(v, v_id);
      if (v instanceof bigint | undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(v).assertEqual(5n);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Object | undefined | bigint).assertEqual(true);
        if (v instanceof Object | undefined | bigint) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof Object | undefined | bigint) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Object | undefined | bigint) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(5n, 1);
    let res2_2: boolean = check_is_in_T_type_2(123, 2);
    let res3_2: boolean = check_is_in_T_type_2(null, 3);
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true);
    return true;
  }
}

namespace testNS4_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(5n);
      expect(v as bigint | undefined | null).assertEqual(5n);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as bigint | undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_2(v: Object | undefined | null, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
    check_value_2(v, v_id);
  }
  function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
    check_value_2(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_2(v, v_id);
      if (v instanceof bigint | undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(v).assertEqual(5n);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Object | undefined | null).assertEqual(true);
        if (v instanceof Object | undefined | null) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof Object | undefined | null) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Object | undefined | null) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(5n, 1);
    let res2_2: boolean = check_is_in_T_type_2(123, 2);
    let res3_2: boolean = check_is_in_T_type_2(null, 3);
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true);
    return true;
  }
}

namespace testNS5_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(undefined);
      expect(v as bigint | undefined | null).assertEqual(undefined);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual("abc");
    }
    else {
      expect(v as bigint | undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_2(v: Object | undefined | null, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
    check_value_2(v, v_id);
  }
  function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
    check_value_2(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_2(v, v_id);
      if (v instanceof bigint | undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(v).assertEqual(undefined);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Object | undefined | null).assertEqual(true);
        if (v instanceof Object | undefined | null) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual("abc");
        if (v instanceof Object | undefined | null) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Object | undefined | null) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(undefined, 1);
    let res2_2: boolean = check_is_in_T_type_2("abc", 2);
    let res3_2: boolean = check_is_in_T_type_2(null, 3);
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true);
    return true;
  }
}

namespace testNS6_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(5n);
      expect(v as bigint | undefined | null).assertEqual(5n);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual("abc");
    }
    else {
      expect(v as bigint | undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_2(v: Any, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
    check_value_2(v, v_id);
  }
  function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
    check_value_2(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_2(v, v_id);
      if (v instanceof bigint | undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(v).assertEqual(5n);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual("abc");
        if (v instanceof Any) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Any) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(5n, 1);
    let res2_2: boolean = check_is_in_T_type_2("abc", 2);
    let res3_2: boolean = check_is_in_T_type_2(null, 3);
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true);
    return true;
  }
}

namespace testNS7_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as Object | undefined).assertEqual(5n);
      expect(v as bigint | undefined | null).assertEqual(5n);
    }
    else if (v_id == 2) {
      expect(v as Object | undefined).assertEqual(123);
    }
    else {
      expect(v as bigint | undefined | null).assertEqual(null);
    }
  }
  function check_value_as_type_T_2(v: Object | null | Any, v_id: int): void {
    expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
    check_value_2(v, v_id);
  }
  function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
    check_value_2(v, v_id);
    if (v instanceof Object | undefined) {
      check_value_2(v, v_id);
      if (v instanceof bigint | undefined | null) {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(v).assertEqual(5n);
        expect(v instanceof Object | undefined).assertEqual(true);
        expect(v instanceof Object | null | Any).assertEqual(true);
        if (v instanceof Object | null | Any) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual(123);
        if (v instanceof Object | null | Any) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual(null);
      if (v instanceof Object | null | Any) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(5n, 1);
    let res2_2: boolean = check_is_in_T_type_2(123, 2);
    let res3_2: boolean = check_is_in_T_type_2(null, 3);
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true);
    return true;
  }
}

function check_value_2(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as Object | undefined).assertEqual(5n);
    expect(v as bigint | undefined | null).assertEqual(5n);
  }
  else if (v_id == 2) {
    expect(v as Object | undefined).assertEqual("abc");
  }
  else {
    expect(v as bigint | undefined | null).assertEqual(null);
  }
}
function check_value_as_type_T_2(v: bigint | undefined | null | int, v_id: int): void {
  expect(v instanceof Object | undefined || v instanceof bigint | undefined | null).assertEqual(true);
  check_value_2(v, v_id);
}
function check_is_in_T_type_2(v: Object | undefined | bigint | undefined | null, v_id: int): boolean {
  check_value_2(v, v_id);
  if (v instanceof Object | undefined) {
    check_value_2(v, v_id);
    if (v instanceof bigint | undefined | null) {
      expect(v_id).assertEqual(1);
      check_value_2(v, v_id);
      expect(v).assertEqual(5n);
      expect(v instanceof Object | undefined).assertEqual(true);
      expect(v instanceof bigint | undefined | null | int).assertEqual(true);
      if (v instanceof bigint | undefined | null | int) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_2(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof bigint | undefined | null | int) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_2(v, v_id);
    expect(v).assertEqual(null);
    if (v instanceof bigint | undefined | null | int) {
      check_value_as_type_T_2(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

export default function InterTypeIsSubOfTypeTOnPredefinedTest(): void {
  describe('InterTypeIsSubOfTypeTOnPredefinedTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0100
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0001';
      

      let res1_1: boolean = check_is_in_T_type_1(undefined, 1)
      let res2_1: boolean = check_is_in_T_type_1(5n, 2)
      let res3_1: boolean = check_is_in_T_type_1(null, 3)
      expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)

      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)
      expect(testNS3_1.runTest_1()).assertEqual(true)
      expect(testNS4_1.runTest_1()).assertEqual(true)
      expect(testNS5_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0200
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0002';
      

      let res1_2: boolean = check_is_in_T_type_2(5n, 1)
      let res2_2: boolean = check_is_in_T_type_2("abc", 2)
      let res3_2: boolean = check_is_in_T_type_2(null, 3)
      expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)

      expect(testNS1_2.runTest_2()).assertEqual(true)
      expect(testNS2_2.runTest_2()).assertEqual(true)
      expect(testNS3_2.runTest_2()).assertEqual(true)
      expect(testNS4_2.runTest_2()).assertEqual(true)
      expect(testNS5_2.runTest_2()).assertEqual(true)
      expect(testNS6_2.runTest_2()).assertEqual(true)
      expect(testNS7_2.runTest_2()).assertEqual(true)

    });
  })
}