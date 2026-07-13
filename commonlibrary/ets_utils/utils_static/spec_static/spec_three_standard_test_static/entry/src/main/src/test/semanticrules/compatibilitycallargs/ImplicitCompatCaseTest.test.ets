'use static';
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
  from '@ohos/hypium-binary/src/main/indexStatic';
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
function checkTypeIdentity1(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity2(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity3(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity4(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity5(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity6(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity7(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity8(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}



export default function ImplicitCompatCaseTest(): void {
  describe('ImplicitCompatCaseTest', () => {
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
     * @tc.number    SUB_IMPLICIT_COMPAT_CASE_0100
     * @tc.name      testImplicitCompatCase0001
     * @tc.desc      Verifying implicit conversion from number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitCompatCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      const val1: number = 123;
      const val2: string = val1.toString();

      const result = checkTypeIdentity1(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_COMPAT_CASE_0200
     * @tc.name      testImplicitCompatCase0002
     * @tc.desc      Verifying implicit conversion from number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitCompatCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      

      const val1: string = "true";
      const val2: boolean = Boolean(val1);

      const result = checkTypeIdentity2(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_COMPAT_CASE_0300
     * @tc.name      testImplicitCompatCase0003
     * @tc.desc      Verifying implicit conversion from number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitCompatCase0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: boolean = true;
      const val2: number = val1 ? 1 : 0;

      const result = checkTypeIdentity3(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_COMPAT_CASE_0400
     * @tc.name      testImplicitCompatCase0004
     * @tc.desc      Verifying implicit conversion from number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitCompatCase0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: Function = () => "test";
      const val2: string = val1.toString();

      const result = checkTypeIdentity4(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_COMPAT_CASE_0500
     * @tc.name      testImplicitCompatCase0005
     * @tc.desc      Verifying implicit conversion from number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitCompatCase0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: string = "123";
      const val2: number = Number(val1);

      const result = checkTypeIdentity5(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_COMPAT_CASE_0600
     * @tc.name      testImplicitCompatCase0006
     * @tc.desc      Verifying implicit conversion from number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitCompatCase0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: number[] = [1, 2, 3];
      const val2: string = val1.toString();

      const result = checkTypeIdentity6(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_COMPAT_CASE_0700
     * @tc.name      testImplicitCompatCase0007
     * @tc.desc      Verifying implicit conversion from number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitCompatCase0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: Record<string, string> = { "key": "value" };
      const val2: string = JSON.stringify(val1);

      const result = checkTypeIdentity7(val1, val2);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_IMPLICIT_COMPAT_CASE_0800
     * @tc.name      testImplicitCompatCase0008
     * @tc.desc      Verifying implicit conversion from number to string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testImplicitCompatCase0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      
      const val1: number = 1;
      const val2: boolean = Boolean(val1);

      const result = checkTypeIdentity8(val1, val2);
      expect(result).assertEqual(false);
    });
  })
}
