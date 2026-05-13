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

namespace testNS1_5 {
  interface I_5 {}
  interface II1_5 extends I_5 {}
  interface II2_5 extends I_5 {}
  interface III1_5 extends II1_5 {}
  interface III2_5 extends II1_5 {}
  class C1_5 implements III1_5, III2_5 {v: bigint = 123n}
  class C2_5 implements II2_5, III2_5 {v: int = 321}
  class C3_5 implements III1_5 {v: number = 7.8}
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C1_5).v).assertEqual(123n)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertEqual(true)
    expect(a instanceof II2_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C2_5).v).assertEqual(321)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C3_5).v).assertEqual(7.8)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_5(v)
      check_C1_5(v as III1_5 | III2_5 | II2_5)
      check_C1_5(v as III2_5 | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5 | III2_5 | II2_5)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as III2_5 | bigint)
    }
  }
  function check_value_as_type_T_5(v: III1_5 | III2_5 | II2_5 | number, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 || v instanceof III2_5 | bigint).assertEqual(true)
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5 | III2_5 | II2_5 | III2_5 | bigint, v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof III2_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertEqual(true)
        expect(v instanceof III1_5 | III2_5 | II2_5 | number).assertEqual(true)
        if (v instanceof III1_5 | III2_5 | II2_5 | number) {
          check_value_as_type_T_5(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof III1_5 | III2_5 | II2_5 | number) {
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
      if (v instanceof III1_5 | III2_5 | II2_5 | number) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  export function runTest_5(): boolean {
    let res1_5: boolean = check_is_in_T_type_5(new C1_5(), 1)
    let res2_5: boolean = check_is_in_T_type_5(new C3_5(), 2)
    let res3_5: boolean = check_is_in_T_type_5(5n, 3)
    expect(res1_5 && (res2_5 || res3_5)).assertEqual(true)
    return true
  }
}

namespace testNS2_5 {
  interface I_5 {}
  interface II1_5 extends I_5 {}
  interface II2_5 extends I_5 {}
  interface III1_5 extends II1_5 {}
  interface III2_5 extends II1_5 {}
  class C1_5 implements III1_5, III2_5 {v: bigint = 123n}
  class C2_5 implements II2_5, III2_5 {v: int = 321}
  class C3_5 implements III1_5 {v: number = 7.8}
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C1_5).v).assertEqual(123n)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertEqual(true)
    expect(a instanceof II2_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C2_5).v).assertEqual(321)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C3_5).v).assertEqual(7.8)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_5(v)
      check_C2_5(v as III1_5 | III2_5 | II2_5)
      check_C2_5(v as III2_5 | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5 | III2_5 | II2_5)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as III2_5 | bigint)
    }
  }
  function check_value_as_type_T_5(v: II1_5 | II2_5, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 || v instanceof III2_5 | bigint).assertEqual(true)
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5 | III2_5 | II2_5 | III2_5 | bigint, v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof III2_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertEqual(true)
        expect(v instanceof II1_5 | II2_5).assertEqual(true)
        if (v instanceof II1_5 | II2_5) {
          check_value_as_type_T_5(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof II1_5 | II2_5) {
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
      if (v instanceof II1_5 | II2_5) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  export function runTest_5(): boolean {
    let res1_5: boolean = check_is_in_T_type_5(new C2_5(), 1)
    let res2_5: boolean = check_is_in_T_type_5(new C3_5(), 2)
    let res3_5: boolean = check_is_in_T_type_5(5n, 3)
    expect(res1_5 && (res2_5 || res3_5)).assertEqual(true)
    return true
  }
}

namespace testNS3_5 {
  interface I_5 {}
  interface II1_5 extends I_5 {}
  interface II2_5 extends I_5 {}
  interface III1_5 extends II1_5 {}
  interface III2_5 extends II1_5 {}
  class C1_5 implements III1_5, III2_5 {v: bigint = 123n}
  class C2_5 implements II2_5, III2_5 {v: int = 321}
  class C3_5 implements III1_5 {v: number = 7.8}
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C1_5).v).assertEqual(123n)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertEqual(true)
    expect(a instanceof II2_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C2_5).v).assertEqual(321)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C3_5).v).assertEqual(7.8)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_5(v)
      check_C1_5(v as III1_5 | III2_5 | II2_5)
      check_C1_5(v as III2_5 | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5 | III2_5 | II2_5)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as III2_5 | bigint)
    }
  }
  function check_value_as_type_T_5(v: II1_5 | bigint, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 || v instanceof III2_5 | bigint).assertEqual(true)
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5 | III2_5 | II2_5 | III2_5 | bigint, v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof III2_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertEqual(true)
        expect(v instanceof II1_5 | bigint).assertEqual(true)
        if (v instanceof II1_5 | bigint) {
          check_value_as_type_T_5(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof II1_5 | bigint) {
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
      if (v instanceof II1_5 | bigint) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  export function runTest_5(): boolean {
    let res1_5: boolean = check_is_in_T_type_5(new C1_5(), 1)
    let res2_5: boolean = check_is_in_T_type_5(new C3_5(), 2)
    let res3_5: boolean = check_is_in_T_type_5(5n, 3)
    expect(res1_5 && (res2_5 || res3_5)).assertEqual(true)
    return true
  }
}

namespace testNS4_5 {
  interface I_5 {}
  interface II1_5 extends I_5 {}
  interface II2_5 extends I_5 {}
  interface III1_5 extends II1_5 {}
  interface III2_5 extends II1_5 {}
  class C1_5 implements III1_5, III2_5 {v: bigint = 123n}
  class C2_5 implements II2_5, III2_5 {v: int = 321}
  class C3_5 implements III1_5 {v: number = 7.8}
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C1_5).v).assertEqual(123n)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertEqual(true)
    expect(a instanceof II2_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C2_5).v).assertEqual(321)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C3_5).v).assertEqual(7.8)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_5(v)
      check_C1_5(v as III1_5 | III2_5 | II2_5)
      check_C1_5(v as III2_5 | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5 | III2_5 | II2_5)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as III2_5 | bigint)
    }
  }
  function check_value_as_type_T_5(v: I_5 | bigint, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 || v instanceof III2_5 | bigint).assertEqual(true)
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5 | III2_5 | II2_5 | III2_5 | bigint, v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof III2_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertEqual(true)
        expect(v instanceof I_5 | bigint).assertEqual(true)
        if (v instanceof I_5 | bigint) {
          check_value_as_type_T_5(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof I_5 | bigint) {
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
      if (v instanceof I_5 | bigint) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  export function runTest_5(): boolean {
    let res1_5: boolean = check_is_in_T_type_5(new C1_5(), 1)
    let res2_5: boolean = check_is_in_T_type_5(new C3_5(), 2)
    let res3_5: boolean = check_is_in_T_type_5(5n, 3)
    expect(res1_5 && (res2_5 || res3_5)).assertEqual(true)
    return true
  }
}

namespace testNS5_5 {
  interface I_5 {}
  interface II1_5 extends I_5 {}
  interface II2_5 extends I_5 {}
  interface III1_5 extends II1_5 {}
  interface III2_5 extends II1_5 {}
  class C1_5 implements III1_5, III2_5 {v: bigint = 123n}
  class C2_5 implements II2_5, III2_5 {v: int = 321}
  class C3_5 implements III1_5 {v: number = 7.8}
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C1_5).v).assertEqual(123n)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertEqual(true)
    expect(a instanceof II2_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C2_5).v).assertEqual(321)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C3_5).v).assertEqual(7.8)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_5(v)
      check_C2_5(v as III1_5 | III2_5 | II2_5)
      check_C2_5(v as III2_5 | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5 | III2_5 | II2_5)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as III2_5 | bigint)
    }
  }
  function check_value_as_type_T_5(v: III2_5 | bigint | string, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 || v instanceof III2_5 | bigint).assertEqual(true)
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5 | III2_5 | II2_5 | III2_5 | bigint, v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof III2_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertEqual(true)
        expect(v instanceof III2_5 | bigint | string).assertEqual(true)
        if (v instanceof III2_5 | bigint | string) {
          check_value_as_type_T_5(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof III2_5 | bigint | string) {
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
      if (v instanceof III2_5 | bigint | string) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  export function runTest_5(): boolean {
    let res1_5: boolean = check_is_in_T_type_5(new C2_5(), 1)
    let res2_5: boolean = check_is_in_T_type_5(new C3_5(), 2)
    let res3_5: boolean = check_is_in_T_type_5(5n, 3)
    expect(res1_5 && (res2_5 || res3_5)).assertEqual(true)
    return true
  }
}

namespace testNS6_5 {
  interface I_5 {}
  interface II1_5 extends I_5 {}
  interface II2_5 extends I_5 {}
  interface III1_5 extends II1_5 {}
  interface III2_5 extends II1_5 {}
  class C1_5 implements III1_5, III2_5 {v: bigint = 123n}
  class C2_5 implements II2_5, III2_5 {v: int = 321}
  class C3_5 implements III1_5 {v: number = 7.8}
  function check_C1_5(a: Any) {
    expect(a instanceof C1_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C1_5).v).assertEqual(123n)
  }
  function check_C2_5(a: Any) {
    expect(a instanceof C2_5).assertEqual(true)
    expect(a instanceof II2_5).assertEqual(true)
    expect(a instanceof III2_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C2_5).v).assertEqual(321)
  }
  function check_C3_5(a: Any) {
    expect(a instanceof C3_5).assertEqual(true)
    expect(a instanceof III1_5).assertEqual(true)
    expect(a instanceof II1_5).assertEqual(true)
    expect(a instanceof I_5).assertEqual(true)
    expect((a as C3_5).v).assertEqual(7.8)
  }
  function check_bigint_5(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_5(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_5(v)
      check_C1_5(v as III1_5 | III2_5 | II2_5)
      check_C1_5(v as III2_5 | bigint)
    }
    else if (v_id == 2) {
      check_C3_5(v)
      check_C3_5(v as III1_5 | III2_5 | II2_5)
    }
    else {
      check_bigint_5(v)
      check_bigint_5(v as III2_5 | bigint)
    }
  }
  function check_value_as_type_T_5(v: Any, v_id: int): void {
    expect(v instanceof III1_5 | III2_5 | II2_5 || v instanceof III2_5 | bigint).assertEqual(true)
    check_value_5(v, v_id)
  }
  function check_is_in_T_type_5(v: III1_5 | III2_5 | II2_5 | III2_5 | bigint, v_id: int): boolean {
    check_value_5(v, v_id)
    if (v instanceof III1_5 | III2_5 | II2_5) {
      check_value_5(v, v_id)
      if (v instanceof III2_5 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_5(v, v_id)
        expect(v instanceof III1_5 | III2_5 | II2_5).assertEqual(true)
        expect(v instanceof Any).assertEqual(true)
        if (v instanceof Any) {
          check_value_as_type_T_5(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_5(v, v_id)
        if (v instanceof Any) {
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
      if (v instanceof Any) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  export function runTest_5(): boolean {
    let res1_5: boolean = check_is_in_T_type_5(new C1_5(), 1)
    let res2_5: boolean = check_is_in_T_type_5(new C3_5(), 2)
    let res3_5: boolean = check_is_in_T_type_5(5n, 3)
    expect(res1_5 && (res2_5 || res3_5)).assertEqual(true)
    return true
  }
}

interface I_5 {}
interface II1_5 extends I_5 {}
interface II2_5 extends I_5 {}
interface III1_5 extends II1_5 {}
interface III2_5 extends II1_5 {}
class C1_5 implements III1_5, III2_5 {v: bigint = 123n}
class C2_5 implements II2_5, III2_5 {v: int = 321}
class C3_5 implements III1_5 {v: number = 7.8}
function check_C1_5(a: Any) {
  expect(a instanceof C1_5).assertEqual(true)
  expect(a instanceof III1_5).assertEqual(true)
  expect(a instanceof III2_5).assertEqual(true)
  expect(a instanceof II1_5).assertEqual(true)
  expect(a instanceof I_5).assertEqual(true)
  expect((a as C1_5).v).assertEqual(123n)
}
function check_C2_5(a: Any) {
  expect(a instanceof C2_5).assertEqual(true)
  expect(a instanceof II2_5).assertEqual(true)
  expect(a instanceof III2_5).assertEqual(true)
  expect(a instanceof II1_5).assertEqual(true)
  expect(a instanceof I_5).assertEqual(true)
  expect((a as C2_5).v).assertEqual(321)
}
function check_C3_5(a: Any) {
  expect(a instanceof C3_5).assertEqual(true)
  expect(a instanceof III1_5).assertEqual(true)
  expect(a instanceof II1_5).assertEqual(true)
  expect(a instanceof I_5).assertEqual(true)
  expect((a as C3_5).v).assertEqual(7.8)
}
function check_bigint_5(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_5(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_5(v)
    check_C1_5(v as III1_5 | III2_5 | II2_5)
    check_C1_5(v as III2_5 | bigint)
  }
  else if (v_id == 2) {
    check_C3_5(v)
    check_C3_5(v as III1_5 | III2_5 | II2_5)
  }
  else {
    check_bigint_5(v)
    check_bigint_5(v as III2_5 | bigint)
  }
}
function check_value_as_type_T_5(v: III1_5 | III2_5 | II2_5 | number, v_id: int): void {
  expect(v instanceof III1_5 | III2_5 | II2_5 || v instanceof III2_5 | bigint).assertEqual(true)
  check_value_5(v, v_id)
}
function check_is_in_T_type_5(v: III1_5 | III2_5 | II2_5 | III2_5 | bigint, v_id: int): boolean {
  check_value_5(v, v_id)
  if (v instanceof III1_5 | III2_5 | II2_5) {
    check_value_5(v, v_id)
    if (v instanceof III2_5 | bigint) {
      expect(v_id).assertEqual(1)
      check_value_5(v, v_id)
      expect(v instanceof III1_5 | III2_5 | II2_5).assertEqual(true)
      expect(v instanceof III1_5 | III2_5 | II2_5 | number).assertEqual(true)
      if (v instanceof III1_5 | III2_5 | II2_5 | number) {
        check_value_as_type_T_5(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_5(v, v_id)
      if (v instanceof III1_5 | III2_5 | II2_5 | number) {
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
    if (v instanceof III1_5 | III2_5 | II2_5 | number) {
      check_value_as_type_T_5(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_6 {
  interface I_6 {}
  interface II1_6 extends I_6 {}
  interface II2_6 extends I_6 {}
  interface III1_6 extends II1_6 {}
  interface III2_6 extends II1_6 {}
  class C1_6 implements III1_6, III2_6 {v: bigint = 123n}
  class C2_6 implements II2_6, III2_6 {v: int = 321}
  class C3_6 implements III1_6 {v: number = 7.8}
  function check_C1_6(a: Any) {
    expect(a instanceof C1_6).assertEqual(true)
    expect(a instanceof III1_6).assertEqual(true)
    expect(a instanceof III2_6).assertEqual(true)
    expect(a instanceof II1_6).assertEqual(true)
    expect(a instanceof I_6).assertEqual(true)
    expect((a as C1_6).v).assertEqual(123n)
  }
  function check_C2_6(a: Any) {
    expect(a instanceof C2_6).assertEqual(true)
    expect(a instanceof II2_6).assertEqual(true)
    expect(a instanceof III2_6).assertEqual(true)
    expect(a instanceof II1_6).assertEqual(true)
    expect(a instanceof I_6).assertEqual(true)
    expect((a as C2_6).v).assertEqual(321)
  }
  function check_C3_6(a: Any) {
    expect(a instanceof C3_6).assertEqual(true)
    expect(a instanceof III1_6).assertEqual(true)
    expect(a instanceof II1_6).assertEqual(true)
    expect(a instanceof I_6).assertEqual(true)
    expect((a as C3_6).v).assertEqual(7.8)
  }
  function check_bigint_6(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_6(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_6(v)
      check_C1_6(v as III1_6 | III2_6 | II2_6)
      check_C1_6(v as III2_6 | bigint)
    }
    else if (v_id == 2) {
      check_C3_6(v)
      check_C3_6(v as III1_6 | III2_6 | II2_6)
    }
    else {
      check_bigint_6(v)
      check_bigint_6(v as III2_6 | bigint)
    }
  }
  function check_value_as_type_T_6(v: I_6, v_id: int): void {
    expect(v instanceof III1_6 | III2_6 | II2_6 || v instanceof III2_6 | bigint).assertEqual(true)
    check_value_6(v, v_id)
  }
  function check_is_in_T_type_6(v: III1_6 | III2_6 | II2_6 | III2_6 | bigint, v_id: int): boolean {
    check_value_6(v, v_id)
    if (v instanceof III1_6 | III2_6 | II2_6) {
      check_value_6(v, v_id)
      if (v instanceof III2_6 | bigint) {
        expect(v_id).assertEqual(1)
        check_value_6(v, v_id)
        expect(v instanceof III1_6 | III2_6 | II2_6).assertEqual(true)
        expect(v instanceof I_6).assertEqual(true)
        if (v instanceof I_6) {
          check_value_as_type_T_6(v, v_id)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id).assertEqual(2)
        check_value_6(v, v_id)
        if (v instanceof I_6) {
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
      if (v instanceof I_6) {
        check_value_as_type_T_6(v, v_id)
        return true
      } else {
        return false
      }
    }
  }
  export function runTest_6(): boolean {
    let res1_6: boolean = check_is_in_T_type_6(new C1_6(), 1)
    let res2_6: boolean = check_is_in_T_type_6(new C3_6(), 2)
    let res3_6: boolean = check_is_in_T_type_6(5n, 3)
    expect(res1_6 && (res2_6 || res3_6)).assertEqual(true)
    return true
  }
}

interface I_6 {}
interface II1_6 extends I_6 {}
interface II2_6 extends I_6 {}
interface III1_6 extends II1_6 {}
interface III2_6 extends II1_6 {}
class C1_6 implements III1_6, III2_6 {v: bigint = 123n}
class C2_6 implements II2_6, III2_6 {v: int = 321}
class C3_6 implements III1_6 {v: number = 7.8}
function check_C1_6(a: Any) {
  expect(a instanceof C1_6).assertEqual(true)
  expect(a instanceof III1_6).assertEqual(true)
  expect(a instanceof III2_6).assertEqual(true)
  expect(a instanceof II1_6).assertEqual(true)
  expect(a instanceof I_6).assertEqual(true)
  expect((a as C1_6).v).assertEqual(123n)
}
function check_C2_6(a: Any) {
  expect(a instanceof C2_6).assertEqual(true)
  expect(a instanceof II2_6).assertEqual(true)
  expect(a instanceof III2_6).assertEqual(true)
  expect(a instanceof II1_6).assertEqual(true)
  expect(a instanceof I_6).assertEqual(true)
  expect((a as C2_6).v).assertEqual(321)
}
function check_C3_6(a: Any) {
  expect(a instanceof C3_6).assertEqual(true)
  expect(a instanceof III1_6).assertEqual(true)
  expect(a instanceof II1_6).assertEqual(true)
  expect(a instanceof I_6).assertEqual(true)
  expect((a as C3_6).v).assertEqual(7.8)
}
function check_bigint_6(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_6(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_6(v)
    check_C1_6(v as III1_6 | III2_6 | II2_6)
    check_C1_6(v as III2_6 | bigint)
  }
  else if (v_id == 2) {
    check_C3_6(v)
    check_C3_6(v as III1_6 | III2_6 | II2_6)
  }
  else {
    check_bigint_6(v)
    check_bigint_6(v as III2_6 | bigint)
  }
}
function check_value_as_type_T_6(v: I_6, v_id: int): void {
  expect(v instanceof III1_6 | III2_6 | II2_6 || v instanceof III2_6 | bigint).assertEqual(true)
  check_value_6(v, v_id)
}
function check_is_in_T_type_6(v: III1_6 | III2_6 | II2_6 | III2_6 | bigint, v_id: int): boolean {
  check_value_6(v, v_id)
  if (v instanceof III1_6 | III2_6 | II2_6) {
    check_value_6(v, v_id)
    if (v instanceof III2_6 | bigint) {
      expect(v_id).assertEqual(1)
      check_value_6(v, v_id)
      expect(v instanceof III1_6 | III2_6 | II2_6).assertEqual(true)
      expect(v instanceof I_6).assertEqual(true)
      if (v instanceof I_6) {
        check_value_as_type_T_6(v, v_id)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id).assertEqual(2)
      check_value_6(v, v_id)
      if (v instanceof I_6) {
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
    if (v instanceof I_6) {
      check_value_as_type_T_6(v, v_id)
      return true
    } else {
      return false
    }
  }
}



export default function InterTypeIsSubOfTypeTOnNonGenTest02(): void {
  describe('InterTypeIsSubOfTypeTOnNonGenTest02', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0500
     * @tc.name      testInterTypeIsSubOfTypeTOnNonGen0005
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on non generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnNonGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnNonGen0005';
      

      let res1_5: boolean = check_is_in_T_type_5(new C1_5(), 1)
      let res2_5: boolean = check_is_in_T_type_5(new C3_5(), 2)
      let res3_5: boolean = check_is_in_T_type_5(5n, 3)
      expect(res1_5 && (res2_5 || res3_5)).assertEqual(true)

      expect(testNS1_5.runTest_5()).assertEqual(true)
      expect(testNS2_5.runTest_5()).assertEqual(true)
      expect(testNS3_5.runTest_5()).assertEqual(true)
      expect(testNS4_5.runTest_5()).assertEqual(true)
      expect(testNS5_5.runTest_5()).assertEqual(true)
      expect(testNS6_5.runTest_5()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0600
     * @tc.name      testInterTypeIsSubOfTypeTOnNonGen0006
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on non generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnNonGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnNonGen0006';
      

      let res1_6: boolean = check_is_in_T_type_6(new C1_6(), 1)
      let res2_6: boolean = check_is_in_T_type_6(new C3_6(), 2)
      let res3_6: boolean = check_is_in_T_type_6(5n, 3)
      expect(res1_6 && (res2_6 || res3_6)).assertEqual(true)

      expect(testNS1_6.runTest_6()).assertEqual(true)

    });
  })
}