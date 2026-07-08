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
} from '@ohos/hypium-binary/src/main/indexStatic';

export default function ByteIsLessEqualThanTest_02(): void {
  describe("ByteIsLessEqualThanTest_02", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0100
     * @tc.name      testByteIsLessEqualThan0001
     * @tc.desc      Parameter validation: single Byte parameter - less than case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let other: byte = 70 as byte;
        let result: boolean = b.isLessEqualThan(other);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0200
     * @tc.name      testByteIsLessEqualThan0002
     * @tc.desc      Parameter validation: single Byte parameter - equal case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isLessEqualThan(other);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0300
     * @tc.name      testByteIsLessEqualThan0003
     * @tc.desc      Parameter validation: single Byte parameter - greater than case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 70 as byte;
        let other: byte = 65 as byte;
        let result: boolean = b.isLessEqualThan(other);
        expect(result).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0400
     * @tc.name      testByteIsLessEqualThan0004
     * @tc.desc      Boundary values: minByte vs maxByte comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        let zeroByte: byte = 0 as byte;
        expect(minByte.isLessEqualThan(maxByte)).assertTrue();
        expect(minByte.isLessEqualThan(minByte)).assertTrue();
        expect(maxByte.isLessEqualThan(minByte)).assertFalse();
        expect(maxByte.isLessEqualThan(maxByte)).assertTrue();
        expect(minByte.isLessEqualThan(zeroByte)).assertTrue();
        expect(zeroByte.isLessEqualThan(maxByte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0500
     * @tc.name      testByteIsLessEqualThan0005
     * @tc.desc      Negative values comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = -128 as byte;
        let b2: byte = -100 as byte;
        let b3: byte = -50 as byte;
        let b4: byte = -1 as byte;
        expect(b1.isLessEqualThan(b2)).assertTrue();
        expect(b2.isLessEqualThan(b3)).assertTrue();
        expect(b3.isLessEqualThan(b4)).assertTrue();
        expect(b1.isLessEqualThan(b4)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0600
     * @tc.name      testByteIsLessEqualThan0006
     * @tc.desc      Equal values comparison - sample values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let testValues: int[] = [-128, -50, 0, 50, 127];
        for (let i = 0; i < testValues.length; i++) {
          let b1: byte = Int.toByte(testValues[i]);
          let b2: byte = Int.toByte(testValues[i]);
          expect(b1.isLessEqualThan(b2)).assertTrue();
        }
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0700
     * @tc.name      testByteIsLessEqualThan0007
     * @tc.desc      Zero value comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let negativeByte: byte = -1 as byte;
        let zeroByte: byte = 0 as byte;
        let positiveByte: byte = 1 as byte;
        expect(negativeByte.isLessEqualThan(zeroByte)).assertTrue();
        expect(negativeByte.isLessEqualThan(positiveByte)).assertTrue();
        expect(zeroByte.isLessEqualThan(positiveByte)).assertTrue();
        expect(zeroByte.isLessEqualThan(zeroByte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0800
     * @tc.name      testByteIsLessEqualThan0008
     * @tc.desc      Exception handling: null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let hasError: boolean = false;
        try {
          b.isLessEqualThan(null as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_0900
     * @tc.name      testByteIsLessEqualThan0009
     * @tc.desc      Exception handling: undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let hasError: boolean = false;
        try {
          b.isLessEqualThan(undefined as byte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1000
     * @tc.name      testByteIsLessEqualThan0010
     * @tc.desc      Return value: less than case returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 50 as byte;
        let other: byte = 100 as byte;
        expect(b.isLessEqualThan(other)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1100
     * @tc.name      testByteIsLessEqualThan0011
     * @tc.desc      Return value: equal case returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let other: byte = 65 as byte;
        expect(b.isLessEqualThan(other)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1200
     * @tc.name      testByteIsLessEqualThan0012
     * @tc.desc      Return value: greater than case returns false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 100 as byte;
        let other: byte = 50 as byte;
        expect(b.isLessEqualThan(other)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1300
     * @tc.name      testByteIsLessEqualThan0013
     * @tc.desc      Return value type check: should return boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b: byte = 65 as byte;
        let other: byte = 70 as byte;
        let result: boolean = b.isLessEqualThan(other);
        expect(result).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1500
     * @tc.name      testByteIsLessEqualThan0015
     * @tc.desc      Boundary return value: minByte comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let other: byte = -127 as byte;
        expect(minByte.isLessEqualThan(other)).assertTrue();
        expect(minByte.isLessEqualThan(minByte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1600
     * @tc.name      testByteIsLessEqualThan0016
     * @tc.desc      Boundary return value: maxByte comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let maxByte: byte = 127 as byte;
        let other: byte = 126 as byte;
        expect(maxByte.isLessEqualThan(other)).assertFalse();
        expect(maxByte.isLessEqualThan(maxByte)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1700
     * @tc.name      testByteIsLessEqualThan0017
     * @tc.desc      Boundary return value: minByte vs maxByte cross comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        expect(minByte.isLessEqualThan(maxByte)).assertTrue();
        expect(maxByte.isLessEqualThan(minByte)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1800
     * @tc.name      testByteIsLessEqualThan0018
     * @tc.desc      Special values: consecutive integers comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        for (let i = -128; i < 127; i++) {
          let b1: byte = Int.toByte(i);
          let b2: byte = Int.toByte(i + 1);
          expect(b1.isLessEqualThan(b2)).assertTrue();
          expect(b2.isLessEqualThan(b1)).assertFalse();
        }
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_1900
     * @tc.name      testByteIsLessEqualThan0019
     * @tc.desc      Special values: symmetry validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 70 as byte;
        let result1: boolean = b1.isLessEqualThan(b2);
        let result2: boolean = b2.isLessEqualThan(b1);
        expect(result1).assertTrue();
        expect(result2).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_2000
     * @tc.name      testByteIsLessEqualThan0020
     * @tc.desc      Boundary stability: extreme values comparison should not throw exception
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minByte: byte = -128 as byte;
        let maxByte: byte = 127 as byte;
        let hasError: boolean = false;
        try {
          minByte.isLessEqualThan(maxByte);
          maxByte.isLessEqualThan(minByte);
          minByte.isLessEqualThan(minByte);
          maxByte.isLessEqualThan(maxByte);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('ClassCastError');
        }
        expect(hasError).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_2100
     * @tc.name      testByteIsLessEqualThan0021
     * @tc.desc      Comprehensive scenario: sorting in ascending order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
            if (!bytes[j].isLessEqualThan(bytes[j + 1])) {
              let temp: byte = bytes[j];
              bytes[j] = bytes[j + 1];
              bytes[j + 1] = temp;
            }
          }
        }
        expect(bytes[0]).assertEqual(10);
        expect(bytes[4]).assertEqual(90);
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_2200
     * @tc.name      testByteIsLessEqualThan0022
     * @tc.desc      Comprehensive scenario: threshold judgment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let minValue: byte = Int.toByte(0);
        let maxValue: byte = Int.toByte(100);
        let test1: byte = Int.toByte(50);
        let inRange1: boolean = test1.isLessEqualThan(maxValue) && minValue.isLessEqualThan(test1);
        expect(inRange1).assertTrue();
        let test2Byte: byte = Int.toByte(200);
        expect(test2Byte.isLessEqualThan(maxValue)).assertTrue();
        let test3: byte = Int.toByte(-10);
        expect(minValue.isLessEqualThan(test3)).assertFalse();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_2300
     * @tc.name      testByteIsLessEqualThan0023
     * @tc.desc      Comprehensive scenario: batch comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let baseValue: byte = 50 as byte;
        let values: byte[] = [
          10 as byte,
          30 as byte,
          50 as byte,
          70 as byte,
          100 as byte
        ];
        let results: boolean[] = [];
        for (let i = 0; i < values.length; i++) {
          results.push(baseValue.isLessEqualThan(values[i]));
        }
        expect(results[0]).assertFalse();
        expect(results[1]).assertFalse();
        expect(results[2]).assertTrue();
        expect(results[3]).assertTrue();
        expect(results[4]).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_2400
     * @tc.name      testByteIsLessEqualThan0024
     * @tc.desc      Mathematical scenario: arithmetic operation comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 40 as byte;
        let b2: byte = 50 as byte;
        let sum: byte = Int.toByte(b1 + 10);
        expect(sum.isLessEqualThan(b2)).assertTrue();
        let diff: byte = Int.toByte(b2 - 10);
        expect(diff.isLessEqualThan(b1)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_2500
     * @tc.name      testByteIsLessEqualThan0025
     * @tc.desc      Mathematical scenario: wrapping value comparison
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 100 as byte;
        let b2: byte = 50 as byte;
        let sum: byte = Int.toByte(200);
        expect(sum.isLessEqualThan(b2)).assertTrue();
      });

    /**
     * @tc.number    SUB_BYTE_IS_LESS_EQUAL_THAN_2600
     * @tc.name      testByteIsLessEqualThan0026
     * @tc.desc      Performance: loop comparison performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testByteIsLessEqualThan0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let b1: byte = 50 as byte;
        let b2: byte = 70 as byte;
        let startTime: number = Date.now();
        for (let i = 0; i < 100000; i++) {
          b1.isLessEqualThan(b2);
        }
        let endTime: number = Date.now();
        expect(endTime - startTime).assertLess(5000);
      });
  })
}
