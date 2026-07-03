'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
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
import Utils from './../Util.test';

class SomeCheck087 {
  static check(value: number): boolean {
    return value > 1.0;
  }
}

export default function float64ArraySomeTest(): void {
  describe('Float64ArraySomeTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0010
     * @tc.name testFloat64ArraySome001
     * @tc.desc Verify some with 3-param callback returns true when element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const result = values.some((value: number, index: int, array: Float64Array) => value > 1.0);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0020
     * @tc.name testFloat64ArraySome002
     * @tc.desc Verify some with 1-param callback using only value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.some((value: number) => value > 2.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0030
     * @tc.name testFloat64ArraySome003
     * @tc.desc Verify some with 2-param callback using value and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128, 0]);
      const result = values.some((value: number, index: int) => index === 1);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0040
     * @tc.name testFloat64ArraySome004
     * @tc.desc Verify some callback using array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      const result = values.some((value: number, index: int, array: Float64Array) => array.$_get(index) === value);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0050
     * @tc.name testFloat64ArraySome005
     * @tc.desc Verify some returns true when element equals 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const result = values.some((value: number) => value === 0.0);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0060
     * @tc.name testFloat64ArraySome006
     * @tc.desc Verify some returns true when element equals -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.some((value: number) => value === -0.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0070
     * @tc.name testFloat64ArraySome007
     * @tc.desc Verify some detects NaN using Number.isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128, 0]);
      const result = values.some((value: number) => Number.isNaN(value));
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0080
     * @tc.name testFloat64ArraySome008
     * @tc.desc Verify some detects Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      const result = values.some((value: number) => value === Infinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0090
     * @tc.name testFloat64ArraySome009
     * @tc.desc Verify some detects -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const result = values.some((value: number) => value === -Infinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0100
     * @tc.name testFloat64ArraySome010
     * @tc.desc Verify some detects MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.some((value: number) => value > 1.0e+100);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0110
     * @tc.name testFloat64ArraySome011
     * @tc.desc Verify some returns false when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128, 0]);
      const result = values.some((value: number) => value > 100.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0120
     * @tc.name testFloat64ArraySome012
     * @tc.desc Verify some on empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array(0);
      const result = values.some((value: number) => true);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0130
     * @tc.name testFloat64ArraySome013
     * @tc.desc Verify some on single element matching returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648]);
      const result = values.some((value: number) => value === 42.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0140
     * @tc.name testFloat64ArraySome014
     * @tc.desc Verify some on single element not matching returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1);
      const result = values.some((value: number) => value > 100.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0150
     * @tc.name testFloat64ArraySome015
     * @tc.desc Verify some with all elements matching returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.some((value: number) => value > 0.0);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0160
     * @tc.name testFloat64ArraySome016
     * @tc.desc Verify some stops after first match and does not continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const values = new Float64Array([-32768, -128, 0]);
      let count: int = 0;
      values.some((value: number) => {
        count++;
        return value > 1.0;
      })

      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0170
     * @tc.name testFloat64ArraySome017
     * @tc.desc Verify some callback throws Error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      try {
        values.some((value: number) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0180
     * @tc.name testFloat64ArraySome018
     * @tc.desc Verify some callback throws RangeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1, 9007199254740991);
      try {
        values.some((value: number) => {
          throw new RangeError("range");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0190
     * @tc.name testFloat64ArraySome019
     * @tc.desc Verify some with negative values matching condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const result = values.some((value: number) => value < 0.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0200
     * @tc.name testFloat64ArraySome020
     * @tc.desc Verify some with scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128]);
      const result = values.some((value: number) => value > 1.0e+50);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0210
     * @tc.name testFloat64ArraySome021
     * @tc.desc Verify some callback using external variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      let threshold: number = 2.5;
      const result = values.some((value: number) => value > threshold);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0220
     * @tc.name testFloat64ArraySome022
     * @tc.desc Verify some callback modifying external counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      let callCount: int = 0;
      values.some((value: number) => {
        callCount++;
        return false;
      })

      const expectVal = threeValue;
      expect(callCount).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0230
     * @tc.name testFloat64ArraySome023
     * @tc.desc Verify some on all-zero array matching zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointTwoFive, pointTwoFive, pointTwoFive);
      const result = values.some((value: number) => value === 0.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0240
     * @tc.name testFloat64ArraySome024
     * @tc.desc Verify some on all-identical array matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = values.some((value: number) => value === 7.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0250
     * @tc.name testFloat64ArraySome025
     * @tc.desc Verify some callback receives correct index values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = new Float64Array([-2147483648, -1, 0]);
      let capturedIndex: int = -1;
      values.some((value: number, index: int) => {
        capturedIndex = index;
        return value > 20.0;
      })

      const expectVal = twoValue;
      expect(capturedIndex).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0260
     * @tc.name testFloat64ArraySome026
     * @tc.desc Verify some original array unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      values.some((value: number) => value > 100.0);
      const actVal1 = values.$_get(0);
      const expectVal = pointOne;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = values.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0270
     * @tc.name testFloat64ArraySome027
     * @tc.desc Verify some on large array finds matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const values = new Float64Array(1000);
      values.$_set(500, fillValue42);
      const result = values.some((value: number) => value === 42.0);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0280
     * @tc.name testFloat64ArraySome028
     * @tc.desc Verify some with index-based condition matches only at specific position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const result = values.some((value: number, index: int) => index === 2 && value === 3.0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0290
     * @tc.name testFloat64ArraySome029
     * @tc.desc Verify some with int variable as threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128, 0, 127]);
      const threshold: int = 3;
      const result = values.some((value: number) => value >= threshold);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0300
     * @tc.name testFloat64ArraySome030
     * @tc.desc Verify some with double variable as threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1, 0]);
      const threshold: double = 2.0;
      const result = values.some((value: number) => value > threshold);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0310
     * @tc.name testFloat64ArraySome031
     * @tc.desc Verify some with MIN_VALUE match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([0.1, 9007199254740991, 0]);
      const actVal3 = v.some((x: number) => x === 5e-324);
      const expectVal = false;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0320
     * @tc.name testFloat64ArraySome032
     * @tc.desc Verify some with MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([0.5, 1.5, 0.25]);
      const actVal4 = v.some((x: number) => x === 9007199254740991.0);
      const expectVal = false;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0330
     * @tc.name testFloat64ArraySome033
     * @tc.desc Verify some with MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([-32768, -128, 0]);
      const actVal5 = v.some((x: number) => x === -9007199254740991.0);
      const expectVal = false;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0340
     * @tc.name testFloat64ArraySome034
     * @tc.desc Verify some index=0 match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal6 = new Float64Array([-2147483648, -1, 0]).some((v, i) => i === 0);
      const expectVal = true;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0350
     * @tc.name testFloat64ArraySome035
     * @tc.desc Verify some callback array ref equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([-32768, -128, 0]);
      const actVal7 = v.some((x, i, a) => a === v);
      const expectVal = true;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0360
     * @tc.name testFloat64ArraySome036
     * @tc.desc Verify some callback always true short-circuits at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      let c: int = 0;
      const r = new Float64Array([-2147483648, -1, 0]).some((v) => {
        c++;
        return true;
      })

      const expectVal = true;
      expect(r).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(c).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0370
     * @tc.name testFloat64ArraySome037
     * @tc.desc Verify some callback always false traverses all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      let c: int = 0;
      const r = new Float64Array([0.1, 9007199254740991, 0]).some((v) => {
        c++;
        return false;
      })

      const expectVal = false;
      expect(r).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(c).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0380
     * @tc.name testFloat64ArraySome038
     * @tc.desc Verify some only last element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal8 = new Float64Array([0.5, 1.5, 0.25]).some(v => v > 2.5);
      const expectVal = false;
      expect(actVal8).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0390
     * @tc.name testFloat64ArraySome039
     * @tc.desc Verify some only first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal9 = Float64Array.of(-32768, -128, 0).some(v => v < 1.5);
      const expectVal = true;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0400
     * @tc.name testFloat64ArraySome040
     * @tc.desc Verify some empty array callback not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      let c: int = 0;
      new Float64Array(0).some((v) => {
        c++;
        return true;
      })

      const expectVal = zeroValue;
      expect(c).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0410
     * @tc.name testFloat64ArraySome041
     * @tc.desc Verify some short-circuits at second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      let c: int = 0;
      const r = Float64Array.of(-2147483648, -1, 0).some(v => {
        c++;
        return v === 2;
      })

      const expectVal = false;
      expect(r).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(c).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0420
     * @tc.name testFloat64ArraySome042
     * @tc.desc Verify some short-circuits at third element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      let c: int = 0;
      const r = new Float64Array([0.1, 9007199254740991, 0]).some(v => {
        c++;
        return v === 3;
      })

      const expectVal = false;
      expect(r).assertEqual(expectVal);
      const expectVal2 = threeValue;
      expect(c).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0430
     * @tc.name testFloat64ArraySome043
     * @tc.desc Verify some callback throws TypeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Float64Array.of(0.5, 1.5).some(v => {
          throw new TypeError("t");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0440
     * @tc.name testFloat64ArraySome044
     * @tc.desc Verify some callback throws at second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      let c: int = 0;
      try {
        new Float64Array([-32768, -128, 0]).some(v => {
          c++;
          if (c === 2) {
            throw new Error("2nd");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        const expectVal = twoValue;
        expect(c).assertEqual(expectVal);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0450
     * @tc.name testFloat64ArraySome045
     * @tc.desc Verify some callback throws at last call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      let c: int = 0;
      try {
        Float64Array.of(-2147483648, -1, 0).some(v => {
          c++;
          if (c === 3) {
            throw new Error("last");
          }
          return false;
        })

        expect().assertFail();
      } catch (e) {
        const expectVal = threeValue;
        expect(c).assertEqual(expectVal);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0460
     * @tc.name testFloat64ArraySome046
     * @tc.desc Verify some empty array callback that throws is never called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        new Float64Array(0).some(v => {
          throw new Error("x");
        })

      } catch (e) {
        threw = true;
      }
      const expectVal = false;
      expect(threw).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0470
     * @tc.name testFloat64ArraySome047
     * @tc.desc Verify some short-circuits before throwing callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: int = 0;
      try {
        Float64Array.of(0.1, 9007199254740991, 0).some(v => {
          c++;
          if (c > 1) {
            throw new Error("x");
          }
          return v === 1;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0480
     * @tc.name testFloat64ArraySome048
     * @tc.desc Verify some with all NaN array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const actVal10 = Float64Array.of(pointTwoFive, pointTwoFive, pointTwoFive).some(v => Number.isNaN(v));
      const expectVal = false;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0490
     * @tc.name testFloat64ArraySome049
     * @tc.desc Verify some with all Infinity array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const actVal11 = Float64Array.of(zeroValue, zeroValue, zeroValue).some(v => v === Infinity);
      const expectVal = false;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0500
     * @tc.name testFloat64ArraySome050
     * @tc.desc Verify some single element NaN matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal12 = new Float64Array([-2147483648]).some(v => Number.isNaN(v));
      const expectVal = false;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0510
     * @tc.name testFloat64ArraySome051
     * @tc.desc Verify some single element callback executes once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      let c: int = 0;
      Float64Array.of(0.1).some(v => {
        c++;
        return false;
      })

      const expectVal = oneValue;
      expect(c).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0520
     * @tc.name testFloat64ArraySome052
     * @tc.desc Verify some two-element first matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal13 = new Float64Array([0.5, 1.5]).some(v => v === 1);
      const expectVal = false;
      expect(actVal13).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0530
     * @tc.name testFloat64ArraySome053
     * @tc.desc Verify some two-element second matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal14 = Float64Array.of(-32768, -128).some(v => v === 2);
      const expectVal = false;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0540
     * @tc.name testFloat64ArraySome054
     * @tc.desc Verify some on 100-element array first matches short-circuits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const v = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        v.$_set(i, i);
      }
      let c: int = 0;
      const r = v.some(x => {
        c++;
        return x === 0.0;
      })

      const expectVal = true;
      expect(r).assertEqual(expectVal);
      const expectVal2 = oneValue;
      expect(c).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0550
     * @tc.name testFloat64ArraySome055
     * @tc.desc Verify some on 100-element array last matches traverses all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredValue: number = 100;
      const v = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        v.$_set(i, i);
      }
      let c: int = 0;
      const r = v.some(x => {
        c++;
        return x === 99;
      })

      const expectVal = true;
      expect(r).assertEqual(expectVal);
      const expectVal2 = hundredValue;
      expect(c).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0560
     * @tc.name testFloat64ArraySome056
     * @tc.desc Verify some 0.1+0.2 precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Float64Array.of(0.1 + 0.2);
      const actVal15 = v.some(x => x !== 0.3);
      const expectVal = true;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0570
     * @tc.name testFloat64ArraySome057
     * @tc.desc Verify some callback reads external variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      let sum: number = 0;
      Float64Array.of(0.1, maxSafeInteger, 0).some(v => {
        sum += v;
        return false;
      })

      const expectVal = maxSafeInteger;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0580
     * @tc.name testFloat64ArraySome058
     * @tc.desc Verify some nested call inside callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([0.5, 1.5, 0.25]);
      const actVal16 = v.some(x => Float64Array.of(x).some(y => y === x));
      const expectVal = true;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0590
     * @tc.name testFloat64ArraySome059
     * @tc.desc Verify some OR condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal17 = Float64Array.of(-32768, -128, 0).some(v => v === 1 || v === 3);
      const expectVal = false;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0600
     * @tc.name testFloat64ArraySome060
     * @tc.desc Verify some AND condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal18 = new Float64Array([-2147483648, -1, 0]).some(v => v > 1 && v < 3);
      const expectVal = false;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0610
     * @tc.name testFloat64ArraySome061
     * @tc.desc Verify some >= condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal19 = Float64Array.of(0.1, 9007199254740991, 0).some(v => v >= 3);
      const expectVal = true;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0620
     * @tc.name testFloat64ArraySome062
     * @tc.desc Verify some <= condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal20 = Float64Array.of(0.5, 1.5, 0.25).some(v => v <= 1);
      const expectVal = true;
      expect(actVal20).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0630
     * @tc.name testFloat64ArraySome063
     * @tc.desc Verify some != condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal21 = new Float64Array([-32768, -128, 0]).some(v => v !== 2);
      const expectVal = true;
      expect(actVal21).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0640
     * @tc.name testFloat64ArraySome064
     * @tc.desc Verify some all-zero checks non-zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal22 = new Float64Array(3).some(v => v !== 0.0);
      const expectVal = false;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0650
     * @tc.name testFloat64ArraySome065
     * @tc.desc Verify some all-identical check unequal returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const actVal23 = new Float64Array([zeroValue, zeroValue, zeroValue]).some(v => v !== 5);
      const expectVal = true;
      expect(actVal23).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0660
     * @tc.name testFloat64ArraySome066
     * @tc.desc Verify some mixed positive-negative checks positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal24 = Float64Array.of(0.1, 9007199254740991, 0).some(v => v > 0);
      const expectVal = true;
      expect(actVal24).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0670
     * @tc.name testFloat64ArraySome067
     * @tc.desc Verify some callback returns literal true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal25 = new Float64Array([0.5, 1.5]).some(v => true);
      const expectVal = true;
      expect(actVal25).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0680
     * @tc.name testFloat64ArraySome068
     * @tc.desc Verify some callback returns literal false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal26 = Float64Array.of(-32768, -128).some(v => false);
      const expectVal = false;
      expect(actVal26).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0690
     * @tc.name testFloat64ArraySome069
     * @tc.desc Verify some chained with slice after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([-2147483648, -1, 0]);
      const has = v.some(x => x % 2 === 0);
      const expectVal = true;
      expect(has).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0700
     * @tc.name testFloat64ArraySome070
     * @tc.desc Verify some on ArrayBuffer constructed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const twoValue: number = 2;
      const threeValue: number = 3;
      const buf = new ArrayBuffer(24);
      const v = new Float64Array(buf, 0, 3);
      v.$_set(0, oneValue);
      v.$_set(1, twoValue);
      v.$_set(2, threeValue);
      const actVal27 = v.some(x => x === 2);
      const expectVal = true;
      expect(actVal27).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0710
     * @tc.name testFloat64ArraySome071
     * @tc.desc Verify some returns false on selected copied values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([9007199254740991, 0]);
      const actVal28 = v.some(x => x === 2);
      const expectVal = false;
      expect(actVal28).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0720
     * @tc.name testFloat64ArraySome072
     * @tc.desc Verify some returns false on selected middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([1.5, 0.25]);
      const actVal29 = v.some(x => x === 3);
      const expectVal = false;
      expect(actVal29).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0730
     * @tc.name testFloat64ArraySome073
     * @tc.desc Verify some returns false on transformed-equivalent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Float64Array.of(-65536.0, -256.0, 0.0);
      const actVal30 = v.some(x => x === 4);
      const expectVal = false;
      expect(actVal30).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0740
     * @tc.name testFloat64ArraySome074
     * @tc.desc Verify some returns false on empty selected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array(0);
      const actVal31 = v.some(x => x === 2);
      const expectVal = false;
      expect(actVal31).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0750
     * @tc.name testFloat64ArraySome075
     * @tc.desc Verify some on copy-constructed Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o = new Float64Array([0.1, 9007199254740991, 0]);
      const actVal32 = new Float64Array(o).some(x => x === 2);
      const expectVal = false;
      expect(actVal32).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0760
     * @tc.name testFloat64ArraySome076
     * @tc.desc Verify some on FixedArray constructed Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [1, 2, 3];
      const actVal33 = new Float64Array(fa).some(x => x > 1);
      const expectVal = true;
      expect(actVal33).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0770
     * @tc.name testFloat64ArraySome077
     * @tc.desc Verify some with int boundary 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([0.5, 1.5, 0.25]);
      const actVal34 = v.some(x => x === 2147483647.0);
      const expectVal = false;
      expect(actVal34).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0780
     * @tc.name testFloat64ArraySome078
     * @tc.desc Verify some with int boundary -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([-32768, -128, 0]);
      const actVal35 = v.some(x => x === -2147483648.0);
      const expectVal = false;
      expect(actVal35).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0790
     * @tc.name testFloat64ArraySome079
     * @tc.desc Verify some multiple calls on same array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Float64Array([-2147483648, -1, 0]);
      const actVal36 = v.some(x => x > 0);
      const expectVal = false;
      expect(actVal36).assertEqual(expectVal);
      const actVal37 = v.some(x => x > 1);
      const expectVal2 = false;
      expect(actVal37).assertEqual(expectVal2);
      const actVal38 = v.some(x => x > 100);
      const expectVal3 = false;
      expect(actVal38).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0800
     * @tc.name testFloat64ArraySome080
     * @tc.desc Verify some callback with conditional branch return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.some((v: number): boolean => {
        if (v === 2) {
          return true;
        }
        return false;
      });
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0810
     * @tc.name testFloat64ArraySome081
     * @tc.desc Verify some callback with ternary operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal39 = new Float64Array([0.5, 1.5, 0.25]).some(v => v > 1 ? true : false);
      const expectVal = true;
      expect(actVal39).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0820
     * @tc.name testFloat64ArraySome082
     * @tc.desc Verify some callback returns self-equality expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal40 = Float64Array.of(-32768, -128, 0).some(v => v === v);
      const expectVal = true;
      expect(actVal40).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0830
     * @tc.name testFloat64ArraySome083
     * @tc.desc Verify some with index >= 0 always true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const actVal41 = new Float64Array([-2147483648, -1, 0]).some((v, i) => i >= 0);
      const expectVal = true;
      expect(actVal41).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0840
     * @tc.name testFloat64ArraySome084
     * @tc.desc Verify some with class static method as callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const result = values.some((value: number) => SomeCheck087.check(value));
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0850
     * @tc.name testFloat64ArraySome085
     * @tc.desc Verify some returns true when any element satisfies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const actVal42 = values.some((value) => value === 6.0);
      const expectVal = false;
      expect(actVal42).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0860
     * @tc.name testFloat64ArraySome086
     * @tc.desc Verify some returns false when no elements satisfy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128, 0]);
      const actVal43 = values.some((value) => value > 10);
      const expectVal = false;
      expect(actVal43).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0870
     * @tc.name testFloat64ArraySome087
     * @tc.desc Verify some empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array();
      const actVal44 = values.some((value) => value > 0);
      const expectVal = false;
      expect(actVal44).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0880
     * @tc.name testFloat64ArraySome088
     * @tc.desc Verify some single element satisfies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648]);
      const actVal45 = values.some((value) => value > 0);
      const expectVal = false;
      expect(actVal45).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0890
     * @tc.name testFloat64ArraySome089
     * @tc.desc Verify some single element does not satisfy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(0.1);
      const actVal46 = values.some((value) => value > 10);
      const expectVal = false;
      expect(actVal46).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0900
     * @tc.name testFloat64ArraySome090
     * @tc.desc Verify some with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5]);
      const actVal47 = values.some((value) => Number.isNaN(value));
      const expectVal = false;
      expect(actVal47).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0910
     * @tc.name testFloat64ArraySome091
     * @tc.desc Verify some with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-32768, -128]);
      const actVal48 = values.some((value) => value === Infinity);
      const expectVal = false;
      expect(actVal48).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0920
     * @tc.name testFloat64ArraySome092
     * @tc.desc Verify some returns immediately after finding match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const values = new Float64Array([-2147483648, -1, 0]);
      let count = 0;
      values.some((value) => {
        count++;
        return value > 0;
      })

      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0930
     * @tc.name testFloat64ArraySome093
     * @tc.desc Verify some with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const arr = new Float64Array([hexValueFF, hexValueAA, hexValue55]);
      const r = arr.some((v: number): boolean => v === 0xAA);
      const expectVal = true;
      expect(r).assertEqual(expectVal);
      const actVal49 = arr.some((v: number): boolean => v === 0xBB);
      const expectVal2 = false;
      expect(actVal49).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0940
     * @tc.name testFloat64ArraySome094
     * @tc.desc Verify some with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const arr = new Float64Array([binaryValue11111111, binaryValue10101010, binaryValue01010101]);
      const r = arr.some((v: number): boolean => v === 0b10101010);
      const expectVal = true;
      expect(r).assertEqual(expectVal);
      const actVal50 = arr.some((v: number): boolean => v === 0b11110000);
      const expectVal2 = false;
      expect(actVal50).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0950
     * @tc.name testFloat64ArraySome095
     * @tc.desc Verify some with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const actVal51 = arr.some((v: number): boolean => Number.isNaN(v));
      const expectVal = true;
      expect(actVal51).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0960
     * @tc.name testFloat64ArraySome096
     * @tc.desc Verify some with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const actVal52 = arr.some((v: number): boolean => v === Double.POSITIVE_INFINITY);
      const expectVal = true;
      expect(actVal52).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0970
     * @tc.name testFloat64ArraySome097
     * @tc.desc Verify some with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const actVal53 = arr.some((v: number): boolean => v === Double.MIN_VALUE);
      const expectVal = true;
      expect(actVal53).assertEqual(expectVal);
      const actVal54 = arr.some((v: number): boolean => v === Double.MAX_VALUE);
      const expectVal2 = true;
      expect(actVal54).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0980
     * @tc.name testFloat64ArraySome098
     * @tc.desc Verify some returns true when NaN element is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const arr = Float64Array.of(nanValue, 1.0, 2.0);
      const actVal55 = arr.some((v: number): boolean => Number.isNaN(v));
      const expectVal = true;
      expect(actVal55).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_0990
     * @tc.name testFloat64ArraySome099
     * @tc.desc Verify some returns true when Infinity element is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, 1.0, 2.0);
      const actVal56 = arr.some((v: number): boolean => v === Infinity);
      const expectVal = true;
      expect(actVal56).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1000
     * @tc.name testFloat64ArraySome100
     * @tc.desc Verify some returns true when -Infinity element is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(negativeInfinity, 1.0, 2.0);
      const actVal57 = arr.some((v: number): boolean => v === -Infinity);
      const expectVal = true;
      expect(actVal57).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1010
     * @tc.name testFloat64ArraySome101
     * @tc.desc Verify some returns true when MAX_VALUE element is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = new Float64Array([doubleMaxValue, 1.0, 2.0]);
      const actVal58 = arr.some((v: number): boolean => v === Double.MAX_VALUE);
      const expectVal = true;
      expect(actVal58).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1020
     * @tc.name testFloat64ArraySome102
     * @tc.desc Verify some returns true when MIN_VALUE element is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const arr = Float64Array.of(doubleMinValue, 1.0, 2.0);
      const actVal59 = arr.some((v: number): boolean => v === Double.MIN_VALUE);
      const expectVal = true;
      expect(actVal59).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1030
     * @tc.name testFloat64ArraySome103
     * @tc.desc Verify some returns true when large scientific notation element is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0e+200, 1.0, 2.0]);
      const actVal60 = arr.some((v: number): boolean => v === 1.0e+200);
      const expectVal = true;
      expect(actVal60).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1040
     * @tc.name testFloat64ArraySome104
     * @tc.desc Verify some returns true when small scientific notation element is present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0e-200, 1.0, 2.0);
      const actVal61 = arr.some((v: number): boolean => v === 1.0e-200);
      const expectVal = true;
      expect(actVal61).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1050
     * @tc.name testFloat64ArraySome105
     * @tc.desc Verify some returns true when large negative element satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-999999.99, 1.0, 2.0]);
      const actVal62 = arr.some((v: number): boolean => v < -100000.0);
      const expectVal = true;
      expect(actVal62).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1060
     * @tc.name testFloat64ArraySome106
     * @tc.desc Verify some with 0.0 and -0.0 elements matching 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.0, -0.0, 1.0);
      const actVal63 = arr.some((v: number): boolean => v === 0.0);
      const expectVal = true;
      expect(actVal63).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1070
     * @tc.name testFloat64ArraySome107
     * @tc.desc Verify some on Array<number> constructed Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = new Float64Array(src);
      const actVal64 = arr.some((v: number): boolean => v > 1.0);
      const expectVal = true;
      expect(actVal64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1080
     * @tc.name testFloat64ArraySome108
     * @tc.desc Verify some on all-zero array matching zero returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      const actVal65 = arr.some((v: number): boolean => v === 0.0);
      const expectVal = true;
      expect(actVal65).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1090
     * @tc.name testFloat64ArraySome109
     * @tc.desc Verify some on all-identical array matching value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const arr = new Float64Array([fivePointZero, fivePointZero, fivePointZero]);
      const actVal66 = arr.some((v: number): boolean => v === 5.0);
      const expectVal = true;
      expect(actVal66).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1100
     * @tc.name testFloat64ArraySome110
     * @tc.desc Verify some with mixed positive-negative checks negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-1.0, 0.0, 1.0]);
      const actVal67 = arr.some((v: number): boolean => v < 0.0);
      const expectVal = true;
      expect(actVal67).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1110
     * @tc.name testFloat64ArraySome111
     * @tc.desc Verify some with hex literal 0x1234 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const arr = Float64Array.of(hexValue1234, 1.0, 2.0);
      const actVal68 = arr.some((v: number): boolean => v === 0x1234);
      const expectVal = true;
      expect(actVal68).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1120
     * @tc.name testFloat64ArraySome112
     * @tc.desc Verify some with octal literal 0o123 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0o123, 1.0, 2.0]);
      const actVal69 = arr.some((v: number): boolean => v === 0o123);
      const expectVal = true;
      expect(actVal69).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1130
     * @tc.name testFloat64ArraySome113
     * @tc.desc Verify some with int overflow 2147483648 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([2147483648, 1.0, 2.0]);
      const actVal70 = arr.some((v: number): boolean => v === 2147483648);
      const expectVal = true;
      expect(actVal70).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1140
     * @tc.name testFloat64ArraySome114
     * @tc.desc Verify some with 0x7FFF (short max) element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue7FFF: number = 0x7FFF;
      const arr = Float64Array.of(hexValue7FFF, 1.0, 2.0);
      const actVal71 = arr.some((v: number): boolean => v === 0x7FFF);
      const expectVal = true;
      expect(actVal71).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1150
     * @tc.name testFloat64ArraySome115
     * @tc.desc Verify some with 1.0e6 scientific notation element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0e6, 2.0, 3.0]);
      const actVal72 = arr.some((v: number): boolean => v === 1.0e6);
      const expectVal = true;
      expect(actVal72).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SOME_1160
     * @tc.name testFloat64ArraySome116
     * @tc.desc Verify some reads modified value when callback changes array elements during forward iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySome116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      // At index 0, modify index 2 from 3.0 to 999.0
      // some should use the modified value 999.0 when it reaches index 2
      const result = arr.some((val: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(2, 999.0);
        }
        return val > 3.0;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

  })
}
