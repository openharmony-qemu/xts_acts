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


namespace testNS216 {
  class Cat31 { v: string = "cat" }
  class Dog31 { v: bigint = 123n }
  class Frog31 { v: number = 5 }

  function check_cat31(a: Cat31 | Dog31 | Frog31 | number) {
    expect(a instanceof Cat31).assertTrue();
    expect((a as Cat31).v).assertEqual("cat");
  }

  function check_dog31(a: Cat31 | Dog31 | Frog31 | number) {
    expect(a instanceof Dog31).assertTrue();
    expect((a as Dog31).v).assertEqual(123n);
  }

  function check_frog31(a: Cat31 | Dog31 | Frog31 | number) {
    expect(a instanceof Frog31).assertTrue();
    expect((a as Frog31).v).assertEqual(5);
  }

  function check_number31(a: Cat31 | Dog31 | Frog31 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo31(p: (number | Dog31 | Cat31 | Frog31)[]): Array<Cat31 | Dog31 | Frog31 | number> {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat31 | Dog31 | Frog31 | number)[] = [new Cat31(), 7.8, new Dog31(), new Frog31()]
    let b: Array<number | Dog31 | Cat31 | Frog31> = foo31(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat31).assertTrue();
    check_cat31(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog31).assertTrue();
    check_dog31(b[2])

    expect(b[3] instanceof Frog31).assertTrue();
    check_frog31(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat31).assertTrue();
    check_cat31(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog31).assertTrue();
    check_dog31(a[2])

    expect(a[3] instanceof Frog31).assertTrue();
    check_frog31(a[3])

    return true
  }
}

class Cat31 { v: string = "cat" }
class Dog31 { v: bigint = 123n }
class Frog31 { v: number = 5 }

function check_cat31(a: Cat31 | Dog31 | Frog31 | number) {
  expect(a instanceof Cat31).assertTrue();
  expect((a as Cat31).v).assertEqual("cat");
}

function check_dog31(a: Cat31 | Dog31 | Frog31 | number) {
  expect(a instanceof Dog31).assertTrue();
  expect((a as Dog31).v).assertEqual(123n);
}

function check_frog31(a: Cat31 | Dog31 | Frog31 | number) {
  expect(a instanceof Frog31).assertTrue();
  expect((a as Frog31).v).assertEqual(5);
}

function check_number31(a: Cat31 | Dog31 | Frog31 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo31(p: (number | Dog31 | Cat31 | Frog31)[]): Array<Cat31 | Dog31 | Frog31 | number> {
  return p
}

namespace testNS217 {
  class Cat32 { v: string = "cat" }
  class Dog32 { v: bigint = 123n }
  class Frog32 { v: number = 5 }

  function check_cat32(a: Cat32 | Dog32 | Frog32 | number) {
    expect(a instanceof Cat32).assertTrue();
    expect((a as Cat32).v).assertEqual("cat");
  }

  function check_dog32(a: Cat32 | Dog32 | Frog32 | number) {
    expect(a instanceof Dog32).assertTrue();
    expect((a as Dog32).v).assertEqual(123n);
  }

  function check_frog32(a: Cat32 | Dog32 | Frog32 | number) {
    expect(a instanceof Frog32).assertTrue();
    expect((a as Frog32).v).assertEqual(5);
  }

  function check_number32(a: Cat32 | Dog32 | Frog32 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo32(p: (number | Dog32 | Cat32 | Frog32)[]): Array<Cat32 | Dog32 | Frog32 | number> {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat32 | Dog32 | Frog32 | number> = [new Cat32(), 7.8, new Dog32(), new Frog32()]
    let b: (number | Dog32 | Cat32 | Frog32)[] = foo32(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat32).assertTrue();
    check_cat32(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog32).assertTrue();
    check_dog32(b[2])

    expect(b[3] instanceof Frog32).assertTrue();
    check_frog32(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat32).assertTrue();
    check_cat32(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog32).assertTrue();
    check_dog32(a[2])

    expect(a[3] instanceof Frog32).assertTrue();
    check_frog32(a[3])

    return true
  }
}

class Cat32 { v: string = "cat" }
class Dog32 { v: bigint = 123n }
class Frog32 { v: number = 5 }

function check_cat32(a: Cat32 | Dog32 | Frog32 | number) {
  expect(a instanceof Cat32).assertTrue();
  expect((a as Cat32).v).assertEqual("cat");
}

function check_dog32(a: Cat32 | Dog32 | Frog32 | number) {
  expect(a instanceof Dog32).assertTrue();
  expect((a as Dog32).v).assertEqual(123n);
}

function check_frog32(a: Cat32 | Dog32 | Frog32 | number) {
  expect(a instanceof Frog32).assertTrue();
  expect((a as Frog32).v).assertEqual(5);
}

function check_number32(a: Cat32 | Dog32 | Frog32 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo32(p: (number | Dog32 | Cat32 | Frog32)[]): Array<Cat32 | Dog32 | Frog32 | number> {
  return p
}

namespace testNS218 {
  class Cat33 { v: string = "cat" }
  class Dog33 { v: bigint = 123n }
  class Frog33 { v: number = 5 }

  function check_cat33(a: Cat33 | Dog33 | Frog33 | number) {
    expect(a instanceof Cat33).assertTrue();
    expect((a as Cat33).v).assertEqual("cat");
  }

  function check_dog33(a: Cat33 | Dog33 | Frog33 | number) {
    expect(a instanceof Dog33).assertTrue();
    expect((a as Dog33).v).assertEqual(123n);
  }

  function check_frog33(a: Cat33 | Dog33 | Frog33 | number) {
    expect(a instanceof Frog33).assertTrue();
    expect((a as Frog33).v).assertEqual(5);
  }

  function check_number33(a: Cat33 | Dog33 | Frog33 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo33(p: (Cat33 | Dog33 | Frog33 | number)[]): (number | Dog33 | Cat33 | Frog33)[] {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat33 | Dog33 | Frog33 | number)[] = [new Cat33(), 7.8, new Dog33(), new Frog33()]
    let b: Array<number | Dog33 | Cat33 | Frog33> = foo33(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat33).assertTrue();
    check_cat33(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog33).assertTrue();
    check_dog33(b[2])

    expect(b[3] instanceof Frog33).assertTrue();
    check_frog33(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat33).assertTrue();
    check_cat33(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog33).assertTrue();
    check_dog33(a[2])

    expect(a[3] instanceof Frog33).assertTrue();
    check_frog33(a[3])

    return true
  }
}

class Cat33 { v: string = "cat" }
class Dog33 { v: bigint = 123n }
class Frog33 { v: number = 5 }

function check_cat33(a: Cat33 | Dog33 | Frog33 | number) {
  expect(a instanceof Cat33).assertTrue();
  expect((a as Cat33).v).assertEqual("cat");
}

function check_dog33(a: Cat33 | Dog33 | Frog33 | number) {
  expect(a instanceof Dog33).assertTrue();
  expect((a as Dog33).v).assertEqual(123n);
}

function check_frog33(a: Cat33 | Dog33 | Frog33 | number) {
  expect(a instanceof Frog33).assertTrue();
  expect((a as Frog33).v).assertEqual(5);
}

function check_number33(a: Cat33 | Dog33 | Frog33 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo33(p: (Cat33 | Dog33 | Frog33 | number)[]): (number | Dog33 | Cat33 | Frog33)[] {
  return p
}

namespace testNS219 {
  class Cat34 { v: string = "cat" }
  class Dog34 { v: bigint = 123n }
  class Frog34 { v: number = 5 }

  function check_cat34(a: Cat34 | Dog34 | Frog34 | number) {
    expect(a instanceof Cat34).assertTrue();
    expect((a as Cat34).v).assertEqual("cat");
  }

  function check_dog34(a: Cat34 | Dog34 | Frog34 | number) {
    expect(a instanceof Dog34).assertTrue();
    expect((a as Dog34).v).assertEqual(123n);
  }

  function check_frog34(a: Cat34 | Dog34 | Frog34 | number) {
    expect(a instanceof Frog34).assertTrue();
    expect((a as Frog34).v).assertEqual(5);
  }

  function check_number34(a: Cat34 | Dog34 | Frog34 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo34(p: (Cat34 | Dog34 | Frog34 | number)[]): (number | Dog34 | Cat34 | Frog34)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat34 | Dog34 | Frog34 | number> = [new Cat34(), 7.8, new Dog34(), new Frog34()]
    let b: (number | Dog34 | Cat34 | Frog34)[] = foo34(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat34).assertTrue();
    check_cat34(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog34).assertTrue();
    check_dog34(b[2])

    expect(b[3] instanceof Frog34).assertTrue();
    check_frog34(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat34).assertTrue();
    check_cat34(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog34).assertTrue();
    check_dog34(a[2])

    expect(a[3] instanceof Frog34).assertTrue();
    check_frog34(a[3])

    return true
  }
}

class Cat34 { v: string = "cat" }
class Dog34 { v: bigint = 123n }
class Frog34 { v: number = 5 }

function check_cat34(a: Cat34 | Dog34 | Frog34 | number) {
  expect(a instanceof Cat34).assertTrue();
  expect((a as Cat34).v).assertEqual("cat");
}

function check_dog34(a: Cat34 | Dog34 | Frog34 | number) {
  expect(a instanceof Dog34).assertTrue();
  expect((a as Dog34).v).assertEqual(123n);
}

function check_frog34(a: Cat34 | Dog34 | Frog34 | number) {
  expect(a instanceof Frog34).assertTrue();
  expect((a as Frog34).v).assertEqual(5);
}

function check_number34(a: Cat34 | Dog34 | Frog34 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo34(p: (Cat34 | Dog34 | Frog34 | number)[]): (number | Dog34 | Cat34 | Frog34)[] {
  return p
}

namespace testNS221 {
  class Cat36 { v: string = "cat" }
  class Dog36 { v: bigint = 123n }
  class Frog43 { v: number = 5 }

  function check_cat36(a: Cat36 | Dog36 | Frog43 | number) {
    expect(a instanceof Cat36).assertTrue();
    expect((a as Cat36).v).assertEqual("cat");
  }

  function check_dog36(a: Cat36 | Dog36 | Frog43 | number) {
    expect(a instanceof Dog36).assertTrue();
    expect((a as Dog36).v).assertEqual(123n);
  }

  function check_frog43(a: Cat36 | Dog36 | Frog43 | number) {
    expect(a instanceof Frog43).assertTrue();
    expect((a as Frog43).v).assertEqual(5);
  }

  function check_number36(a: Cat36 | Dog36 | Frog43 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo36(p: (number | Dog36 | Cat36 | Frog43)[]): (Cat36 | Dog36 | Frog43 | number)[] {
    return p
  }

  export function runTest(): boolean {
    let a: (Cat36 | Dog36 | Frog43 | number)[] = [new Cat36(), 7.8, new Dog36(), new Frog43()]
    let b: Array<number | Dog36 | Cat36 | Frog43> = foo36(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat36).assertTrue();
    check_cat36(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog36).assertTrue();
    check_dog36(b[2])

    expect(b[3] instanceof Frog43).assertTrue();
    check_frog43(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat36).assertTrue();
    check_cat36(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog36).assertTrue();
    check_dog36(a[2])

    expect(a[3] instanceof Frog43).assertTrue();
    check_frog43(a[3])

    return true
  }
}

class Cat36 { v: string = "cat" }
class Dog36 { v: bigint = 123n }
class Frog43 { v: number = 5 }

function check_cat36(a: Cat36 | Dog36 | Frog43 | number) {
  expect(a instanceof Cat36).assertTrue();
  expect((a as Cat36).v).assertEqual("cat");
}

function check_dog36(a: Cat36 | Dog36 | Frog43 | number) {
  expect(a instanceof Dog36).assertTrue();
  expect((a as Dog36).v).assertEqual(123n);
}

function check_frog43(a: Cat36 | Dog36 | Frog43 | number) {
  expect(a instanceof Frog43).assertTrue();
  expect((a as Frog43).v).assertEqual(5);
}

function check_number36(a: Cat36 | Dog36 | Frog43 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo36(p: (number | Dog36 | Cat36 | Frog43)[]): (Cat36 | Dog36 | Frog43 | number)[] {
  return p
}

namespace testNS222 {
  class Cat37 { v: string = "cat" }
  class Dog37 { v: bigint = 123n }
  class Frog44 { v: number = 5 }

  function check_cat37(a: Cat37 | Dog37 | Frog44 | number) {
    expect(a instanceof Cat37).assertTrue();
    expect((a as Cat37).v).assertEqual("cat");
  }

  function check_dog37(a: Cat37 | Dog37 | Frog44 | number) {
    expect(a instanceof Dog37).assertTrue();
    expect((a as Dog37).v).assertEqual(123n);
  }

  function check_frog44(a: Cat37 | Dog37 | Frog44 | number) {
    expect(a instanceof Frog44).assertTrue();
    expect((a as Frog44).v).assertEqual(5);
  }

  function check_number37(a: Cat37 | Dog37 | Frog44 | number) {
    expect(typeof a).assertEqual("number");
    expect(a as number).assertEqual(7.8);
  }

  function foo37(p: (number | Dog37 | Cat37 | Frog44)[]): (Cat37 | Dog37 | Frog44 | number)[] {
    return p
  }

  export function runTest(): boolean {
    let a: Array<Cat37 | Dog37 | Frog44 | number> = [new Cat37(), 7.8, new Dog37(), new Frog44()]
    let b: (number | Dog37 | Cat37 | Frog44)[] = foo37(a)

    expect(a instanceof Array).assertTrue();
    expect(b instanceof Array).assertTrue();
    expect(b.length).assertEqual(4);

    expect(b[0] instanceof Cat37).assertTrue();
    check_cat37(b[0])

    expect(typeof b[1]).assertEqual("number");
    expect(b[1] as number).assertEqual(7.8);

    expect(b[2] instanceof Dog37).assertTrue();
    check_dog37(b[2])

    expect(b[3] instanceof Frog44).assertTrue();
    check_frog44(b[3])

    a = b

    expect(a instanceof Array).assertTrue();
    expect(a.length).assertEqual(4);

    expect(a[0] instanceof Cat37).assertTrue();
    check_cat37(a[0])

    expect(typeof a[1]).assertEqual("number");
    expect(a[1] as number).assertEqual(7.8);

    expect(a[2] instanceof Dog37).assertTrue();
    check_dog37(a[2])

    expect(a[3] instanceof Frog44).assertTrue();
    check_frog44(a[3])

    return true
  }
}

class Cat37 { v: string = "cat" }
class Dog37 { v: bigint = 123n }
class Frog44 { v: number = 5 }

function check_cat37(a: Cat37 | Dog37 | Frog44 | number) {
  expect(a instanceof Cat37).assertTrue();
  expect((a as Cat37).v).assertEqual("cat");
}

function check_dog37(a: Cat37 | Dog37 | Frog44 | number) {
  expect(a instanceof Dog37).assertTrue();
  expect((a as Dog37).v).assertEqual(123n);
}

function check_frog44(a: Cat37 | Dog37 | Frog44 | number) {
  expect(a instanceof Frog44).assertTrue();
  expect((a as Frog44).v).assertEqual(5);
}

function check_number37(a: Cat37 | Dog37 | Frog44 | number) {
  expect(typeof a).assertEqual("number");
  expect(a as number).assertEqual(7.8);
}

function foo37(p: (number | Dog37 | Cat37 | Frog44)[]): (Cat37 | Dog37 | Frog44 | number)[] {
  return p
}

export default function SemanticRulesTypeIdentity05(): void {
  describe('SemanticRulesTypeIdentity05', () => {
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
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6700
     * @tc.name      testSemanticRulesTypeIdentity0067
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0067';
        let a: (Cat31 | Dog31 | Frog31 | number)[] = [new Cat31(), 7.8, new Dog31(), new Frog31()]
        let b: Array<number | Dog31 | Cat31 | Frog31> = foo31(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat31).assertTrue();
        check_cat31(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog31).assertTrue();
        check_dog31(b[2])

        expect(b[3] instanceof Frog31).assertTrue();
        check_frog31(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat31).assertTrue();
        check_cat31(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog31).assertTrue();
        check_dog31(a[2])

        expect(a[3] instanceof Frog31).assertTrue();
        check_frog31(a[3])

        expect(testNS216.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6800
     * @tc.name      testSemanticRulesTypeIdentity0068
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0068';
        let a: Array<Cat32 | Dog32 | Frog32 | number> = [new Cat32(), 7.8, new Dog32(), new Frog32()]
        let b: (number | Dog32 | Cat32 | Frog32)[] = foo32(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat32).assertTrue();
        check_cat32(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog32).assertTrue();
        check_dog32(b[2])

        expect(b[3] instanceof Frog32).assertTrue();
        check_frog32(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat32).assertTrue();
        check_cat32(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog32).assertTrue();
        check_dog32(a[2])

        expect(a[3] instanceof Frog32).assertTrue();
        check_frog32(a[3])

        expect(testNS217.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_6900
     * @tc.name      testSemanticRulesTypeIdentity0069
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0069';
        let a: (Cat33 | Dog33 | Frog33 | number)[] = [new Cat33(), 7.8, new Dog33(), new Frog33()]
        let b: Array<number | Dog33 | Cat33 | Frog33> = foo33(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat33).assertTrue();
        check_cat33(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog33).assertTrue();
        check_dog33(b[2])

        expect(b[3] instanceof Frog33).assertTrue();
        check_frog33(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat33).assertTrue();
        check_cat33(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog33).assertTrue();
        check_dog33(a[2])

        expect(a[3] instanceof Frog33).assertTrue();
        check_frog33(a[3])

        expect(testNS218.runTest()).assertTrue();
      })

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_7000
     * @tc.name      testSemanticRulesTypeIdentity0070
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0070';
        let a: Array<Cat34 | Dog34 | Frog34 | number> = [new Cat34(), 7.8, new Dog34(), new Frog34()]
        let b: (number | Dog34 | Cat34 | Frog34)[] = foo34(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat34).assertTrue();
        check_cat34(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog34).assertTrue();
        check_dog34(b[2])

        expect(b[3] instanceof Frog34).assertTrue();
        check_frog34(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat34).assertTrue();
        check_cat34(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog34).assertTrue();
        check_dog34(a[2])

        expect(a[3] instanceof Frog34).assertTrue();
        check_frog34(a[3])

        expect(testNS219.runTest()).assertTrue();
      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_7100
     * @tc.name      testSemanticRulesTypeIdentity0071
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0071';
        let a: (Cat36 | Dog36 | Frog43 | number)[] = [new Cat36(), 7.8, new Dog36(), new Frog43()]
        let b: Array<number | Dog36 | Cat36 | Frog43> = foo36(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat36).assertTrue();
        check_cat36(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog36).assertTrue();
        check_dog36(b[2])

        expect(b[3] instanceof Frog43).assertTrue();
        check_frog43(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat36).assertTrue();
        check_cat36(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog36).assertTrue();
        check_dog36(a[2])

        expect(a[3] instanceof Frog43).assertTrue();
        check_frog43(a[3])

        expect(testNS221.runTest()).assertTrue();


      });

    /**
     * @tc.number    SUB_SEMANTIC_RULES_TYPE_IDENTITYTEST_7200
     * @tc.name      testSemanticRulesTypeIdentity0072
     * @tc.desc      Checking for Array types A[] and Array<B> for Union types A and B are identical
     *               on predefined types on assign operations.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSemanticRulesTypeIdentity0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
      , (): void => {
        const TAG = 'testSemanticRulesTypeIdentity0072';
        let a: Array<Cat37 | Dog37 | Frog44 | number> = [new Cat37(), 7.8, new Dog37(), new Frog44()]
        let b: (number | Dog37 | Cat37 | Frog44)[] = foo37(a)

        expect(a instanceof Array).assertTrue();
        expect(b instanceof Array).assertTrue();
        expect(b.length).assertEqual(4);

        expect(b[0] instanceof Cat37).assertTrue();
        check_cat37(b[0])

        expect(typeof b[1]).assertEqual("number");
        expect(b[1] as number).assertEqual(7.8);

        expect(b[2] instanceof Dog37).assertTrue();
        check_dog37(b[2])

        expect(b[3] instanceof Frog44).assertTrue();
        check_frog44(b[3])

        a = b

        expect(a instanceof Array).assertTrue();
        expect(a.length).assertEqual(4);

        expect(a[0] instanceof Cat37).assertTrue();
        check_cat37(a[0])

        expect(typeof a[1]).assertEqual("number");
        expect(a[1] as number).assertEqual(7.8);

        expect(a[2] instanceof Dog37).assertTrue();
        check_dog37(a[2])

        expect(a[3] instanceof Frog44).assertTrue();
        check_frog44(a[3])

        expect(testNS222.runTest()).assertTrue();
      })
  });
}