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

namespace testNS1_6 {
  function check_value_6(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | byte).assertEqual(5 as byte);
      expect(v as byte | string).assertEqual(5 as byte);
    }
    else if (v_id == 2) {
      expect(v as bigint | byte).assertEqual(5n);
    }
    else {
      expect(v as byte | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_6(v: bigint | byte | boolean, v_id: int): void {
    expect(v instanceof bigint | byte || v instanceof byte | string).assertEqual(true);
    check_value_6(v, v_id);
  }
  function check_is_in_T_type_6(v: bigint | byte | byte | string, v_id: int): boolean {
    check_value_6(v, v_id);
    if (v instanceof bigint | byte) {
      check_value_6(v, v_id);
      if (v instanceof byte | string) {
        expect(v_id).assertEqual(1);
        check_value_6(v, v_id);
        expect(v).assertEqual(5 as byte);
        expect(v instanceof bigint | byte).assertEqual(true);
        expect(v instanceof bigint | byte | boolean).assertEqual(true);
        if (v instanceof bigint | byte | boolean) {
          check_value_as_type_T_6(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_6(v, v_id);
        expect(v).assertEqual(5n);
        if (v instanceof bigint | byte | boolean) {
          check_value_as_type_T_6(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_6(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof bigint | byte | boolean) {
        check_value_as_type_T_6(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_6(): boolean {
    let res1_6: boolean = check_is_in_T_type_6(5 as byte, 1);
    let res2_6: boolean = check_is_in_T_type_6(5n, 2);
    let res3_6: boolean = check_is_in_T_type_6("abc", 3);
    expect(res1_6 && (res2_6 || res3_6)).assertEqual(true);
    return true;
  }
}

namespace testNS2_6 {
  function check_value_6(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | byte).assertEqual(7 as byte);
      expect(v as byte | string).assertEqual(7 as byte);
    }
    else if (v_id == 2) {
      expect(v as bigint | byte).assertEqual(723n);
    }
    else {
      expect(v as byte | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_6(v: byte | string | char, v_id: int): void {
    expect(v instanceof bigint | byte || v instanceof byte | string).assertEqual(true);
    check_value_6(v, v_id);
  }
  function check_is_in_T_type_6(v: bigint | byte | byte | string, v_id: int): boolean {
    check_value_6(v, v_id);
    if (v instanceof bigint | byte) {
      check_value_6(v, v_id);
      if (v instanceof byte | string) {
        expect(v_id).assertEqual(1);
        check_value_6(v, v_id);
        expect(v).assertEqual(7 as byte);
        expect(v instanceof bigint | byte).assertEqual(true);
        expect(v instanceof byte | string | char).assertEqual(true);
        if (v instanceof byte | string | char) {
          check_value_as_type_T_6(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_6(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof byte | string | char) {
          check_value_as_type_T_6(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_6(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof byte | string | char) {
        check_value_as_type_T_6(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_6(): boolean {
    let res1_6: boolean = check_is_in_T_type_6(7 as byte, 1);
    let res2_6: boolean = check_is_in_T_type_6(723n, 2);
    let res3_6: boolean = check_is_in_T_type_6("efg", 3);
    expect(res1_6 && (res2_6 || res3_6)).assertEqual(true);
    return true;
  }
}

namespace testNS3_6 {
  function check_value_6(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | byte).assertEqual(7 as byte);
      expect(v as byte | string).assertEqual(7 as byte);
    }
    else if (v_id == 2) {
      expect(v as bigint | byte).assertEqual(723n);
    }
    else {
      expect(v as byte | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_6(v: Any, v_id: int): void {
    expect(v instanceof bigint | byte || v instanceof byte | string).assertEqual(true);
    check_value_6(v, v_id);
  }
  function check_is_in_T_type_6(v: bigint | byte | byte | string, v_id: int): boolean {
    check_value_6(v, v_id);
    if (v instanceof bigint | byte) {
      check_value_6(v, v_id);
      if (v instanceof byte | string) {
        expect(v_id).assertEqual(1);
        check_value_6(v, v_id);
        expect(v).assertEqual(7 as byte);
        expect(v instanceof bigint | byte).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_6(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_6(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof Any) {
          check_value_as_type_T_6(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_6(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof Any) {
        check_value_as_type_T_6(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_6(): boolean {
    let res1_6: boolean = check_is_in_T_type_6(7 as byte, 1);
    let res2_6: boolean = check_is_in_T_type_6(723n, 2);
    let res3_6: boolean = check_is_in_T_type_6("efg", 3);
    expect(res1_6 && (res2_6 || res3_6)).assertEqual(true);
    return true;
  }
}

function check_value_6(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | byte).assertEqual(5 as byte);
    expect(v as byte | string).assertEqual(5 as byte);
  }
  else if (v_id == 2) {
    expect(v as bigint | byte).assertEqual(5n);
  }
  else {
    expect(v as byte | string).assertEqual("abc");
  }
}
function check_value_as_type_T_6(v: bigint | byte | boolean, v_id: int): void {
  expect(v instanceof bigint | byte || v instanceof byte | string).assertEqual(true);
  check_value_6(v, v_id);
}
function check_is_in_T_type_6(v: bigint | byte | byte | string, v_id: int): boolean {
  check_value_6(v, v_id);
  if (v instanceof bigint | byte) {
    check_value_6(v, v_id);
    if (v instanceof byte | string) {
      expect(v_id).assertEqual(1);
      check_value_6(v, v_id);
      expect(v).assertEqual(5 as byte);
      expect(v instanceof bigint | byte).assertEqual(true);
      expect(v instanceof bigint | byte | boolean).assertEqual(true);
      if (v instanceof bigint | byte | boolean) {
        check_value_as_type_T_6(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_6(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof bigint | byte | boolean) {
        check_value_as_type_T_6(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_6(v, v_id);
    expect(v).assertEqual("abc");
    if (v instanceof bigint | byte | boolean) {
      check_value_as_type_T_6(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_7 {
  function check_value_7(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | short).assertEqual(17 as short);
      expect(v as short | string).assertEqual(17 as short);
    }
    else if (v_id == 2) {
      expect(v as bigint | short).assertEqual(5n);
    }
    else {
      expect(v as short | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_7(v: bigint | short | boolean, v_id: int): void {
    expect(v instanceof bigint | short || v instanceof short | string).assertEqual(true);
    check_value_7(v, v_id);
  }
  function check_is_in_T_type_7(v: bigint | short | short | string, v_id: int): boolean {
    check_value_7(v, v_id);
    if (v instanceof bigint | short) {
      check_value_7(v, v_id);
      if (v instanceof short | string) {
        expect(v_id).assertEqual(1);
        check_value_7(v, v_id);
        expect(v).assertEqual(17 as short);
        expect(v instanceof bigint | short).assertEqual(true);
        expect(v instanceof bigint | short | boolean).assertEqual(true);
        if (v instanceof bigint | short | boolean) {
          check_value_as_type_T_7(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_7(v, v_id);
        expect(v).assertEqual(5n);
        if (v instanceof bigint | short | boolean) {
          check_value_as_type_T_7(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_7(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof bigint | short | boolean) {
        check_value_as_type_T_7(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_7(): boolean {
    let res1_7: boolean = check_is_in_T_type_7(17 as short, 1);
    let res2_7: boolean = check_is_in_T_type_7(5n, 2);
    let res3_7: boolean = check_is_in_T_type_7("abc", 3);
    expect(res1_7 && (res2_7 || res3_7)).assertEqual(true);
    return true;
  }
}

namespace testNS2_7 {
  function check_value_7(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | short).assertEqual(128 as short);
      expect(v as short | string).assertEqual(128 as short);
    }
    else if (v_id == 2) {
      expect(v as bigint | short).assertEqual(723n);
    }
    else {
      expect(v as short | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_7(v: short | string | char, v_id: int): void {
    expect(v instanceof bigint | short || v instanceof short | string).assertEqual(true);
    check_value_7(v, v_id);
  }
  function check_is_in_T_type_7(v: bigint | short | short | string, v_id: int): boolean {
    check_value_7(v, v_id);
    if (v instanceof bigint | short) {
      check_value_7(v, v_id);
      if (v instanceof short | string) {
        expect(v_id).assertEqual(1);
        check_value_7(v, v_id);
        expect(v).assertEqual(128 as short);
        expect(v instanceof bigint | short).assertEqual(true);
        expect(v instanceof short | string | char).assertEqual(true);
        if (v instanceof short | string | char) {
          check_value_as_type_T_7(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_7(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof short | string | char) {
          check_value_as_type_T_7(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_7(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof short | string | char) {
        check_value_as_type_T_7(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_7(): boolean {
    let res1_7: boolean = check_is_in_T_type_7(128 as short, 1);
    let res2_7: boolean = check_is_in_T_type_7(723n, 2);
    let res3_7: boolean = check_is_in_T_type_7("efg", 3);
    expect(res1_7 && (res2_7 || res3_7)).assertEqual(true);
    return true;
  }
}

namespace testNS3_7 {
  function check_value_7(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | short).assertEqual(128 as short);
      expect(v as short | string).assertEqual(128 as short);
    }
    else if (v_id == 2) {
      expect(v as bigint | short).assertEqual(723n);
    }
    else {
      expect(v as short | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_7(v: Any, v_id: int): void {
    expect(v instanceof bigint | short || v instanceof short | string).assertEqual(true);
    check_value_7(v, v_id);
  }
  function check_is_in_T_type_7(v: bigint | short | short | string, v_id: int): boolean {
    check_value_7(v, v_id);
    if (v instanceof bigint | short) {
      check_value_7(v, v_id);
      if (v instanceof short | string) {
        expect(v_id).assertEqual(1);
        check_value_7(v, v_id);
        expect(v).assertEqual(128 as short);
        expect(v instanceof bigint | short).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_7(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_7(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof Any) {
          check_value_as_type_T_7(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_7(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof Any) {
        check_value_as_type_T_7(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_7(): boolean {
    let res1_7: boolean = check_is_in_T_type_7(128 as short, 1);
    let res2_7: boolean = check_is_in_T_type_7(723n, 2);
    let res3_7: boolean = check_is_in_T_type_7("efg", 3);
    expect(res1_7 && (res2_7 || res3_7)).assertEqual(true);
    return true;
  }
}

function check_value_7(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | short).assertEqual(17 as short);
    expect(v as short | string).assertEqual(17 as short);
  }
  else if (v_id == 2) {
    expect(v as bigint | short).assertEqual(5n);
  }
  else {
    expect(v as short | string).assertEqual("abc");
  }
}
function check_value_as_type_T_7(v: bigint | short | boolean, v_id: int): void {
  expect(v instanceof bigint | short || v instanceof short | string).assertEqual(true);
  check_value_7(v, v_id);
}
function check_is_in_T_type_7(v: bigint | short | short | string, v_id: int): boolean {
  check_value_7(v, v_id);
  if (v instanceof bigint | short) {
    check_value_7(v, v_id);
    if (v instanceof short | string) {
      expect(v_id).assertEqual(1);
      check_value_7(v, v_id);
      expect(v).assertEqual(17 as short);
      expect(v instanceof bigint | short).assertEqual(true);
      expect(v instanceof bigint | short | boolean).assertEqual(true);
      if (v instanceof bigint | short | boolean) {
        check_value_as_type_T_7(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_7(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof bigint | short | boolean) {
        check_value_as_type_T_7(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_7(v, v_id);
    expect(v).assertEqual("abc");
    if (v instanceof bigint | short | boolean) {
      check_value_as_type_T_7(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_8 {
  function check_value_8(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | double).assertEqual(1.7);
      expect(v as double | string).assertEqual(1.7);
    }
    else if (v_id == 2) {
      expect(v as bigint | double).assertEqual(5n);
    }
    else {
      expect(v as double | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_8(v: bigint | double | boolean, v_id: int): void {
    expect(v instanceof bigint | double || v instanceof double | string).assertEqual(true);
    check_value_8(v, v_id);
  }
  function check_is_in_T_type_8(v: bigint | double | double | string, v_id: int): boolean {
    check_value_8(v, v_id);
    if (v instanceof bigint | double) {
      check_value_8(v, v_id);
      if (v instanceof double | string) {
        expect(v_id).assertEqual(1);
        check_value_8(v, v_id);
        expect(v).assertEqual(1.7);
        expect(v instanceof bigint | double).assertEqual(true);
        expect(v instanceof bigint | double | boolean).assertEqual(true);
        if (v instanceof bigint | double | boolean) {
          check_value_as_type_T_8(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_8(v, v_id);
        expect(v).assertEqual(5n);
        if (v instanceof bigint | double | boolean) {
          check_value_as_type_T_8(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_8(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof bigint | double | boolean) {
        check_value_as_type_T_8(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_8(): boolean {
    let res1_8: boolean = check_is_in_T_type_8(1.7, 1);
    let res2_8: boolean = check_is_in_T_type_8(5n, 2);
    let res3_8: boolean = check_is_in_T_type_8("abc", 3);
    expect(res1_8 && (res2_8 || res3_8)).assertEqual(true);
    return true;
  }
}

namespace testNS2_8 {
  function check_value_8(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | double).assertEqual(12.8);
      expect(v as double | string).assertEqual(12.8);
    }
    else if (v_id == 2) {
      expect(v as bigint | double).assertEqual(723n);
    }
    else {
      expect(v as double | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_8(v: double | string | char, v_id: int): void {
    expect(v instanceof bigint | double || v instanceof double | string).assertEqual(true);
    check_value_8(v, v_id);
  }
  function check_is_in_T_type_8(v: bigint | double | double | string, v_id: int): boolean {
    check_value_8(v, v_id);
    if (v instanceof bigint | double) {
      check_value_8(v, v_id);
      if (v instanceof double | string) {
        expect(v_id).assertEqual(1);
        check_value_8(v, v_id);
        expect(v).assertEqual(12.8);
        expect(v instanceof bigint | double).assertEqual(true);
        expect(v instanceof double | string | char).assertEqual(true);
        if (v instanceof double | string | char) {
          check_value_as_type_T_8(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_8(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof double | string | char) {
          check_value_as_type_T_8(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_8(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof double | string | char) {
        check_value_as_type_T_8(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_8(): boolean {
    let res1_8: boolean = check_is_in_T_type_8(12.8, 1);
    let res2_8: boolean = check_is_in_T_type_8(723n, 2);
    let res3_8: boolean = check_is_in_T_type_8("efg", 3);
    expect(res1_8 && (res2_8 || res3_8)).assertEqual(true);
    return true;
  }
}

namespace testNS3_8 {
  function check_value_8(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | double).assertEqual(12.8);
      expect(v as double | string).assertEqual(12.8);
    }
    else if (v_id == 2) {
      expect(v as bigint | double).assertEqual(723n);
    }
    else {
      expect(v as double | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_8(v: Any, v_id: int): void {
    expect(v instanceof bigint | double || v instanceof double | string).assertEqual(true);
    check_value_8(v, v_id);
  }
  function check_is_in_T_type_8(v: bigint | double | double | string, v_id: int): boolean {
    check_value_8(v, v_id);
    if (v instanceof bigint | double) {
      check_value_8(v, v_id);
      if (v instanceof double | string) {
        expect(v_id).assertEqual(1);
        check_value_8(v, v_id);
        expect(v).assertEqual(12.8);
        expect(v instanceof bigint | double).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_8(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_8(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof Any) {
          check_value_as_type_T_8(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_8(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof Any) {
        check_value_as_type_T_8(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_8(): boolean {
    let res1_8: boolean = check_is_in_T_type_8(12.8, 1);
    let res2_8: boolean = check_is_in_T_type_8(723n, 2);
    let res3_8: boolean = check_is_in_T_type_8("efg", 3);
    expect(res1_8 && (res2_8 || res3_8)).assertEqual(true);
    return true;
  }
}

function check_value_8(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | double).assertEqual(1.7);
    expect(v as double | string).assertEqual(1.7);
  }
  else if (v_id == 2) {
    expect(v as bigint | double).assertEqual(5n);
  }
  else {
    expect(v as double | string).assertEqual("abc");
  }
}
function check_value_as_type_T_8(v: bigint | double | boolean, v_id: int): void {
  expect(v instanceof bigint | double || v instanceof double | string).assertEqual(true);
  check_value_8(v, v_id);
}
function check_is_in_T_type_8(v: bigint | double | double | string, v_id: int): boolean {
  check_value_8(v, v_id);
  if (v instanceof bigint | double) {
    check_value_8(v, v_id);
    if (v instanceof double | string) {
      expect(v_id).assertEqual(1);
      check_value_8(v, v_id);
      expect(v).assertEqual(1.7);
      expect(v instanceof bigint | double).assertEqual(true);
      expect(v instanceof bigint | double | boolean).assertEqual(true);
      if (v instanceof bigint | double | boolean) {
        check_value_as_type_T_8(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_8(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof bigint | double | boolean) {
        check_value_as_type_T_8(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_8(v, v_id);
    expect(v).assertEqual("abc");
    if (v instanceof bigint | double | boolean) {
      check_value_as_type_T_8(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_9 {
  function check_value_9(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | number).assertEqual(1.7);
      expect(v as number | string).assertEqual(1.7);
    }
    else if (v_id == 2) {
      expect(v as bigint | number).assertEqual(5n);
    }
    else {
      expect(v as number | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_9(v: bigint | number | boolean, v_id: int): void {
    expect(v instanceof bigint | number || v instanceof number | string).assertEqual(true);
    check_value_9(v, v_id);
  }
  function check_is_in_T_type_9(v: bigint | number | number | string, v_id: int): boolean {
    check_value_9(v, v_id);
    if (v instanceof bigint | number) {
      check_value_9(v, v_id);
      if (v instanceof number | string) {
        expect(v_id).assertEqual(1);
        check_value_9(v, v_id);
        expect(v).assertEqual(1.7);
        expect(v instanceof bigint | number).assertEqual(true);
        expect(v instanceof bigint | number | boolean).assertEqual(true);
        if (v instanceof bigint | number | boolean) {
          check_value_as_type_T_9(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_9(v, v_id);
        expect(v).assertEqual(5n);
        if (v instanceof bigint | number | boolean) {
          check_value_as_type_T_9(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_9(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof bigint | number | boolean) {
        check_value_as_type_T_9(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_9(): boolean {
    let res1_9: boolean = check_is_in_T_type_9(1.7, 1);
    let res2_9: boolean = check_is_in_T_type_9(5n, 2);
    let res3_9: boolean = check_is_in_T_type_9("abc", 3);
    expect(res1_9 && (res2_9 || res3_9)).assertEqual(true);
    return true;
  }
}

namespace testNS2_9 {
  function check_value_9(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | number).assertEqual(12.8);
      expect(v as number | string).assertEqual(12.8);
    }
    else if (v_id == 2) {
      expect(v as bigint | number).assertEqual(723n);
    }
    else {
      expect(v as number | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_9(v: number | string | char, v_id: int): void {
    expect(v instanceof bigint | number || v instanceof number | string).assertEqual(true);
    check_value_9(v, v_id);
  }
  function check_is_in_T_type_9(v: bigint | number | number | string, v_id: int): boolean {
    check_value_9(v, v_id);
    if (v instanceof bigint | number) {
      check_value_9(v, v_id);
      if (v instanceof number | string) {
        expect(v_id).assertEqual(1);
        check_value_9(v, v_id);
        expect(v).assertEqual(12.8);
        expect(v instanceof bigint | number).assertEqual(true);
        expect(v instanceof number | string | char).assertEqual(true);
        if (v instanceof number | string | char) {
          check_value_as_type_T_9(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_9(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof number | string | char) {
          check_value_as_type_T_9(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_9(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof number | string | char) {
        check_value_as_type_T_9(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_9(): boolean {
    let res1_9: boolean = check_is_in_T_type_9(12.8, 1);
    let res2_9: boolean = check_is_in_T_type_9(723n, 2);
    let res3_9: boolean = check_is_in_T_type_9("efg", 3);
    expect(res1_9 && (res2_9 || res3_9)).assertEqual(true);
    return true;
  }
}

namespace testNS3_9 {
  function check_value_9(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | number).assertEqual(12.8);
      expect(v as number | string).assertEqual(12.8);
    }
    else if (v_id == 2) {
      expect(v as bigint | number).assertEqual(723n);
    }
    else {
      expect(v as number | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_9(v: Any, v_id: int): void {
    expect(v instanceof bigint | number || v instanceof number | string).assertEqual(true);
    check_value_9(v, v_id);
  }
  function check_is_in_T_type_9(v: bigint | number | number | string, v_id: int): boolean {
    check_value_9(v, v_id);
    if (v instanceof bigint | number) {
      check_value_9(v, v_id);
      if (v instanceof number | string) {
        expect(v_id).assertEqual(1);
        check_value_9(v, v_id);
        expect(v).assertEqual(12.8);
        expect(v instanceof bigint | number).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_9(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_9(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof Any) {
          check_value_as_type_T_9(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_9(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof Any) {
        check_value_as_type_T_9(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_9(): boolean {
    let res1_9: boolean = check_is_in_T_type_9(12.8, 1);
    let res2_9: boolean = check_is_in_T_type_9(723n, 2);
    let res3_9: boolean = check_is_in_T_type_9("efg", 3);
    expect(res1_9 && (res2_9 || res3_9)).assertEqual(true);
    return true;
  }
}

function check_value_9(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | number).assertEqual(1.7);
    expect(v as number | string).assertEqual(1.7);
  }
  else if (v_id == 2) {
    expect(v as bigint | number).assertEqual(5n);
  }
  else {
    expect(v as number | string).assertEqual("abc");
  }
}
function check_value_as_type_T_9(v: bigint | number | boolean, v_id: int): void {
  expect(v instanceof bigint | number || v instanceof number | string).assertEqual(true);
  check_value_9(v, v_id);
}
function check_is_in_T_type_9(v: bigint | number | number | string, v_id: int): boolean {
  check_value_9(v, v_id);
  if (v instanceof bigint | number) {
    check_value_9(v, v_id);
    if (v instanceof number | string) {
      expect(v_id).assertEqual(1);
      check_value_9(v, v_id);
      expect(v).assertEqual(1.7);
      expect(v instanceof bigint | number).assertEqual(true);
      expect(v instanceof bigint | number | boolean).assertEqual(true);
      if (v instanceof bigint | number | boolean) {
        check_value_as_type_T_9(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_9(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof bigint | number | boolean) {
        check_value_as_type_T_9(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_9(v, v_id);
    expect(v).assertEqual("abc");
    if (v instanceof bigint | number | boolean) {
      check_value_as_type_T_9(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

namespace testNS1_10 {
  function check_value_10(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | float).assertEqual(1.7f);
      expect(v as float | string).assertEqual(1.7f);
    }
    else if (v_id == 2) {
      expect(v as bigint | float).assertEqual(5n);
    }
    else {
      expect(v as float | string).assertEqual("abc");
    }
  }
  function check_value_as_type_T_10(v: bigint | float | boolean, v_id: int): void {
    expect(v instanceof bigint | float || v instanceof float | string).assertEqual(true);
    check_value_10(v, v_id);
  }
  function check_is_in_T_type_10(v: bigint | float | float | string, v_id: int): boolean {
    check_value_10(v, v_id);
    if (v instanceof bigint | float) {
      check_value_10(v, v_id);
      if (v instanceof float | string) {
        expect(v_id).assertEqual(1);
        check_value_10(v, v_id);
        expect(v).assertEqual(1.7f);
        expect(v instanceof bigint | float).assertEqual(true);
        expect(v instanceof bigint | float | boolean).assertEqual(true);
        if (v instanceof bigint | float | boolean) {
          check_value_as_type_T_10(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_10(v, v_id);
        expect(v).assertEqual(5n);
        if (v instanceof bigint | float | boolean) {
          check_value_as_type_T_10(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_10(v, v_id);
      expect(v).assertEqual("abc");
      if (v instanceof bigint | float | boolean) {
        check_value_as_type_T_10(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_10(): boolean {
    let res1_10: boolean = check_is_in_T_type_10(1.7f, 1);
    let res2_10: boolean = check_is_in_T_type_10(5n, 2);
    let res3_10: boolean = check_is_in_T_type_10("abc", 3);
    expect(res1_10 && (res2_10 || res3_10)).assertEqual(true);
    return true;
  }
}

namespace testNS2_10 {
  function check_value_10(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | float).assertEqual(12.8f);
      expect(v as float | string).assertEqual(12.8f);
    }
    else if (v_id == 2) {
      expect(v as bigint | float).assertEqual(723n);
    }
    else {
      expect(v as float | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_10(v: float | string | char, v_id: int): void {
    expect(v instanceof bigint | float || v instanceof float | string).assertEqual(true);
    check_value_10(v, v_id);
  }
  function check_is_in_T_type_10(v: bigint | float | float | string, v_id: int): boolean {
    check_value_10(v, v_id);
    if (v instanceof bigint | float) {
      check_value_10(v, v_id);
      if (v instanceof float | string) {
        expect(v_id).assertEqual(1);
        check_value_10(v, v_id);
        expect(v).assertEqual(12.8f);
        expect(v instanceof bigint | float).assertEqual(true);
        expect(v instanceof float | string | char).assertEqual(true);
        if (v instanceof float | string | char) {
          check_value_as_type_T_10(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_10(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof float | string | char) {
          check_value_as_type_T_10(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_10(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof float | string | char) {
        check_value_as_type_T_10(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_10(): boolean {
    let res1_10: boolean = check_is_in_T_type_10(12.8f, 1);
    let res2_10: boolean = check_is_in_T_type_10(723n, 2);
    let res3_10: boolean = check_is_in_T_type_10("efg", 3);
    expect(res1_10 && (res2_10 || res3_10)).assertEqual(true);
    return true;
  }
}

namespace testNS3_10 {
  function check_value_10(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | float).assertEqual(12.8f);
      expect(v as float | string).assertEqual(12.8f);
    }
    else if (v_id == 2) {
      expect(v as bigint | float).assertEqual(723n);
    }
    else {
      expect(v as float | string).assertEqual("efg");
    }
  }
  function check_value_as_type_T_10(v: Any, v_id: int): void {
    expect(v instanceof bigint | float || v instanceof float | string).assertEqual(true);
    check_value_10(v, v_id);
  }
  function check_is_in_T_type_10(v: bigint | float | float | string, v_id: int): boolean {
    check_value_10(v, v_id);
    if (v instanceof bigint | float) {
      check_value_10(v, v_id);
      if (v instanceof float | string) {
        expect(v_id).assertEqual(1);
        check_value_10(v, v_id);
        expect(v).assertEqual(12.8f);
        expect(v instanceof bigint | float).assertEqual(true);
        expect(v instanceof Any).assertEqual(true);
        if (v instanceof Any) {
          check_value_as_type_T_10(v, v_id);
          return true;
        } else {
          return false;
        }
      }
      else {
        expect(v_id).assertEqual(2);
        check_value_10(v, v_id);
        expect(v).assertEqual(723n);
        if (v instanceof Any) {
          check_value_as_type_T_10(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    }
    else {
      expect(v_id).assertEqual(3);
      check_value_10(v, v_id);
      expect(v).assertEqual("efg");
      if (v instanceof Any) {
        check_value_as_type_T_10(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_10(): boolean {
    let res1_10: boolean = check_is_in_T_type_10(12.8f, 1);
    let res2_10: boolean = check_is_in_T_type_10(723n, 2);
    let res3_10: boolean = check_is_in_T_type_10("efg", 3);
    expect(res1_10 && (res2_10 || res3_10)).assertEqual(true);
    return true;
  }
}

function check_value_10(v: Any, v_id: int): void {
  if (v_id == 1) {
    expect(v as bigint | float).assertEqual(1.7f);
    expect(v as float | string).assertEqual(1.7f);
  }
  else if (v_id == 2) {
    expect(v as bigint | float).assertEqual(5n);
  }
  else {
    expect(v as float | string).assertEqual("abc");
  }
}
function check_value_as_type_T_10(v: bigint | float | boolean, v_id: int): void {
  expect(v instanceof bigint | float || v instanceof float | string).assertEqual(true);
  check_value_10(v, v_id);
}
function check_is_in_T_type_10(v: bigint | float | float | string, v_id: int): boolean {
  check_value_10(v, v_id);
  if (v instanceof bigint | float) {
    check_value_10(v, v_id);
    if (v instanceof float | string) {
      expect(v_id).assertEqual(1);
      check_value_10(v, v_id);
      expect(v).assertEqual(1.7f);
      expect(v instanceof bigint | float).assertEqual(true);
      expect(v instanceof bigint | float | boolean).assertEqual(true);
      if (v instanceof bigint | float | boolean) {
        check_value_as_type_T_10(v, v_id);
        return true;
      } else {
        return false;
      }
    }
    else {
      expect(v_id).assertEqual(2);
      check_value_10(v, v_id);
      expect(v).assertEqual(5n);
      if (v instanceof bigint | float | boolean) {
        check_value_as_type_T_10(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }
  else {
    expect(v_id).assertEqual(3);
    check_value_10(v, v_id);
    expect(v).assertEqual("abc");
    if (v instanceof bigint | float | boolean) {
      check_value_as_type_T_10(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

export default function InterTypeIsSubOfTypeTOnPredefinedTest02(): void {
  describe('InterTypeIsSubOfTypeTOnPredefinedTest02', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0600
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0006
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0006';
      

      let res1_6: boolean = check_is_in_T_type_6(5 as byte, 1)
      let res2_6: boolean = check_is_in_T_type_6(5n, 2)
      let res3_6: boolean = check_is_in_T_type_6("abc", 3)
      expect(res1_6 && (res2_6 || res3_6)).assertEqual(true)

      expect(testNS1_6.runTest_6()).assertEqual(true)
      expect(testNS2_6.runTest_6()).assertEqual(true)
      expect(testNS3_6.runTest_6()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0700
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0007
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0007';
      

      let res1_7: boolean = check_is_in_T_type_7(17 as short, 1)
      let res2_7: boolean = check_is_in_T_type_7(5n, 2)
      let res3_7: boolean = check_is_in_T_type_7("abc", 3)
      expect(res1_7 && (res2_7 || res3_7)).assertEqual(true)

      expect(testNS1_7.runTest_7()).assertEqual(true)
      expect(testNS2_7.runTest_7()).assertEqual(true)
      expect(testNS3_7.runTest_7()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0800
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0008
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0008';
      

      let res1_8: boolean = check_is_in_T_type_8(1.7, 1)
      let res2_8: boolean = check_is_in_T_type_8(5n, 2)
      let res3_8: boolean = check_is_in_T_type_8("abc", 3)
      expect(res1_8 && (res2_8 || res3_8)).assertEqual(true)

      expect(testNS1_8.runTest_8()).assertEqual(true)
      expect(testNS2_8.runTest_8()).assertEqual(true)
      expect(testNS3_8.runTest_8()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0900
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0009
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0009';
      

      let res1_9: boolean = check_is_in_T_type_9(1.7, 1)
      let res2_9: boolean = check_is_in_T_type_9(5n, 2)
      let res3_9: boolean = check_is_in_T_type_9("abc", 3)
      expect(res1_9 && (res2_9 || res3_9)).assertEqual(true)

      expect(testNS1_9.runTest_9()).assertEqual(true)
      expect(testNS2_9.runTest_9()).assertEqual(true)
      expect(testNS3_9.runTest_9()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1000
     * @tc.name      testInterTypeIsSubOfTypeTOnPredefined0010
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnPredefined0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnPredefined0010';
      

      let res1_10: boolean = check_is_in_T_type_10(1.7f, 1)
      let res2_10: boolean = check_is_in_T_type_10(5n, 2)
      let res3_10: boolean = check_is_in_T_type_10("abc", 3)
      expect(res1_10 && (res2_10 || res3_10)).assertEqual(true)

      expect(testNS1_10.runTest_10()).assertEqual(true)
      expect(testNS2_10.runTest_10()).assertEqual(true)
      expect(testNS3_10.runTest_10()).assertEqual(true)

    });
  })
}