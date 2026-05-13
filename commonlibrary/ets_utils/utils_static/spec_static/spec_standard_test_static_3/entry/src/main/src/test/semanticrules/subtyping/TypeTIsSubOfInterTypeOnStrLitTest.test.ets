import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index'
namespace testNS1_6 {
  // 修改：a 类型 Object -> Object | null | undefined
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  // 修改：a 类型 Object -> Object | null | undefined
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  // 修改：v 类型 Object -> Object | null | undefined
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof int).assertTrue()
    if (v_id == 1) {
      expect((v as int)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123)
      }
    }
    else {
      expect((v as int)).assertEqual(456)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(456)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(456)
      }
    }
  }
  function check_6(v: int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: int = 123
    let v2: int = 456
    let res: boolean =
      check_6(v1, true, 1) &&
      check_6(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS2_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof byte).assertTrue()
    if (v_id == 1) {
      expect((v as byte)).assertEqual(4)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(4)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(4)
      }
    }
    else {
      expect((v as byte)).assertEqual(5)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(5)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(5)
      }
    }
  }
  function check_6(v: byte,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: byte = 4
    let v2: byte = 5
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof short).assertTrue()
    if (v_id == 1) {
      expect((v as short)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123)
      }
    }
    else {
      expect((v as short)).assertEqual(456)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(456)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(456)
      }
    }
  }
  function check_6(v: short,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: short = 123
    let v2: short = 456
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof float).assertTrue()
    if (v_id == 1) {
      expect((v as float)).assertEqual(123.0f)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123.0f)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123.0f)
      }
    }
    else {
      expect((v as float)).assertEqual(45.6f)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(45.6f)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(45.6f)
      }
    }
  }
  function check_6(v: float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: float = 123.0f
    let v2: float = 45.6f
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof bigint).assertTrue()
    if (v_id == 1) {
      expect((v as bigint)).assertEqual(123n)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123n)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123n)
      }
    }
    else {
      expect((v as bigint)).assertEqual(456n)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(456n)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(456n)
      }
    }
  }
  function check_6(v: bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: bigint = 123n
    let v2: bigint = 456n
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS6_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof string).assertTrue()
    if (v_id == 1) {
      expect((v as string)).assertEqual("abc")
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual("abc")
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual("abc")
      }
    }
    else {
      expect((v as string)).assertEqual("In Progress")
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual("In Progress")
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual("In Progress")
      }
    }
  }
  function check_6(v: string,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: string = "abc"
    let v2: string = "In Progress"
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS7_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof char).assertTrue()
    if (v_id == 1) {
      expect((v as char)).assertEqual(c'a')
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(c'a')
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(c'a')
      }
    }
    else {
      expect((v as char)).assertEqual(c'b')
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(c'b')
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(c'b')
      }
    }
  }
  function check_6(v: char,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: char = c'a'
    let v2: char = c'b'
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS8_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof Object).assertTrue()
    if (v_id == 1) {
      expect((v as Object)).assertEqual(5n)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(5n)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(5n)
      }
    }
    else {
      expect((v as Object)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123)
      }
    }
  }
  function check_6(v: Object,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: Object = 5n
    let v2: Object = 123
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS9_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof Object || v instanceof undefined).assertTrue()
    if (v_id == 1) {
      expect((v as Object | undefined)).assertEqual(567)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(567)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(567)
      }
    }
    else {
      expect((v as Object | undefined)).assertEqual(undefined)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(undefined)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(undefined)
      }
    }
  }
  function check_6(v: Object | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: Object | undefined = 567
    let v2: Object | undefined = undefined
    let res: boolean =
      check_6(v1, true, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS10_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof Object || v instanceof undefined || v === null).assertTrue()
    if (v_id == 1) {
      expect((v as Object | undefined | null)).assertEqual(null)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(null)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(null)
      }
    }
    else {
      expect((v as Object | undefined | null)).assertEqual(undefined)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(undefined)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(undefined)
      }
    }
  }
  function check_6(v: Object | undefined | null,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: Object | undefined | null = null
    let v2: Object | undefined | null = undefined
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS11_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof undefined).assertTrue()
    if (v_id == 1) {
      expect((v as undefined)).assertEqual(undefined)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(undefined)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(undefined)
      }
    }
    else {
      expect((v as undefined)).assertEqual(undefined)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(undefined)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(undefined)
      }
    }
  }
  function check_6(v: undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: undefined = undefined
    let v2: undefined = undefined
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS12_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v === null).assertTrue()
    if (v_id == 1) {
      expect((v as null)).assertEqual(null)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(null)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(null)
      }
    }
    else {
      expect((v as null)).assertEqual(null)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(null)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(null)
      }
    }
  }
  function check_6(v: null,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: null = null
    let v2: null = null
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS13_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof Object).assertTrue()
    if (v_id == 1) {
      expect((v as Object)).assertEqual(5n)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(5n)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(5n)
      }
    }
    else {
      expect((v as Object)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual(123)
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual(123)
      }
    }
  }
  function check_6(v: Object,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: Object = 5n
    let v2: Object = 123
    let res: boolean =
      check_6(v1, false, 1) &&
      check_6(v2, true, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS14_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }
  function check_is_subtype_of_I2_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int | float) {
      if (a instanceof int | float) {
        res = true
      }
      else {
        if ((a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      if (a instanceof string | float) {
        let b: "In Progress" | "On Review" | float =
          a as "In Progress" | "On Review" | float
      }
      if (a instanceof string) {
        let b: "In Progress" | "On Review" =
          a as "In Progress" | "On Review"
      }
      if (a instanceof int) {
        let b: int = a as int
      }
      if (a instanceof float) {
        let b: float = a as float
      }
      let b: "In Progress" | "On Review" | int | float =
        a as "In Progress" | "On Review" | int | float
    }
    return res
  }
  function check_value_6(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof string).assertTrue()
    if (v_id == 1) {
      expect((v as "In Progress")).assertEqual("In Progress")
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual("In Progress")
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual("In Progress")
      }
    }
    else {
      expect((v as "In Progress")).assertEqual("In Progress")
      if (is_subtype_of_inter_type) {
        expect(v instanceof string | int &&
          v instanceof string | int | float).assertTrue()
        expect((v as "Done" | "In Progress" | "On Review" | int)).assertEqual("In Progress")
        expect((v as "In Progress" | "On Review" | int | float)).assertEqual("In Progress")
      }
    }
  }
  function check_6(v: "In Progress",
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    if (is_subtype_of_inter_type) {
      expect(v instanceof string | int &&
        v instanceof string | int | float).assertTrue()
      expect(check_is_subtype_of_I1_6(v)).assertTrue()
      expect(check_is_subtype_of_I2_6(v)).assertTrue()
    }
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I1_6(v)) {
      expect(v instanceof string | int).assertTrue()
      if (v instanceof string | int) {
        expect(check_is_subtype_of_I1_6(v as "Done" | "In Progress" | "On Review" | int)).assertTrue()
        res = check_is_in_inter_type_6(v as "Done" | "In Progress" | "On Review" | int,
          is_subtype_of_inter_type, v_id)
        expect(res).assertEqual(is_subtype_of_inter_type)
        if (!res) {
          expect(check_is_subtype_of_I2_6(v)).assertFalse()
        }
      }
    }
    else {
      expect(is_subtype_of_inter_type).assertFalse()
    }
    return res
  }
  function check_is_in_inter_type_6(v: string | int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    check_value_6(v, is_subtype_of_inter_type, v_id)
    if (check_is_subtype_of_I2_6(v)) {
      expect(is_subtype_of_inter_type).assertTrue()
      expect(v instanceof string | int | float).assertTrue()
      if (v instanceof string | int | float) {
        res = check_as_I2_type_6(v as "In Progress" | "On Review" | int | float,
          is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_as_I2_type_6(v: string | int | float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_6(v, is_subtype_of_inter_type, v_id)
    return check_is_subtype_of_I2_6(v)
  }

  export function runTest_6(): boolean {
    let v1: "In Progress" = "In Progress"
    let v2: "In Progress" = "In Progress"
    let res: boolean =
      check_6(v1, true, 1) &&
      check_6(v2, true, 2)
    expect(res).assertEqual(true)
    return true
  }
}

namespace testNS15_6 {
  function check_is_subtype_of_I1_6(a: Object | null | undefined): boolean {
    let res: boolean = false
    if (a instanceof string | int) {
      if (a instanceof int) {
        res = true
      }
      else {
        if ((a === "Done") ||
          (a === "In Progress") ||
          (a === "On Review")) {
          res = true
        }
      }
    }
    if (res) {
      let b: "Done" | "In Progress" | "On Review" | int =
        a as "Done" | "In Progress" | "On Review" | int
    }
    return res
  }


  })
}