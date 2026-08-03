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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BigInt64ArrayWithTest(): void {
  describe('BigInt64ArrayWithTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0100
     * @tc.name testBigInt64ArrayWith001
     * @tc.desc Verify with replaces first element index zero with positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(0, 99n);
      expect(res[0]).assertEqual(99n);
      expect(res[1]).assertEqual(22n);
      expect(res[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0200
     * @tc.name testBigInt64ArrayWith002
     * @tc.desc Verify with replaces middle element index one with zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(1, 99n);
      expect(res[0]).assertEqual(11n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0300
     * @tc.name testBigInt64ArrayWith003
     * @tc.desc Verify with replaces last element index two with negative value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(2, -1n);
      expect(res[0]).assertEqual(11n);
      expect(res[1]).assertEqual(22n);
      expect(res[2]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0400
     * @tc.name testBigInt64ArrayWith004
     * @tc.desc Verify with replaces element at index one on four element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.with(1, 99n);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(30n);
      expect(res[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0500
     * @tc.name testBigInt64ArrayWith005
     * @tc.desc Verify with replaces element at index three on four element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.with(3, 88n);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
      expect(res[3]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0600
     * @tc.name testBigInt64ArrayWith006
     * @tc.desc Verify with on five element array replaces element at index two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.with(2, 77n);
      expect(res[0]).assertEqual(10n);
      expect(res[2]).assertEqual(77n);
      expect(res[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0700
     * @tc.name testBigInt64ArrayWith007
     * @tc.desc Verify with on five element array replaces last element index four.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.with(4, 99n);
      expect(res[0]).assertEqual(10n);
      expect(res[4]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0800
     * @tc.name testBigInt64ArrayWith008
     * @tc.desc Verify with replaces with maximum positive BigInt value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      let res = arr.with(1, 9223372036854775807n);
      expect(res[1]).assertEqual(9223372036854775807n);
      expect(res[0]).assertEqual(11n);
      expect(res[3]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_0900
     * @tc.name testBigInt64ArrayWith009
     * @tc.desc Verify with replaces with minimum negative BigInt value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      let res = arr.with(2, -9223372036854775808n);
      expect(res[2]).assertEqual(-9223372036854775808n);
      expect(res[0]).assertEqual(11n);
      expect(res[3]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1000
     * @tc.name testBigInt64ArrayWith010
     * @tc.desc Verify with replaces with positive small integer one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(2, 1n);
      expect(res[2]).assertEqual(1n);
      expect(res[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1100
     * @tc.name testBigInt64ArrayWith011
     * @tc.desc Verify with replaces with negative medium value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(0, -200n);
      expect(res[0]).assertEqual(-200n);
      expect(res[1]).assertEqual(22n);
      expect(res[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1200
     * @tc.name testBigInt64ArrayWith012
     * @tc.desc Verify with replaces with a computed BigInt value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.with(1, 100n * 50n + 7n);
      expect(res[1]).assertEqual(5007n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1300
     * @tc.name testBigInt64ArrayWith013
     * @tc.desc Verify with on two element array replaces index one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.with(1, 999n);
      expect(res[0]).assertEqual(100n);
      expect(res[1]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1400
     * @tc.name testBigInt64ArrayWith014
     * @tc.desc Verify with on four element array all elements verify unchanged neighbors.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.with(2, 99n);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(99n);
      expect(res[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1500
     * @tc.name testBigInt64ArrayWith015
     * @tc.desc Verify with on ten element array replaces element at index five.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
      let res = arr.with(5, 99n);
      expect(res[4]).assertEqual(4n);
      expect(res[5]).assertEqual(99n);
      expect(res[6]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1600
     * @tc.name testBigInt64ArrayWith016
     * @tc.desc Verify with on hundred element array loop initialized replaces index fifty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) { arr[i] = BigInt(i); }
      let res = arr.with(50, 9999n);
      expect(res[49]).assertEqual(49n);
      expect(res[50]).assertEqual(9999n);
      expect(res[51]).assertEqual(51n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1700
     * @tc.name testBigInt64ArrayWith017
     * @tc.desc Verify with on array constructed with explicit length then filled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let res = arr.with(1, 55n);
      expect(res[1]).assertEqual(55n);
      expect(arr[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1800
     * @tc.name testBigInt64ArrayWith018
     * @tc.desc Verify with on array constructed with explicit length initial zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let res = arr.with(1, 42n);
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(42n);
      expect(res[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_1900
     * @tc.name testBigInt64ArrayWith019
     * @tc.desc Verify with on ArrayBuffer based array with nonzero byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 11n;
      arr[1] = 22n;
      arr[2] = 33n;
      let res = arr.with(1, 99n);
      expect(res[0]).assertEqual(11n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(33n);
      expect(arr[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2000
     * @tc.name testBigInt64ArrayWith020
     * @tc.desc Verify with on subarray view returns correct result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      let res = sub.with(1, 99n);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2100
     * @tc.name testBigInt64ArrayWith021
     * @tc.desc Verify with on subarray view starting at zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(0, 3);
      let res = sub.with(0, 88n);
      expect(res[0]).assertEqual(88n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2200
     * @tc.name testBigInt64ArrayWith022
     * @tc.desc Verify with on subarray view covering entire original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(0, 3);
      let res = sub.with(2, 77n);
      expect(res[2]).assertEqual(77n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2300
     * @tc.name testBigInt64ArrayWith023
     * @tc.desc Verify with throws RangeError for negative index minus four on three-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      try {
        arr.with(-4, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2400
     * @tc.name testBigInt64ArrayWith024
     * @tc.desc Verify with throws RangeError for index equal to length on three element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      try {
        arr.with(3, 1n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2500
     * @tc.name testBigInt64ArrayWith025
     * @tc.desc Verify with throws RangeError for maximum int out-of-bounds index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      try {
        arr.with(2147483647, 1n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2600
     * @tc.name testBigInt64ArrayWith026
     * @tc.desc Verify with throws RangeError for minimum int out-of-bounds negative index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      try {
        arr.with(-2147483648, 1n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2700
     * @tc.name testBigInt64ArrayWith027
     * @tc.desc Verify with source array still unchanged after failed with call RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([11n, 22n, 33n]);
      try {
        src.with(-10, 5n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(src[0]).assertEqual(11n);
      expect(src[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2800
     * @tc.name testBigInt64ArrayWith028
     * @tc.desc Verify with source array still unchanged after out-of-bounds with call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([11n, 22n, 33n]);
      try {
        src.with(5, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(src[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_2900
     * @tc.name testBigInt64ArrayWith029
     * @tc.desc Verify multiple with calls from same source each produce independent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n, 30n]);
      let res1 = src.with(0, 100n);
      let res2 = src.with(0, 200n);
      expect(res1[0]).assertEqual(100n);
      expect(res2[0]).assertEqual(200n);
      expect(src[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3000
     * @tc.name testBigInt64ArrayWith030
     * @tc.desc Verify with returns a new array reference not the original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new BigInt64Array([11n, 22n, 33n]);
      let result = original.with(0, 99n);
      expect(result !== original).assertTrue();
      expect(result[0]).assertEqual(99n);
      expect(original[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3100
     * @tc.name testBigInt64ArrayWith031
     * @tc.desc Verify with result is independent modifying original does not affect result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new BigInt64Array([11n, 22n, 33n]);
      let result = original.with(1, 99n);
      original[0] = 888n;
      expect(original[0]).assertEqual(888n);
      expect(result[0]).assertEqual(11n);
      expect(result[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3200
     * @tc.name testBigInt64ArrayWith032
     * @tc.desc Verify modifying result does not affect original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original = new BigInt64Array([11n, 22n, 33n]);
      let result = original.with(1, 99n);
      result[0] = 777n;
      expect(result[0]).assertEqual(777n);
      expect(original[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3300
     * @tc.name testBigInt64ArrayWith033
     * @tc.desc Verify chained with calls produce correct intermediate results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.with(0, 100n).with(2, 300n);
      expect(res[0]).assertEqual(100n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3400
     * @tc.name testBigInt64ArrayWith034
     * @tc.desc Verify triple chained with calls produce correct result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.with(0, 1n).with(1, 2n).with(3, 9n);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(30n);
      expect(res[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3500
     * @tc.name testBigInt64ArrayWith035
     * @tc.desc Verify chained with on same index keeps last value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.with(1, 50n).with(1, 99n);
      expect(res[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3600
     * @tc.name testBigInt64ArrayWith036
     * @tc.desc Verify four chained with calls on four element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.with(0, 10n).with(1, 20n).with(2, 30n).with(3, 40n);
      expect(res[0]).assertEqual(10n);
      expect(res[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3700
     * @tc.name testBigInt64ArrayWith037
     * @tc.desc Verify chained with alternates max and min values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.with(0, 9223372036854775807n).with(2, -9223372036854775808n);
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3800
     * @tc.name testBigInt64ArrayWith038
     * @tc.desc Verify with result byteLength equals the original byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      let res = arr.with(2, 99n);
      expect(res.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_3900
     * @tc.name testBigInt64ArrayWith039
     * @tc.desc Verify with result byteOffset equals the original byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(0, 99n);
      expect(res.byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4000
     * @tc.name testBigInt64ArrayWith040
     * @tc.desc Verify byteLength on ArrayBuffer-based with result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 11n;
      arr[1] = 22n;
      arr[2] = 33n;
      let res = arr.with(0, 99n);
      expect(res.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4100
     * @tc.name testBigInt64ArrayWith041
     * @tc.desc Verify with on array with all identical values replaces correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n, 7n, 7n]);
      let res = arr.with(2, 99n);
      expect(res[0]).assertEqual(7n);
      expect(res[1]).assertEqual(7n);
      expect(res[2]).assertEqual(99n);
      expect(res[3]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4200
     * @tc.name testBigInt64ArrayWith042
     * @tc.desc Verify with on array with all negative values replaces correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, -10n, -15n, -20n]);
      let res = arr.with(1, 99n);
      expect(res[0]).assertEqual(-5n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(-15n);
      expect(res[3]).assertEqual(-20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4300
     * @tc.name testBigInt64ArrayWith043
     * @tc.desc Verify with on array with mixed zero and nonzero elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 100n, 0n, 200n]);
      let res = arr.with(2, 999n);
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(100n);
      expect(res[2]).assertEqual(999n);
      expect(res[3]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4400
     * @tc.name testBigInt64ArrayWith044
     * @tc.desc Verify with on array with alternating positive and negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n, -3n]);
      let res = arr.with(2, 99n);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(-1n);
      expect(res[2]).assertEqual(99n);
      expect(res[5]).assertEqual(-3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4500
     * @tc.name testBigInt64ArrayWith045
     * @tc.desc Verify with on array with all max values replaces correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n, 9223372036854775807n]);
      let res = arr.with(1, 0n);
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[1]).assertEqual(0n);
      expect(res[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4600
     * @tc.name testBigInt64ArrayWith046
     * @tc.desc Verify with on array with all min values replaces correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n, -9223372036854775808n]);
      let res = arr.with(1, 1n);
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4700
     * @tc.name testBigInt64ArrayWith047
     * @tc.desc Verify with on array where all elements are zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n]);
      let res = arr.with(2, 99n);
      expect(res[0]).assertEqual(0n);
      expect(res[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4800
     * @tc.name testBigInt64ArrayWith048
     * @tc.desc Verify with with MAX at index zero on four element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      let res = arr.with(0, 9223372036854775807n);
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[1]).assertEqual(22n);
      expect(res[3]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_4900
     * @tc.name testBigInt64ArrayWith049
     * @tc.desc Verify with with MAX at last index on four element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      let res = arr.with(3, 9223372036854775807n);
      expect(res[0]).assertEqual(11n);
      expect(res[3]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5000
     * @tc.name testBigInt64ArrayWith050
     * @tc.desc Verify with with MIN at index zero on four element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      let res = arr.with(0, -9223372036854775808n);
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5100
     * @tc.name testBigInt64ArrayWith051
     * @tc.desc Verify with with MIN at last index on four element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      let res = arr.with(3, -9223372036854775808n);
      expect(res[2]).assertEqual(33n);
      expect(res[3]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5200
     * @tc.name testBigInt64ArrayWith052
     * @tc.desc Verify with replaces MAX with MIN at same index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 22n, 33n]);
      let res = arr.with(0, -9223372036854775808n);
      expect(res[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5300
     * @tc.name testBigInt64ArrayWith053
     * @tc.desc Verify with replaces MIN with MAX at same index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 22n, 33n]);
      let res = arr.with(0, 9223372036854775807n);
      expect(res[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5400
     * @tc.name testBigInt64ArrayWith054
     * @tc.desc Verify with(arr.length - 1, 999n) replaces the last element using expression-based index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.with(arr.length - 1, 999n);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
      expect(res[3]).assertEqual(40n);
      expect(res[4]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5500
     * @tc.name testBigInt64ArrayWith055
     * @tc.desc Verify large array source remains unchanged after with.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) { arr[i] = BigInt(i); }
      let res = arr.with(50, 9999n);
      expect(arr[50]).assertEqual(50n);
      expect(res[50]).assertEqual(9999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5600
     * @tc.name testBigInt64ArrayWith056
     * @tc.desc Verify fill then with on same array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(10n);
      let res = arr.with(2, 99n);
      expect(res[0]).assertEqual(10n);
      expect(res[2]).assertEqual(99n);
      expect(res[4]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5700
     * @tc.name testBigInt64ArrayWith057
     * @tc.desc Verify copyWithin then with on result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(1, 2, 4);
      let res = arr.with(0, 99n);
      expect(res[0]).assertEqual(99n);
      expect(res[1]).assertEqual(30n);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5800
     * @tc.name testBigInt64ArrayWith058
     * @tc.desc Verify with result used in forEach iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.with(1, 99n);
      let sum: bigint = 0n;
      res.forEach((v: bigint): void => { sum = sum + v; });
      expect(sum).assertEqual(139n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_5900
     * @tc.name testBigInt64ArrayWith059
     * @tc.desc Verify values iterator on with result produces correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.with(1, 99n);
      let last: bigint = 0n;
      for (let v of res.values()) { last = v; }
      expect(last).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6000
     * @tc.name testBigInt64ArrayWith060
     * @tc.desc Verify direct index access on with result returns correct first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.with(0, 55n);
      let firstVal: bigint = res[0];
      expect(firstVal).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6100
     * @tc.name testBigInt64ArrayWith061
     * @tc.desc Verify with on reversed array result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let rev = arr.reverse();
      let res = rev.with(1, 99n);
      expect(res[0]).assertEqual(4n);
      expect(res[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6200
     * @tc.name testBigInt64ArrayWith062
     * @tc.desc Verify with result can be sorted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n]);
      let res = arr.with(1, 5n);
      let sorted = res.sort();
      expect(sorted[0]).assertEqual(5n);
      expect(sorted[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6300
     * @tc.name testBigInt64ArrayWith063
     * @tc.desc Verify with on result of slice operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sliced = arr.slice(1, 4);
      let res = sliced.with(1, 99n);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6400
     * @tc.name testBigInt64ArrayWith064
     * @tc.desc Verify every returns true on with result elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.with(1, 99n);
      let allNonZero = res.every((v: bigint): boolean => v !== 0n);
      expect(allNonZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6500
     * @tc.name testBigInt64ArrayWith065
     * @tc.desc Verify with self referencing value from same array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(0, arr[2]);
      expect(res[0]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6600
     * @tc.name testBigInt64ArrayWith066
     * @tc.desc Verify with on array containing MAX then replace with MIN cascading.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 22n, 33n]);
      let res1 = arr.with(0, -9223372036854775808n);
      let res2 = res1.with(0, 9223372036854775807n);
      expect(res2[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6700
     * @tc.name testBigInt64ArrayWith067
     * @tc.desc Verify with on index two after creating array with MAX and MIN values produces correct results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n]);
      let res = arr.with(2, 9223372036854775807n);
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6800
     * @tc.name testBigInt64ArrayWith068
     * @tc.desc Verify with replaces element then combined via set with another array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([10n, 20n, 30n]);
      let res = arr1.with(1, 99n);
      let arr2 = new BigInt64Array([100n, 200n]);
      let combined = new BigInt64Array(5);
      combined.set(res, 0);
      combined.set(arr2, 3);
      expect(combined[1]).assertEqual(99n);
      expect(combined[3]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_6900
     * @tc.name testBigInt64ArrayWith069
     * @tc.desc Verify with result preserves correct element order after replacement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let res = arr.with(3, 99n);
      expect(res[0]).assertEqual(1n);
      expect(res[2]).assertEqual(3n);
      expect(res[3]).assertEqual(99n);
      expect(res[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7000
     * @tc.name testBigInt64ArrayWith070
     * @tc.desc Verify with on array constructed from iterator elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([5n, 10n, 15n]);
      let arr = new BigInt64Array(src);
      let res = arr.with(1, 99n);
      expect(res[0]).assertEqual(5n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7100
     * @tc.name testBigInt64ArrayWith071
     * @tc.desc Verify Symbol.iterator on with result works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(1, 99n);
      let count = 0;
      for (let v of res) { count++; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7200
     * @tc.name testBigInt64ArrayWith072
     * @tc.desc Verify with on subarray preserves subarray length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      let res = sub.with(0, 99n);
      expect(res[0]).assertEqual(99n);
      expect(res.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7300
     * @tc.name testBigInt64ArrayWith073
     * @tc.desc Verify with on subarray does not affect parent array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      sub.with(1, 99n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7400
     * @tc.name testBigInt64ArrayWith074
     * @tc.desc Verify with on ArrayBuffer view with offset and MAX value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 11n;
      arr[1] = 22n;
      arr[2] = 33n;
      let res = arr.with(1, 9223372036854775807n);
      expect(res[1]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7500
     * @tc.name testBigInt64ArrayWith075
     * @tc.desc Verify with on zero byteOffset ArrayBuffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 0, 3);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let res = arr.with(2, 99n);
      expect(res[2]).assertEqual(99n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7600
     * @tc.name testBigInt64ArrayWith076
     * @tc.desc Verify two different subarray views produce independent with results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub1 = arr.subarray(0, 2);
      let sub2 = arr.subarray(3, 5);
      let res1 = sub1.with(0, 11n);
      let res2 = sub2.with(1, 99n);
      expect(res1[0]).assertEqual(11n);
      expect(res2[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7700
     * @tc.name testBigInt64ArrayWith077
     * @tc.desc Verify with on empty array throws RangeError for index zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      try {
        arr.with(0, 1n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7800
     * @tc.name testBigInt64ArrayWith078
     * @tc.desc Verify with on empty array throws RangeError for negative index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      try {
        arr.with(-1, 1n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_7900
     * @tc.name testBigInt64ArrayWith079
     * @tc.desc Verify with distinguishes between negative and out of bounds positive index RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr.with(-3, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.with(2, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8000
     * @tc.name testBigInt64ArrayWith080
     * @tc.desc Verify with behavior after catching RangeError source still usable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      try {
        arr.with(10, 1n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let res = arr.with(1, 55n);
      expect(res[1]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8100
     * @tc.name testBigInt64ArrayWith081
     * @tc.desc Verify with() treats -0 index as 0 for replacement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.with(-0, 99n);
      expect(res[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8200
     * @tc.name testBigInt64ArrayWith082
     * @tc.desc Verify with() using out-of-range index throws RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.with(999, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8300
     * @tc.name testBigInt64ArrayWith083
     * @tc.desc Verify with() replacing with same value still produces a new independent buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let res = arr.with(1, 22n);
      expect(res.buffer !== arr.buffer).assertTrue();
      expect(res[0]).assertEqual(11n);
      expect(res[1]).assertEqual(22n);
      expect(res[2]).assertEqual(33n);
      res[1] = 99n;
      expect(arr[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8400
     * @tc.name testBigInt64ArrayWith084
     * @tc.desc Verify entries iterator on with result yields correct index-value pairs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.with(0, 55n);
      let iter = res.entries();
      let first = iter.next();
      let fv = first.value;
      if (fv != null) {
        expect(first.done).assertFalse();
        expect(fv[0]).assertEqual(0);
        expect(fv[1]).assertEqual(55n);
      }
      let second = iter.next();
      let sv = second.value;
      if (sv != null) {
        expect(sv[0]).assertEqual(1);
        expect(sv[1]).assertEqual(20n);
      }
      let third = iter.next();
      let tv = third.value;
      if (tv != null) {
        expect(tv[0]).assertEqual(2);
        expect(tv[1]).assertEqual(30n);
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8500
     * @tc.name testBigInt64ArrayWith085
     * @tc.desc Verify with() result preserves the same length as the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.with(1, 99n);
      expect(res.length).assertEqual(4);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(30n);
      expect(res[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8600
     * @tc.name testBigInt64ArrayWith086
     * @tc.desc Verify with() result byteOffset is 0 even when original array has non-zero byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let res = arr.with(1, 99n);
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8700
     * @tc.name testBigInt64ArrayWith087
     * @tc.desc Verify original array is completely unchanged after with() call preserving all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      arr.with(2, 99n);
      expect(arr[0]).assertEqual(11n);
      expect(arr[1]).assertEqual(22n);
      expect(arr[2]).assertEqual(33n);
      expect(arr[3]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8800
     * @tc.name testBigInt64ArrayWith088
     * @tc.desc Verify BigInt64Array.of() result with() produces correct replaced array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n);
      let res = arr.with(1, 99n);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(99n);
      expect(res[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_8900
     * @tc.name testBigInt64ArrayWith089
     * @tc.desc Verify with() on ArrayBuffer-offset-constructed array yields correct element replacement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 4);
      arr[0] = 5n;
      arr[1] = 10n;
      arr[2] = 15n;
      arr[3] = 20n;
      let res = arr.with(2, 99n);
      expect(res[0]).assertEqual(5n);
      expect(res[2]).assertEqual(99n);
      expect(res[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_9000
     * @tc.name testBigInt64ArrayWith090
     * @tc.desc Verify BigInt64Array.from() result with() produces correct replaced array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([5n, 6n, 7n]);
      let res = arr.with(0, 0n);
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(6n);
      expect(res[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_9100
     * @tc.name testBigInt64ArrayWith091
     * @tc.desc Verify with-to-with chain replaces first then last element producing correct result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.with(0, 9n).with(2, 8n);
      expect(res[0]).assertEqual(9n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_9200
     * @tc.name testBigInt64ArrayWith092
     * @tc.desc Verify toSorted() then with() replaces first element of the sorted array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n]);
      let sorted = arr.toSorted();
      let res = sorted.with(0, 5n);
      expect(res[0]).assertEqual(5n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_9300
     * @tc.name testBigInt64ArrayWith093
     * @tc.desc Verify with() result used in for-of iteration yields the replaced value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.with(2, 99n);
      let vals: bigint[] = [];
      for (let v of res) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(1n);
      expect(vals[1]).assertEqual(2n);
      expect(vals[2]).assertEqual(99n);
      expect(vals[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_WITH_9400
     * @tc.name testBigInt64ArrayWith094
     * @tc.desc Verify with() on overflow value returns bigint type; original array unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayWith094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let maxVal: bigint = 9223372036854775807n;
      let overflowVal: bigint = maxVal + maxVal;
      let res = arr.with(0, overflowVal);
      expect(typeof res[0]).assertEqual('bigint');
      expect(res[0]).assertEqual(-2n);
      expect(arr[0]).assertEqual(0n);
    });

  });
}
