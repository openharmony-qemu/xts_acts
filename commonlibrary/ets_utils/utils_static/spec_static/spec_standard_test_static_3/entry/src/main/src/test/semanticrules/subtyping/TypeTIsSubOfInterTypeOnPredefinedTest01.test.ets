import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index'

namespace testNS1_3 {

  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof int).assertTrue()
    if (v_id == 1) {
      expect((v as int)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(123)
        expect((v as bigint | int | null)).assertEqual(123)
      }
    }
    else {
      expect((v as int)).assertEqual(456)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(456)
        expect((v as bigint | int | null)).assertEqual(456)
      }
    }
  }
  function check_3(v: int,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(123)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(456)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(456)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(123)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(456)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }

  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: int = 123
    let v2: int = 456
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS2_3 {
  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof long).assertTrue()
    if (v_id == 1) {
      expect((v as long)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(123)
        expect((v as bigint | int | null)).assertEqual(123)
      }
    }
    else {
      expect((v as long)).assertEqual(456)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(456)
        expect((v as bigint | int | null)).assertEqual(456)
      }
    }
  }
  function check_3(v: long,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(123)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(456)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(456)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(123)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(456)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: long = 123
    let v2: long = 456
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS3_3 {
  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof byte).assertTrue()
    if (v_id == 1) {
      expect((v as byte)).assertEqual(4)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(4)
        expect((v as bigint | int | null)).assertEqual(4)
      }
    }
    else {
      expect((v as byte)).assertEqual(5)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(5)
        expect((v as bigint | int | null)).assertEqual(5)
      }
    }
  }
  function check_3(v: byte,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(4)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(5)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(4)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(5)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(4)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(5)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: byte = 4
    let v2: byte = 5
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS4_3 {
  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof short).assertTrue()
    if (v_id == 1) {
      expect((v as short)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(123)
        expect((v as bigint | int | null)).assertEqual(123)
      }
    }
    else {
      expect((v as short)).assertEqual(456)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(456)
        expect((v as bigint | int | null)).assertEqual(456)
      }
    }
  }
  function check_3(v: short,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(123)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(456)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(456)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(123)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(456)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: short = 123
    let v2: short = 456
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS5_3 {
  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof double).assertTrue()
    if (v_id == 1) {
      expect((v as double)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(123)
        expect((v as bigint | int | null)).assertEqual(123)
      }
    }
    else {
      expect((v as double)).assertEqual(45.6)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(45.6)
        expect((v as bigint | int | null)).assertEqual(45.6)
      }
    }
  }
  function check_3(v: double,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(123)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(45.6)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(45.6)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(123)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(45.6)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: double = 123
    let v2: double = 45.6
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS6_3 {
  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof number).assertTrue()
    if (v_id == 1) {
      expect((v as number)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(123)
        expect((v as bigint | int | null)).assertEqual(123)
      }
    }
    else {
      expect((v as number)).assertEqual(45.6)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(45.6)
        expect((v as bigint | int | null)).assertEqual(45.6)
      }
    }
  }
  function check_3(v: number,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(123)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(45.6)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(45.6)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(123)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(45.6)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: number = 123
    let v2: number = 45.6
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS7_3 {
  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof float).assertTrue()
    if (v_id == 1) {
      expect((v as float)).assertEqual(123)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(123)
        expect((v as bigint | int | null)).assertEqual(123)
      }
    }
    else {
      expect((v as float)).assertEqual(45.6)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(45.6)
        expect((v as bigint | int | null)).assertEqual(45.6)
      }
    }
  }
  function check_3(v: float,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(123)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(45.6)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(45.6)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(123)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(45.6)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: float = 123
    let v2: float = 45.6
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}

namespace testNS8_3 {
  function check_value_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    expect(v instanceof boolean).assertTrue()
    if (v_id == 1) {
      expect((v as boolean)).assertEqual(false)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(false)
        expect((v as bigint | int | null)).assertEqual(false)
      }
    }
    else {
      expect((v as boolean)).assertEqual(true)
      if (is_subtype_of_inter_type) {
        expect(v instanceof undefined | string | null | bigint &&
          v instanceof bigint | int | null).assertTrue()
        expect((v as undefined | string | null | bigint)).assertEqual(true)
        expect((v as bigint | int | null)).assertEqual(true)
      }
    }
  }
  function check_3(v: boolean,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    let res: boolean = false
    expect(v instanceof undefined | string | null | bigint &&
      v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v instanceof undefined | string | null | bigint) {
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as undefined | string | null | bigint)).assertEqual(false)
      }
      else {
        expect((v as undefined | string | null | bigint)).assertEqual(true)
      }
      res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
      if (!res) {
        expect(v instanceof bigint | int | null).assertFalse()
        check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
      }
    }
    return res
  }
  function check_is_in_inter_type_3(v: undefined | string | null | bigint,
    is_subtype_of_inter_type: boolean,
    v_id: int): boolean {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(false)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(true)
    }
    if (v instanceof bigint | int | null) {
      expect(is_subtype_of_inter_type).assertTrue()
      check_value_3(v, is_subtype_of_inter_type, v_id)
      if (v_id == 1) {
        expect((v as bigint | int | null)).assertEqual(false)
      }
      else {
        expect((v as bigint | int | null)).assertEqual(true)
      }
      let b: bigint | int | null = v as bigint | int | null
      check_value_3(b, is_subtype_of_inter_type, v_id)
      return true
    }
    else {
      return false
    }
  }
  function check_is_not_in_I2_type_3(v: Object | null | undefined,
    is_subtype_of_inter_type: boolean,
    v_id: int): void {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    expect(v instanceof bigint | int | null).assertFalse()
    expect(() => {
      let b: bigint | int | null = v as bigint | int | null
    }).assertThrow("error")
  }

  export function runTest_3(): boolean {
    let v1: boolean = false
    let v2: boolean = true
    let res: boolean =
      check_3(v1, false, 1) &&
      check_3(v2, false, 2)
    expect(res).assertEqual(false)
    return true
  }
}


function check_value_3(v: Object | null | undefined,
  is_subtype_of_inter_type: boolean,
  v_id: int): void {
  expect(v instanceof int).assertTrue()
  if (v_id == 1) {
    expect((v as int)).assertEqual(123)
    if (is_subtype_of_inter_type) {
      expect(v instanceof undefined | string | null | bigint &&
        v instanceof bigint | int | null).assertTrue()
      expect((v as undefined | string | null | bigint)).assertEqual(123)
      expect((v as bigint | int | null)).assertEqual(123)
    }
  }
  else {
    expect((v as int)).assertEqual(456)
    if (is_subtype_of_inter_type) {
      expect(v instanceof undefined | string | null | bigint &&
        v instanceof bigint | int | null).assertTrue()
      expect((v as undefined | string | null | bigint)).assertEqual(456)
      expect((v as bigint | int | null)).assertEqual(456)
    }
  }
}
function check_3(v: int,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  let res: boolean = false
  expect(v instanceof undefined | string | null | bigint &&
    v instanceof bigint | int | null).assertEqual(is_subtype_of_inter_type)
  check_value_3(v, is_subtype_of_inter_type, v_id)
  if (v instanceof undefined | string | null | bigint) {
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as undefined | string | null | bigint)).assertEqual(123)
    }
    else {
      expect((v as undefined | string | null | bigint)).assertEqual(456)
    }
    res = check_is_in_inter_type_3(v, is_subtype_of_inter_type, v_id)
    if (!res) {
      expect(v instanceof bigint | int | null).assertFalse()
      check_is_not_in_I2_type_3(v, is_subtype_of_inter_type, v_id)
    }
  }
  return res
}
function check_is_in_inter_type_3(v: undefined | string | null | bigint,
  is_subtype_of_inter_type: boolean,
  v_id: int): boolean {
  check_value_3(v, is_subtype_of_inter_type, v_id)
  if (v_id == 1) {
    expect((v as undefined | string | null | bigint)).assertEqual(123)
  }
  else {
    expect((v as undefined | string | null | bigint)).assertEqual(456)
  }
  if (v instanceof bigint | int | null) {
    expect(is_subtype_of_inter_type).assertTrue()
    check_value_3(v, is_subtype_of_inter_type, v_id)
    if (v_id == 1) {
      expect((v as bigint | int | null)).assertEqual(123)
    }
    else {
      expect((v as bigint | int | null)).assertEqual(456)
    }
    let b: bigint | int | null = v as bigint | int | null
    check_value_3(b, is_subtype_of_inter_type, v_id)
    return true
  }
  else {
    return false
  }
}
function check_is_not_in_I2_type_3(v: Object | null | undefined,
  is_subtype_of_inter_type: boolean,
  v_id: int): void {
  check_value_3(v, is_subtype_of_inter_type, v_id)
  expect(v instanceof bigint | int | null).assertFalse()
  expect(() => {
    let b: bigint | int | null = v as bigint | int | null
  }).assertThrow("error")
}

export default function TypeTIsSubOfInterTypeOnPredefinedTest01(): void {
  describe('TypeTIsSubOfInterTypeOnPredefinedTest01', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_TYPE_T_IS_SUB_OF_INTER_TYPE_ON_PREDEFINED_0300
     * @tc.name      testTypeTIsSubOfInterTypeOnPredefined0003
     * @tc.desc      Checking that type T is a subtype of intersection type (I1 & I2) if T is a subtype
     *               of each Ii in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeTIsSubOfInterTypeOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTypeTIsSubOfInterTypeOnPredefined0003';
      let v1: int = 123
      let v2: int = 456
      let res: boolean =
        check_3(v1, false, 1) &&
        check_3(v2, false, 2)
      expect(res).assertEqual(false)

      expect(testNS1_3.runTest_3()).assertTrue()
      expect(testNS2_3.runTest_3()).assertTrue()
      expect(testNS3_3.runTest_3()).assertTrue()
      expect(testNS4_3.runTest_3()).assertTrue()
      expect(testNS5_3.runTest_3()).assertTrue()
      expect(testNS6_3.runTest_3()).assertTrue()
      expect(testNS7_3.runTest_3()).assertTrue()
      expect(testNS8_3.runTest_3()).assertTrue()
    })

  })
}