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
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function CompoundAssignmentByte(): void{
  describe('CompoundAssignmentByte', () => {
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
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0100
     * @tc.name      testCompoundAssignmentByte0001
     * @tc.desc      Compound assignment += for byte with overflow - Simple addition without overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 5;
      a += 10;
      expect(a).assertEqual(15);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0200
     * @tc.name      testCompoundAssignmentByte0002
     * @tc.desc      Compound assignment += for byte with overflow - Addition with positive overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 120;
      a += 10;
      expect(a).assertEqual(-126)
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0300
     * @tc.name      testCompoundAssignmentByte0003
     * @tc.desc      Compound assignment += for byte with overflow - Addition with large positive overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 5;
      a += 32767;
      expect(a).assertEqual(4);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0400
     * @tc.name      testCompoundAssignmentByte0004
     * @tc.desc      Compound assignment -= for byte with overflow - Subtraction with negative overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -120;
      a -= 10;
      expect(a).assertEqual(126);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0500
     * @tc.name      testCompoundAssignmentByte0005
     * @tc.desc      Compound assignment -= for byte with overflow - Subtraction from min value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -128;
      a -= 1;
      expect(a).assertEqual(127);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0600
     * @tc.name      testCompoundAssignmentByte0006
     * @tc.desc      Compound assignment *= for byte with overflow - Multiplication with overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 100;
      a *= 3;
      expect(a).assertEqual(44);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0700
     * @tc.name      testCompoundAssignmentByte0007
     * @tc.desc      Compound assignment *= for byte with overflow - Multiplication with large overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 100;
      a *= 100;
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0800
     * @tc.name      testCompoundAssignmentByte0008
     * @tc.desc      Compound assignment /= for byte with overflow - Division with truncation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 100;
      a /= 3;
      expect(a).assertEqual(33);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_0900
     * @tc.name      testCompoundAssignmentByte0009
     * @tc.desc      Compound assignment %= for byte with overflow - Modulo operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 100;
      a %= 3;
      expect(a).assertEqual(1);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_1000
     * @tc.name      testCompoundAssignmentByte0010
     * @tc.desc      Compound assignment |= for byte with overflow - Bitwise OR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 85;
      a |= 170;
      expect(a).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_1100
     * @tc.name      testCompoundAssignmentByte0011
     * @tc.desc      Compound assignment ^= for byte with overflow - Bitwise XOR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 127;
      a ^= 127;
      expect(a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_1200
     * @tc.name      testCompoundAssignmentByte0012
     * @tc.desc      Compound assignment <<= for byte with overflow - Left shift with overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 64;
      a <<= 2;
      expect(a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_1300
     * @tc.name      testCompoundAssignmentByte0013
     * @tc.desc      Compound assignment >>= for byte with overflow - Right shift
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -8;
      a >>= 2;
      expect(a).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_1400
     * @tc.name      testCompoundAssignmentByte0014
     * @tc.desc      Compound assignment >>>= for byte with overflow - Unsigned right shift
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -8;
      a >>>= 2;
      expect(a).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_BASEDATE_COMPOUND_ASSIGNMENT_BYTE_1500
     * @tc.name      testCompoundAssignmentByte0015
     * @tc.desc      Compound assignment ^= for byte with overflow - Bitwise XOR
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentByte0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 127;
      a &= 15;
      expect(a).assertEqual(15);
    });
  });
}