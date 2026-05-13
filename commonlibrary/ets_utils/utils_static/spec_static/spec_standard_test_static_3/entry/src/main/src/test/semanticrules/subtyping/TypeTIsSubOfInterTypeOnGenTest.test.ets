import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => { resolve(0); }, time);
  });
}

namespace testNS1_0 {
  abstract class A_0<U, V> {}
  abstract class B1_0<U, V> extends A_0<U, V> {}
  class B2_0<U, V> extends A_0<U, V> {
    b2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_0 = p
    }
  }
  class C1_0<U, V> extends B1_0<U, V> {
    c1_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_0 = p
    }
  }
  class C2_0<U, V> extends B1_0<U, V> {
    c2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_0 = p
    }
  }
  class Other_0<T> {
    other_v_0: T
    constructor (p: T) {
      this.other_v_0 = p
    }
  }
  function check_C1_0(a: Object) {
    expect(a instanceof C1_0).assertTrue()
    expect((a as C1_0<number, null>).c1_v_0 as number).assertEqual(321)
  }
  function check_C2_0(a: Object) {
    expect(a instanceof C2_0).assertTrue()
    expect((a as C2_0<number, string>).c2_v_0 as number).assertEqual(6.7)
  }
  function check_B2_0(a: Object) {
    expect(a instanceof B2_0).assertTrue()
    expect((a as B2_0<bigint, undefined>).b2_v_0 as bigint).assertEqual(123n)
  }
  function check_Other_0(a: Object) {
    expect(a instanceof Other_0).assertTrue()
    expect((a as Other_0<string>).other_v_0 as string).assertEqual("other")
  }
  function check_value_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    } else {
      check_B2_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    }
  }
  function check_0(v: B2_0<bigint, undefined> | Other_0<string> | C1_0<number, null>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
    let cond1: boolean = v instanceof B1_0
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0) {
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_0(v)
      } else {
        check_B2_0(v)
      }
      res = check_is_in_inter_type_0(v as C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_0).assertFalse()
        check_is_not_in_I2_type_0(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_0(v: C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_0(v)
    } else {
      check_B2_0(v)
    }
    if (v instanceof B1_0) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_0(v)
      } else {
        check_B2_0(v)
      }
      check_value_0(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_0).assertFalse()
  }
  export function runTest_0(): boolean {
    let v1: B2_0<bigint, undefined> | Other_0<string> | C1_0<number, null> = new C1_0<number, null>(321)
    let v2: B2_0<bigint, undefined> | Other_0<string> | C1_0<number, null> = new B2_0<bigint, undefined>(123n)
    let res: boolean = check_0(v1, true, 1) && check_0(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}
namespace testNS2_0 {
  abstract class A_0<U, V> {}
  abstract class B1_0<U, V> extends A_0<U, V> {}
  class B2_0<U, V> extends A_0<U, V> {
    b2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_0 = p
    }
  }
  class C1_0<U, V> extends B1_0<U, V> {
    c1_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_0 = p
    }
  }
  class C2_0<U, V> extends B1_0<U, V> {
    c2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_0 = p
    }
  }
  class Other_0<T> {
    other_v_0: T
    constructor (p: T) {
      this.other_v_0 = p
    }
  }
  function check_C1_0(a: Object) {
    expect(a instanceof C1_0).assertTrue()
    expect((a as C1_0<number, null>).c1_v_0 as number).assertEqual(321)
  }
  function check_C2_0(a: Object) {
    expect(a instanceof C2_0).assertTrue()
    expect((a as C2_0<number, string>).c2_v_0 as number).assertEqual(6.7)
  }
  function check_B2_0(a: Object) {
    expect(a instanceof B2_0).assertTrue()
    expect((a as B2_0<bigint, undefined>).b2_v_0 as bigint).assertEqual(123n)
  }
  function check_Other_0(a: Object) {
    expect(a instanceof Other_0).assertTrue()
    expect((a as Other_0<string>).other_v_0 as string).assertEqual("other")
  }
  function check_value_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    } else {
      check_B2_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    }
  }
  function check_0(v: B1_0<number, null> | B1_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
    let cond1: boolean = v instanceof B1_0
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0) {
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_0(v)
      } else {
        check_B2_0(v)
      }
      res = check_is_in_inter_type_0(v as C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_0).assertFalse()
        check_is_not_in_I2_type_0(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_0(v: C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_0(v)
    } else {
      check_B2_0(v)
    }
    if (v instanceof B1_0) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_0(v)
      } else {
        check_B2_0(v)
      }
      check_value_0(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_0).assertFalse()
  }
  export function runTest_0(): boolean {
    let v1: B1_0<number, null> | B1_0<number, string> | B2_0<bigint, undefined> | Other_0<string> = new C2_0<number, string>(6.7)
    let v2: B1_0<number, null> | B1_0<number, string> | B2_0<bigint, undefined> | Other_0<string> = new B2_0<bigint, undefined>(123n)
    let res: boolean = check_0(v1, true, 1) && check_0(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_0 {
  abstract class A_0<U, V> {}
  abstract class B1_0<U, V> extends A_0<U, V> {}
  class B2_0<U, V> extends A_0<U, V> {
    b2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_0 = p
    }
  }
  class C1_0<U, V> extends B1_0<U, V> {
    c1_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_0 = p
    }
  }
  class C2_0<U, V> extends B1_0<U, V> {
    c2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_0 = p
    }
  }
  class Other_0<T> {
    other_v_0: T
    constructor (p: T) {
      this.other_v_0 = p
    }
  }
  function check_C1_0(a: Object) {
    expect(a instanceof C1_0).assertTrue()
    expect((a as C1_0<number, null>).c1_v_0 as number).assertEqual(321)
  }
  function check_C2_0(a: Object) {
    expect(a instanceof C2_0).assertTrue()
    expect((a as C2_0<number, string>).c2_v_0 as number).assertEqual(6.7)
  }
  function check_B2_0(a: Object) {
    expect(a instanceof B2_0).assertTrue()
    expect((a as B2_0<bigint, undefined>).b2_v_0 as bigint).assertEqual(123n)
  }
  function check_Other_0(a: Object) {
    expect(a instanceof Other_0).assertTrue()
    expect((a as Other_0<string>).other_v_0 as string).assertEqual("other")
  }
  function check_value_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    } else {
      check_B2_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    }
  }
  function check_0(v: A_0<number, null> | A_0<number, string> | A_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
    let cond1: boolean = v instanceof B1_0
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0) {
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_0(v)
      } else {
        check_B2_0(v)
      }
      res = check_is_in_inter_type_0(v as C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_0).assertFalse()
        check_is_not_in_I2_type_0(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_0(v: C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_0(v)
    } else {
      check_B2_0(v)
    }
    if (v instanceof B1_0) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_0(v)
      } else {
        check_B2_0(v)
      }
      check_value_0(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_0).assertFalse()
  }
  export function runTest_0(): boolean {
    let v1: A_0<number, null> | A_0<number, string> | A_0<bigint, undefined> | Other_0<string> = new C2_0<number, string>(6.7)
    let v2: A_0<number, null> | A_0<number, string> | A_0<bigint, undefined> | Other_0<string> = new B2_0<bigint, undefined>(123n)
    let res: boolean = check_0(v1, true, 1) && check_0(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}
namespace testNS4_0 {
  abstract class A_0<U, V> {}
  abstract class B1_0<U, V> extends A_0<U, V> {}
  class B2_0<U, V> extends A_0<U, V> {
    b2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_0 = p
    }
  }
  class C1_0<U, V> extends B1_0<U, V> {
    c1_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_0 = p
    }
  }
  class C2_0<U, V> extends B1_0<U, V> {
    c2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_0 = p
    }
  }
  class Other_0<T> {
    other_v_0: T
    constructor (p: T) {
      this.other_v_0 = p
    }
  }
  function check_C1_0(a: Object) {
    expect(a instanceof C1_0).assertTrue()
    expect((a as C1_0<number, null>).c1_v_0 as number).assertEqual(321)
  }
  function check_C2_0(a: Object) {
    expect(a instanceof C2_0).assertTrue()
    expect((a as C2_0<number, string>).c2_v_0 as number).assertEqual(6.7)
  }
  function check_B2_0(a: Object) {
    expect(a instanceof B2_0).assertTrue()
    expect((a as B2_0<bigint, undefined>).b2_v_0 as bigint).assertEqual(123n)
  }
  function check_Other_0(a: Object) {
    expect(a instanceof Other_0).assertTrue()
    expect((a as Other_0<string>).other_v_0 as string).assertEqual("other")
  }
  function check_value_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_Other_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    } else {
      check_B2_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    }
  }
  function check_0(v: B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
    let cond1: boolean = v instanceof B1_0
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0) {
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_Other_0(v)
      } else {
        check_B2_0(v)
      }
      res = check_is_in_inter_type_0(v as C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_0).assertFalse()
        check_is_not_in_I2_type_0(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_0(v: C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_Other_0(v)
    } else {
      check_B2_0(v)
    }
    if (v instanceof B1_0) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_Other_0(v)
      } else {
        check_B2_0(v)
      }
      check_value_0(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_0).assertFalse()
  }
  export function runTest_0(): boolean {
    let v1: B2_0<bigint, undefined> | Other_0<string> = new Other_0<string>("other")
    let v2: B2_0<bigint, undefined> | Other_0<string> = new B2_0<bigint, undefined>(123n)
    let res: boolean = check_0(v1, false, 1) && check_0(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_0 {
  abstract class A_0<U, V> {}
  abstract class B1_0<U, V> extends A_0<U, V> {}
  class B2_0<U, V> extends A_0<U, V> {
    b2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_0 = p
    }
  }
  class C1_0<U, V> extends B1_0<U, V> {
    c1_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_0 = p
    }
  }
  class C2_0<U, V> extends B1_0<U, V> {
    c2_v_0: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_0 = p
    }
  }
  class Other_0<T> {
    other_v_0: T
    constructor (p: T) {
      this.other_v_0 = p
    }
  }
  function check_C1_0(a: Object) {
    expect(a instanceof C1_0).assertTrue()
    expect((a as C1_0<number, null>).c1_v_0 as number).assertEqual(321)
  }
  function check_C2_0(a: Object) {
    expect(a instanceof C2_0).assertTrue()
    expect((a as C2_0<number, string>).c2_v_0 as number).assertEqual(6.7)
  }
  function check_B2_0(a: Object) {
    expect(a instanceof B2_0).assertTrue()
    expect((a as B2_0<bigint, undefined>).b2_v_0 as bigint).assertEqual(123n)
  }
  function check_Other_0(a: Object) {
    expect(a instanceof Other_0).assertTrue()
    expect((a as Other_0<string>).other_v_0 as string).assertEqual("other")
  }
  function check_value_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    } else {
      check_C2_0(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_0
        expect(cond1).assertTrue()
      }
    }
  }
  function check_0(v: C1_0<number, null> | C2_0<number, string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
    let cond1: boolean = v instanceof B1_0
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0) {
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_0(v)
      } else {
        check_C2_0(v)
      }
      res = check_is_in_inter_type_0(v as C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_0).assertFalse()
        check_is_not_in_I2_type_0(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_0(v: C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_0(v)
    } else {
      check_C2_0(v)
    }
    if (v instanceof B1_0) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_0(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_0(v)
      } else {
        check_C2_0(v)
      }
      check_value_0(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_0).assertFalse()
  }
  export function runTest_0(): boolean {
    let v1: C1_0<number, null> | C2_0<number, string> = new C1_0<number, null>(321)
    let v2: C1_0<number, null> | C2_0<number, string> = new C2_0<number, string>(6.7)
    let res: boolean = check_0(v1, true, 1) && check_0(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

abstract class A_0<U, V> {}
abstract class B1_0<U, V> extends A_0<U, V> {}
class B2_0<U, V> extends A_0<U, V> {
  b2_v_0: U | V
  constructor (p: U | V) {
    super()
    this.b2_v_0 = p
  }
}
class C1_0<U, V> extends B1_0<U, V> {
  c1_v_0: U | V
  constructor (p: U | V) {
    super()
    this.c1_v_0 = p
  }
}
class C2_0<U, V> extends B1_0<U, V> {
  c2_v_0: U | V
  constructor (p: U | V) {
    super()
    this.c2_v_0 = p
  }
}
class Other_0<T> {
  other_v_0: T
  constructor (p: T) {
    this.other_v_0 = p
  }
}
function check_C1_0(a: Object) {
  expect(a instanceof C1_0).assertTrue()
  expect((a as C1_0<number, null>).c1_v_0 as number).assertEqual(321)
}
function check_C2_0(a: Object) {
  expect(a instanceof C2_0).assertTrue()
  expect((a as C2_0<number, string>).c2_v_0 as number).assertEqual(6.7)
}
function check_B2_0(a: Object) {
  expect(a instanceof B2_0).assertTrue()
  expect((a as B2_0<bigint, undefined>).b2_v_0 as bigint).assertEqual(123n)
}
function check_Other_0(a: Object) {
  expect(a instanceof Other_0).assertTrue()
  expect((a as Other_0<string>).other_v_0 as string).assertEqual("other")
}
function check_value_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_C1_0(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof B1_0
      expect(cond1).assertTrue()
    }
  } else {
    check_B2_0(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof B1_0
      expect(cond1).assertTrue()
    }
  }
}
function check_0(v: B2_0<bigint, undefined> | Other_0<string> | C1_0<number, null>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0
  let cond1: boolean = v instanceof B1_0
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_0(v, is_subtype_of_inter_type, v_id)
  if (v instanceof C1_0 || v instanceof C2_0 || v instanceof B2_0 || v instanceof Other_0) {
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_0(v)
    } else {
      check_B2_0(v)
    }
    res = check_is_in_inter_type_0(v as C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof B1_0).assertFalse()
      check_is_not_in_I2_type_0(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_0(v: C1_0<number, null> | C2_0<number, string> | B2_0<bigint, undefined> | Other_0<string>, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  check_value_0(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_C1_0(v)
  } else {
    check_B2_0(v)
  }
  if (v instanceof B1_0) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_0(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_0(v)
    } else {
      check_B2_0(v)
    }
    check_value_0(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_0(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_0(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof B1_0).assertFalse()
}
namespace testNS1_1 {
  abstract class A_1<U, V> {}
  abstract class B1_1<U, V> extends A_1<U, V> {}
  class B2_1<U=bigint, V=undefined> extends A_1<U, V> {
    b2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_1 = p
    }
  }
  class C1_1<U=number, V=null> extends B1_1<U, V> {
    c1_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_1 = p
    }
  }
  class C2_1<U=number, V=string> extends B1_1<U, V> {
    c2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_1 = p
    }
  }
  class Other_1<T=string> {
    other_v_1: T
    constructor (p: T) {
      this.other_v_1 = p
    }
  }
  function check_C1_1(a: Object) {
    expect(a instanceof C1_1).assertTrue()
    expect((a as C1_1).c1_v_1 as number).assertEqual(321)
  }
  function check_C2_1(a: Object) {
    expect(a instanceof C2_1).assertTrue()
    expect((a as C2_1).c2_v_1 as number).assertEqual(6.7)
  }
  function check_B2_1(a: Object) {
    expect(a instanceof B2_1).assertTrue()
    expect((a as B2_1).b2_v_1 as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Object) {
    expect(a instanceof Other_1).assertTrue()
    expect((a as Other_1).other_v_1 as string).assertEqual("other")
  }
  function check_value_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    } else {
      check_B2_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    }
  }
  function check_1(v: B2_1 | Other_1 | C1_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
    let cond1: boolean = v instanceof B1_1
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1) {
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_1(v)
      } else {
        check_B2_1(v)
      }
      res = check_is_in_inter_type_1(v as C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_1).assertFalse()
        check_is_not_in_I2_type_1(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_1(v: C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_1(v)
    } else {
      check_B2_1(v)
    }
    if (v instanceof B1_1) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_1(v)
      } else {
        check_B2_1(v)
      }
      check_value_1(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_1).assertFalse()
  }
  export function runTest_1(): boolean {
    let v1: B2_1 | Other_1 | C1_1 = new C1_1(321)
    let v2: B2_1 | Other_1 | C1_1 = new B2_1(123n)
    let res: boolean = check_1(v1, true, 1) && check_1(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_1 {
  abstract class A_1<U, V> {}
  abstract class B1_1<U, V> extends A_1<U, V> {}
  class B2_1<U=bigint, V=undefined> extends A_1<U, V> {
    b2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_1 = p
    }
  }
  class C1_1<U=number, V=null> extends B1_1<U, V> {
    c1_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_1 = p
    }
  }
  class C2_1<U=number, V=string> extends B1_1<U, V> {
    c2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_1 = p
    }
  }
  class Other_1<T=string> {
    other_v_1: T
    constructor (p: T) {
      this.other_v_1 = p
    }
  }
  function check_C1_1(a: Object) {
    expect(a instanceof C1_1).assertTrue()
    expect((a as C1_1).c1_v_1 as number).assertEqual(321)
  }
  function check_C2_1(a: Object) {
    expect(a instanceof C2_1).assertTrue()
    expect((a as C2_1).c2_v_1 as number).assertEqual(6.7)
  }
  function check_B2_1(a: Object) {
    expect(a instanceof B2_1).assertTrue()
    expect((a as B2_1).b2_v_1 as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Object) {
    expect(a instanceof Other_1).assertTrue()
    expect((a as Other_1).other_v_1 as string).assertEqual("other")
  }
  function check_value_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    } else {
      check_B2_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    }
  }
  function check_1(v: B1_1<number, null> | B1_1<number, string> | B2_1 | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
    let cond1: boolean = v instanceof B1_1
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1) {
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_1(v)
      } else {
        check_B2_1(v)
      }
      res = check_is_in_inter_type_1(v as C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_1).assertFalse()
        check_is_not_in_I2_type_1(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_1(v: C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_1(v)
    } else {
      check_B2_1(v)
    }
    if (v instanceof B1_1) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_1(v)
      } else {
        check_B2_1(v)
      }
      check_value_1(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_1).assertFalse()
  }
  export function runTest_1(): boolean {
    let v1: B1_1<number, null> | B1_1<number, string> | B2_1 | Other_1 = new C2_1(6.7)
    let v2: B1_1<number, null> | B1_1<number, string> | B2_1 | Other_1 = new B2_1(123n)
    let res: boolean = check_1(v1, true, 1) && check_1(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}
namespace testNS3_1 {
  abstract class A_1<U, V> {}
  abstract class B1_1<U, V> extends A_1<U, V> {}
  class B2_1<U=bigint, V=undefined> extends A_1<U, V> {
    b2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_1 = p
    }
  }
  class C1_1<U=number, V=null> extends B1_1<U, V> {
    c1_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_1 = p
    }
  }
  class C2_1<U=number, V=string> extends B1_1<U, V> {
    c2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_1 = p
    }
  }
  class Other_1<T=string> {
    other_v_1: T
    constructor (p: T) {
      this.other_v_1 = p
    }
  }
  function check_C1_1(a: Object) {
    expect(a instanceof C1_1).assertTrue()
    expect((a as C1_1).c1_v_1 as number).assertEqual(321)
  }
  function check_C2_1(a: Object) {
    expect(a instanceof C2_1).assertTrue()
    expect((a as C2_1).c2_v_1 as number).assertEqual(6.7)
  }
  function check_B2_1(a: Object) {
    expect(a instanceof B2_1).assertTrue()
    expect((a as B2_1).b2_v_1 as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Object) {
    expect(a instanceof Other_1).assertTrue()
    expect((a as Other_1).other_v_1 as string).assertEqual("other")
  }
  function check_value_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C2_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    } else {
      check_B2_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    }
  }
  function check_1(v: A_1<number, null> | A_1<number, string> | A_1<bigint, undefined> | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
    let cond1: boolean = v instanceof B1_1
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1) {
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_1(v)
      } else {
        check_B2_1(v)
      }
      res = check_is_in_inter_type_1(v as C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_1).assertFalse()
        check_is_not_in_I2_type_1(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_1(v: C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C2_1(v)
    } else {
      check_B2_1(v)
    }
    if (v instanceof B1_1) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C2_1(v)
      } else {
        check_B2_1(v)
      }
      check_value_1(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_1).assertFalse()
  }
  export function runTest_1(): boolean {
    let v1: A_1<number, null> | A_1<number, string> | A_1<bigint, undefined> | Other_1 = new C2_1(6.7)
    let v2: A_1<number, null> | A_1<number, string> | A_1<bigint, undefined> | Other_1 = new B2_1(123n)
    let res: boolean = check_1(v1, true, 1) && check_1(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_1 {
  abstract class A_1<U, V> {}
  abstract class B1_1<U, V> extends A_1<U, V> {}
  class B2_1<U=bigint, V=undefined> extends A_1<U, V> {
    b2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_1 = p
    }
  }
  class C1_1<U=number, V=null> extends B1_1<U, V> {
    c1_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_1 = p
    }
  }
  class C2_1<U=number, V=string> extends B1_1<U, V> {
    c2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_1 = p
    }
  }
  class Other_1<T=string> {
    other_v_1: T
    constructor (p: T) {
      this.other_v_1 = p
    }
  }
  function check_C1_1(a: Object) {
    expect(a instanceof C1_1).assertTrue()
    expect((a as C1_1).c1_v_1 as number).assertEqual(321)
  }
  function check_C2_1(a: Object) {
    expect(a instanceof C2_1).assertTrue()
    expect((a as C2_1).c2_v_1 as number).assertEqual(6.7)
  }
  function check_B2_1(a: Object) {
    expect(a instanceof B2_1).assertTrue()
    expect((a as B2_1).b2_v_1 as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Object) {
    expect(a instanceof Other_1).assertTrue()
    expect((a as Other_1).other_v_1 as string).assertEqual("other")
  }
  function check_value_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_Other_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    } else {
      check_B2_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    }
  }
  function check_1(v: B2_1 | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
    let cond1: boolean = v instanceof B1_1
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1) {
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_Other_1(v)
      } else {
        check_B2_1(v)
      }
      res = check_is_in_inter_type_1(v as C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_1).assertFalse()
        check_is_not_in_I2_type_1(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_1(v: C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_Other_1(v)
    } else {
      check_B2_1(v)
    }
    if (v instanceof B1_1) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_Other_1(v)
      } else {
        check_B2_1(v)
      }
      check_value_1(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_1).assertFalse()
  }
  export function runTest_1(): boolean {
    let v1: B2_1 | Other_1 = new Other_1("other")
    let v2: B2_1 | Other_1 = new B2_1(123n)
    let res: boolean = check_1(v1, false, 1) && check_1(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_1 {
  abstract class A_1<U, V> {}
  abstract class B1_1<U, V> extends A_1<U, V> {}
  class B2_1<U=bigint, V=undefined> extends A_1<U, V> {
    b2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.b2_v_1 = p
    }
  }
  class C1_1<U=number, V=null> extends B1_1<U, V> {
    c1_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c1_v_1 = p
    }
  }
  class C2_1<U=number, V=string> extends B1_1<U, V> {
    c2_v_1: U | V
    constructor (p: U | V) {
      super()
      this.c2_v_1 = p
    }
  }
  class Other_1<T=string> {
    other_v_1: T
    constructor (p: T) {
      this.other_v_1 = p
    }
  }
  function check_C1_1(a: Object) {
    expect(a instanceof C1_1).assertTrue()
    expect((a as C1_1).c1_v_1 as number).assertEqual(321)
  }
  function check_C2_1(a: Object) {
    expect(a instanceof C2_1).assertTrue()
    expect((a as C2_1).c2_v_1 as number).assertEqual(6.7)
  }
  function check_B2_1(a: Object) {
    expect(a instanceof B2_1).assertTrue()
    expect((a as B2_1).b2_v_1 as bigint).assertEqual(123n)
  }
  function check_Other_1(a: Object) {
    expect(a instanceof Other_1).assertTrue()
    expect((a as Other_1).other_v_1 as string).assertEqual("other")
  }
  function check_value_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    if (v_id == 1) {
      check_C1_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    } else {
      check_C2_1(v)
      if (is_subtype_of_inter_type) {
        let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
        expect(cond0).assertTrue()
        let cond1: boolean = v instanceof B1_1
        expect(cond1).assertTrue()
      }
    }
  }
  function check_1(v: C1_1 | C2_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    let res: boolean = false
    let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
    let cond1: boolean = v instanceof B1_1
    let cmp: boolean = cond0 && cond1
    expect(cmp).assertEqual(is_subtype_of_inter_type)
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1) {
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_1(v)
      } else {
        check_C2_1(v)
      }
      res = check_is_in_inter_type_1(v as C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof B1_1).assertFalse()
        check_is_not_in_I2_type_1(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_1(v: C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_1(v)
    } else {
      check_C2_1(v)
    }
    if (v instanceof B1_1) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_1(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        check_C1_1(v)
      } else {
        check_C2_1(v)
      }
      check_value_1(v, is_subtype_of_inter_type, v_id)
      return true
    } else {
      return false
    }
  }
  function check_is_not_in_I2_type_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof B1_1).assertFalse()
  }
  export function runTest_1(): boolean {
    let v1: C1_1 | C2_1 = new C1_1(321)
    let v2: C1_1 | C2_1 = new C2_1(6.7)
    let res: boolean = check_1(v1, true, 1) && check_1(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

abstract class A_1<U, V> {}
abstract class B1_1<U, V> extends A_1<U, V> {}
class B2_1<U=bigint, V=undefined> extends A_1<U, V> {
  b2_v_1: U | V
  constructor (p: U | V) {
    super()
    this.b2_v_1 = p
  }
}
class C1_1<U=number, V=null> extends B1_1<U, V> {
  c1_v_1: U | V
  constructor (p: U | V) {
    super()
    this.c1_v_1 = p
  }
}
class C2_1<U=number, V=string> extends B1_1<U, V> {
  c2_v_1: U | V
  constructor (p: U | V) {
    super()
    this.c2_v_1 = p
  }
}
class Other_1<T=string> {
  other_v_1: T
  constructor (p: T) {
    this.other_v_1 = p
  }
}
function check_C1_1(a: Object) {
  expect(a instanceof C1_1).assertTrue()
  expect((a as C1_1).c1_v_1 as number).assertEqual(321)
}
function check_C2_1(a: Object) {
  expect(a instanceof C2_1).assertTrue()
  expect((a as C2_1).c2_v_1 as number).assertEqual(6.7)
}
function check_B2_1(a: Object) {
  expect(a instanceof B2_1).assertTrue()
  expect((a as B2_1).b2_v_1 as bigint).assertEqual(123n)
}
function check_Other_1(a: Object) {
  expect(a instanceof Other_1).assertTrue()
  expect((a as Other_1).other_v_1 as string).assertEqual("other")
}
function check_value_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  if (v_id == 1) {
    check_C1_1(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof B1_1
      expect(cond1).assertTrue()
    }
  } else {
    check_B2_1(v)
    if (is_subtype_of_inter_type) {
      let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
      expect(cond0).assertTrue()
      let cond1: boolean = v instanceof B1_1
      expect(cond1).assertTrue()
    }
  }
}
function check_1(v: B2_1 | Other_1 | C1_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  let res: boolean = false
  let cond0: boolean = v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1
  let cond1: boolean = v instanceof B1_1
  let cmp: boolean = cond0 && cond1
  expect(cmp).assertEqual(is_subtype_of_inter_type)
  check_value_1(v, is_subtype_of_inter_type, v_id)
  if (v instanceof C1_1 || v instanceof C2_1 || v instanceof B2_1 || v instanceof Other_1) {
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_1(v)
    } else {
      check_B2_1(v)
    }
    res = check_is_in_inter_type_1(v as C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof B1_1).assertFalse()
      check_is_not_in_I2_type_1(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_1(v: C1_1 | C2_1 | B2_1 | Other_1, is_subtype_of_inter_type: boolean, v_id: number): boolean {
  check_value_1(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    check_C1_1(v)
  } else {
    check_B2_1(v)
  }
  if (v instanceof B1_1) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_1(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      check_C1_1(v)
    } else {
      check_B2_1(v)
    }
    check_value_1(v, is_subtype_of_inter_type, v_id)
    return true
  } else {
    return false
  }
}
function check_is_not_in_I2_type_1(v: Object, is_subtype_of_inter_type: boolean, v_id: number): void {
  check_value_1(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof B1_1).assertFalse()
}

export default function TypeTIsSubOfInterTypeOnGenTest(): void {
  describe('TypeTIsSubOfInterTypeOnGenTest', () => {
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0100
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0001
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfInterTypeOnGen0001';
      let v1: B2_0<bigint, undefined> | Other_0<string> | C1_0<number, null> = new C1_0<number, null>(321)
      let v2: B2_0<bigint, undefined> | Other_0<string> | C1_0<number, null> = new B2_0<bigint, undefined>(123n)
      let res: boolean = check_0(v1, true, 1) && check_0(v2, false, 2)
      expect(res).assertEqual(false)
      expect(testNS1_0.runTest_0()).assertTrue()
      expect(testNS2_0.runTest_0()).assertTrue()
      expect(testNS3_0.runTest_0()).assertTrue()
      expect(testNS4_0.runTest_0()).assertTrue()
      expect(testNS5_0.runTest_0()).assertTrue()
    });

    /**
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_GEN_0200
     * @tc.name      testTypeTIsSubOfInterTypeOnGen0002
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfInterTypeOnGen0002';
      let v1: B2_1 | Other_1 | C1_1 = new C1_1(321)
      let v2: B2_1 | Other_1 | C1_1 = new B2_1(123n)
      let res: boolean = check_1(v1, true, 1) && check_1(v2, false, 2)
      expect(res).assertEqual(false)
      expect(testNS1_1.runTest_1()).assertTrue()
      expect(testNS2_1.runTest_1()).assertTrue()
      expect(testNS3_1.runTest_1()).assertTrue()
      expect(testNS4_1.runTest_1()).assertTrue()
      expect(testNS5_1.runTest_1()).assertTrue()
    });
  })
}