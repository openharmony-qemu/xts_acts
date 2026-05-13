/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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
  class Cat_1 extends Animal_1 { v: string = "cat" }
  class Dog_1 extends Animal_1 { v: bigint = 123n }
  class Frog_1 extends Animal_1 { v: int = 5 }

  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_dog_1(v)
      check_dog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
      check_dog_1(v as number | Dog_1 | bigint)
    } else if (v_id == 2) {
      check_cat_1(v)
      check_cat_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    } else {
      check_bigint_1(v)
      check_bigint_1(v as number | Dog_1 | bigint)
    }
  }

  function check_value_as_type_T_1(v: Object, v_id: int): void {
    expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number || v instanceof bigint).assertEqual(true)
    check_value_1(v, v_id)
  }

  function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | bigint, v_id: int): boolean {
    check_value_1(v, v_id)
    if (v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number) {
      check_value_1(v, v_id)
      if (v instanceof number || v instanceof Dog_1 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      } else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1(new Dog_1(), 1)
    let res2: boolean = check_is_in_T_type_1(new Cat_1(), 2)
    let res3: boolean = check_is_in_T_type_1(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

namespace testNS2_1 {
  class Animal_1 {}
  class Cat_1 extends Animal_1 { v: string = "cat" }
  class Dog_1 extends Animal_1 { v: bigint = 123n }
  class Frog_1 extends Animal_1 { v: int = 5 }

  function check_cat_1(a: Any) {
    expect(a instanceof Cat_1).assertEqual(true)
    expect((a as Cat_1).v).assertEqual("cat")
  }
  function check_dog_1(a: Any) {
    expect(a instanceof Dog_1).assertEqual(true)
    expect((a as Dog_1).v).assertEqual(123n)
  }
  function check_frog_1(a: Any) {
    expect(a instanceof Frog_1).assertEqual(true)
    expect((a as Frog_1).v).assertEqual(5)
  }
  function check_number_1(a: Any) {
    expect(a instanceof number).assertEqual(true)
    expect(a as number).assertEqual(7.8)
  }
  function check_bigint_1(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_1(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_number_1(v)
      check_number_1(v as Cat_1 | Dog_1 | Frog_1 | number)
      check_number_1(v as number | Dog_1 | bigint)
    } else if (v_id == 2) {
      check_frog_1(v)
      check_frog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    } else {
      check_bigint_1(v)
      check_bigint_1(v as number | Dog_1 | bigint)
    }
  }

  function check_value_as_type_T_1(v: Object, v_id: int): void {
    expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number || v instanceof bigint).assertEqual(true)
    check_value_1(v, v_id)
  }

  function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | bigint, v_id: int): boolean {
    check_value_1(v, v_id)
    if (v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number) {
      check_value_1(v, v_id)
      if (v instanceof number || v instanceof Dog_1 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_1(v, v_id)
        expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      } else {
        expect(v_id).assertEqual(2)
        check_value_1(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_1(v, v_id)
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_1(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_1(): boolean {
    let res1: boolean = check_is_in_T_type_1(7.8, 1)
    let res2: boolean = check_is_in_T_type_1(new Frog_1(), 2)
    let res3: boolean = check_is_in_T_type_1(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

class Animal_1 {}
class Cat_1 extends Animal_1 { v: string = "cat" }
class Dog_1 extends Animal_1 { v: bigint = 123n }
class Frog_1 extends Animal_1 { v: int = 5 }

function check_cat_1(a: Any) {
  expect(a instanceof Cat_1).assertEqual(true)
  expect((a as Cat_1).v).assertEqual("cat")
}
function check_dog_1(a: Any) {
  expect(a instanceof Dog_1).assertEqual(true)
  expect((a as Dog_1).v).assertEqual(123n)
}
function check_frog_1(a: Any) {
  expect(a instanceof Frog_1).assertEqual(true)
  expect((a as Frog_1).v).assertEqual(5)
}
function check_number_1(a: Any) {
  expect(a instanceof number).assertEqual(true)
  expect(a as number).assertEqual(7.8)
}
function check_bigint_1(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}

function check_value_1(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_dog_1(v)
    check_dog_1(v as Cat_1 | Dog_1 | Frog_1 | number)
    check_dog_1(v as number | Dog_1 | bigint)
  } else if (v_id == 2) {
    check_cat_1(v)
    check_cat_1(v as Cat_1 | Dog_1 | Frog_1 | number)
  } else {
    check_bigint_1(v)
    check_bigint_1(v as number | Dog_1 | bigint)
  }
}

function check_value_as_type_T_1(v: Object, v_id: int): void {
  expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number || v instanceof bigint).assertEqual(true)
  check_value_1(v, v_id)
}

function check_is_in_T_type_1(v: Cat_1 | Dog_1 | Frog_1 | number | bigint, v_id: int): boolean {
  check_value_1(v, v_id)
  if (v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number) {
    check_value_1(v, v_id)
    if (v instanceof number || v instanceof Dog_1 || v instanceof bigint) {
      expect(v_id).assertEqual(1)
      check_value_1(v, v_id)
      expect(v instanceof Cat_1 || v instanceof Dog_1 || v instanceof Frog_1 || v instanceof number).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    } else {
      expect(v_id).assertEqual(2)
      check_value_1(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_1(v, v_id)
        return true
      } else {
        return false
      }
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_1(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_1(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v: bigint = 123n}
  class C1_2 extends B1_2 {v: int = 321}
  class C2_2 extends B1_2 {v: number = 6.7}
  class Other_2 {v: string = "other"}

  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_2(v)
      check_C1_2(v as C1_2 | C2_2 | B2_2 | Other_2)
      check_C1_2(v as B1_2 | Other_2 | bigint)
    }
    else if (v_id == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2 | Other_2 | bigint)
    }
  }

  function check_value_as_type_T_2(v: Object, v_id: int): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2 || v instanceof B1_2 || v instanceof bigint).assertEqual(true)
    check_value_2(v, v_id)
  }

  function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | bigint, v_id: int): boolean {
    check_value_2(v, v_id)
    if (v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2) {
      check_value_2(v, v_id)
      if (v instanceof B1_2 || v instanceof Other_2 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
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
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(new C1_2(), 1)
    let res2: boolean = check_is_in_T_type_2(new B2_2(), 2)
    let res3: boolean = check_is_in_T_type_2(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

namespace testNS2_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v: bigint = 123n}
  class C1_2 extends B1_2 {v: int = 321}
  class C2_2 extends B1_2 {v: number = 6.7}
  class Other_2 {v: string = "other"}

  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_2(v)
      check_C2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
      check_C2_2(v as B1_2 | Other_2 | bigint)
    }
    else if (v_id == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2 | Other_2 | bigint)
    }
  }

  function check_value_as_type_T_2(v: Object, v_id: int): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2 || v instanceof B1_2 || v instanceof bigint).assertEqual(true)
    check_value_2(v, v_id)
  }

  function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | bigint, v_id: int): boolean {
    check_value_2(v, v_id)
    if (v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2) {
      check_value_2(v, v_id)
      if (v instanceof B1_2 || v instanceof Other_2 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
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
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(new C2_2(), 1)
    let res2: boolean = check_is_in_T_type_2(new B2_2(), 2)
    let res3: boolean = check_is_in_T_type_2(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

namespace testNS3_2 {
  abstract class A_2 {}
  abstract class B1_2 extends A_2 {}
  class B2_2 extends A_2 {v: bigint = 123n}
  class C1_2 extends B1_2 {v: int = 321}
  class C2_2 extends B1_2 {v: number = 6.7}
  class Other_2 {v: string = "other"}

  function check_C1_2(a: Any) {
    expect(a instanceof C1_2).assertEqual(true)
    expect((a as C1_2).v).assertEqual(321)
  }
  function check_C2_2(a: Any) {
    expect(a instanceof C2_2).assertEqual(true)
    expect((a as C2_2).v).assertEqual(6.7)
  }
  function check_B2_2(a: Any) {
    expect(a instanceof B2_2).assertEqual(true)
    expect((a as B2_2).v).assertEqual(123n)
  }
  function check_Other_2(a: Any) {
    expect(a instanceof Other_2).assertEqual(true)
    expect((a as Other_2).v).assertEqual("other")
  }
  function check_bigint_2(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_2(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_Other_2(v)
      check_Other_2(v as C1_2 | C2_2 | B2_2 | Other_2)
      check_Other_2(v as B1_2 | Other_2 | bigint)
    }
    else if (v_id == 2) {
      check_B2_2(v)
      check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    }
    else {
      check_bigint_2(v)
      check_bigint_2(v as B1_2 | Other_2 | bigint)
    }
  }

  function check_value_as_type_T_2(v: Object, v_id: int): void {
    expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2 || v instanceof B1_2 || v instanceof bigint).assertEqual(true)
    check_value_2(v, v_id)
  }

  function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | bigint, v_id: int): boolean {
    check_value_2(v, v_id)
    if (v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2) {
      check_value_2(v, v_id)
      if (v instanceof B1_2 || v instanceof Other_2 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_2(v, v_id)
        expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
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
      if (v instanceof Object) {
        check_value_as_type_T_2(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_2(): boolean {
    let res1: boolean = check_is_in_T_type_2(new Other_2(), 1)
    let res2: boolean = check_is_in_T_type_2(new B2_2(), 2)
    let res3: boolean = check_is_in_T_type_2(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

abstract class A_2 {}
abstract class B1_2 extends A_2 {}
class B2_2 extends A_2 {v: bigint = 123n}
class C1_2 extends B1_2 {v: int = 321}
class C2_2 extends B1_2 {v: number = 6.7}
class Other_2 {v: string = "other"}

function check_C1_2(a: Any) {
  expect(a instanceof C1_2).assertEqual(true)
  expect((a as C1_2).v).assertEqual(321)
}
function check_C2_2(a: Any) {
  expect(a instanceof C2_2).assertEqual(true)
  expect((a as C2_2).v).assertEqual(6.7)
}
function check_B2_2(a: Any) {
  expect(a instanceof B2_2).assertEqual(true)
  expect((a as B2_2).v).assertEqual(123n)
}
function check_Other_2(a: Any) {
  expect(a instanceof Other_2).assertEqual(true)
  expect((a as Other_2).v).assertEqual("other")
}
function check_bigint_2(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}

function check_value_2(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_2(v)
    check_C1_2(v as C1_2 | C2_2 | B2_2 | Other_2)
    check_C1_2(v as B1_2 | Other_2 | bigint)
  }
  else if (v_id == 2) {
    check_B2_2(v)
    check_B2_2(v as C1_2 | C2_2 | B2_2 | Other_2)
  }
  else {
    check_bigint_2(v)
    check_bigint_2(v as B1_2 | Other_2 | bigint)
  }
}

function check_value_as_type_T_2(v: Object, v_id: int): void {
  expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2 || v instanceof B1_2 || v instanceof bigint).assertEqual(true)
  check_value_2(v, v_id)
}

function check_is_in_T_type_2(v: C1_2 | C2_2 | B2_2 | Other_2 | B1_2 | bigint, v_id: int): boolean {
  check_value_2(v, v_id)
  if (v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2) {
    check_value_2(v, v_id)
    if (v instanceof B1_2 || v instanceof Other_2 || v instanceof bigint) {
      expect(v_id).assertEqual(1)
      check_value_2(v, v_id)
      expect(v instanceof C1_2 || v instanceof C2_2 || v instanceof B2_2 || v instanceof Other_2).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
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
    if (v instanceof Object) {
      check_value_as_type_T_2(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 {v: bigint = 123n}
  class C2_3 implements III2_3 {v: int = 321}
  class C3_3 implements II2_3 {v: number = 7.8}

  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3).v).assertEqual(123n)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3).v).assertEqual(321)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3).v).assertEqual(7.8)
  }
  function check_bigint_3(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_3(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_3(v)
      check_C1_3(v as III1_3 | III2_3 | II2_3)
      check_C1_3(v as II1_3 | bigint)
    } else if (v_id == 2) {
      check_C3_3(v)
      check_C3_3(v as III1_3 | III2_3 | II2_3)
    } else {
      check_bigint_3(v)
      check_bigint_3(v as II1_3 | bigint)
    }
  }

  function check_value_as_type_T_3(v: Object, v_id: int): void {
    expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof II1_3 || v instanceof bigint).assertEqual(true)
    check_value_3(v, v_id)
  }

  function check_is_in_T_type_3(v: III1_3 | III2_3 | II2_3 | II1_3 | bigint, v_id: int): boolean {
    check_value_3(v, v_id)
    if (v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3) {
      check_value_3(v, v_id)
      if (v instanceof II1_3 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_3(v, v_id)
        expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_3(v, v_id)
          return true
        } else {
          return false
        }
      } else {
        expect(v_id).assertEqual(2)
        check_value_3(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_3(v, v_id)
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_3(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3(new C1_3(), 1)
    let res2: boolean = check_is_in_T_type_3(new C3_3(), 2)
    let res3: boolean = check_is_in_T_type_3(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

namespace testNS2_3 {
  interface I1_3 {}
  interface I2_3 {}
  interface II1_3 extends I1_3, I2_3 {}
  interface II2_3 extends I1_3, I2_3 {}
  interface III1_3 extends II1_3 {}
  interface III2_3 extends II1_3 {}
  class C1_3 implements III1_3 {v: bigint = 123n}
  class C2_3 implements III2_3 {v: int = 321}
  class C3_3 implements II2_3 {v: number = 7.8}

  function check_C1_3(a: Any) {
    expect(a instanceof C1_3).assertEqual(true)
    expect(a instanceof III1_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C1_3).v).assertEqual(123n)
  }
  function check_C2_3(a: Any) {
    expect(a instanceof C2_3).assertEqual(true)
    expect(a instanceof III2_3).assertEqual(true)
    expect(a instanceof II1_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C2_3).v).assertEqual(321)
  }
  function check_C3_3(a: Any) {
    expect(a instanceof C3_3).assertEqual(true)
    expect(a instanceof II2_3).assertEqual(true)
    expect(a instanceof I1_3).assertEqual(true)
    expect(a instanceof I2_3).assertEqual(true)
    expect((a as C3_3).v).assertEqual(7.8)
  }
  function check_bigint_3(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_3(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_3(v)
      check_C2_3(v as III1_3 | III2_3 | II2_3)
      check_C2_3(v as II1_3 | bigint)
    } else if (v_id == 2) {
      check_C3_3(v)
      check_C3_3(v as III1_3 | III2_3 | II2_3)
    } else {
      check_bigint_3(v)
      check_bigint_3(v as II1_3 | bigint)
    }
  }

  function check_value_as_type_T_3(v: Object, v_id: int): void {
    expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof II1_3 || v instanceof bigint).assertEqual(true)
    check_value_3(v, v_id)
  }

  function check_is_in_T_type_3(v: III1_3 | III2_3 | II2_3 | II1_3 | bigint, v_id: int): boolean {
    check_value_3(v, v_id)
    if (v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3) {
      check_value_3(v, v_id)
      if (v instanceof II1_3 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_3(v, v_id)
        expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_3(v, v_id)
          return true
        } else {
          return false
        }
      } else {
        expect(v_id).assertEqual(2)
        check_value_3(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_3(v, v_id)
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_3(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_3(): boolean {
    let res1: boolean = check_is_in_T_type_3(new C2_3(), 1)
    let res2: boolean = check_is_in_T_type_3(new C3_3(), 2)
    let res3: boolean = check_is_in_T_type_3(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

interface I1_3 {}
interface I2_3 {}
interface II1_3 extends I1_3, I2_3 {}
interface II2_3 extends I1_3, I2_3 {}
interface III1_3 extends II1_3 {}
interface III2_3 extends II1_3 {}
class C1_3 implements III1_3 {v: bigint = 123n}
class C2_3 implements III2_3 {v: int = 321}
class C3_3 implements II2_3 {v: number = 7.8}

function check_C1_3(a: Any) {
  expect(a instanceof C1_3).assertEqual(true)
  expect(a instanceof III1_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C1_3).v).assertEqual(123n)
}
function check_C2_3(a: Any) {
  expect(a instanceof C2_3).assertEqual(true)
  expect(a instanceof III2_3).assertEqual(true)
  expect(a instanceof II1_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C2_3).v).assertEqual(321)
}
function check_C3_3(a: Any) {
  expect(a instanceof C3_3).assertEqual(true)
  expect(a instanceof II2_3).assertEqual(true)
  expect(a instanceof I1_3).assertEqual(true)
  expect(a instanceof I2_3).assertEqual(true)
  expect((a as C3_3).v).assertEqual(7.8)
}
function check_bigint_3(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}

function check_value_3(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_3(v)
    check_C1_3(v as III1_3 | III2_3 | II2_3)
    check_C1_3(v as II1_3 | bigint)
  } else if (v_id == 2) {
    check_C3_3(v)
    check_C3_3(v as III1_3 | III2_3 | II2_3)
  } else {
    check_bigint_3(v)
    check_bigint_3(v as II1_3 | bigint)
  }
}

function check_value_as_type_T_3(v: Object, v_id: int): void {
  expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3 || v instanceof II1_3 || v instanceof bigint).assertEqual(true)
  check_value_3(v, v_id)
}

function check_is_in_T_type_3(v: III1_3 | III2_3 | II2_3 | II1_3 | bigint, v_id: int): boolean {
  check_value_3(v, v_id)
  if (v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3) {
    check_value_3(v, v_id)
    if (v instanceof II1_3 || v instanceof bigint) {
      expect(v_id).assertEqual(1)
      check_value_3(v, v_id)
      expect(v instanceof III1_3 || v instanceof III2_3 || v instanceof II2_3).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    } else {
      expect(v_id).assertEqual(2)
      check_value_3(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_3(v, v_id)
        return true
      } else {
        return false
      }
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_3(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_3(v, v_id)
      return true
    } else {
      return false
    }
  }
}

namespace testNS1_4 {
  interface I_4 {}
  interface II1_4 extends I_4 {}
  interface II2_4 extends I_4 {}
  interface III1_4 extends II1_4 {}
  interface III2_4 extends II1_4 {}
  class C1_4 implements III1_4, III2_4 {v: bigint = 123n}
  class C2_4 implements II2_4, III2_4 {v: int = 321}
  class C3_4 implements III1_4 {v: number = 7.8}

  function check_C1_4(a: Any) {
    expect(a instanceof C1_4).assertEqual(true)
    expect(a instanceof III1_4).assertEqual(true)
    expect(a instanceof III2_4).assertEqual(true)
    expect(a instanceof II1_4).assertEqual(true)
    expect(a instanceof I_4).assertEqual(true)
    expect((a as C1_4).v).assertEqual(123n)
  }
  function check_C2_4(a: Any) {
    expect(a instanceof C2_4).assertEqual(true)
    expect(a instanceof II2_4).assertEqual(true)
    expect(a instanceof III2_4).assertEqual(true)
    expect(a instanceof II1_4).assertEqual(true)
    expect(a instanceof I_4).assertEqual(true)
    expect((a as C2_4).v).assertEqual(321)
  }
  function check_C3_4(a: Any) {
    expect(a instanceof C3_4).assertEqual(true)
    expect(a instanceof III1_4).assertEqual(true)
    expect(a instanceof II1_4).assertEqual(true)
    expect(a instanceof I_4).assertEqual(true)
    expect((a as C3_4).v).assertEqual(7.8)
  }
  function check_bigint_4(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_4(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C1_4(v)
      check_C1_4(v as III1_4 | III2_4 | II2_4)
      check_C1_4(v as III2_4 | bigint)
    } else if (v_id == 2) {
      check_C3_4(v)
      check_C3_4(v as III1_4 | III2_4 | II2_4)
    } else {
      check_bigint_4(v)
      check_bigint_4(v as III2_4 | bigint)
    }
  }

  function check_value_as_type_T_4(v: Object, v_id: int): void {
    expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || v instanceof bigint).assertEqual(true)
    check_value_4(v, v_id)
  }

  function check_is_in_T_type_4(v: III1_4 | III2_4 | II2_4 | bigint, v_id: int): boolean {
    check_value_4(v, v_id)
    if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4) {
      check_value_4(v, v_id)
      if (v instanceof III2_4 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_4(v, v_id)
        expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_4(v, v_id)
          return true
        } else {
          return false
        }
      } else {
        expect(v_id).assertEqual(2)
        check_value_4(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_4(v, v_id)
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_4(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_4(): boolean {
    let res1: boolean = check_is_in_T_type_4(new C1_4(), 1)
    let res2: boolean = check_is_in_T_type_4(new C3_4(), 2)
    let res3: boolean = check_is_in_T_type_4(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

namespace testNS2_4 {
  interface I_4 {}
  interface II1_4 extends I_4 {}
  interface II2_4 extends I_4 {}
  interface III1_4 extends II1_4 {}
  interface III2_4 extends II1_4 {}
  class C1_4 implements III1_4, III2_4 {v: bigint = 123n}
  class C2_4 implements II2_4, III2_4 {v: int = 321}
  class C3_4 implements III1_4 {v: number = 7.8}

  function check_C1_4(a: Any) {
    expect(a instanceof C1_4).assertEqual(true)
    expect(a instanceof III1_4).assertEqual(true)
    expect(a instanceof III2_4).assertEqual(true)
    expect(a instanceof II1_4).assertEqual(true)
    expect(a instanceof I_4).assertEqual(true)
    expect((a as C1_4).v).assertEqual(123n)
  }
  function check_C2_4(a: Any) {
    expect(a instanceof C2_4).assertEqual(true)
    expect(a instanceof II2_4).assertEqual(true)
    expect(a instanceof III2_4).assertEqual(true)
    expect(a instanceof II1_4).assertEqual(true)
    expect(a instanceof I_4).assertEqual(true)
    expect((a as C2_4).v).assertEqual(321)
  }
  function check_C3_4(a: Any) {
    expect(a instanceof C3_4).assertEqual(true)
    expect(a instanceof III1_4).assertEqual(true)
    expect(a instanceof II1_4).assertEqual(true)
    expect(a instanceof I_4).assertEqual(true)
    expect((a as C3_4).v).assertEqual(7.8)
  }
  function check_bigint_4(a: Any) {
    expect(a instanceof bigint).assertEqual(true)
    expect(a as bigint).assertEqual(5n)
  }

  function check_value_4(v: Any, v_id: int): void {
    if (v_id == 1) {
      check_C2_4(v)
      check_C2_4(v as III1_4 | III2_4 | II2_4)
      check_C2_4(v as III2_4 | bigint)
    } else if (v_id == 2) {
      check_C3_4(v)
      check_C3_4(v as III1_4 | III2_4 | II2_4)
    } else {
      check_bigint_4(v)
      check_bigint_4(v as III2_4 | bigint)
    }
  }

  function check_value_as_type_T_4(v: Object, v_id: int): void {
    expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || v instanceof bigint).assertEqual(true)
    check_value_4(v, v_id)
  }

  function check_is_in_T_type_4(v: III1_4 | III2_4 | II2_4 | bigint, v_id: int): boolean {
    check_value_4(v, v_id)
    if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4) {
      check_value_4(v, v_id)
      if (v instanceof III2_4 || v instanceof bigint) {
        expect(v_id).assertEqual(1)
        check_value_4(v, v_id)
        expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertEqual(true)
        expect(v instanceof Object).assertEqual(true)
        if (v instanceof Object) {
          check_value_as_type_T_4(v, v_id)
          return true
        } else {
          return false
        }
      } else {
        expect(v_id).assertEqual(2)
        check_value_4(v, v_id)
        if (v instanceof Object) {
          check_value_as_type_T_4(v, v_id)
          return true
        } else {
          return false
        }
      }
    } else {
      expect(v_id).assertEqual(3)
      check_value_4(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    }
  }

  export function runTest_4(): boolean {
    let res1: boolean = check_is_in_T_type_4(new C2_4(), 1)
    let res2: boolean = check_is_in_T_type_4(new C3_4(), 2)
    let res3: boolean = check_is_in_T_type_4(5n, 3)
    expect(res1 && (res2 || res3)).assertEqual(true)
    return true
  }
}

interface I_4 {}
interface II1_4 extends I_4 {}
interface II2_4 extends I_4 {}
interface III1_4 extends II1_4 {}
interface III2_4 extends II1_4 {}
class C1_4 implements III1_4, III2_4 {v: bigint = 123n}
class C2_4 implements II2_4, III2_4 {v: int = 321}
class C3_4 implements III1_4 {v: number = 7.8}

function check_C1_4(a: Any) {
  expect(a instanceof C1_4).assertEqual(true)
  expect(a instanceof III1_4).assertEqual(true)
  expect(a instanceof III2_4).assertEqual(true)
  expect(a instanceof II1_4).assertEqual(true)
  expect(a instanceof I_4).assertEqual(true)
  expect((a as C1_4).v).assertEqual(123n)
}
function check_C2_4(a: Any) {
  expect(a instanceof C2_4).assertEqual(true)
  expect(a instanceof II2_4).assertEqual(true)
  expect(a instanceof III2_4).assertEqual(true)
  expect(a instanceof II1_4).assertEqual(true)
  expect(a instanceof I_4).assertEqual(true)
  expect((a as C2_4).v).assertEqual(321)
}
function check_C3_4(a: Any) {
  expect(a instanceof C3_4).assertEqual(true)
  expect(a instanceof III1_4).assertEqual(true)
  expect(a instanceof II1_4).assertEqual(true)
  expect(a instanceof I_4).assertEqual(true)
  expect((a as C3_4).v).assertEqual(7.8)
}
function check_bigint_4(a: Any) {
  expect(a instanceof bigint).assertEqual(true)
  expect(a as bigint).assertEqual(5n)
}

function check_value_4(v: Any, v_id: int): void {
  if (v_id == 1) {
    check_C1_4(v)
    check_C1_4(v as III1_4 | III2_4 | II2_4)
    check_C1_4(v as III2_4 | bigint)
  } else if (v_id == 2) {
    check_C3_4(v)
    check_C3_4(v as III1_4 | III2_4 | II2_4)
  } else {
    check_bigint_4(v)
    check_bigint_4(v as III2_4 | bigint)
  }
}

function check_value_as_type_T_4(v: Object, v_id: int): void {
  expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4 || v instanceof bigint).assertEqual(true)
  check_value_4(v, v_id)
}

function check_is_in_T_type_4(v: III1_4 | III2_4 | II2_4 | bigint, v_id: int): boolean {
  check_value_4(v, v_id)
  if (v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4) {
    check_value_4(v, v_id)
    if (v instanceof III2_4 || v instanceof bigint) {
      expect(v_id).assertEqual(1)
      check_value_4(v, v_id)
      expect(v instanceof III1_4 || v instanceof III2_4 || v instanceof II2_4).assertEqual(true)
      expect(v instanceof Object).assertEqual(true)
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    } else {
      expect(v_id).assertEqual(2)
      check_value_4(v, v_id)
      if (v instanceof Object) {
        check_value_as_type_T_4(v, v_id)
        return true
      } else {
        return false
      }
    }
  } else {
    expect(v_id).assertEqual(3)
    check_value_4(v, v_id)
    if (v instanceof Object) {
      check_value_as_type_T_4(v, v_id)
      return true
    } else {
      return false
    }
  }
}






export default function InterTypeIsSubOfTypeObjOnNonGenTest(): void {
  describe('InterTypeIsSubOfTypeObjOnNonGenTest', () => {
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
     * @tc.number    SUB_INTER_TYPE_IS_SUB_OF_TYPE_OBJ_ON_NON_GEN_0100
     * @tc.name      testInterTypeIsSubOfTypeObjOnNonGen0001
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on non
     *               generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnNonGen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnNonGen0001';
      

      let res1_1: boolean = check_is_in_T_type_1(
        new Dog_1(), 1)
      let res2_1: boolean = check_is_in_T_type_1(
        new Cat_1(), 2)
      let res3_1: boolean = check_is_in_T_type_1(
        5n, 3)
      expect(res1_1 && (res2_1 || res3_1)).assertEqual(true)

      expect(testNS1_1.runTest_1()).assertEqual(true)
      expect(testNS2_1.runTest_1()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0200
     * @tc.name      testInterTypeIsSubOfTypeObjOnNonGen0002
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on non
     *               generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnNonGen0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnNonGen0002';
      

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

    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0300
     * @tc.name      testInterTypeIsSubOfTypeObjOnNonGen0003
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on non
     *               generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnNonGen0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnNonGen0003';
      

      let res1_3: boolean = check_is_in_T_type_3(
        new C1_3(), 1)
      let res2_3: boolean = check_is_in_T_type_3(
        new C3_3(), 2)
      let res3_3: boolean = check_is_in_T_type_3(
        5n, 3)
      expect(res1_3 && (res2_3 || res3_3)).assertEqual(true)

      expect(testNS1_3.runTest_3()).assertEqual(true)
      expect(testNS2_3.runTest_3()).assertEqual(true)

    });

    /**
     * @tc.number    SUB_SPECIFICS_OF_TYPE_PARAMETERS_0400
     * @tc.name      testInterTypeIsSubOfTypeObjOnNonGen0004
     * @tc.desc      Checking that intersection type I (defined as I1 & I2) is a subtype of type
     *               Object if Ii is a subtype of Object for some i in case of usage instanceof on non
     *               generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInterTypeIsSubOfTypeObjOnNonGen0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInterTypeIsSubOfTypeObjOnNonGen0004';
      

      let res1_4: boolean = check_is_in_T_type_4(
        new C1_4(), 1)
      let res2_4: boolean = check_is_in_T_type_4(
        new C3_4(), 2)
      let res3_4: boolean = check_is_in_T_type_4(
        5n, 3)
      expect(res1_4 && (res2_4 || res3_4)).assertEqual(true)

      expect(testNS1_4.runTest_4()).assertEqual(true)
      expect(testNS2_4.runTest_4()).assertEqual(true)

    });
  })
}