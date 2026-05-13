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
  constructor(x: T) {}
}

class Pos<T extends number> {
  constructor(x: T) {}
}

// ==================== testNS1_1 ====================
namespace testNS1_1 {
  function check_value_1(v: Object, v_id: number): void {
    if (v_id == 1) {
      expect(v as "Done" | "In Progress").assertEqual("In Progress");
      expect(v as "In Progress" | "On Review").assertEqual("In Progress");
    } else if (v_id == 2) {
      expect(v as "Done" | "In Progress").assertEqual("Done");
    } else {
      expect(v as "In Progress" | "On Review").assertEqual("On Review");
    }
  }

  function check_value_as_type_T_1(v: Object, v_id: number): void {
    expect(typeof v === 'string' || typeof v === 'string').assertTrue(); // 保持原有重复结构，仅修正语法
    expect((v === "Done" || v === "In Progress") || (v === "In Progress" || v === "On Review")).assertTrue();
    check_value_1(v as "Done" | "In Progress" | "On Review", v_id);
  }

  function check_is_in_T_type_1(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_1(v, v_id);
    if (v === "Done" || v === "In Progress") {
      check_value_1(v, v_id);
      if (v === "In Progress" || v === "On Review") {
        expect(v_id).assertEqual(1);
        check_value_1(v, v_id);
        expect(typeof v === 'string').assertTrue();
        expect(v).assertEqual("In Progress");
        expect(typeof v === 'string').assertTrue();
        expect(v instanceof Object).assertTrue();
        expect(v instanceof Object).assertTrue();
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      } else {
        expect(v_id).assertEqual(2);
        check_value_1(v, v_id);
        expect(v).assertEqual("Done");
        if (v instanceof Object) {
          expect(v instanceof Object).assertTrue();
          check_value_as_type_T_1(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_1(v, v_id);
      expect(v).assertEqual("On Review");
      if (v instanceof Object) {
        expect(v instanceof Object).assertTrue();
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1("In Progress", 1);
    let res2: boolean = check_is_in_T_type_1("Done", 2);
    let res3: boolean = check_is_in_T_type_1("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// ==================== 全局 test_1 系列 ====================
function check_value_1(v: Object, v_id: number): void {
  if (v_id == 1) {
    expect(v as "Done" | "In Progress").assertEqual("In Progress");
    expect(v as "In Progress" | "On Review").assertEqual("In Progress");
  } else if (v_id == 2) {
    expect(v as "Done" | "In Progress").assertEqual("Done");
  } else {
    expect(v as "In Progress" | "On Review").assertEqual("On Review");
  }
}

function check_value_as_type_T_1(v: Object, v_id: number): void {
  expect(typeof v === 'string' || typeof v === 'string').assertTrue();
  expect((v === "Done" || v === "In Progress") || (v === "In Progress" || v === "On Review")).assertTrue();
  check_value_1(v as "Done" | "In Progress" | "On Review", v_id);
}

function check_is_in_T_type_1(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
  check_value_1(v, v_id);
  if (v === "Done" || v === "In Progress") {
    check_value_1(v, v_id);
    if (v === "In Progress" || v === "On Review") {
      expect(v_id).assertEqual(1);
      check_value_1(v, v_id);
      expect(typeof v === 'string').assertTrue();
      expect(v).assertEqual("In Progress");
      expect(typeof v === 'string').assertTrue();
      expect(v instanceof Object).assertTrue();
      expect(v instanceof Object).assertTrue();
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    } else {
      expect(v_id).assertEqual(2);
      check_value_1(v, v_id);
      expect(v).assertEqual("Done");
      if (v instanceof Object) {
        expect(v instanceof Object).assertTrue();
        check_value_as_type_T_1(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  } else {
    expect(v_id).assertEqual(3);
    check_value_1(v, v_id);
    expect(v).assertEqual("On Review");
    if (v instanceof Object) {
      expect(v instanceof Object).assertTrue();
      check_value_as_type_T_1(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

// ==================== testNS1_2 ====================
namespace testNS1_2 {
  function check_value_2(v: Object, v_id: number): void {
    if (v_id == 1) {
      expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("In Progress");
      expect(v as number | "In Progress" | "On Review").assertEqual("In Progress");
    } else if (v_id == 2) {
      expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("Done");
    } else {
      expect(v as number | "In Progress" | "On Review").assertEqual("On Review");
    }
  }

  function check_value_as_type_T_2(v: Object, v_id: number): void {
    expect(typeof v === 'string' || typeof v === 'number' || typeof v === 'string' || typeof v === 'number').assertTrue();
    expect((v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number') ||
      (typeof v === 'number' || v === "In Progress" || v === "On Review")).assertTrue();
    check_value_2(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
  }

  function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2(v, v_id);
    if (v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number') {
      check_value_2(v, v_id);
      if (typeof v === 'number' || v === "In Progress" || v === "On Review") {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(v).assertEqual("In Progress");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(v instanceof Object).assertTrue();
        expect(v instanceof Object).assertTrue();
        if (v instanceof Object) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      } else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual("Done");
        if (v instanceof Object) {
          expect(v instanceof Object).assertTrue();
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual("On Review");
      if (v instanceof Object) {
        expect(v instanceof Object).assertTrue();
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2("In Progress", 1);
    let res2: boolean = check_is_in_T_type_2("Done", 2);
    let res3: boolean = check_is_in_T_type_2("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// ==================== testNS2_2 ====================
namespace testNS2_2 {
  function check_value_2(v: Object, v_id: number): void {
    if (v_id == 1) {
      expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual(123);
      expect(v as number | "In Progress" | "On Review").assertEqual(123);
    } else if (v_id == 2) {
      expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("Done");
    } else {
      expect(v as number | "In Progress" | "On Review").assertEqual("On Review");
    }
  }

  function check_value_as_type_T_2(v: Object, v_id: number): void {
    expect(typeof v === 'string' || typeof v === 'number' || typeof v === 'string' || typeof v === 'number').assertTrue();
    expect((v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number') ||
      (typeof v === 'number' || v === "In Progress" || v === "On Review")).assertTrue();
    check_value_2(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
  }

  function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_2(v, v_id);
    if (v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number') {
      check_value_2(v, v_id);
      if (typeof v === 'number' || v === "In Progress" || v === "On Review") {
        expect(v_id).assertEqual(1);
        check_value_2(v, v_id);
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(v).assertEqual(123);
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        expect(v instanceof Object).assertTrue();
        expect(v instanceof Object).assertTrue();
        if (v instanceof Object) {
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      } else {
        expect(v_id).assertEqual(2);
        check_value_2(v, v_id);
        expect(v).assertEqual("Done");
        if (v instanceof Object) {
          expect(v instanceof Object).assertTrue();
          check_value_as_type_T_2(v, v_id);
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_2(v, v_id);
      expect(v).assertEqual("On Review");
      if (v instanceof Object) {
        expect(v instanceof Object).assertTrue();
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(123, 1);
    let res2: boolean = check_is_in_T_type_2("Done", 2);
    let res3: boolean = check_is_in_T_type_2("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// ==================== 全局 test_2 系列 ====================
function check_value_2(v: Object, v_id: number): void {
  if (v_id == 1) {
    expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("In Progress");
    expect(v as number | "In Progress" | "On Review").assertEqual("In Progress");
  } else if (v_id == 2) {
    expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("Done");
  } else {
    expect(v as number | "In Progress" | "On Review").assertEqual("On Review");
  }
}

function check_value_as_type_T_2(v: Object, v_id: number): void {
  expect(typeof v === 'string' || typeof v === 'number' || typeof v === 'string' || typeof v === 'number').assertTrue();
  expect((v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number') ||
    (typeof v === 'number' || v === "In Progress" || v === "On Review")).assertTrue();
  check_value_2(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
}

function check_is_in_T_type_2(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
  check_value_2(v, v_id);
  if (v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number') {
    check_value_2(v, v_id);
    if (typeof v === 'number' || v === "In Progress" || v === "On Review") {
      expect(v_id).assertEqual(1);
      check_value_2(v, v_id);
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      expect(v).assertEqual("In Progress");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      expect(v instanceof Object).assertTrue();
      expect(v instanceof Object).assertTrue();
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    } else {
      expect(v_id).assertEqual(2);
      check_value_2(v, v_id);
      expect(v).assertEqual("Done");
      if (v instanceof Object) {
        expect(v instanceof Object).assertTrue();
        check_value_as_type_T_2(v, v_id);
        return true;
      } else {
        return false;
      }
    }
  } else {
    expect(v_id).assertEqual(3);
    check_value_2(v, v_id);
    expect(v).assertEqual("On Review");
    if (v instanceof Object) {
      expect(v instanceof Object).assertTrue();
      check_value_as_type_T_2(v, v_id);
      return true;
    } else {
      return false;
    }
  }
}

// ==================== testNS1_3 ====================
namespace testNS1_3 {
  function check_value_from_type_I1_3(v: Object): boolean {
    if (typeof v === 'string') {
      return v === "Done" || v === "In Progress";
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_3(v: Object): boolean {
    if (typeof v === 'string') {
      return v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_3(v: Object): boolean {
    return v instanceof Object;
  }

  function check_value_3(v: "Done" | "In Progress" | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v as "Done" | "In Progress").assertEqual("In Progress");
      expect(v as "In Progress" | "On Review").assertEqual("In Progress");
    } else if (v_id == 2) {
      expect(v as "Done" | "In Progress").assertEqual("Done");
    } else {
      expect(v as "In Progress" | "On Review").assertEqual("On Review");
    }
  }

  function check_is_in_T_type_3(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
    check_value_3(v, v_id);
    if (check_value_from_type_I1_3(v)) {
      check_value_3(v, v_id);
      expect(typeof v === 'string').assertTrue();
      if (typeof v === 'string') {
        check_value_3(v as "Done" | "In Progress" | "On Review", v_id);
      }
      if (check_value_from_type_I2_3(v)) {
        expect(v_id).assertEqual(1);
        check_value_3(v as "Done" | "In Progress" | "On Review", v_id);
        expect(v).assertEqual("In Progress");
        expect(typeof v === 'string').assertTrue();
        if (typeof v === 'string') {
          check_value_3(v as "Done" | "In Progress" | "On Review", v_id);
        }
        expect(v instanceof Object).assertTrue();
        expect(check_value_from_type_T_3(v)).assertTrue();
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_3(v as "Done" | "In Progress" | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string').assertTrue();
        if (check_value_from_type_T_3(v)) {
          expect(v instanceof Object).assertTrue();
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_3(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string').assertTrue();
      if (check_value_from_type_T_3(v)) {
        expect(v instanceof Object).assertTrue();
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3("In Progress", 1);
    let res2: boolean = check_is_in_T_type_3("Done", 2);
    let res3: boolean = check_is_in_T_type_3("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// ==================== 全局 test_3 系列 ====================
function check_value_from_type_I1_3(v: Object): boolean {
  if (typeof v === 'string') {
    return v === "Done" || v === "In Progress";
  } else {
    return false;
  }
}

function check_value_from_type_I2_3(v: Object): boolean {
  if (typeof v === 'string') {
    return v === "In Progress" || v === "On Review";
  } else {
    return false;
  }
}

function check_value_from_type_T_3(v: Object): boolean {
  return v instanceof Object;
}

function check_value_3(v: "Done" | "In Progress" | "On Review", v_id: number): void {
  if (v_id == 1) {
    expect(v as "Done" | "In Progress").assertEqual("In Progress");
    expect(v as "In Progress" | "On Review").assertEqual("In Progress");
  } else if (v_id == 2) {
    expect(v as "Done" | "In Progress").assertEqual("Done");
  } else {
    expect(v as "In Progress" | "On Review").assertEqual("On Review");
  }
}

function check_is_in_T_type_3(v: "Done" | "In Progress" | "On Review", v_id: number): boolean {
  check_value_3(v, v_id);
  if (check_value_from_type_I1_3(v)) {
    check_value_3(v, v_id);
    expect(typeof v === 'string').assertTrue();
    if (typeof v === 'string') {
      check_value_3(v as "Done" | "In Progress" | "On Review", v_id);
    }
    if (check_value_from_type_I2_3(v)) {
      expect(v_id).assertEqual(1);
      check_value_3(v as "Done" | "In Progress" | "On Review", v_id);
      expect(v).assertEqual("In Progress");
      expect(typeof v === 'string').assertTrue();
      if (typeof v === 'string') {
        check_value_3(v as "Done" | "In Progress" | "On Review", v_id);
      }
      expect(v instanceof Object).assertTrue();
      expect(check_value_from_type_T_3(v)).assertTrue();
      return true;
    } else {
      expect(v_id).assertEqual(2);
      check_value_3(v as "Done" | "In Progress" | "On Review", v_id);
      expect(v).assertEqual("Done");
      expect(typeof v === 'string').assertTrue();
      if (check_value_from_type_T_3(v)) {
        expect(v instanceof Object).assertTrue();
        return true;
      } else {
        return false;
      }
    }
  } else {
    expect(v_id).assertEqual(3);
    check_value_3(v, v_id);
    expect(v).assertEqual("On Review");
    expect(typeof v === 'string').assertTrue();
    if (check_value_from_type_T_3(v)) {
      expect(v instanceof Object).assertTrue();
      return true;
    } else {
      return false;
    }
  }
}

// ==================== testNS1_4 ====================
namespace testNS1_4 {
  function check_value_from_type_I1_4(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number';
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_4(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_4(v: Object): boolean {
    return v instanceof Object;
  }

  function check_value_4(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("In Progress");
      expect(v as number | "In Progress" | "On Review").assertEqual("In Progress");
    } else if (v_id == 2) {
      expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("Done");
    } else {
      expect(v as number | "In Progress" | "On Review").assertEqual("On Review");
    }
  }

  function check_is_in_T_type_4(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_4(v, v_id);
    if (check_value_from_type_I1_4(v)) {
      check_value_4(v, v_id);
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      }
      if (check_value_from_type_I2_4(v)) {
        expect(v_id).assertEqual(1);
        check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("In Progress");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (typeof v === 'string' || typeof v === 'number') {
          check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        }
        expect(v instanceof Object).assertTrue();
        expect(check_value_from_type_T_4(v)).assertTrue();
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (check_value_from_type_T_4(v)) {
          expect(v instanceof Object).assertTrue();
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_4(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (check_value_from_type_T_4(v)) {
        expect(v instanceof Object).assertTrue();
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_4(): boolean {
    let res1: boolean = check_is_in_T_type_4("In Progress", 1);
    let res2: boolean = check_is_in_T_type_4("Done", 2);
    let res3: boolean = check_is_in_T_type_4("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// ==================== testNS2_4 ====================
namespace testNS2_4 {
  function check_value_from_type_I1_4(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number';
    } else {
      return false;
    }
  }

  function check_value_from_type_I2_4(v: Object): boolean {
    if (typeof v === 'string' || typeof v === 'number') {
      return typeof v === 'number' || v === "In Progress" || v === "On Review";
    } else {
      return false;
    }
  }

  function check_value_from_type_T_4(v: Object): boolean {
    return v instanceof Object;
  }

  function check_value_4(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
    if (v_id == 1) {
      expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual(123);
      expect(v as number | "In Progress" | "On Review").assertEqual(123);
    } else if (v_id == 2) {
      expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("Done");
    } else {
      expect(v as number | "In Progress" | "On Review").assertEqual("On Review");
    }
  }

  function check_is_in_T_type_4(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
    check_value_4(v, v_id);
    if (check_value_from_type_I1_4(v)) {
      check_value_4(v, v_id);
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      }
      if (check_value_from_type_I2_4(v)) {
        expect(v_id).assertEqual(1);
        check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual(123);
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (typeof v === 'string' || typeof v === 'number') {
          check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        }
        expect(v instanceof Object).assertTrue();
        expect(check_value_from_type_T_4(v)).assertTrue();
        return true;
      } else {
        expect(v_id).assertEqual(2);
        check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
        expect(v).assertEqual("Done");
        expect(typeof v === 'string' || typeof v === 'number').assertTrue();
        if (check_value_from_type_T_4(v)) {
          expect(v instanceof Object).assertTrue();
          return true;
        } else {
          return false;
        }
      }
    } else {
      expect(v_id).assertEqual(3);
      check_value_4(v, v_id);
      expect(v).assertEqual("On Review");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (check_value_from_type_T_4(v)) {
        expect(v instanceof Object).assertTrue();
        return true;
      } else {
        return false;
      }
    }
  }

  export function runTest_4(): boolean {
    let res1: boolean = check_is_in_T_type_4(123, 1);
    let res2: boolean = check_is_in_T_type_4("Done", 2);
    let res3: boolean = check_is_in_T_type_4("On Review", 3);
    expect(res1 && (res2 || res3)).assertTrue();
    return true;
  }
}

// ==================== 全局 test_4 系列 ====================
function check_value_from_type_I1_4(v: Object): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return v === "Done" || v === "In Progress" || v === "Blocked" || typeof v === 'number';
  } else {
    return false;
  }
}

function check_value_from_type_I2_4(v: Object): boolean {
  if (typeof v === 'string' || typeof v === 'number') {
    return typeof v === 'number' || v === "In Progress" || v === "On Review";
  } else {
    return false;
  }
}

function check_value_from_type_T_4(v: Object): boolean {
  return v instanceof Object;
}

function check_value_4(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): void {
  if (v_id == 1) {
    expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("In Progress");
    expect(v as number | "In Progress" | "On Review").assertEqual("In Progress");
  } else if (v_id == 2) {
    expect(v as "Done" | "In Progress" | "Blocked" | number).assertEqual("Done");
  } else {
    expect(v as number | "In Progress" | "On Review").assertEqual("On Review");
  }
}

function check_is_in_T_type_4(v: "Done" | "In Progress" | "Blocked" | number | "On Review", v_id: number): boolean {
  check_value_4(v, v_id);
  if (check_value_from_type_I1_4(v)) {
    check_value_4(v, v_id);
    expect(typeof v === 'string' || typeof v === 'number').assertTrue();
    if (typeof v === 'string' || typeof v === 'number') {
      check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
    }
    if (check_value_from_type_I2_4(v)) {
      expect(v_id).assertEqual(1);
      check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      expect(v).assertEqual("In Progress");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (typeof v === 'string' || typeof v === 'number') {
        check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      }
      expect(v instanceof Object).assertTrue();
      expect(check_value_from_type_T_4(v)).assertTrue();
      return true;
    } else {
      expect(v_id).assertEqual(2);
      check_value_4(v as "Done" | "In Progress" | "Blocked" | number | "On Review", v_id);
      expect(v).assertEqual("Done");
      expect(typeof v === 'string' || typeof v === 'number').assertTrue();
      if (check_value_from_type_T_4(v)) {
        expect(v instanceof Object).assertTrue();
        return true;
      } else {
        return false;
      }
    }
  } else {
    expect(v_id).assertEqual(3);
    check_value_4(v, v_id);
    expect(v).assertEqual("On Review");
    expect(typeof v === 'string' || typeof v === 'number').assertTrue();
    if (check_value_from_type_T_4(v)) {
      expect(v instanceof Object).assertTrue();
      return true;
    } else {
      return false;
    }
  }
}



export default function InterTypeIsSubOfTypeObjOnStrLitTest(): void {
  describe('InterTypeIsSubOfTypeObjOnStrLitTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_STR_LIT_0100
     * @tc.name      testInterTypeIsSubOfTypeObjOnStrLit0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on literal
     *               union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnStrLit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnStrLit0001';
      

      let res1: boolean = check_is_in_T_type_1("In Progress", 1)
      let res2: boolean = check_is_in_T_type_1("Done", 2)
      let res3: boolean = check_is_in_T_type_1("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_1.runTest_1()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_STR_LIT_0200
     * @tc.name      testInterTypeIsSubOfTypeObjOnStrLit0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on literal
     *               union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnStrLit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnStrLit0002';
      

      let res1: boolean = check_is_in_T_type_2("In Progress", 1)
      let res2: boolean = check_is_in_T_type_2("Done", 2)
      let res3: boolean = check_is_in_T_type_2("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_2.runTest_2()).assertTrue()
      expect(testNS2_2.runTest_2()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_STR_LIT_0300
     * @tc.name      testInterTypeIsSubOfTypeObjOnStrLit0003
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on literal
     *               union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnStrLit0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnStrLit0003';
      

      let res1: boolean = check_is_in_T_type_3("In Progress", 1)
      let res2: boolean = check_is_in_T_type_3("Done", 2)
      let res3: boolean = check_is_in_T_type_3("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_3.runTest_3()).assertTrue()

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_STR_LIT_0400
     * @tc.name      testInterTypeIsSubOfTypeObjOnStrLit0004
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on literal
     *               union types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnStrLit0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnStrLit0004';
      

      let res1: boolean = check_is_in_T_type_4("In Progress", 1)
      let res2: boolean = check_is_in_T_type_4("Done", 2)
      let res3: boolean = check_is_in_T_type_4("On Review", 3)
      expect(res1 && (res2 || res3)).assertTrue()

      expect(testNS1_4.runTest_4()).assertTrue()
      expect(testNS2_4.runTest_4()).assertTrue()

    });
  })
}