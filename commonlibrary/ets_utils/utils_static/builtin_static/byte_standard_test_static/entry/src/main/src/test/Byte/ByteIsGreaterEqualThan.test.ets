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

export default function ByteIsGreaterEqualThanTest_02(): void {
  describe("ByteIsGreaterEqualThanTest_02", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0100
     * @tc.name      testByteIsGreaterEqualThan0001
     * @tc.desc      Parameter validation: single Byte parameter - greater than case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 70 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isGreaterEqualThan(other);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0200
     * @tc.name      testByteIsGreaterEqualThan0002
     * @tc.desc      Parameter validation: single Byte parameter - equal case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isGreaterEqualThan(other);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0300
     * @tc.name      testByteIsGreaterEqualThan0003
     * @tc.desc      Parameter validation: single Byte parameter - less than case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isGreaterEqualThan(other);
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0400
     * @tc.name      testByteIsGreaterEqualThan0004
     * @tc.desc      Boundary values: maxByte vs minByte comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        let zeroByte: byte = 0 as byte;
        expect(maxByte.isGreaterEqualThan(minByte)).assertTrue();
        expect(maxByte.isGreaterEqualThan(maxByte)).assertTrue();
        expect(minByte.isGreaterEqualThan(maxByte)).assertFalse();
        expect(minByte.isGreaterEqualThan(minByte)).assertTrue();
        expect(maxByte.isGreaterEqualThan(zeroByte)).assertTrue();
        expect(zeroByte.isGreaterEqualThan(minByte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0500
     * @tc.name      testByteIsGreaterEqualThan0005
     * @tc.desc      Negative values comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -50 as byte;
        let b2: byte = -100 as byte;
        let b3: byte = -128 as byte;
        expect(b1.isGreaterEqualThan(b2)).assertTrue();
        expect(b2.isGreaterEqualThan(b3)).assertTrue();
        expect(b1.isGreaterEqualThan(b3)).assertTrue();
        expect(b2.isGreaterEqualThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0600
     * @tc.name      testByteIsGreaterEqualThan0006
     * @tc.desc      Equal values comparison - sample values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i <= 127; i++) {
          let b1: byte = Int.toByte(i);
          let b2: byte = Int.toByte(i);
          expect(b1.isGreaterEqualThan(b2)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0700
     * @tc.name      testByteIsGreaterEqualThan0007
     * @tc.desc      Zero value comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let negativeByte: byte = -1 as byte;
        let zeroByte: byte = 0 as byte;
        let positiveByte: byte = 1 as byte;
        expect(positiveByte.isGreaterEqualThan(zeroByte)).assertTrue();
        expect(zeroByte.isGreaterEqualThan(negativeByte)).assertTrue();
        expect(positiveByte.isGreaterEqualThan(negativeByte)).assertTrue();
        expect(zeroByte.isGreaterEqualThan(zeroByte)).assertTrue();
      });
    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0800
     * @tc.name      testByteIsGreaterEqualThan0008
     * @tc.desc      Exception handling: null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let hasError: boolean = false;
        try {
          b.isGreaterEqualThan(null as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_0900
     * @tc.name      testByteIsGreaterEqualThan0009
     * @tc.desc      Exception handling: undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let hasError: boolean = false;
        try {
          b.isGreaterEqualThan(undefined as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_1000
     * @tc.name      testByteIsGreaterEqualThan0010
     * @tc.desc      Return value: greater than case returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 100 as byte;
        let other: byte = 50 as byte;
        expect(b.isGreaterEqualThan(other)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_1200
     * @tc.name      testByteIsGreaterEqualThan0012
     * @tc.desc      Return value: less than case returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let other: byte = 100 as byte;
        expect(b.isGreaterEqualThan(other)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_1300
     * @tc.name      testByteIsGreaterEqualThan0013
     * @tc.desc      Return value type check: should return boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 70 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isGreaterEqualThan(other);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_1500
     * @tc.name      testByteIsGreaterEqualThan0015
     * @tc.desc      Boundary return value: minByte comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let other: byte = -127 as byte;
        expect(minByte.isGreaterEqualThan(other)).assertFalse();
        expect(minByte.isGreaterEqualThan(minByte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_1600
     * @tc.name      testByteIsGreaterEqualThan0016
     * @tc.desc      Boundary return value: maxByte comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let maxByte: byte = 127 as byte;
        let other: byte = 126 as byte;
        expect(maxByte.isGreaterEqualThan(other)).assertTrue();
        expect(maxByte.isGreaterEqualThan(maxByte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_1700
     * @tc.name      testByteIsGreaterEqualThan0017
     * @tc.desc      Boundary return value: minByte vs maxByte cross comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        expect(maxByte.isGreaterEqualThan(minByte)).assertTrue();
        expect(minByte.isGreaterEqualThan(maxByte)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_1800
     * @tc.name      testByteIsGreaterEqualThan0018
     * @tc.desc      Special values: consecutive integers comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i < 127; i++) {
          let b1: byte = Int.toByte(i + 1);
          let b2: byte = Int.toByte(i);
          expect(b1.isGreaterEqualThan(b2)).assertTrue();
          expect(b2.isGreaterEqualThan(b1)).assertFalse();
        }
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_1900
     * @tc.name      testByteIsGreaterEqualThan0019
     * @tc.desc      Special values: symmetry validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 70 as byte;
        let b2: byte = 50 as byte;
        let result1: boolean = b1.isGreaterEqualThan(b2);
        let result2: boolean = b2.isGreaterEqualThan(b1);
        expect(result1).assertTrue();
        expect(result2).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2000
     * @tc.name      testByteIsGreaterEqualThan0020
     * @tc.desc      Special values: transitivity validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 30 as byte;
        let b2: byte = 50 as byte;
        let b3: byte = 70 as byte;
        let result1: boolean = b3.isGreaterEqualThan(b2);
        let result2: boolean = b2.isGreaterEqualThan(b1);
        let result3: boolean = b3.isGreaterEqualThan(b1);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2100
     * @tc.name      testByteIsGreaterEqualThan0021
     * @tc.desc      Boundary stability: extreme values comparison should not throw exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        let hasError: boolean = false;
        try {
          maxByte.isGreaterEqualThan(minByte);
          minByte.isGreaterEqualThan(maxByte);
          maxByte.isGreaterEqualThan(maxByte);
          minByte.isGreaterEqualThan(minByte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2200
     * @tc.name      testByteIsGreaterEqualThan0022
     * @tc.desc      Comprehensive scenario: sorting in descending order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
            if (!bytes[j].isGreaterEqualThan(bytes[j + 1])) {
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
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2300
     * @tc.name      testByteIsGreaterEqualThan0023
     * @tc.desc      Comprehensive scenario: find maximum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
          if (bytes[i].isGreaterEqualThan(maxByte)) {
            maxByte = bytes[i];
          }
        }
        expect(maxByte).assertEqual(90);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2400
     * @tc.name      testByteIsGreaterEqualThan0024
     * @tc.desc      Comprehensive scenario: threshold judgment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let threshold: byte = 75 as byte;
        let values: byte[] = [
          50 as byte,
          80 as byte,
          75 as byte,
          100 as byte,
          70 as byte
        ];
        let atOrAboveThreshold: byte[] = [];
        for (let i = 0; i < values.length; i++) {
          if (values[i].isGreaterEqualThan(threshold)) {
            atOrAboveThreshold.push(values[i]);
          }
        }
        expect(atOrAboveThreshold.length).assertEqual(3);
        expect(atOrAboveThreshold[0]).assertEqual(80);
        expect(atOrAboveThreshold[1]).assertEqual(75);
        expect(atOrAboveThreshold[2]).assertEqual(100);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2500
     * @tc.name      testByteIsGreaterEqualThan0025
     * @tc.desc      Comprehensive scenario: range validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minValue: byte = 20 as byte;
        let maxValue: byte = 80 as byte;
        let test1: byte = 50 as byte;
        let inRange1: boolean = test1.isGreaterEqualThan(minValue) && maxValue.isGreaterEqualThan(test1);
        expect(inRange1).assertTrue();
        let test2: byte = 10 as byte;
        let inRange2: boolean = test2.isGreaterEqualThan(minValue) && maxValue.isGreaterEqualThan(test2);
        expect(inRange2).assertFalse();
        let test3: byte = 80 as byte;
        let inRange3: boolean = test3.isGreaterEqualThan(minValue) && maxValue.isGreaterEqualThan(test3);
        expect(inRange3).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2600
     * @tc.name      testByteIsGreaterEqualThan0026
     * @tc.desc      Mathematical scenario: arithmetic operation comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Int.toByte(60);
        let b2: byte = Int.toByte(50);
        let diff: byte = Int.toByte(b1 - 5);
        expect(diff.isGreaterEqualThan(b2)).assertTrue();
        let sum: byte = Int.toByte(b2 + 5);
        expect(diff.isGreaterEqualThan(sum)).assertTrue();
        expect(sum.isGreaterEqualThan(diff)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2700
     * @tc.name      testByteIsGreaterEqualThan0027
     * @tc.desc      Mathematical scenario: overflow value comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Int.toByte(100);
        let b2: byte = Int.toByte(50);
        let sum: byte = Int.toByte(100 + 50 - 256);
        expect(b1.isGreaterEqualThan(sum)).assertTrue();
        expect(sum.isGreaterEqualThan(b2)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2800
     * @tc.name      testByteIsGreaterEqualThan0028
     * @tc.desc      Comparison methods: four comparison methods consistency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 70 as byte;
        let b2: byte = 50 as byte;
        expect(b1.isGreaterThan(b2)).assertTrue();
        expect(b1.isGreaterEqualThan(b2)).assertTrue();
        expect(b1.isLessThan(b2)).assertFalse();
        expect(b1.isLessEqualThan(b2)).assertFalse();
        expect(b1.isGreaterThan(b1)).assertFalse();
        expect(b1.isGreaterEqualThan(b1)).assertTrue();
        expect(b1.isLessThan(b1)).assertFalse();
        expect(b1.isLessEqualThan(b1)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_2900
     * @tc.name      testByteIsGreaterEqualThan0029
     * @tc.desc      Comparison methods: complementary relationship validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -50, 0, 50, 127];
        let count: int = 0;
        for (let i = 0; i < testValues.length; i++) {
          for (let j = 0; j < testValues.length; j++) {
            let b1: byte = Int.toByte(testValues[i]);
            let b2: byte = Int.toByte(testValues[j]);
            let isLess: boolean = b1.isLessThan(b2);
            let isGreaterEqual: boolean = b1.isGreaterEqualThan(b2);
            expect(isLess || isGreaterEqual).assertTrue();
            expect(isLess && isGreaterEqual).assertFalse();
          expect(isGreaterEqual).assertEqual(testValues[i] >= testValues[j]);
            count++;
          }
        }
        expect(count > 0).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_3000
     * @tc.name      testByteIsGreaterEqualThan0030
     * @tc.desc      Performance: loop comparison performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 70 as byte;
        let b2: byte = 50 as byte;
        let startTime: number = Date.now();
        for (let i = 0; i < 100000; i++) {
          b1.isGreaterEqualThan(b2);
        }
        let endTime: number = Date.now();
        expect(endTime - startTime).assertLess(5000);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_3100
     * @tc.name      testByteIsGreaterEqualThan0031
     * @tc.desc      Performance: full value domain coverage test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let mismatchCount: number = 0;
        for (let i = -128; i <= 127; i++) {
          for (let j = -128; j <= 127; j++) {
            let b1: byte = Int.toByte(i);
            let b2: byte = Int.toByte(j);
            let result: boolean = b1.isGreaterEqualThan(b2);
            let expected: boolean = i >= j;
            mismatchCount += result !== expected ? 1 : 0;
          }
        }
        expect(mismatchCount).assertEqual(0);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_3200
     * @tc.name      testByteIsGreaterEqualThan0032
     * @tc.desc      CompareTo consistency: isGreaterEqualThan vs compareTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = Int.toByte(70);
        let b2: byte = Int.toByte(50);
        let isGreaterEqual: boolean = b1.isGreaterEqualThan(b2);
        let compareToResult: int = b1.compareTo(b2);
        expect(isGreaterEqual).assertEqual(compareToResult >= 0);
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_3300
     * @tc.name      testByteIsGreaterEqualThan0033
     * @tc.desc      CompareTo consistency: full value domain validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -50, 0, 50, 127];
        for (let i = 0; i < testValues.length; i++) {
          for (let j = 0; j < testValues.length; j++) {
            let b1: byte = Int.toByte(testValues[i]);
            let b2: byte = Int.toByte(testValues[j]);
            let isGreaterEqual: boolean = b1.isGreaterEqualThan(b2);
            let compareToResult: int = b1.compareTo(b2);
            expect(isGreaterEqual).assertEqual(compareToResult >= 0);
          }
        }
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_3400
     * @tc.name      testByteIsGreaterEqualThan0034
     * @tc.desc      Equals consistency: equals implies isGreaterEqualThan
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 65 as byte;
        let b2: byte = 65 as byte;
        let areEqual: boolean = b1.equals(b2);
        let isGreaterEqual: boolean = b1.isGreaterEqualThan(b2);
        expect(areEqual).assertTrue();
        expect(isGreaterEqual).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_GREATER_EQUAL_THAN_3500
     * @tc.name      testByteIsGreaterEqualThan0035
     * @tc.desc      Equals consistency: bidirectional equality validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsGreaterEqualThan0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -50, 0, 50, 127];
        for (let i = 0; i < testValues.length; i++) {
          let b1: byte = Int.toByte(testValues[i]);
          let b2: byte = Int.toByte(testValues[i]);
          expect(b1.isGreaterEqualThan(b2)).assertTrue();
          expect(b2.isGreaterEqualThan(b1)).assertTrue();
          expect(b1.equals(b2)).assertTrue();
        }
      });
  })
}
