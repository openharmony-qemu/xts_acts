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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function ByteCompareToTest(): void {
  describe("ByteCompareToTest", () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_0100
     * @tc.name      testCompareToRequiredParam0001
     * @tc.desc      Verify required parameters of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToRequiredParam0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(50);
        const b2 = new Byte(30);
        const result = b1.compareTo(b2);
        expect(result).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_0200
     * @tc.name      testCompareToNoParamThrowError0002
     * @tc.desc      verifies compareTo() returns positive value when comparing greater Byte to zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToNoParamThrowError0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const other = new Byte(0 as byte);
        const result = b.compareTo(other);
        expect(result > 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_0300
     * @tc.name      testCompareToExtraParamThrowError0003
     * @tc.desc      Byte.compareTo() with different-value Byte parameter returns correct comparison result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToExtraParamThrowError0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const other = new Byte(30 as byte);
        const result = b.compareTo(other);
        expect(result > 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_0400
     * @tc.name      testCompareToParamIsByteInstance0004
     * @tc.desc      The parameter of Byte.compareTo() is a Byte instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToParamIsByteInstance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(60);
        const b2 = new Byte(40);
        expect(b1.compareTo(b2)).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_0500
     * @tc.name      testCompareToParamNullThrowError0005
     * @tc.desc      verifies compareTo() returns positive when comparing Byte(50) with Byte(0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToParamNullThrowError0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(50 as byte);
        const param = new Byte(0 as byte);
        const result = b.compareTo(param);
        expect(result > 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_0800
     * @tc.name      testCompareToStandardResult0008
     * @tc.desc      Standard comparison result of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToStandardResult0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(70);
        const b2 = new Byte(50);
        const result = b1.compareTo(b2);
        expect(result.toDouble()).assertEqual(1.0);
        expect(result).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_0900
     * @tc.name      testCompareToCurrentGreaterThanOther0009
     * @tc.desc      Byte.compareTo() returns a positive number when current value is greater than the compared value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToCurrentGreaterThanOther0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100);
        const b2 = new Byte(50);
        const result = b1.compareTo(b2);
        expect(result > 0).assertTrue();
        expect(result).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1000
     * @tc.name      testCompareToCurrentLessThanOther0010
     * @tc.desc      Byte.compareTo() returns a negative number when current value is less than the compared value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToCurrentLessThanOther0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(30);
        const b2 = new Byte(80);
        const result = b1.compareTo(b2);
        expect(result < 0).assertTrue();
        expect(result).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1100
     * @tc.name      testCompareToCurrentEqualToOther0011
     * @tc.desc      Byte.compareTo() returns 0 when current value is equal to the compared value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToCurrentEqualToOther0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(55);
        const b2 = new Byte(55);
        const result = b1.compareTo(b2);
        expect(result).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1200
     * @tc.name      testCompareToZeroValueCompare0012
     * @tc.desc      Zero value comparison of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToZeroValueCompare0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bZero = new Byte(0);
        const bPos = new Byte(50);
        const bNeg = new Byte(-50);
        expect(bPos.compareTo(bZero)).assertEqual(1);
        expect(bNeg.compareTo(bZero)).assertEqual(-1);
        expect(bZero.compareTo(bZero)).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1300
     * @tc.name      testCompareToMaxValueCompare0013
     * @tc.desc      Maximum value comparison of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToMaxValueCompare0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bMax = new Byte(Byte.MAX_VALUE);
        const bMin = new Byte(Byte.MIN_VALUE);
        const bMid = new Byte(0);
        expect(bMax.toInt() > bMin.toInt()).assertTrue();
        expect(bMin.toInt() < bMax.toInt()).assertTrue();
        expect(bMax.toInt() > bMid.toInt()).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1400
     * @tc.name      testCompareToMinValueCompare0014
     * @tc.desc      Minimum value comparison of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToMinValueCompare0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bMin = new Byte(Byte.MIN_VALUE);
        const b1 = new Byte(0);
        const b2 = new Byte(127);
        expect(bMin.toInt() < b1.toInt()).assertTrue();
        expect(bMin.toInt() < b2.toInt()).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1500
     * @tc.name      testCompareToBoundaryValueCompare0015
     * @tc.desc      Boundary value (-1/1) comparison of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToBoundaryValueCompare0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bNeg1 = new Byte(-1);
        const bPos1 = new Byte(1);
        const bZero = new Byte(0);
        expect(bPos1.compareTo(bNeg1) > 0).assertTrue();
        expect(bNeg1.compareTo(bPos1) < 0).assertTrue();
        expect(bPos1.compareTo(bZero) > 0).assertTrue();
        expect(bNeg1.compareTo(bZero) < 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1600
     * @tc.name      testCompareToReturnTypeNumber0016
      * @tc.desc      The return value type of Byte.compareTo() is int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToReturnTypeNumber0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(60);
        const b2 = new Byte(40);
        const result = b1.compareTo(b2);
        expect(result.toDouble()).assertEqual(1.0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1700
     * @tc.name      testCompareToReturnTypeInt0017
     * @tc.desc      Use the return value of Byte.compareTo() as int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToReturnTypeInt0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(70);
        const b2 = new Byte(30);
        const result: number = b1.compareTo(b2);
        expect(result).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1800
     * @tc.name      testCompareToReturnIntegerValue0018
     * @tc.desc      The return value of Byte.compareTo() is always an integer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToReturnIntegerValue0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(55);
        const b2 = new Byte(33);
        const result = b1.compareTo(b2);
        expect(result % 1).assertEqual(0);
        expect(result).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_1900
     * @tc.name      testCompareToMaxDifferenceValue0019
     * @tc.desc      Maximum difference between maximum and minimum values of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToMaxDifferenceValue0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bMax = new Byte(Byte.MAX_VALUE);
        const bMin = new Byte(Byte.MIN_VALUE);
        expect(bMax.toInt() > bMin.toInt()).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2000
     * @tc.name      testCompareToSameInstanceCompare0020
     * @tc.desc      Byte.compareTo() returns 0 when comparing the same instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToSameInstanceCompare0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(88);
        expect(b.compareTo(b)).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2100
     * @tc.name      testCompareToDifferentInstanceSameValue0021
     * @tc.desc      Byte.compareTo() returns 0 when comparing different instances with the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToDifferentInstanceSameValue0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(99);
        const b2 = new Byte(99);
        expect(b1.compareTo(b2)).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2200
     * @tc.name      testCompareToReturnPositive0022
     * @tc.desc      Byte.compareTo() returns a positive number when current value is greater than target value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToReturnPositive0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(100);
        const b2: Byte = Int.toByte(20);
        const result = b1.compareTo(b2);
        expect(result > 0).assertTrue();
        expect(result).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2300
     * @tc.name      testCompareToDifferentPositiveValue0023
     * @tc.desc      Byte.compareTo() returns corresponding positive numbers for different differences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToDifferentPositiveValue0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bBase = new Byte(50);
        const b1 = new Byte(40);
        const b2 = new Byte(30);
        const b3 = new Byte(0);
        expect(bBase.compareTo(b1)).assertEqual(1);
        expect(bBase.compareTo(b2)).assertEqual(1);
        expect(bBase.compareTo(b3)).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2400
     * @tc.name      testCompareToReturnNegative0024
     * @tc.desc      Byte.compareTo() returns a negative number when current value is less than target value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToReturnNegative0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(20);
        const b2: Byte = Int.toByte(80);
        const result = b1.compareTo(b2);
        expect(result < 0).assertTrue();
        expect(result).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2500
     * @tc.name      testCompareToDifferentNegativeValue0025
     * @tc.desc      Byte.compareTo() returns corresponding negative numbers for different differences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToDifferentNegativeValue0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bBase = new Byte(50);
        const b1 = new Byte(60);
        const b2 = new Byte(70);
        const b3 = new Byte(100);
        expect(bBase.compareTo(b1)).assertEqual(-1);
        expect(bBase.compareTo(b2)).assertEqual(-1);
        expect(bBase.compareTo(b3)).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2600
     * @tc.name      testCompareToReturnZero0026
     * @tc.desc      Byte.compareTo() returns 0 when values are equal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToReturnZero0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(75);
        const b2 = new Byte(75);
        const result = b1.compareTo(b2);
        expect(result).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2700
     * @tc.name      testCompareToDifferentInstanceSameValue0027
     * @tc.desc      Byte.compareTo() returns 0 for different instances with the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToDifferentInstanceSameValue0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(88);
        const b2 = new Byte(88);
        const b3 = new Byte(88);
        expect(b1.compareTo(b2)).assertEqual(0);
        expect(b2.compareTo(b3)).assertEqual(0);
        expect(b1.compareTo(b3)).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2800
     * @tc.name      testCompareToSelfCompare0028
     * @tc.desc      Byte.compareTo() returns 0 when instance compares with itself
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToSelfCompare0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(99);
        const b2 = new Byte(33);
        expect(b1.compareTo(b1)).assertEqual(0);
        expect(b2.compareTo(b2)).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_2900
     * @tc.name      testCompareToSymmetricReverse0029
     * @tc.desc      Reverse comparison results of Byte.compareTo() have opposite signs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToSymmetricReverse0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(70);
        const b2 = new Byte(30);
        const result1 = b1.compareTo(b2);
        const result2 = b2.compareTo(b1);
        expect(result1).assertEqual(-result2);
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(-1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3000
     * @tc.name      testCompareToEqualSymmetric0030
     * @tc.desc      Two-way comparison of equal values of Byte.compareTo() returns 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToEqualSymmetric0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(66);
        const b2 = new Byte(66);
        expect(b1.compareTo(b2)).assertEqual(0);
        expect(b2.compareTo(b1)).assertEqual(0);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3100
     * @tc.name      testCompareToTransitivity0031
     * @tc.desc      Verify comparison transitivity of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToTransitivity0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(80);
        const b2: Byte = Int.toByte(50);
        const b3: Byte = Int.toByte(20);
        expect(b1.compareTo(b2) > 0).assertTrue();
        expect(b2.compareTo(b3) > 0).assertTrue();
        expect(b1.compareTo(b3) > 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3200
     * @tc.name      testCompareToChainCompare0032
     * @tc.desc      Multi-instance chain comparison of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToChainCompare0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(10);
        const b2: Byte = Int.toByte(30);
        const b3: Byte = Int.toByte(50);
        const b4: Byte = Int.toByte(70);
        expect(b4.compareTo(b3) > 0).assertTrue();
        expect(b3.compareTo(b2) > 0).assertTrue();
        expect(b2.compareTo(b1) > 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3300
     * @tc.name      testCompareToVsIsGreaterThan0033
     * @tc.desc      Byte.compareTo() is consistent with isGreaterThan logic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToVsIsGreaterThan0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(70);
        const b2: Byte = Int.toByte(50);
        expect(b1.compareTo(b2) > 0).assertTrue();
        expect(b1.isGreaterThan(b2)).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3400
     * @tc.name      testCompareToVsIsLessThan0034
     * @tc.desc      Byte.compareTo() is consistent with isLessThan logic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToVsIsLessThan0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(30);
        const b2: Byte = Int.toByte(60);
        expect(b1.compareTo(b2) < 0).assertTrue();
        expect(b1.isLessThan(b2)).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3500
     * @tc.name      testCompareToVsEquals0035
     * @tc.desc      Returning 0 of Byte.compareTo() is equivalent to equals being true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToVsEquals0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(88);
        const b2 = new Byte(88);
        expect(b1.compareTo(b2)).assertEqual(0);
        expect(b1.equals(b2)).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3600
     * @tc.name      testCompareToSortAsc0036
     * @tc.desc      Implement array ascending sorting with Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToSortAsc0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          new Byte(50),
          new Byte(10),
          new Byte(90),
          new Byte(30)
        ];
        bytes.sort((a, b) => a.compareTo(b));
        expect(bytes[0].toByte()).assertEqual(10);
        expect(bytes[3].toByte()).assertEqual(90);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3700
     * @tc.name      testCompareToSortDesc0037
     * @tc.desc      Implement array descending sorting with Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToSortDesc0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          new Byte(20),
          new Byte(60),
          new Byte(40)
        ];
        bytes.sort((a, b) => b.compareTo(a));
        expect(bytes[0].toByte()).assertEqual(60);
        expect(bytes[2].toByte()).assertEqual(20);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3800
     * @tc.name      testCompareToFindMax0038
     * @tc.desc      Find the maximum value of array with Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToFindMax0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          new Byte(30),
          new Byte(80),
          new Byte(50),
          new Byte(90)
        ];
        let max = bytes[0];
        for (let i = 1; i < bytes.length; i++) {
          if (bytes[i].compareTo(max) > 0) {
            max = bytes[i];
          }
        }
        expect(max.toByte()).assertEqual(90);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_3900
     * @tc.name      testCompareToFindMin0039
     * @tc.desc      Find the minimum value of array with Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToFindMin0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Byte[] = [
          new Byte(60),
          new Byte(20),
          new Byte(40)
        ];
        let min = bytes[0];
        for (let i = 1; i < bytes.length; i++) {
          if (bytes[i].compareTo(min) < 0) {
            min = bytes[i];
          }
        }
        expect(min.toByte()).assertEqual(20);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4000
     * @tc.name      testCompareToCheckInRange0040
     * @tc.desc      Verify the value is within the specified range with Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToCheckInRange0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b = new Byte(55);
        const bMin = new Byte(30);
        const bMax = new Byte(80);
        const inRange = b.compareTo(bMin) >= 0 && b.compareTo(bMax) <= 0;
        expect(inRange).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4100
     * @tc.name      testCompareToCheckOutOfRange0041
     * @tc.desc      Verify the value is out of range with Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToCheckOutOfRange0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(95);
        const b2 = new Byte(15);
        const bMin = new Byte(30);
        const bMax = new Byte(80);
        expect(b1.compareTo(bMax) > 0).assertTrue();
        expect(b2.compareTo(bMin) < 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4200
     * @tc.name      testCompareToFullRangeCompare0042
     * @tc.desc      Full byte range value comparison of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToFullRangeCompare0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bMin = new Byte(Byte.MIN_VALUE);
        const bMax = new Byte(Byte.MAX_VALUE);
        const bMid = new Byte(0);
        expect(bMax.toInt() > bMin.toInt()).assertTrue();
        expect(bMax.toInt() > bMid.toInt()).assertTrue();
        expect(bMid.toInt() > bMin.toInt()).assertTrue();
        expect(bMin.toInt() < bMax.toInt()).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4300
     * @tc.name      testCompareToAdjacentValueCompare0043
     * @tc.desc      Adjacent value comparison of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToAdjacentValueCompare0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i < 127; i++) {
          const b1: Byte = Int.toByte(i);
          const b2: Byte = Int.toByte(i + 1);
          expect(b1.compareTo(b2)).assertEqual(-1);
          expect(b2.compareTo(b1)).assertEqual(1);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4400
     * @tc.name      testCompareToSymmetricValueCompare0044
     * @tc.desc      Positive and negative symmetric value comparison of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToSymmetricValueCompare0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = 1; i <= 127; i++) {
          const bPos: Byte = Int.toByte(i);
          const bNeg: Byte = Int.toByte(-i);
          expect(bPos.compareTo(bNeg) > 0).assertTrue();
          expect(bNeg.compareTo(bPos) < 0).assertTrue();
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4500
     * @tc.name      testCompareToZeroCompareAll0045
     * @tc.desc      Comparison of 0 with all positive and negative values of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToZeroCompareAll0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bZero: Byte = Int.toByte(0);
        for (let i = 1; i <= 127; i++) {
          const bPos: Byte = Int.toByte(i);
          const bNeg: Byte = Int.toByte(-i);
          expect(bZero.compareTo(bPos) < 0).assertTrue();
          expect(bZero.compareTo(bNeg) > 0).assertTrue();
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4600
     * @tc.name      testCompareToMassiveCall0046
     * @tc.desc      Performance and stability of massive calls to Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToMassiveCall0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100);
        const b2 = new Byte(50);
        for (let i = 0; i < 10000; i++) {
          const result = b1.compareTo(b2);
          expect(result).assertEqual(1);
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4700
     * @tc.name      testCompareToLargeArraySort0047
     * @tc.desc      Performance verification of large array sorting with Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToLargeArraySort0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const bytes: Array<Byte> = new Array<Byte>();
        for (let i: Int = 0; i < 1000; i++) {
          const randomValue: Double = Math.random() * 256 - 128;
          const value: Int = Double.toInt(randomValue);
          const b: Byte = Int.toByte(value);
          bytes.push(b);
        }
        bytes.sort((a: Byte, b: Byte): Int => a.compareTo(b));
        for (let i: Int = 1; i < bytes.length; i++) {
          const curr: Byte = bytes[i];
          const prev: Byte = bytes[i - 1];
          expect(curr.compareTo(prev) >= 0).assertTrue();
        }
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4800
     * @tc.name      testCompareToJavaComparableContract0048
     * @tc.desc      Verify the reciprocal property of Byte.compareTo() result sign
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToJavaComparableContract0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(60);
        const b2 = new Byte(40);
        const r1 = Math.sign(b1.compareTo(b2));
        const r2 = Math.sign(b2.compareTo(b1));
        expect(r1).assertEqual(-r2);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_4900
     * @tc.name      testCompareToTransitivityContract0049
     * @tc.desc      Byte.compareTo() complies with the Comparable transitivity contract
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToTransitivityContract0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const x = new Byte(80);
        const y = new Byte(50);
        const z = new Byte(20);
        expect(x.compareTo(y) > 0).assertTrue();
        expect(y.compareTo(z) > 0).assertTrue();
        expect(x.compareTo(z) > 0).assertTrue();
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_5000
     * @tc.name      testCompareToCrossPlatformConsistency0050
     * @tc.desc      Cross-platform numerical result consistency of Byte.compareTo()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToCrossPlatformConsistency0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1 = new Byte(100);
        const b2 = new Byte(30);
        const result = b1.compareTo(b2);
        expect(result).assertEqual(1);
      }
    );

    /**
     * @tc.number    SUB_BYTE_COMPARETO_TEST_5100
     * @tc.name      testCompareToReturnValueStandard0051
     * @tc.desc      The meaning of Byte.compareTo() return value complies with official specifications
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompareToReturnValueStandard0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const b1: Byte = Int.toByte(70);
        const b2: Byte = Int.toByte(70);
        const b3: Byte = Int.toByte(50);
        const b4: Byte = Int.toByte(90);
        expect(b1.compareTo(b2)).assertEqual(0);
        expect(b1.compareTo(b3) > 0).assertTrue();
        expect(b1.compareTo(b4) < 0).assertTrue();
      }

    );
  });
}
