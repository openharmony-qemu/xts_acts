'use static'
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
  from '@ohos/hypium-binary/src/main/indexStatic'
import Utils from '../../Util.test'

export default function CompoundAssignmentInt(): void {
  describe('CompoundAssignmentInt', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0100
     * @tc.name      testCompoundAssignmentInt0001
     * @tc.desc      Compound assignment += for int with overflow - Addition with positive overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 2147483640;
      a += 10;
      expect(Math.imul(a, 1)).assertEqual(-2147483646);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0200
     * @tc.name      testCompoundAssignmentInt0002
     * @tc.desc      Compound assignment += for int with overflow - Addition with max value overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 2147483647;
      a += 1;
      expect(Math.imul(a, 1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0300
     * @tc.name      testCompoundAssignmentInt0003
     * @tc.desc      Compound assignment -= for int with overflow - Subtraction with negative overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -2147483640;
      a -= 10;
      expect(Math.imul(a, 1)).assertEqual(2147483646);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0400
     * @tc.name      testCompoundAssignmentInt0004
     * @tc.desc      Compound assignment -= for int with overflow - Subtraction from min value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -2147483648;
      a -= 1;
      expect(Math.imul(a, 1)).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0500
     * @tc.name      testCompoundAssignmentInt0005
     * @tc.desc      Compound assignment *= for int with overflow - Multiplication with overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 1000000;
      a *= 1000000;
      expect(Math.imul(a, 1)).assertEqual(-727379968);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0600
     * @tc.name      testCompoundAssignmentInt0006
     * @tc.desc      Compound assignment *= for int with overflow - Large multiplication overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 46341;
      a *= 46341;
      expect(Math.imul(a, 1)).assertEqual(-2147479015);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0700
     * @tc.name      testCompoundAssignmentInt0007
     * @tc.desc      Compound assignment <<= for int with overflow - Left shift with overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 1073741824;
      a <<= 2;
      expect(Math.imul(a, 1)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0800
     * @tc.name      testCompoundAssignmentInt0008
     * @tc.desc      Compound assignment >>= for int with overflow - Right shift
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -2147483648;
      a >>= 16;
      expect(Math.imul(a, 1)).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_INT_0900
     * @tc.name      testCompoundAssignmentInt0009
     * @tc.desc      Compound assignment >>>= for int with overflow - Unsigned right shift
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentInt0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -2147483648;
      a >>>= 16;
      expect(Math.imul(a, 1)).assertEqual(32768);
    });
  })
}