'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// ============================================================================
// Data Setup for testSpecExample0001
// ============================================================================
function main_01(): string {
  let a = new Object()
  return a.toString()
}

// ============================================================================
// Data Setup for testSpecExample0002
// ============================================================================
function boo_02(): number | string {
  let a: number | string = 42
  // Smart cast: static type narrowed to number, so ++ is allowed
  a++
  return a
}

class Base_02 {}
class Derived_02 extends Base_02 {
  method(): number { return 1 }
}

function goo_02(): number {
  let b: Base_02 = new Derived_02()
  return (b as Derived_02).method()
}

function foo_02(b: Base_02, d: Derived_02): number {
  // Smart cast inside conditional blocks
  if (b instanceof Derived_02) {
    return b.method()
  }
  if (d != null) {
    return d.method()
  }
  return 0
}

// ============================================================================
// Data Setup for testSpecExample0003
// ============================================================================
class Base_03 {}
class Derived_03 extends Base_03 {
  d: number = 2
}

function fooBase_03(p: Base_03): string { return "Base" }
function fooDerived_03(p: Derived_03): string { return "Derived" }

function foo_03(p: Base_03): string {
  if (p instanceof Derived_03) {
    return fooDerived_03(p);
  }
  return fooBase_03(p);
}


export default function SmartCastExamplesTest():void {
  describe('SmartCastExamplesTest', () => {
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
     * @tc.number    SUB_SMART_CAST_EXAMPLESTEST_0100
     * @tc.name      testSpecExampleOne0001
     * @tc.desc      There could be cases when the type of an entity (mostly local variables) is
     *               a union type and in the particular context of the program the compiler can narrow
     *               (smart cast) the static type to a more precise type (smart type) and allow operations
     *               which are specific to such narrowed type. (Object.toString)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExampleOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(main_01()).assertEqual("[object Object]")
    });

    /**
     * @tc.number    SUB_SMART_CAST_EXAMPLESTEST_0200
     * @tc.name      testSpecExampleOne0002
     * @tc.desc      Checking smart cast inside initial assignments, increments on unions,
     *               and inside `instanceof` blocks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExampleOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(boo_02()).assertEqual(43)
      expect(goo_02()).assertEqual(1)
      expect(foo_02(new Derived_02(), new Derived_02())).assertEqual(1)
      expect(foo_02(new Base_02(), new Derived_02())).assertEqual(1)
    });

    /**
     * @tc.number    SUB_SMART_CAST_EXAMPLESTEST_0300
     * @tc.name      testSpecExampleOne0003
     * @tc.desc      Checking smart cast dynamically resolving the correct function overload
     *               based on the narrowed type of the variable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSpecExampleOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_03 = new Base_03()
      expect(foo_03(a)).assertEqual("Base")

      let b: Base_03 = new Derived_03()
      // ArkTS smart cast narrows 'b' to 'Derived_03', routing it properly
      expect(foo_03(b)).assertEqual("Derived")
    });

  })
}