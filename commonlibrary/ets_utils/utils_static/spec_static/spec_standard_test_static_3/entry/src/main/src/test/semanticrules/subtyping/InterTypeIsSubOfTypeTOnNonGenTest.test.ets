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
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v_1: string = "cat"}
  class Dog_1 extends Animal_1 {v_1: bigint = 123n}
  class Frog_1 extends Animal_1 {v_1: int = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v_1).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v_1).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v_1).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_1(v: Any, v_id_1: int): void {
    if (v_id_1 == 1) {
      check_dog_1(v)
      check_dog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
      check_dog_1(v as number | Dog_1 | bigint)
    }
    else if (v_id_1 == 2) {
      check_cat_1(v)
      check_cat_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    }
    else {
      check_bigint_1(v)
      check_bigint_1(v as number | Dog_1 | bigint)
    }
  }
  function check_value_as_type_T_1(v: Cat_1 | Dog_1 | Frog_1 | number | int, v_id_1: int): void {
    expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number ||
      v instanceof number | Dog_1 | bigint).assertEqual(true)
    check_value_1(v, v_id_1)
  }
  function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | number | Dog_1 | bigint,
    v_id_1: int): boolean {
    check_value_1(v, v_id_1)
    if (v instanceof Cat_1 | Dog_1 | Frog_1 | number) {
      check_value_1(v, v_id_1)
      if (v instanceof number | Dog_1 | bigint) {
        expect(v_id_1).assertEqual(1)
        check_value_1(v, v_id_1)
        expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number).assertEqual(true)
        expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number | int).assertEqual(true)
        if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_1).assertEqual(2)
        check_value_1(v, v_id_1)
        if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_1).assertEqual(3)
      check_value_1(v, v_id_1)
      if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(
      new Dog_1(), 1)
    let res2_1: boolean = check_is_in_T_type_1(
      new Cat_1(), 2)
    let res3_1: boolean = check_is_in_T_type_1(
      5n, 3)
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)
    return true
  }
}

namespace testNS2_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v_1: string = "cat"}
  class Dog_1 extends Animal_1 {v_1: bigint = 123n}
  class Frog_1 extends Animal_1 {v_1: int = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v_1).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v_1).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v_1).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_1(v: Any, v_id_1: int): void {
    if (v_id_1 == 1) {
      check_number_1(v)
      check_number_1(v as Cat_1 | Dog_1 | Frog_1 | number)
      check_number_1(v as number | Dog_1 | bigint)
    }
    else if (v_id_1 == 2) {
      check_frog_1(v)
      check_frog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    }
    else {
      check_bigint_1(v)
      check_bigint_1(v as number | Dog_1 | bigint)
    }
  }
  function check_value_as_type_T_1(v: number | Dog_1 | bigint | int, v_id_1: int): void {
    expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number ||
      v instanceof number | Dog_1 | bigint).assertEqual(true)
    check_value_1(v, v_id_1)
  }
  function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | number | Dog_1 | bigint,
    v_id_1: int): boolean {
    check_value_1(v, v_id_1)
    if (v instanceof Cat_1 | Dog_1 | Frog_1 | number) {
      check_value_1(v, v_id_1)
      if (v instanceof number | Dog_1 | bigint) {
        expect(v_id_1).assertEqual(1)
        check_value_1(v, v_id_1)
        expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number).assertEqual(true)
        expect(v instanceof number | Dog_1 | bigint | int).assertEqual(true)
        if (v instanceof number | Dog_1 | bigint | int) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_1).assertEqual(2)
        check_value_1(v, v_id_1)
        if (v instanceof number | Dog_1 | bigint | int) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_1).assertEqual(3)
      check_value_1(v, v_id_1)
      if (v instanceof number | Dog_1 | bigint | int) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(
      7.8, 1)
    let res2_1: boolean = check_is_in_T_type_1(
      new Frog_1(), 2)
    let res3_1: boolean = check_is_in_T_type_1(
      5n, 3)
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)
    return true
  }
}

namespace testNS3_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v_1: string = "cat"}
  class Dog_1 extends Animal_1 {v_1: bigint = 123n}
  class Frog_1 extends Animal_1 {v_1: int = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v_1).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v_1).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v_1).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_1(v: Any, v_id_1: int): void {
    if (v_id_1 == 1) {
      check_dog_1(v)
      check_dog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
      check_dog_1(v as number | Dog_1 | bigint)
    }
    else if (v_id_1 == 2) {
      check_cat_1(v)
      check_cat_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    }
    else {
      check_bigint_1(v)
      check_bigint_1(v as number | Dog_1 | bigint)
    }
  }
  function check_value_as_type_T_1(v: Animal_1 | number, v_id_1: int): void {
    expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number ||
      v instanceof number | Dog_1 | bigint).assertEqual(true)
    check_value_1(v, v_id_1)
  }
  function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | number | Dog_1 | bigint,
    v_id_1: int): boolean {
    check_value_1(v, v_id_1)
    if (v instanceof Cat_1 | Dog_1 | Frog_1 | number) {
      check_value_1(v, v_id_1)
      if (v instanceof number | Dog_1 | bigint) {
        expect(v_id_1).assertEqual(1)
        check_value_1(v, v_id_1)
        expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number).assertEqual(true)
        expect(v instanceof Animal_1 | number).assertEqual(true)
        if (v instanceof Animal_1 | number) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_1).assertEqual(2)
        check_value_1(v, v_id_1)
        if (v instanceof Animal_1 | number) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_1).assertEqual(3)
      check_value_1(v, v_id_1)
      if (v instanceof Animal_1 | number) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(
      new Dog_1(), 1)
    let res2_1: boolean = check_is_in_T_type_1(
      new Cat_1(), 2)
    let res3_1: boolean = check_is_in_T_type_1(
      5n, 3)
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)
    return true
  }
}

namespace testNS4_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v_1: string = "cat"}
  class Dog_1 extends Animal_1 {v_1: bigint = 123n}
  class Frog_1 extends Animal_1 {v_1: int = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v_1).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v_1).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v_1).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_1(v: Any, v_id_1: int): void {
    if (v_id_1 == 1) {
      check_number_1(v)
      check_number_1(v as Cat_1 | Dog_1 | Frog_1 | number)
      check_number_1(v as number | Dog_1 | bigint)
    }
    else if (v_id_1 == 2) {
      check_frog_1(v)
      check_frog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    }
    else {
      check_bigint_1(v)
      check_bigint_1(v as number | Dog_1 | bigint)
    }
  }
  function check_value_as_type_T_1(v: Animal_1 | number | bigint, v_id_1: int): void {
    expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number ||
      v instanceof number | Dog_1 | bigint).assertEqual(true)
    check_value_1(v, v_id_1)
  }
  function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | number | Dog_1 | bigint,
    v_id_1: int): boolean {
    check_value_1(v, v_id_1)
    if (v instanceof Cat_1 | Dog_1 | Frog_1 | number) {
      check_value_1(v, v_id_1)
      if (v instanceof number | Dog_1 | bigint) {
        expect(v_id_1).assertEqual(1)
        check_value_1(v, v_id_1)
        expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number).assertEqual(true)
        expect(v instanceof Animal_1 | number | bigint).assertEqual(true)
        if (v instanceof Animal_1 | number | bigint) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_1).assertEqual(2)
        check_value_1(v, v_id_1)
        if (v instanceof Animal_1 | number | bigint) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_1).assertEqual(3)
      check_value_1(v, v_id_1)
      if (v instanceof Animal_1 | number | bigint) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(
      7.8, 1)
    let res2_1: boolean = check_is_in_T_type_1(
      new Frog_1(), 2)
    let res3_1: boolean = check_is_in_T_type_1(
      5n, 3)
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)
    return true
  }
}

namespace testNS5_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 {v_1: string = "cat"}
  class Dog_1 extends Animal_1 {v_1: bigint = 123n}
  class Frog_1 extends Animal_1 {v_1: int = 5}
  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v_1).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v_1).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v_1).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_1(v: Any, v_id_1: int): void {
    if (v_id_1 == 1) {
      check_number_1(v)
      check_number_1(v as Cat_1 | Dog_1 | Frog_1 | number)
      check_number_1(v as number | Dog_1 | bigint)
    }
    else if (v_id_1 == 2) {
      check_frog_1(v)
      check_frog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    }
    else {
      check_bigint_1(v)
      check_bigint_1(v as number | Dog_1 | bigint)
    }
  }
  function check_value_as_type_T_1(v: Any, v_id_1: int): void {
    expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number ||
      v instanceof number | Dog_1 | bigint).assertEqual(true)
    check_value_1(v, v_id_1)
  }
  function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | number | Dog_1 | bigint,
    v_id_1: int): boolean {
    check_value_1(v, v_id_1)
    if (v instanceof Cat_1 | Dog_1 | Frog_1 | number) {
      check_value_1(v, v_id_1)
      if (v instanceof number | Dog_1 | bigint) {
        expect(v_id_1).assertEqual(1)
        check_value_1(v, v_id_1)
        expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number).assertEqual(true)
        expect(v instanceof Any).assertEqual(true)
        if (v instanceof Any) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_1).assertEqual(2)
        check_value_1(v, v_id_1)
        expect(v instanceof Any).assertEqual(true)
        if (v instanceof Any) {
          check_value_as_type_T_1(v, v_id_1)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_1).assertEqual(3)
      check_value_1(v, v_id_1)
      expect(v instanceof Any).assertEqual(true)
      if (v instanceof Any) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1_1: boolean = check_is_in_T_type_1(
      7.8, 1)
    let res2_1: boolean = check_is_in_T_type_1(
      new Frog_1(), 2)
    let res3_1: boolean = check_is_in_T_type_1(
      5n, 3)
    expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)
    return true
  }
}

class Animal_1 {}
class Cat_1 extends Animal_1 {v_1: string = "cat"}
class Dog_1 extends Animal_1 {v_1: bigint = 123n}
class Frog_1 extends Animal_1 {v_1: int = 5}
function check_cat_1(a: Any) {
  expect(a instanceof Cat_1).assertEqual(true)
  expect((a as Cat_1).v_1).assertEqual("cat")
}
function check_dog_1(a: Any) {
  expect(a instanceof Dog_1).assertEqual(true)
  expect((a as Dog_1).v_1).assertEqual(123n)
}
function check_frog_1(a: Any) {
  expect(a instanceof Frog_1).assertEqual(true)
  expect((a as Frog_1).v_1).assertEqual(5)
}
function check_number_1(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function check_bigint_1(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_1(v: Any, v_id_1: int): void {
  if (v_id_1 == 1) {
    check_dog_1(v)
    check_dog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    check_dog_1(v as number | Dog_1 | bigint)
  }
  else if (v_id_1 == 2) {
    check_cat_1(v)
    check_cat_1(v as Cat_1 | Dog_1 | Frog_1 | number)
  }
  else {
    check_bigint_1(v)
    check_bigint_1(v as number | Dog_1 | bigint)
  }
}
function check_value_as_type_T_1(v: Cat_1 | Dog_1 | Frog_1 | number | int, v_id_1: int): void {
  expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number ||
    v instanceof number | Dog_1 | bigint).assertEqual(true)
  check_value_1(v, v_id_1)
}
function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | number | Dog_1 | bigint,
  v_id_1: int): boolean {
  check_value_1(v, v_id_1)
  if (v instanceof Cat_1 | Dog_1 | Frog_1 | number) {
    check_value_1(v, v_id_1)
    if (v instanceof number | Dog_1 | bigint) {
      expect(v_id_1).assertEqual(1)
      check_value_1(v, v_id_1)
      expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number).assertEqual(true)
      expect(v instanceof Cat_1 | Dog_1 | Frog_1 | number | int).assertEqual(true)
      if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id_1).assertEqual(2)
      check_value_1(v, v_id_1)
      if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
        check_value_as_type_T_1(v, v_id_1)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id_1).assertEqual(3)
    check_value_1(v, v_id_1)
    if (v instanceof Cat_1 | Dog_1 | Frog_1 | number | int) {
      check_value_as_type_T_1(v, v_id_1)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v_2: bigint = 123n}
  class C1_2 extends B1_2 {v_2: int = 321}
  class C2_2 extends B1_2 {v_2: number = 6.7}
  class Other_2 {v_2: string = "other"}
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v_2).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v_2).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v_2).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v_2).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_2(v: Any, v_id_2: int): void {
    if (v_id_2 == 1) {
      check_C1_2(v)
      check_C1_2(v as C1_2 | C2_2 | B2_2 | Other_2)
      check_C1_2(v as B1_2 | Other_2 | bigint)
    }
    else if (v_id_2 == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2 | Other_2 | bigint)
    }
  }
  function check_value_as_type_T_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number, v_id_2: int): void {
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
      v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
    check_value_2(v, v_id_2)
  }
  function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | Other_2 | bigint,
    v_id_2: int): boolean {
    check_value_2(v, v_id_2)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      check_value_2(v, v_id_2)
      if (v instanceof B1_2 | Other_2 | bigint) {
        expect(v_id_2).assertEqual(1)
        check_value_2(v, v_id_2)
        expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
        expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(true)
        if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_2).assertEqual(2)
        check_value_2(v, v_id_2)
        if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_2).assertEqual(3)
      check_value_2(v, v_id_2)
      if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(
      new C1_2(), 1)
    let res2_2: boolean = check_is_in_T_type_2(
      new B2_2(), 2)
    let res3_2: boolean = check_is_in_T_type_2(
      5n, 3)
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)
    return true
  }
}

namespace testNS2_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v_2: bigint = 123n}
  class C1_2 extends B1_2 {v_2: int = 321}
  class C2_2 extends B1_2 {v_2: number = 6.7}
  class Other_2 {v_2: string = "other"}
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v_2).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v_2).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v_2).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v_2).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_2(v: Any, v_id_2: int): void {
    if (v_id_2 == 1) {
      check_C2_2(v)
      check_C2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
      check_C2_2(v as B1_2 | Other_2 | bigint)
    }
    else if (v_id_2 == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2 | Other_2 | bigint)
    }
  }
  function check_value_as_type_T_2(v: B1_2 | Other_2 | bigint | char, v_id_2: int): void {
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
      v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
    check_value_2(v, v_id_2)
  }
  function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | Other_2 | bigint,
    v_id_2: int): boolean {
    check_value_2(v, v_id_2)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      check_value_2(v, v_id_2)
      if (v instanceof B1_2 | Other_2 | bigint) {
        expect(v_id_2).assertEqual(1)
        check_value_2(v, v_id_2)
        expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
        expect(v instanceof B1_2 | Other_2 | bigint | char).assertEqual(true)
        if (v instanceof B1_2 | Other_2 | bigint | char) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_2).assertEqual(2)
        check_value_2(v, v_id_2)
        if (v instanceof B1_2 | Other_2 | bigint | char) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_2).assertEqual(3)
      check_value_2(v, v_id_2)
      if (v instanceof B1_2 | Other_2 | bigint | char) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(
      new C2_2(), 1)
    let res2_2: boolean = check_is_in_T_type_2(
      new B2_2(), 2)
    let res3_2: boolean = check_is_in_T_type_2(
      5n, 3)
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)
    return true
  }
}

namespace testNS3_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v_2: bigint = 123n}
  class C1_2 extends B1_2 {v_2: int = 321}
  class C2_2 extends B1_2 {v_2: number = 6.7}
  class Other_2 {v_2: string = "other"}
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v_2).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v_2).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v_2).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v_2).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_2(v: Any, v_id_2: int): void {
    if (v_id_2 == 1) {
      check_Other_2(v)
      check_Other_2(v as C1_2 | C2_2 | B2_2 | Other_2)
      check_Other_2(v as B1_2 | Other_2 | bigint)
    }
    else if (v_id_2 == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2 | Other_2 | bigint)
    }
  }
  function check_value_as_type_T_2(v: A_2 | Other_2 | bigint, v_id_2: int): void {
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
      v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
    check_value_2(v, v_id_2)
  }
  function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | Other_2 | bigint,
    v_id_2: int): boolean {
    check_value_2(v, v_id_2)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      check_value_2(v, v_id_2)
      if (v instanceof B1_2 | Other_2 | bigint) {
        expect(v_id_2).assertEqual(1)
        check_value_2(v, v_id_2)
        expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
        expect(v instanceof A_2 | Other_2 | bigint).assertEqual(true)
        if (v instanceof A_2 | Other_2 | bigint) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_2).assertEqual(2)
        check_value_2(v, v_id_2)
        if (v instanceof A_2 | Other_2 | bigint) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_2).assertEqual(3)
      check_value_2(v, v_id_2)
      if (v instanceof A_2 | Other_2 | bigint) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(
      new Other_2(), 1)
    let res2_2: boolean = check_is_in_T_type_2(
      new B2_2(), 2)
    let res3_2: boolean = check_is_in_T_type_2(
      5n, 3)
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)
    return true
  }
}

namespace testNS4_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v_2: bigint = 123n}
  class C1_2 extends B1_2 {v_2: int = 321}
  class C2_2 extends B1_2 {v_2: number = 6.7}
  class Other_2 {v_2: string = "other"}
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v_2).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v_2).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v_2).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v_2).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_2(v: Any, v_id_2: int): void {
    if (v_id_2 == 1) {
      check_C2_2(v)
      check_C2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
      check_C2_2(v as B1_2 | Other_2 | bigint)
    }
    else if (v_id_2 == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2 | Other_2 | bigint)
    }
  }
  function check_value_as_type_T_2(v: B1_2 | B2_2 | Other_2, v_id_2: int): void {
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
      v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
    check_value_2(v, v_id_2)
  }
  function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | Other_2 | bigint,
    v_id_2: int): boolean {
    check_value_2(v, v_id_2)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      check_value_2(v, v_id_2)
      if (v instanceof B1_2 | Other_2 | bigint) {
        expect(v_id_2).assertEqual(1)
        check_value_2(v, v_id_2)
        expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
        expect(v instanceof B1_2 | B2_2 | Other_2).assertEqual(true)
        if (v instanceof B1_2 | B2_2 | Other_2) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_2).assertEqual(2)
        check_value_2(v, v_id_2)
        if (v instanceof B1_2 | B2_2 | Other_2) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_2).assertEqual(3)
      check_value_2(v, v_id_2)
      if (v instanceof B1_2 | B2_2 | Other_2) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(
      new C2_2(), 1)
    let res2_2: boolean = check_is_in_T_type_2(
      new B2_2(), 2)
    let res3_2: boolean = check_is_in_T_type_2(
      5n, 3)
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)
    return true
  }
}

namespace testNS5_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v_2: bigint = 123n}
  class C1_2 extends B1_2 {v_2: int = 321}
  class C2_2 extends B1_2 {v_2: number = 6.7}
  class Other_2 {v_2: string = "other"}
  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v_2).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v_2).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v_2).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v_2).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }
  function check_value_2(v: Any, v_id_2: int): void {
    if (v_id_2 == 1) {
      check_C1_2(v)
      check_C1_2(v as C1_2 | C2_2 | B2_2 | Other_2)
      check_C1_2(v as B1_2 | Other_2 | bigint)
    }
    else if (v_id_2 == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2 | Other_2 | bigint)
    }
  }
  function check_value_as_type_T_2(v: Any, v_id_2: int): void {
    expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
      v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
    check_value_2(v, v_id_2)
  }
  function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | Other_2 | bigint,
    v_id_2: int): boolean {
    check_value_2(v, v_id_2)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
      check_value_2(v, v_id_2)
      if (v instanceof B1_2 | Other_2 | bigint) {
        expect(v_id_2).assertEqual(1)
        check_value_2(v, v_id_2)
        expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
        expect(v instanceof Any).assertEqual(true)
        if (v instanceof Any) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
      else {
        expect(v_id_2).assertEqual(2)
        check_value_2(v, v_id_2)
        if (v instanceof Any) {
          check_value_as_type_T_2(v, v_id_2)
          return true
        } else {
          return false
        }
      }
    }
    else {
      expect(v_id_2).assertEqual(3)
      check_value_2(v, v_id_2)
      if (v instanceof Any) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1_2: boolean = check_is_in_T_type_2(
      new C1_2(), 1)
    let res2_2: boolean = check_is_in_T_type_2(
      new B2_2(), 2)
    let res3_2: boolean = check_is_in_T_type_2(
      5n, 3)
    expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)
    return true
  }
}

abstract class A_2 {}
abstract class B1_2 extends A_2 {}
class B2_2 extends A_2 {v_2: bigint = 123n}
class C1_2 extends B1_2 {v_2: int = 321}
class C2_2 extends B1_2 {v_2: number = 6.7}
class Other_2 {v_2: string = "other"}
function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertEqual(true)
  expect((a as C1_2).v_2).assertEqual(321)
}
function check_C2_2(a: Any) {
  expect(a instanceof C2_2).assertEqual(true)
  expect((a as C2_2).v_2).assertEqual(6.7)
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertEqual(true)
  expect((a as B2_2).v_2).assertEqual(123n)
}
function check_Other_2(a: Any) {
  expect(a instanceof Other_2).assertEqual(true)
  expect((a as Other_2).v_2).assertEqual("other")
}
function check_bigint_2(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}
function check_value_2(v: Any, v_id_2: int): void {
  if (v_id_2 == 1) {
    check_C1_2(v)
    check_C1_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    check_C1_2(v as B1_2 | Other_2 | bigint)
  }
  else if (v_id_2 == 2) {
    check_B2_2(v)
    check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
  }
  else {
    check_bigint_2(v)
    check_bigint_2(v as B1_2 | Other_2 | bigint)
  }
}
function check_value_as_type_T_2(v: C1_2 | C2_2 | B2_2 | Other_2 | number, v_id_2: int): void {
  expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 ||
    v instanceof B1_2 | Other_2 | bigint).assertEqual(true)
  check_value_2(v, v_id_2)
}
function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | Other_2 | bigint,
  v_id_2: int): boolean {
  check_value_2(v, v_id_2)
  if (v instanceof C1_2 | C2_2 | B2_2 | Other_2) {
    check_value_2(v, v_id_2)
    if (v instanceof B1_2 | Other_2 | bigint) {
      expect(v_id_2).assertEqual(1)
      check_value_2(v, v_id_2)
      expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2).assertEqual(true)
      expect(v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number).assertEqual(true)
      if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
    else {
      expect(v_id_2).assertEqual(2)
      check_value_2(v, v_id_2)
      if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
        check_value_as_type_T_2(v, v_id_2)
        return true
      } else {
        return false
      }
    }
  }
  else {
    expect(v_id_2).assertEqual(3)
    check_value_2(v, v_id_2)
    if (v instanceof C1_2 | C2_2 | B2_2 | Other_2 | number) {
      check_value_as_type_T_2(v, v_id_2)
      return true
    } else {
      return false
    }
  }
}

export default function InterTypeIsSubOfTypeTOnNonGenTest(): void {
  describe('InterTypeIsSubOfTypeTOnNonGenTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0100
     * @tc.name      testInterTypeIsSubOfTypeTOnNonGen0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on non generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnNonGen0001';
      

      let res1_1: boolean = check_is_in_T_type_1(
        new Dog_1(), 1)
      let res2_1: boolean = check_is_in_T_type_1(
        new Cat_1(), 2)
      let res3_1: boolean = check_is_in_T_type_1(
        5n, 3)
      expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)

      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)
      expect(testNS3_1.runTest_1()).assertEqual(true)
      expect(testNS4_1.runTest_1()).assertEqual(true)
      expect(testNS5_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0200
     * @tc.name      testInterTypeIsSubOfTypeTOnNonGen0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               T if Ii is a subtype of T for some i in case of usage instanceof on non generic
     *               custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeTOnNonGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeTOnNonGen0002';
      

      let res1_2: boolean = check_is_in_T_type_2(
        new C1_2(), 1)
      let res2_2: boolean = check_is_in_T_type_2(
        new B2_2(), 2)
      let res3_2: boolean = check_is_in_T_type_2(
        5n, 3)
      expect(res1_2 && (res2_2 || res3_2)).assertEqual(true)

      expect(testNS1_2.runTest_2()).assertEqual(true)
      expect(testNS2_2.runTest_2()).assertEqual(true)
      expect(testNS3_2.runTest_2()).assertEqual(true)
      expect(testNS4_2.runTest_2()).assertEqual(true)
      expect(testNS5_2.runTest_2()).assertEqual(true)

    });
  })
}