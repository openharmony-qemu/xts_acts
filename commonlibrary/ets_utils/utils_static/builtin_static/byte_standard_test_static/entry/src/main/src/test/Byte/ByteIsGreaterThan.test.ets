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

export default function ByteIsGreaterThanTest_02(): void {
  describe("ByteIsGreaterThanTest_02", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0100
     * @tc.name      testByteIsGreaterThan0001
     * @tc.desc      Single parameter call - greater than: Normal Byte parameter passed, current value greater than other
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 70 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isGreaterThan(other);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0200
     * @tc.name      testByteIsGreaterThan0002
     * @tc.desc      Single parameter call - equal: Normal Byte parameter passed, current value equal to other
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isGreaterThan(other);
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0300
     * @tc.name      testByteIsGreaterThan0003
     * @tc.desc      Single parameter call - less than: Normal Byte parameter passed, current value less than other
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isGreaterThan(other);
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0400
     * @tc.name      testByteIsGreaterThan0004
     * @tc.desc      null parameter: Passing null parameter should returns expected result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let hasError: boolean = false;
        try {
          b.isGreaterThan(null as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0500
     * @tc.name      testByteIsGreaterThan0005
     * @tc.desc      undefined parameter: Passing undefined parameter should returns expected result
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let hasError: boolean = false;
        try {
          b.isGreaterThan(undefined as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0600
     * @tc.name      testByteIsGreaterThan0006
     * @tc.desc      Boundary value comparison: maxByte vs minByte vs zeroByte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        let zeroByte: byte = 0 as byte;
        expect(maxByte.isGreaterThan(minByte)).assertTrue();
        expect(maxByte.isGreaterThan(maxByte)).assertFalse();
        expect(minByte.isGreaterThan(maxByte)).assertFalse();
        expect(minByte.isGreaterThan(minByte)).assertFalse();
        expect(maxByte.isGreaterThan(zeroByte)).assertTrue();
        expect(zeroByte.isGreaterThan(minByte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0700
     * @tc.name      testByteIsGreaterThan0007
     * @tc.desc      Negative value comparison: Comparison between negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = -100 as byte;
        let b3: byte = -128 as byte;
        expect(b1.isGreaterThan(b2)).assertTrue();
        expect(b2.isGreaterThan(b3)).assertTrue();
        expect(b1.isGreaterThan(b3)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0800
     * @tc.name      testByteIsGreaterThan0008
     * @tc.desc      Equal value comparison: Equal value comparison across full value range (-128 to 127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i <= 127; i++) {
          let b1: byte = Int.toByte(i);
          let b2: byte = Int.toByte(i);
          expect(b1.isGreaterThan(b2)).assertFalse();
        }
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_0900
     * @tc.name      testByteIsGreaterThan0009
     * @tc.desc      Zero value comparison: Comparison between positive, zero, and negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let negativeByte: byte = -1 as byte;
        let zeroByte: byte = 0 as byte;
        let positiveByte: byte = 1 as byte;
        expect(positiveByte.isGreaterThan(zeroByte)).assertTrue();
        expect(zeroByte.isGreaterThan(negativeByte)).assertTrue();
        expect(positiveByte.isGreaterThan(negativeByte)).assertTrue();
        expect(zeroByte.isGreaterThan(zeroByte)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_1000
     * @tc.name      testByteIsGreaterThan0010
     * @tc.desc      Greater than returns true: Verify that greater than case returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 100 as byte;
        let other: byte = 50 as byte;
        expect(b.isGreaterThan(other)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_1200
     * @tc.name      testByteIsGreaterThan0012
     * @tc.desc      Less than returns false: Verify that less than case returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let other: byte = 100 as byte;
        expect(b.isGreaterThan(other)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_1300
     * @tc.name      testByteIsGreaterThan0013
     * @tc.desc      Return value type check: Verify return value is boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 70 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isGreaterThan(other);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_1500
     * @tc.name      testByteIsGreaterThan0015
     * @tc.desc      Minimum value comparison: Comparison of minByte(-128)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let other: byte = -127 as byte;
        expect(minByte.isGreaterThan(other)).assertFalse();
        expect(minByte.isGreaterThan(minByte)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_1600
     * @tc.name      testByteIsGreaterThan0016
     * @tc.desc      Maximum value comparison: Comparison of maxByte(127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let maxByte: byte = 127 as byte;
        let other: byte = 126 as byte;
        expect(maxByte.isGreaterThan(other)).assertTrue();
        expect(maxByte.isGreaterThan(maxByte)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_1700
     * @tc.name      testByteIsGreaterThan0017
     * @tc.desc      Extreme value cross comparison: minByte vs maxByte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        expect(maxByte.isGreaterThan(minByte)).assertTrue();
        expect(minByte.isGreaterThan(maxByte)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_1800
     * @tc.name      testByteIsGreaterThan0018
     * @tc.desc      Consecutive value comparison: Comparison of consecutive integers across full value range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i < 127; i++) {
          let b1: byte = Int.toByte(i + 1);
          let b2: byte = Int.toByte(i);
          expect(b1.isGreaterThan(b2)).assertTrue();
          expect(b2.isGreaterThan(b1)).assertFalse();
        }
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_1900
     * @tc.name      testByteIsGreaterThan0019
     * @tc.desc      Symmetry verification: Verify symmetry of comparison logic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 70 as byte;
        let b2: byte = 50 as byte;
        let result1: boolean = b1.isGreaterThan(b2);
        let result2: boolean = b2.isGreaterThan(b1);
        expect(result1).assertTrue();
        expect(result2).assertFalse();

        b1 = 60 as byte;
        b2 = 60 as byte;
        result1 = b1.isGreaterThan(b2);
        result2 = b2.isGreaterThan(b1);
        expect(result1).assertFalse();
        expect(result2).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2000
     * @tc.name      testByteIsGreaterThan0020
     * @tc.desc      Transitivity verification: Verify transitivity of greater than relationship
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        let b3: byte = 70 as byte;
        let result1: boolean = b3.isGreaterThan(b2);
        let result2: boolean = b2.isGreaterThan(b1);
        let result3: boolean = b3.isGreaterThan(b1);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2100
     * @tc.name      testByteIsGreaterThan0021
     * @tc.desc      Extreme value comparison stability: Boundary value comparison should not throw exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        let hasError: boolean = false;
        try {
          maxByte.isGreaterThan(minByte);
          minByte.isGreaterThan(maxByte);
          maxByte.isGreaterThan(maxByte);
          minByte.isGreaterThan(minByte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2200
     * @tc.name      testByteIsGreaterThan0022
     * @tc.desc      Sorting scenario: Use isGreaterThan for descending sort
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          50 as byte,
          20 as byte,
          80 as byte,
          10 as byte,
          90 as byte
        ];
        for (let i = 0; i < bytes.length - 1; i++) {
          for (let j = 0; j < bytes.length - 1 - i; j++) {
            if (!bytes[j].isGreaterThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(90);
        expect(bytes[4]).assertEqual(10);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2300
     * @tc.name      testByteIsGreaterThan0023
     * @tc.desc      Maximum value search: Find maximum value in a set of Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let bytes: byte[] = [
          50 as byte,
          80 as byte,
          30 as byte,
          90 as byte,
          60 as byte
        ];
        let maxByte: byte = bytes[0];
        for (let i = 1; i < bytes.length; i++) {
          if (bytes[i].isGreaterThan(maxByte)) {
            maxByte = bytes[i];
          }
        }
        expect(maxByte).assertEqual(90);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2400
     * @tc.name      testByteIsGreaterThan0024
     * @tc.desc      Threshold judgment: Determine if value exceeds threshold
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let threshold: byte = 75 as byte;
        let values: byte[] = [
          50 as byte,
          80 as byte,
          75 as byte,
          100 as byte,
          70 as byte
        ];
        let aboveThreshold: byte[] = [];
        for (let i = 0; i < values.length; i++) {
          if (values[i].isGreaterThan(threshold)) {
            aboveThreshold.push(values[i]);
          }
        }
        expect(aboveThreshold.length).assertEqual(2);
        expect(aboveThreshold[0]).assertEqual(80);
        expect(aboveThreshold[1]).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2500
     * @tc.name      testByteIsGreaterThan0025
     * @tc.desc      Comparison after arithmetic operation: Comparison of values after operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Int.toByte(60);
        let b2: byte = Int.toByte(50);
        let diff: byte = Int.toByte(b1 - 3);
        expect(diff.isGreaterThan(b2)).assertTrue();
        let sum: byte = Int.toByte(b2 + 5);
        expect(diff.isGreaterThan(sum)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2600
     * @tc.name      testByteIsGreaterThan0026
     * @tc.desc      Comparison after overflow: Comparison of overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Int.toByte(100);
        let b2: byte = Int.toByte(50);
        let sum: byte = Int.toByte(150);
        expect(b1.isGreaterThan(sum)).assertTrue();
        expect(sum.isGreaterThan(b2)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2700
     * @tc.name      testByteIsGreaterThan0027
     * @tc.desc      Combined with isLessThan: Combined use to verify range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minValue: byte = 20 as byte;
        let maxValue: byte = 80 as byte;
        let testValue: byte = 10 as byte;
        let isOutsideRange: boolean = testValue.isLessThan(minValue) || maxValue.isGreaterThan(testValue);
        expect(isOutsideRange).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2800
     * @tc.name      testByteIsGreaterThan0028
     * @tc.desc      Loop comparison performance: Performance test for large number of repeated comparisons
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 70 as byte;
        let b2: byte = 50 as byte;
        let startTime: number = Date.now();
        for (let i = 0; i < 100000; i++) {
          b1.isGreaterThan(b2);
        }
        let endTime: number = Date.now();
        expect(endTime - startTime).assertLess(5000);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_2900
     * @tc.name      testByteIsGreaterThan0029
     * @tc.desc      Full value range coverage test: Test all Byte value ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let mismatchCount: number = 0;
        for (let i = -128; i <= 127; i++) {
          for (let j = -128; j <= 127; j++) {
            let b1: byte = Int.toByte(i);
            let b2: byte = Int.toByte(j);
            let result: boolean = b1.isGreaterThan(b2);
            let expected: boolean = i > j;
            mismatchCount += result !== expected ? 1 : 0;
          }
        }
        expect(mismatchCount).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_3000
     * @tc.name      testByteIsGreaterThan0030
     * @tc.desc      compareTo consistency: Verify consistency between isGreaterThan and compareTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Int.toByte(70);
        let b2: byte = Int.toByte(50);
        let isGreater: boolean = b1.isGreaterThan(b2);
        let compareToResult: int = b1.compareTo(b2);
        expect(isGreater).assertEqual(compareToResult > 0);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_THAN_3100
     * @tc.name      testByteIsGreaterThan0031
     * @tc.desc      Full value range consistency verification: Consistency verification within full value range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterThan0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -50, 0, 50, 127];
        for (let i = 0; i < testValues.length; i++) {
          for (let j = 0; j < testValues.length; j++) {
            let b1: byte = Int.toByte(testValues[i]);
            let b2: byte = Int.toByte(testValues[j]);

            let isGreater: boolean = b1.isGreaterThan(b2);
            let compareToResult: int = b1.compareTo(b2);

            expect(isGreater).assertEqual(compareToResult > 0);
          }
        }
      });
  })
}
