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
function checkTypeIdentity1(a: Any, b: Any): boolean {
  return Class.of(a as Object) === Class.of(b as Object);
}
function checkTypeIdentity2(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
}
function checkTypeIdentity3(a: Any, b: Any): boolean {
  return Class.ofAny(a as Any) === Class.ofAny(b as Any);
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

export default function AsymmetricVerificationCaseTest(): void {
  describe('AsymmetricVerificationCaseTest', () => {
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
     * @tc.number    SUB_ASYMMETRIC_VERIFICATION_CASE_TEST_0100
     * @tc.name      testAsymmetricVerificationCase0001
     * @tc.desc      Verifying asymmetric compatibility between boolean and number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAsymmetricVerificationCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAsymmetricVerificationCase0001';
       

      const val1: boolean = true;
      const val2: number = 1;

      const result1 = checkTypeIdentity1(val1, val2);
      const result2 = checkTypeIdentity1(val2, val1);

      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ASYMMETRIC_VERIFICATION_CASE_TEST_0200
     * @tc.name      testAsymmetricVerificationCase0002
     * @tc.desc      Verifying asymmetric compatibility between boolean and number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAsymmetricVerificationCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAsymmetricVerificationCase0002';
       

      const val1: Function = () => "test";
      const val2: string = "test";

      const result1 = checkTypeIdentity2(val1, val2);
      const result2 = checkTypeIdentity2(val2, val1);

      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ASYMMETRIC_VERIFICATION_CASE_TEST_0300
     * @tc.name      testAsymmetricVerificationCase0003
     * @tc.desc      Verifying asymmetric compatibility between boolean and number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAsymmetricVerificationCase0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAsymmetricVerificationCase0003';
       

      const val1: null = null;
      const val2: undefined = undefined;

      const result1 = checkTypeIdentity3(val1, val2);

      expect(result1).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ASYMMETRIC_VERIFICATION_CASE_TEST_0400
     * @tc.name      testAsymmetricVerificationCase0004
     * @tc.desc      Verifying asymmetric compatibility between boolean and number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAsymmetricVerificationCase0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAsymmetricVerificationCase0004';
       

      const val1: number[] = [1, 2, 3];
      const val2: string[] = ["1", "2", "3"];

      const result1 = checkTypeIdentity4(val1, val2);

      expect(result1).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ASYMMETRIC_VERIFICATION_CASE_TEST_0500
     * @tc.name      testAsymmetricVerificationCase
     * @tc.desc      Verifying asymmetric compatibility between boolean and number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAsymmetricVerificationCase0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAsymmetricVerificationCase0005';
       

      const val1: Record<string, string> = {"key": "value"};
      const val2: string = "test";

      const result1 = checkTypeIdentity5(val1, val2);

      expect(result1).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ASYMMETRIC_VERIFICATION_CASE_TEST_0600
     * @tc.name      testAsymmetricVerificationCase0006
     * @tc.desc      Verifying asymmetric compatibility between boolean and number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAsymmetricVerificationCase0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testAsymmetricVerificationCase0006';
       

      const val1: number = 123;
      const val2: string = "123";

      const result1 = checkTypeIdentity6(val1, val2);

      expect(result1).assertEqual(false);
    });
  })
}


