import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => { resolve(0); }, time);
  });
}

namespace testNS1_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v_5: U | V
    constructor(p: U | V) {
      this.c1_v_5 = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V> {
    c2_v_5: U | V
    constructor(p: U | V) {
      this.c2_v_5 = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V> {
    c3_v_5: U | V
    constructor(p: U | V) {
      this.c3_v_5 = p
    }
  }
  function check_C1_5(a: Object) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<number, null>).c1_v_5 as number).assertEqual(123)
  }
  function check_C2_5(a: Object) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v_5 as number).assertEqual(6.7)
  }
  function check_C3_5(a: Object) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v_5 as bigint).assertEqual(321n)
  }
  function check_int_5(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    }
  }
  function check_5(
    v: III1_5<number, null> |
    II2_5<bigint, undefined> |
    III2_5<number, string>,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_5
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number') {
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_5(v)
      } else {
        check_C3_5(v)
      }
      res = check_is_in_inter_type_5(
        v as III1_5<number, null> |
        III2_5<number, string> |
        II2_5<bigint, undefined> |
        number, is_subtype_of_inter_type, v_id
      )
      if (!res) {
        expect(v instanceof II1_5).assertFalse()
        check_is_not_in_I2_type_5(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_5(
    v: III1_5<number, null> |
    III2_5<number, string> |
    II2_5<bigint, undefined> |
    number, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_5(v)
    } else {
      check_C3_5(v)
    }
    if (v instanceof II1_5) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_5(v)
      } else {
        check_C3_5(v)
      }
      check_value_5(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_5).assertFalse()
  }
  export function runTest_5(): boolean {
    let v1: III1_5<number, null> | II2_5<bigint, undefined> | III2_5<number, string> = new C1_5<number, null>(123)
    let v2: III1_5<number, null> | II2_5<bigint, undefined> | III2_5<number, string> = new C3_5<bigint, undefined>(321n)
    let res: boolean = check_5(v1, true, 1) && check_5(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v_5: U | V
    constructor(p: U | V) {
      this.c1_v_5 = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V> {
    c2_v_5: U | V
    constructor(p: U | V) {
      this.c2_v_5 = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V> {
    c3_v_5: U | V
    constructor(p: U | V) {
      this.c3_v_5 = p
    }
  }
  function check_C1_5(a: Object) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<number, null>).c1_v_5 as number).assertEqual(123)
  }
  function check_C2_5(a: Object) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v_5 as number).assertEqual(6.7)
  }
  function check_C3_5(a: Object) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v_5 as bigint).assertEqual(321n)
  }
  function check_int_5(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    }
  }
  function check_5(
    v: II1_5<number, null> |
    II1_5<number, string> |
    II2_5<bigint, undefined>, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_5
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number') {
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_5(v)
      } else {
        check_C3_5(v)
      }
      res = check_is_in_inter_type_5(
        v as III1_5<number, null> |
        III2_5<number, string> |
        II2_5<bigint, undefined> |
        number, is_subtype_of_inter_type, v_id
      )
      if (!res) {
        expect(v instanceof II1_5).assertFalse()
        check_is_not_in_I2_type_5(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_5(
    v: III1_5<number, null> |
    III2_5<number, string> |
    II2_5<bigint, undefined> |
    number, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_5(v)
    } else {
      check_C3_5(v)
    }
    if (v instanceof II1_5) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_5(v)
      } else {
        check_C3_5(v)
      }
      check_value_5(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_5).assertFalse()
  }
  export function runTest_5(): boolean {
    let v1: II1_5<number, null> | II1_5<number, string> | II2_5<bigint, undefined> = new C2_5<number, string>(6.7)
    let v2: II1_5<number, null> | II1_5<number, string> | II2_5<bigint, undefined> = new C3_5<bigint, undefined>(321n)
    let res: boolean = check_5(v1, true, 1) && check_5(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v_5: U | V
    constructor(p: U | V) {
      this.c1_v_5 = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V> {
    c2_v_5: U | V
    constructor(p: U | V) {
      this.c2_v_5 = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V> {
    c3_v_5: U | V
    constructor(p: U | V) {
      this.c3_v_5 = p
    }
  }
  function check_C1_5(a: Object) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<number, null>).c1_v_5 as number).assertEqual(123)
  }
  function check_C2_5(a: Object) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v_5 as number).assertEqual(6.7)
  }
  function check_C3_5(a: Object) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v_5 as bigint).assertEqual(321n)
  }
  function check_int_5(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    }
  }
  function check_5(
    v: I1_5<number, null> |
    I2_5<bigint, undefined>,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_5
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number') {
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_5(v)
      } else {
        check_C3_5(v)
      }
      res = check_is_in_inter_type_5(
        v as III1_5<number, null> |
        III2_5<number, string> |
        II2_5<bigint, undefined> |
        number, is_subtype_of_inter_type, v_id
      )
      if (!res) {
        expect(v instanceof II1_5).assertFalse()
        check_is_not_in_I2_type_5(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_5(
    v: III1_5<number, null> |
    III2_5<number, string> |
    II2_5<bigint, undefined> |
    number, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_5(v)
    } else {
      check_C3_5(v)
    }
    if (v instanceof II1_5) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_5(v)
      } else {
        check_C3_5(v)
      }
      check_value_5(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_5).assertFalse()
  }
  export function runTest_5(): boolean {
    let v1: I1_5<number, null> | I2_5<bigint, undefined> = new C1_5<number, null>(123)
    let v2: I1_5<number, null> | I2_5<bigint, undefined> = new C3_5<bigint, undefined>(321n)
    let res: boolean = check_5(v1, true, 1) && check_5(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v_5: U | V
    constructor(p: U | V) {
      this.c1_v_5 = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V> {
    c2_v_5: U | V
    constructor(p: U | V) {
      this.c2_v_5 = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V> {
    c3_v_5: U | V
    constructor(p: U | V) {
      this.c3_v_5 = p
    }
  }
  function check_C1_5(a: Object) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<number, null>).c1_v_5 as number).assertEqual(123)
  }
  function check_C2_5(a: Object) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v_5 as number).assertEqual(6.7)
  }
  function check_C3_5(a: Object) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v_5 as bigint).assertEqual(321n)
  }
  function check_int_5(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    }
  }
  function check_5(
    v: I1_5<number, string> |
    I1_5<bigint, undefined>,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_5
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number') {
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_5(v)
      } else {
        check_C3_5(v)
      }
      res = check_is_in_inter_type_5(
        v as III1_5<number, null> |
        III2_5<number, string> |
        II2_5<bigint, undefined> |
        number, is_subtype_of_inter_type, v_id
      )
      if (!res) {
        expect(v instanceof II1_5).assertFalse()
        check_is_not_in_I2_type_5(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_5(
    v: III1_5<number, null> |
    III2_5<number, string> |
    II2_5<bigint, undefined> |
    number, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_5(v)
    } else {
      check_C3_5(v)
    }
    if (v instanceof II1_5) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_5(v)
      } else {
        check_C3_5(v)
      }
      check_value_5(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_5).assertFalse()
  }
  export function runTest_5(): boolean {
    let v1: I1_5<number, string> | I1_5<bigint, undefined> = new C2_5<number, string>(6.7)
    let v2: I1_5<number, string> | I1_5<bigint, undefined> = new C3_5<bigint, undefined>(321n)
    let res: boolean = check_5(v1, true, 1) && check_5(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_5 {
  interface I1_5<U, V> {}
  interface I2_5<U, V> {}
  interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
  interface III1_5<U, V> extends II1_5<U, V> {}
  interface III2_5<U, V> extends II1_5<U, V> {}
  class C1_5<U, V> implements III1_5<U, V> {
    c1_v_5: U | V
    constructor(p: U | V) {
      this.c1_v_5 = p
    }
  }
  class C2_5<U, V> implements III2_5<U, V> {
    c2_v_5: U | V
    constructor(p: U | V) {
      this.c2_v_5 = p
    }
  }
  class C3_5<U, V> implements II2_5<U, V> {
    c3_v_5: U | V
    constructor(p: U | V) {
      this.c3_v_5 = p
    }
  }
  function check_C1_5(a: Object) {
    expect(a instanceof C1_5).assertTrue()
    expect(a instanceof III1_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C1_5<number, null>).c1_v_5 as number).assertEqual(123)
  }
  function check_C2_5(a: Object) {
    expect(a instanceof C2_5).assertTrue()
    expect(a instanceof III2_5).assertTrue()
    expect(a instanceof II1_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C2_5<number, string>).c2_v_5 as number).assertEqual(6.7)
  }
  function check_C3_5(a: Object) {
    expect(a instanceof C3_5).assertTrue()
    expect(a instanceof II2_5).assertTrue()
    expect(a instanceof I1_5).assertTrue()
    expect(a instanceof I2_5).assertTrue()
    expect((a as C3_5<bigint, undefined>).c3_v_5 as bigint).assertEqual(321n)
  }
  function check_int_5(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    } else {
      check_C2_5(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_5
        expect(cond1).assertTrue()
      }
    }
  }
  function check_5(
    v: C1_5<number, null> |
    C2_5<number, string>,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_5
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number') {
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_5(v)
      } else {
        check_C2_5(v)
      }
      res = check_is_in_inter_type_5(
        v as III1_5<number, null> |
        III2_5<number, string> |
        II2_5<bigint, undefined> |
        number, is_subtype_of_inter_type, v_id
      )
      if (!res) {
        expect(v instanceof II1_5).assertFalse()
        check_is_not_in_I2_type_5(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_5(
    v: III1_5<number, null> |
    III2_5<number, string> |
    II2_5<bigint, undefined> |
    number, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_5(v)
    } else {
      check_C2_5(v)
    }
    if (v instanceof II1_5) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_5(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_5(v)
      } else {
        check_C2_5(v)
      }
      check_value_5(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_5).assertFalse()
  }
  export function runTest_5(): boolean {
    let v1: C1_5<number, null> | C2_5<number, string> = new C1_5<number, null>(123)
    let v2: C1_5<number, null> | C2_5<number, string> = new C2_5<number, string>(6.7)
    let res: boolean = check_5(v1, true, 1) && check_5(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

interface I1_5<U, V> {}
interface I2_5<U, V> {}
interface II1_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
interface II2_5<U, V> extends I1_5<U, V>, I2_5<U, V> {}
interface III1_5<U, V> extends II1_5<U, V> {}
interface III2_5<U, V> extends II1_5<U, V> {}
class C1_5<U, V> implements III1_5<U, V> {
  c1_v_5: U | V
  constructor(p: U | V) {
    this.c1_v_5 = p
  }
}
class C2_5<U, V> implements III2_5<U, V> {
  c2_v_5: U | V
  constructor(p: U | V) {
    this.c2_v_5 = p
  }
}
class C3_5<U, V> implements II2_5<U, V> {
  c3_v_5: U | V
  constructor(p: U | V) {
    this.c3_v_5 = p
  }
}
function check_C1_5(a: Object) {
  expect(a instanceof C1_5).assertTrue()
  expect(a instanceof III1_5).assertTrue()
  expect(a instanceof II1_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C1_5<number, null>).c1_v_5 as number).assertEqual(123)
}
function check_C2_5(a: Object) {
  expect(a instanceof C2_5).assertTrue()
  expect(a instanceof III2_5).assertTrue()
  expect(a instanceof II1_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C2_5<number, string>).c2_v_5 as number).assertEqual(6.7)
}
function check_C3_5(a: Object) {
  expect(a instanceof C3_5).assertTrue()
  expect(a instanceof II2_5).assertTrue()
  expect(a instanceof I1_5).assertTrue()
  expect(a instanceof I2_5).assertTrue()
  expect((a as C3_5<bigint, undefined>).c3_v_5 as bigint).assertEqual(321n)
}
function check_int_5(a: Object) {
  expect(typeof a === 'number').assertTrue()
  expect(a as number).assertEqual(123)
}
function check_value_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_C1_5(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_5
      expect(cond1).assertTrue()
    }
  } else {
    check_C3_5(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_5
      expect(cond1).assertTrue()
    }
  }
}
function check_5(
  v: III1_5<number, null> |
  II2_5<bigint, undefined> |
  III2_5<number, string>,
  is_subtype_of_inter_type: boolean, v_id: number
): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number'
  let cond1: boolean = v instanceof II1_5
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_5(v, is_subtype_of_inter_type, v_id)
  if (v instanceof III1_5 || v instanceof III2_5 || v instanceof II2_5 || typeof v === 'number') {
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_5(v)
    } else {
      check_C3_5(v)
    }
    res = check_is_in_inter_type_5(
      v as III1_5<number, null> |
      III2_5<number, string> |
      II2_5<bigint, undefined> |
      number, is_subtype_of_inter_type, v_id
    )
    if (!res) {
      expect(v instanceof II1_5).assertFalse()
      check_is_not_in_I2_type_5(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_5(
  v: III1_5<number, null> |
  III2_5<number, string> |
  II2_5<bigint, undefined> |
  number, is_subtype_of_inter_type: boolean, v_id: number
): boolean {
  check_value_5(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_C1_5(v)
  } else {
    check_C3_5(v)
  }
  if (v instanceof II1_5) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_5(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_5(v)
    } else {
      check_C3_5(v)
    }
    check_value_5(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_5(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_5(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof II1_5).assertFalse()
}

namespace testNS1_4 {
  interface I1_4<U, V> {}
  interface I2_4<U, V> {}
  interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
  interface II2_4<U=bigint, V=undefined> extends I1_4<U, V>, I2_4<U, V> {}
  interface III1_4<U=number, V=null> extends II1_4<U, V> {}
  interface III2_4<U=number, V=string> extends II1_4<U, V> {}
  class C1_4<U=number, V=null> implements III1_4<U, V> {
    c1_v_4: U | V
    constructor(p: U | V) {
      this.c1_v_4 = p
    }
  }
  class C2_4<U=number, V=string> implements III2_4<U, V> {
    c2_v_4: U | V
    constructor(p: U | V) {
      this.c2_v_4 = p
    }
  }
  class C3_4<U=bigint, V=undefined> implements II2_4<U, V> {
    c3_v_4: U | V
    constructor(p: U | V) {
      this.c3_v_4 = p
    }
  }
  function check_C1_4(a: Object) {
    expect(a instanceof C1_4).assertTrue()
    expect(a instanceof III1_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C1_4).c1_v_4 as number).assertEqual(123)
  }
  function check_C2_4(a: Object) {
    expect(a instanceof C2_4).assertTrue()
    expect(a instanceof III2_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C2_4).c2_v_4 as number).assertEqual(6.7)
  }
  function check_C3_4(a: Object) {
    expect(a instanceof C3_4).assertTrue()
    expect(a instanceof II2_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C3_4).c3_v_4 as bigint).assertEqual(321n)
  }
  function check_int_4(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    }
  }
  function check_4(v: III1_4 | II2_4 | III2_4, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_4
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number') {
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_4(v)
      } else {
        check_C3_4(v)
      }
      res = check_is_in_inter_type_4(v as III1_4 | III2_4 | II2_4 | number, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof II1_4).assertFalse()
        check_is_not_in_I2_type_4(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_4(
    v: III1_4 | III2_4 | II2_4 | number,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_4(v)
    } else {
      check_C3_4(v)
    }
    if (v instanceof II1_4) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_4(v)
      } else {
        check_C3_4(v)
      }
      check_value_4(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_4).assertFalse()
  }
  export function runTest_4(): boolean {
    let v1: III1_4 | II2_4 | III2_4 = new C1_4(123)
    let v2: III1_4 | II2_4 | III2_4 = new C3_4(321n)
    let res: boolean = check_4(v1, true, 1) && check_4(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_4 {
  interface I1_4<U, V> {}
  interface I2_4<U, V> {}
  interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
  interface II2_4<U=bigint, V=undefined> extends I1_4<U, V>, I2_4<U, V> {}
  interface III1_4<U=number, V=null> extends II1_4<U, V> {}
  interface III2_4<U=number, V=string> extends II1_4<U, V> {}
  class C1_4<U=number, V=null> implements III1_4<U, V> {
    c1_v_4: U | V
    constructor(p: U | V) {
      this.c1_v_4 = p
    }
  }
  class C2_4<U=number, V=string> implements III2_4<U, V> {
    c2_v_4: U | V
    constructor(p: U | V) {
      this.c2_v_4 = p
    }
  }
  class C3_4<U=bigint, V=undefined> implements II2_4<U, V> {
    c3_v_4: U | V
    constructor(p: U | V) {
      this.c3_v_4 = p
    }
  }
  function check_C1_4(a: Object) {
    expect(a instanceof C1_4).assertTrue()
    expect(a instanceof III1_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C1_4).c1_v_4 as number).assertEqual(123)
  }
  function check_C2_4(a: Object) {
    expect(a instanceof C2_4).assertTrue()
    expect(a instanceof III2_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C2_4).c2_v_4 as number).assertEqual(6.7)
  }
  function check_C3_4(a: Object) {
    expect(a instanceof C3_4).assertTrue()
    expect(a instanceof II2_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C3_4).c3_v_4 as bigint).assertEqual(321n)
  }
  function check_int_4(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    }
  }
  function check_4(
    v: II1_4<number, null> |
    II1_4<number, string> |
    II2_4, is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_4
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number') {
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_4(v)
      } else {
        check_C3_4(v)
      }
      res = check_is_in_inter_type_4(v as III1_4 | III2_4 | II2_4 | number, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof II1_4).assertFalse()
        check_is_not_in_I2_type_4(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_4(
    v: III1_4 | III2_4 | II2_4 | number,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_4(v)
    } else {
      check_C3_4(v)
    }
    if (v instanceof II1_4) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_4(v)
      } else {
        check_C3_4(v)
      }
      check_value_4(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_4).assertFalse()
  }
  export function runTest_4(): boolean {
    let v1: II1_4<number, null> | II1_4<number, string> | II2_4 = new C2_4(6.7)
    let v2: II1_4<number, null> | II1_4<number, string> | II2_4 = new C3_4(321n)
    let res: boolean = check_4(v1, true, 1) && check_4(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_4 {
  interface I1_4<U, V> {}
  interface I2_4<U, V> {}
  interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
  interface II2_4<U=bigint, V=undefined> extends I1_4<U, V>, I2_4<U, V> {}
  interface III1_4<U=number, V=null> extends II1_4<U, V> {}
  interface III2_4<U=number, V=string> extends II1_4<U, V> {}
  class C1_4<U=number, V=null> implements III1_4<U, V> {
    c1_v_4: U | V
    constructor(p: U | V) {
      this.c1_v_4 = p
    }
  }
  class C2_4<U=number, V=string> implements III2_4<U, V> {
    c2_v_4: U | V
    constructor(p: U | V) {
      this.c2_v_4 = p
    }
  }
  class C3_4<U=bigint, V=undefined> implements II2_4<U, V> {
    c3_v_4: U | V
    constructor(p: U | V) {
      this.c3_v_4 = p
    }
  }
  function check_C1_4(a: Object) {
    expect(a instanceof C1_4).assertTrue()
    expect(a instanceof III1_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C1_4).c1_v_4 as number).assertEqual(123)
  }
  function check_C2_4(a: Object) {
    expect(a instanceof C2_4).assertTrue()
    expect(a instanceof III2_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C2_4).c2_v_4 as number).assertEqual(6.7)
  }
  function check_C3_4(a: Object) {
    expect(a instanceof C3_4).assertTrue()
    expect(a instanceof II2_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C3_4).c3_v_4 as bigint).assertEqual(321n)
  }
  function check_int_4(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    }
  }
  function check_4(
    v: I1_4<number, null> | I2_4<bigint, undefined>,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_4
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number') {
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_4(v)
      } else {
        check_C3_4(v)
      }
      res = check_is_in_inter_type_4(v as III1_4 | III2_4 | II2_4 | number, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof II1_4).assertFalse()
        check_is_not_in_I2_type_4(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_4(
    v: III1_4 | III2_4 | II2_4 | number,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_4(v)
    } else {
      check_C3_4(v)
    }
    if (v instanceof II1_4) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_4(v)
      } else {
        check_C3_4(v)
      }
      check_value_4(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_4).assertFalse()
  }
  export function runTest_4(): boolean {
    let v1: I1_4<number, null> | I2_4<bigint, undefined> = new C1_4(123)
    let v2: I1_4<number, null> | I2_4<bigint, undefined> = new C3_4(321n)
    let res: boolean = check_4(v1, true, 1) && check_4(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_4 {
  interface I1_4<U, V> {}
  interface I2_4<U, V> {}
  interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
  interface II2_4<U=bigint, V=undefined> extends I1_4<U, V>, I2_4<U, V> {}
  interface III1_4<U=number, V=null> extends II1_4<U, V> {}
  interface III2_4<U=number, V=string> extends II1_4<U, V> {}
  class C1_4<U=number, V=null> implements III1_4<U, V> {
    c1_v_4: U | V
    constructor(p: U | V) {
      this.c1_v_4 = p
    }
  }
  class C2_4<U=number, V=string> implements III2_4<U, V> {
    c2_v_4: U | V
    constructor(p: U | V) {
      this.c2_v_4 = p
    }
  }
  class C3_4<U=bigint, V=undefined> implements II2_4<U, V> {
    c3_v_4: U | V
    constructor(p: U | V) {
      this.c3_v_4 = p
    }
  }
  function check_C1_4(a: Object) {
    expect(a instanceof C1_4).assertTrue()
    expect(a instanceof III1_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C1_4).c1_v_4 as number).assertEqual(123)
  }
  function check_C2_4(a: Object) {
    expect(a instanceof C2_4).assertTrue()
    expect(a instanceof III2_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C2_4).c2_v_4 as number).assertEqual(6.7)
  }
  function check_C3_4(a: Object) {
    expect(a instanceof C3_4).assertTrue()
    expect(a instanceof II2_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C3_4).c3_v_4 as bigint).assertEqual(321n)
  }
  function check_int_4(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    } else {
      check_C3_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    }
  }
  function check_4(
    v: I1_4<number, string> | I1_4<bigint, undefined>,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_4
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number') {
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_4(v)
      } else {
        check_C3_4(v)
      }
      res = check_is_in_inter_type_4(v as III1_4 | III2_4 | II2_4 | number, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof II1_4).assertFalse()
        check_is_not_in_I2_type_4(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_4
  (v: III1_4 | III2_4 | II2_4 | number,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_4(v)
    } else {
      check_C3_4(v)
    }
    if (v instanceof II1_4) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_4(v)
      } else {
        check_C3_4(v)
      }
      check_value_4(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_4).assertFalse()
  }
  export function runTest_4(): boolean {
    let v1: I1_4<number, string> | I1_4<bigint, undefined> = new C2_4(6.7)
    let v2: I1_4<number, string> | I1_4<bigint, undefined> = new C3_4(321n)
    let res: boolean = check_4(v1, true, 1) && check_4(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_4 {
  interface I1_4<U, V> {}
  interface I2_4<U, V> {}
  interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
  interface II2_4<U=bigint, V=undefined> extends I1_4<U, V>, I2_4<U, V> {}
  interface III1_4<U=number, V=null> extends II1_4<U, V> {}
  interface III2_4<U=number, V=string> extends II1_4<U, V> {}
  class C1_4<U=number, V=null> implements III1_4<U, V> {
    c1_v_4: U | V
    constructor(p: U | V) {
      this.c1_v_4 = p
    }
  }
  class C2_4<U=number, V=string> implements III2_4<U, V> {
    c2_v_4: U | V
    constructor(p: U | V) {
      this.c2_v_4 = p
    }
  }
  class C3_4<U=bigint, V=undefined> implements II2_4<U, V> {
    c3_v_4: U | V
    constructor(p: U | V) {
      this.c3_v_4 = p
    }
  }
  function check_C1_4(a: Object) {
    expect(a instanceof C1_4).assertTrue()
    expect(a instanceof III1_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C1_4).c1_v_4 as number).assertEqual(123)
  }
  function check_C2_4(a: Object) {
    expect(a instanceof C2_4).assertTrue()
    expect(a instanceof III2_4).assertTrue()
    expect(a instanceof II1_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C2_4).c2_v_4 as number).assertEqual(6.7)
  }
  function check_C3_4(a: Object) {
    expect(a instanceof C3_4).assertTrue()
    expect(a instanceof II2_4).assertTrue()
    expect(a instanceof I1_4).assertTrue()
    expect(a instanceof I2_4).assertTrue()
    expect((a as C3_4).c3_v_4 as bigint).assertEqual(321n)
  }
  function check_int_4(a: Object) {
    expect(typeof a === 'number').assertTrue()
    expect(a as number).assertEqual(123)
  }
  function check_value_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    } else {
      check_C2_4(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof II1_4
        expect(cond1).assertTrue()
      }
    }
  }
  function check_4(v: C1_4 | C2_4, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
    let cond1: boolean = v instanceof II1_4
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number') {
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_4(v)
      } else {
        check_C2_4(v)
      }
      res = check_is_in_inter_type_4(v as III1_4 | III2_4 | II2_4 | number, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof II1_4).assertFalse()
        check_is_not_in_I2_type_4(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_4(
    v: III1_4 | III2_4 | II2_4 | number,
    is_subtype_of_inter_type: boolean, v_id: number
  ): boolean {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_4(v)
    } else {
      check_C2_4(v)
    }
    if (v instanceof II1_4) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_4(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_4(v)
      } else {
        check_C2_4(v)
      }
      check_value_4(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof II1_4).assertFalse()
  }
  export function runTest_4(): boolean {
    let v1: C1_4 | C2_4 = new C1_4(123)
    let v2: C1_4 | C2_4 = new C2_4(6.7)
    let res: boolean = check_4(v1, true, 1) && check_4(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

interface I1_4<U, V> {}
interface I2_4<U, V> {}
interface II1_4<U, V> extends I1_4<U, V>, I2_4<U, V> {}
interface II2_4<U=bigint, V=undefined> extends I1_4<U, V>, I2_4<U, V> {}
interface III1_4<U=number, V=null> extends II1_4<U, V> {}
interface III2_4<U=number, V=string> extends II1_4<U, V> {}
class C1_4<U=number, V=null> implements III1_4<U, V> {
  c1_v_4: U | V
  constructor(p: U | V) {
    this.c1_v_4 = p
  }
}
class C2_4<U=number, V=string> implements III2_4<U, V> {
  c2_v_4: U | V
  constructor(p: U | V) {
    this.c2_v_4 = p
  }
}
class C3_4<U=bigint, V=undefined> implements II2_4<U, V> {
  c3_v_4: U | V
  constructor(p: U | V) {
    this.c3_v_4 = p
  }
}
function check_C1_4(a: Object) {
  expect(a instanceof C1_4).assertTrue()
  expect(a instanceof III1_4).assertTrue()
  expect(a instanceof II1_4).assertTrue()
  expect(a instanceof I1_4).assertTrue()
  expect(a instanceof I2_4).assertTrue()
  expect((a as C1_4).c1_v_4 as number).assertEqual(123)
}
function check_C2_4(a: Object) {
  expect(a instanceof C2_4).assertTrue()
  expect(a instanceof III2_4).assertTrue()
  expect(a instanceof II1_4).assertTrue()
  expect(a instanceof I1_4).assertTrue()
  expect(a instanceof I2_4).assertTrue()
  expect((a as C2_4).c2_v_4 as number).assertEqual(6.7)
}
function check_C3_4(a: Object) {
  expect(a instanceof C3_4).assertTrue()
  expect(a instanceof II2_4).assertTrue()
  expect(a instanceof I1_4).assertTrue()
  expect(a instanceof I2_4).assertTrue()
  expect((a as C3_4).c3_v_4 as bigint).assertEqual(321n)
}
function check_int_4(a: Object) {
  expect(typeof a === 'number').assertTrue()
  expect(a as number).assertEqual(123)
}
function check_value_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_C1_4(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_4
      expect(cond1).assertTrue()
    }
  } else {
    check_C3_4(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof II1_4
      expect(cond1).assertTrue()
    }
  }
}
function check_4(v: III1_4 | II2_4 | III2_4, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number'
  let cond1: boolean = v instanceof II1_4
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_4(v, is_subtype_of_inter_type, v_id)
  if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || typeof v === 'number') {
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_4(v)
    } else {
      check_C3_4(v)
    }
    res = check_is_in_inter_type_4(v as III1_4 | III2_4 | II2_4 | number, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof II1_4).assertFalse()
      check_is_not_in_I2_type_4(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_4(
  v: III1_4 | III2_4 | II2_4 | number,
  is_subtype_of_inter_type: boolean, v_id: number
): boolean {
  check_value_4(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_C1_4(v)
  } else {
    check_C3_4(v)
  }
  if (v instanceof II1_4) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_4(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_4(v)
    } else {
      check_C3_4(v)
    }
    check_value_4(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_4(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_4(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof II1_4).assertFalse()
}

export default function TypeTIsSubOfInterTypeOnGenTest02(): void {
  describe('TypeTIsSubOfInterTypeOnGenTest02', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0500
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0005
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfInterTypeOnGen0006';
      let v1: III1_4 | II2_4 | III2_4 = new C1_4(123)
      let v2: III1_4 | II2_4 | III2_4 = new C3_4(321n)
      let res: boolean = check_4(v1, true, 1) && check_4(v2, false, 2)
      expect(res).assertEqual(false)
      expect(testNS1_4.runTest_4()).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0600
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0006
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfInterTypeOnGen0006';
      let v1: III1_5<number, null> | II2_5<bigint, undefined> | III2_5<number, string> =
        new C1_5<number, null>(123)
      let v2: III1_5<number, null> | II2_5<bigint, undefined> | III2_5<number, string> =
        new C3_5<bigint, undefined>(321n)
      let res: boolean = check_5(v1, true, 1) && check_5(v2, false, 2)
      expect(res).assertEqual(false)
      expect(testNS1_5.runTest_5()).assertTrue()
      expect(testNS2_5.runTest_5()).assertTrue()
      expect(testNS3_5.runTest_5()).assertTrue()
      expect(testNS4_5.runTest_5()).assertTrue()
      expect(testNS5_5.runTest_5()).assertTrue()
    });
  })
}