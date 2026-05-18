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
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function CompoundAssignmentShort(): void {
  describe('CompoundAssignmentShort', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0100
     * @tc.name      testCompoundAssignmentShort0001
     * @tc.desc      Compound assignment += for short with overflow - Addition with positive overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32700;
      a += 100;
      expect(a).assertEqual(-32736);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0200
     * @tc.name      testCompoundAssignmentShort0002
     * @tc.desc      Compound assignment += for short with overflow - Addition with max value overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767;
      a += 1;
      expect(a).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0300
     * @tc.name      testCompoundAssignmentShort0003
     * @tc.desc      Compound assignment -= for short with overflow - Subtraction with negative overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32700;
      a -= 100;
      expect(a).assertEqual(32736);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0400
     * @tc.name      testCompoundAssignmentShort0004
     * @tc.desc      Compound assignment -= for short with overflow - Subtraction from min value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      a -= 1;
      expect(a).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0500
     * @tc.name      testCompoundAssignmentShort0005
     * @tc.desc      Compound assignment *= for short with overflow - Multiplication with overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 200;
      a *= 200;
      expect(a).assertEqual(-25536);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0600
     * @tc.name      testCompoundAssignmentShort0006
     * @tc.desc      Compound assignment *= for short with overflow - Large multiplication overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1000;
      a *= 1000;
      expect(a).assertEqual(16960);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0700
     * @tc.name      testCompoundAssignmentShort0007
     * @tc.desc      Compound assignment /= for short with overflow - Division
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 10000;
      a /= 3;
      expect(a).assertEqual(3333);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0800
     * @tc.name      testCompoundAssignmentShort0008
     * @tc.desc      Compound assignment %= for short with overflow - Modulo operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 10000;
      a %= 256;
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_0900
     * @tc.name      testCompoundAssignmentShort0009
     * @tc.desc      Compound assignment <<= for short with overflow - Left shift with overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 16384;
      a <<= 2;
      expect(a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_1000
     * @tc.name      testCompoundAssignmentShort0010
     * @tc.desc      Compound assignment >>= for short with overflow - Right shift
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      a >>= 8;
      expect(a).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_SHORT_1100
     * @tc.name      testCompoundAssignmentShort0011
     * @tc.desc      Compound assignment >>>= for short with overflow - Unsigned right shift
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentShort0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      a >>>= 8;
      expect(a).assertEqual(-128);
    });

  });
}