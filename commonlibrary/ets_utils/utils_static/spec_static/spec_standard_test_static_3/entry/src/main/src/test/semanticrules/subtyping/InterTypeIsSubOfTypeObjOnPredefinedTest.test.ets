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
      expect(v as int | bigint | boolean | string).assertEqual("abc")
      expect(v as string | bigint | number).assertEqual("abc")
    }
    else if (v_id == 2) {
      expect(v as int | bigint | boolean | string).assertEqual(true)
    }
    else {
      expect(v as string | bigint | number).assertEqual(100)
    }
  }
  function check_value_as_type_T_1(v: Object, v_id: int): void {
    expect(v instanceof int | bigint | boolean | string || v instanceof string | bigint | number).assertTrue()
    check_value_1(v, v_id)
  }
  function check_is_in_T_type_1(v: int | bigint | boolean | string | bigint | number, v_id: int): boolean {
    check_value_1(v, v_id)
    if (v instanceof int | bigint | boolean | string) {
      check_value_1(v, v_id)
      if (v instanceof string | bigint | number) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v).assertEqual("abc")
        expect(v instanceof int | bigint | boolean | string).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        expect(v).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      expect(v).assertEqual('a')
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1("abc", 1)
    let res2: boolean = check_is_in_T_type_1(true, 2)
    let res3: boolean = check_is_in_T_type_1('a', 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_1 {
  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as int | bigint | boolean | string).assertEqual(5n)
      expect(v as string | bigint | number).assertEqual(5n)
    }
    else if (v_id == 2) {
      expect(v as int | bigint | boolean | string).assertEqual(123)
    }
    else {
      expect(v as string | bigint | number).assertEqual(7.8)
    }
  }
  function check_value_as_type_T_1(v: Object, v_id: int): void {
    expect(v instanceof int | bigint | boolean | string || v instanceof string | bigint | number).assertTrue()
    check_value_1(v, v_id)
  }
  function check_is_in_T_type_1(v: int | bigint | boolean | string | bigint | number, v_id: int): boolean {
    check_value_1(v, v_id)
    if (v instanceof int | bigint | boolean | string) {
      check_value_1(v, v_id)
      if (v instanceof string | bigint | number) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v).assertEqual(5n)
        expect(v instanceof int | bigint | boolean | string).assertTrue()
        expect(v instanceof Object).assertTrue()
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        expect(v).assertEqual(123)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      expect(v).assertEqual(7.8)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1(5n, 1)
    let res2: boolean = check_is_in_T_type_1(123, 2)
    let res3: boolean = check_is_in_T_type_1(7.8, 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

function check_value_1(v: int | bigint | boolean | string | number | Object, v_id: int): void {
  if (v_id == 1) {
    expect(v as int | bigint | boolean | string).assertEqual("abc")
    expect(v as string | bigint | number).assertEqual("abc")
  }
  else if (v_id == 2) {
    expect(v as int | bigint | boolean | string).assertEqual(true)
  }
  else {
    expect(v).assertEqual(100)
  }
}
function check_value_as_type_T_1(v: Object, v_id: int): void {
  expect(v instanceof int | bigint | boolean | string || v instanceof string | bigint | number).assertTrue()
  check_value_1(v, v_id)
}
function check_is_in_T_type_1(v: int | bigint | boolean | string | bigint | number, v_id: int): boolean {
  check_value_1(v, v_id)
  if (v instanceof int | bigint | boolean | string) {
    check_value_1(v, v_id)
    if (v instanceof string | bigint | number) {
      expect(v_id).assertEqual(1)
      check_value_1(v, v_id)
      expect(v).assertEqual("abc")
      expect(v instanceof int | bigint | boolean | string).assertTrue()
      expect(v instanceof Object).assertTrue()
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_1(v, v_id)
      expect(v).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id).assertEqual(3)
    check_value_1(v, v_id)
    expect(v).assertEqual(100)
    if (v instanceof Object) {
      check_value_as_type_T_1(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_2 {
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

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(123, 1)
    let res2: boolean = check_is_in_T_type_2(5n, 2)
    let res3: boolean = check_is_in_T_type_2("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_2 {
  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | int).assertEqual(567)
      expect(v as int | string).assertEqual(567)
    }
    else if (v_id == 2) {
      expect(v as bigint | int).assertEqual(723n)
    }
    else {
      expect(v as int | string).assertEqual("efg")
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
        expect(v).assertEqual(567)
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
        expect(v).assertEqual(723n)
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
      expect(v).assertEqual("efg")
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(567, 1)
    let res2: boolean = check_is_in_T_type_2(723n, 2)
    let res3: boolean = check_is_in_T_type_2("efg", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

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

namespace testNS1_3 {
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

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3(123, 1)
    let res2: boolean = check_is_in_T_type_3(5n, 2)
    let res3: boolean = check_is_in_T_type_3("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_3 {
  function check_value_3(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | number).assertEqual(567)
      expect(v as number | string).assertEqual(567)
    }
    else if (v_id == 2) {
      expect(v as bigint | number).assertEqual(723n)
    }
    else {
      expect(v as number | string).assertEqual("efg")
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
        expect(v).assertEqual(567)
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
        expect(v).assertEqual(723n)
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
      expect(v).assertEqual("efg")
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3(567, 1)
    let res2: boolean = check_is_in_T_type_3(723n, 2)
    let res3: boolean = check_is_in_T_type_3("efg", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
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

namespace testNS1_4 {
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

  export function runTest_4(): boolean {
    let res1: boolean = check_is_in_T_type_4(5, 1)
    let res2: boolean = check_is_in_T_type_4(5n, 2)
    let res3: boolean = check_is_in_T_type_4("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_4 {
  function check_value_4(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | number).assertEqual(7)
      expect(v as number | string).assertEqual(7)
    }
    else if (v_id == 2) {
      expect(v as bigint | number).assertEqual(723n)
    }
    else {
      expect(v as number | string).assertEqual("efg")
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
        expect(v).assertEqual(7)
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
        expect(v).assertEqual(723n)
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
      expect(v).assertEqual("efg")
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_4(): boolean {
    let res1: boolean = check_is_in_T_type_4(7, 1)
    let res2: boolean = check_is_in_T_type_4(723n, 2)
    let res3: boolean = check_is_in_T_type_4("efg", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
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

namespace testNS1_5 {
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

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(17, 1)
    let res2: boolean = check_is_in_T_type_5(5n, 2)
    let res3: boolean = check_is_in_T_type_5("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_5 {
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      expect(v as bigint | number).assertEqual(128)
      expect(v as number | string).assertEqual(128)
    }
    else if (v_id == 2) {
      expect(v as bigint | number).assertEqual(723n)
    }
    else {
      expect(v as number | string).assertEqual("efg")
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
        expect(v).assertEqual(128)
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
        expect(v).assertEqual(723n)
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
      expect(v).assertEqual("efg")
      if (v instanceof Object) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_5(): boolean {
    let res1: boolean = check_is_in_T_type_5(128, 1)
    let res2: boolean = check_is_in_T_type_5(723n, 2)
    let res3: boolean = check_is_in_T_type_5("efg", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
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

namespace testNS1_6 {
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

  export function runTest_6(): boolean {
    let res1: boolean = check_is_in_T_type_6(1.7, 1)
    let res2: boolean = check_is_in_T_type_6(5n, 2)
    let res3: boolean = check_is_in_T_type_6("abc", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
  }
}

namespace testNS2_6 {
  function check_value_6(v: Any, v_id: int): void {
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
        expect(v).assertEqual(12.8)
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
        expect(v).assertEqual(723n)
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
      expect(v).assertEqual("efg")
      if (v instanceof Object) {
        check_value_as_type_T_6(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_6(): boolean {
    let res1: boolean = check_is_in_T_type_6(12.8, 1)
    let res2: boolean = check_is_in_T_type_6(723n, 2)
    let res3: boolean = check_is_in_T_type_6("efg", 3)
    expect(res1 && (res2 || res3)).assertTrue()
    return true
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
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0002';
      

      let res1: boolean = check_is_in_T_type_2(123, 1)
      let res2: boolean = check_is_in_T_type_2(5n, 2)
      let res3: boolean = check_is_in_T_type_2("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_2.runTest_2()).assertTrue()
      expect(testNS2_2.runTest_2()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0300
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0003
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0003';
      

      let res1: boolean = check_is_in_T_type_3(123, 1)
      let res2: boolean = check_is_in_T_type_3(5n, 2)
      let res3: boolean = check_is_in_T_type_3("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_3.runTest_3()).assertTrue()
      expect(testNS2_3.runTest_3()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0400
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0004
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0004';
      

      let res1: boolean = check_is_in_T_type_4(5, 1)
      let res2: boolean = check_is_in_T_type_4(5n, 2)
      let res3: boolean = check_is_in_T_type_4("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_4.runTest_4()).assertTrue()
      expect(testNS2_4.runTest_4()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0500
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0005
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0005';
      

      let res1: boolean = check_is_in_T_type_5(17, 1)
      let res2: boolean = check_is_in_T_type_5(5n, 2)
      let res3: boolean = check_is_in_T_type_5("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_5.runTest_5()).assertTrue()
      expect(testNS2_5.runTest_5()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_PREDEFINED_0600
     * @tc.name      testInterTypeIsSubOfTypeObjOnPredefined0006
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on predefined
     *               types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnPredefined0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnPredefined0006';
      

      let res1: boolean = check_is_in_T_type_6(1.7, 1)
      let res2: boolean = check_is_in_T_type_6(5n, 2)
      let res3: boolean = check_is_in_T_type_6("abc", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_6.runTest_6()).assertTrue()
      expect(testNS2_6.runTest_6()).assertTrue()

    });
  })
}