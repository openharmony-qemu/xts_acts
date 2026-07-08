'use static'

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

export default function BigInt64ArrayReduce02Test(): void {
  describe('BigInt64ArrayReduce02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0010
     * @tc.name testBigInt64ArrayReduceTwo001
     * @tc.desc Verify reduce returns 0n without invoking the callback for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let called = false;
      let res = arr.reduce((p, c) => {
        called = true;
        return p + c;
      });
      expect(res).assertEqual(0n);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0020
     * @tc.name testBigInt64ArrayReduceTwo002
     * @tc.desc Verify reduce ignores a throwing callback and returns 0n for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.reduce((p, c) => {
        throw new Error('should not call');
      });
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0030
     * @tc.name testBigInt64ArrayReduceTwo003
     * @tc.desc Verify reduce returns 1n without invoking the callback for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let called = false;
      let res = arr.reduce((p, c) => {
        called = true;
        return p + c;
      });
      expect(res).assertEqual(1n);
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0040
     * @tc.name testBigInt64ArrayReduceTwo004
     * @tc.desc Verify reduce ignores a throwing callback and returns 1n for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.reduce((p, c) => {
        throw new Error('should not call');
      });
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0050
     * @tc.name testBigInt64ArrayReduceTwo005
     * @tc.desc Verify reduce throws TypeError for an empty array without an initial value using callback variant 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let caught = false;
      let errorName = '';
      try {
        arr.reduce((p, c) => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0060
     * @tc.name testBigInt64ArrayReduceTwo006
     * @tc.desc Verify reduce adds the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(0n + 0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0070
     * @tc.name testBigInt64ArrayReduceTwo007
     * @tc.desc Verify reduce subtracts the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(0n - 0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0080
     * @tc.name testBigInt64ArrayReduceTwo008
     * @tc.desc Verify reduce multiplies the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(0n * 0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0090
     * @tc.name testBigInt64ArrayReduceTwo009
     * @tc.desc Verify reduce returns the previous value for the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0100
     * @tc.name testBigInt64ArrayReduceTwo010
     * @tc.desc Verify reduce returns the current value for the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0110
     * @tc.name testBigInt64ArrayReduceTwo011
     * @tc.desc Verify reduce adds the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(1n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0120
     * @tc.name testBigInt64ArrayReduceTwo012
     * @tc.desc Verify reduce subtracts the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(1n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0130
     * @tc.name testBigInt64ArrayReduceTwo013
     * @tc.desc Verify reduce multiplies the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(1n * 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0140
     * @tc.name testBigInt64ArrayReduceTwo014
     * @tc.desc Verify reduce returns the previous value for the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0150
     * @tc.name testBigInt64ArrayReduceTwo015
     * @tc.desc Verify reduce returns the current value for the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0160
     * @tc.name testBigInt64ArrayReduceTwo016
     * @tc.desc Verify reduce adds the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(-1n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0170
     * @tc.name testBigInt64ArrayReduceTwo017
     * @tc.desc Verify reduce subtracts the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(-1n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0180
     * @tc.name testBigInt64ArrayReduceTwo018
     * @tc.desc Verify reduce multiplies the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(-1n * 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0190
     * @tc.name testBigInt64ArrayReduceTwo019
     * @tc.desc Verify reduce returns the previous value for the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0200
     * @tc.name testBigInt64ArrayReduceTwo020
     * @tc.desc Verify reduce returns the current value for the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0210
     * @tc.name testBigInt64ArrayReduceTwo021
     * @tc.desc Verify reduce adds the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(1n + -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0220
     * @tc.name testBigInt64ArrayReduceTwo022
     * @tc.desc Verify reduce subtracts the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(1n - -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0230
     * @tc.name testBigInt64ArrayReduceTwo023
     * @tc.desc Verify reduce multiplies the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(1n * -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0240
     * @tc.name testBigInt64ArrayReduceTwo024
     * @tc.desc Verify reduce returns the previous value for the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0250
     * @tc.name testBigInt64ArrayReduceTwo025
     * @tc.desc Verify reduce returns the current value for the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0260
     * @tc.name testBigInt64ArrayReduceTwo026
     * @tc.desc Verify reduce adds the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(100n + 200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0270
     * @tc.name testBigInt64ArrayReduceTwo027
     * @tc.desc Verify reduce subtracts the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(100n - 200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0280
     * @tc.name testBigInt64ArrayReduceTwo028
     * @tc.desc Verify reduce multiplies the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(100n * 200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0290
     * @tc.name testBigInt64ArrayReduceTwo029
     * @tc.desc Verify reduce returns the previous value for the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0300
     * @tc.name testBigInt64ArrayReduceTwo030
     * @tc.desc Verify reduce returns the current value for the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0310
     * @tc.name testBigInt64ArrayReduceTwo031
     * @tc.desc Verify reduce adds the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(-100n + -200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0320
     * @tc.name testBigInt64ArrayReduceTwo032
     * @tc.desc Verify reduce subtracts the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(-100n - -200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0330
     * @tc.name testBigInt64ArrayReduceTwo033
     * @tc.desc Verify reduce multiplies the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(-100n * -200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0340
     * @tc.name testBigInt64ArrayReduceTwo034
     * @tc.desc Verify reduce returns the previous value for the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0350
     * @tc.name testBigInt64ArrayReduceTwo035
     * @tc.desc Verify reduce returns the current value for the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(-200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0360
     * @tc.name testBigInt64ArrayReduceTwo036
     * @tc.desc Verify reduce adds the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(255n + 17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0370
     * @tc.name testBigInt64ArrayReduceTwo037
     * @tc.desc Verify reduce subtracts the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(255n - 17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0380
     * @tc.name testBigInt64ArrayReduceTwo038
     * @tc.desc Verify reduce multiplies the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(255n * 17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0390
     * @tc.name testBigInt64ArrayReduceTwo039
     * @tc.desc Verify reduce returns the previous value for the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0400
     * @tc.name testBigInt64ArrayReduceTwo040
     * @tc.desc Verify reduce returns the current value for the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0410
     * @tc.name testBigInt64ArrayReduceTwo041
     * @tc.desc Verify reduce adds the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(2n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0420
     * @tc.name testBigInt64ArrayReduceTwo042
     * @tc.desc Verify reduce subtracts the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(2n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0430
     * @tc.name testBigInt64ArrayReduceTwo043
     * @tc.desc Verify reduce multiplies the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(2n * 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0440
     * @tc.name testBigInt64ArrayReduceTwo044
     * @tc.desc Verify reduce returns the previous value for the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0450
     * @tc.name testBigInt64ArrayReduceTwo045
     * @tc.desc Verify reduce returns the current value for the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0460
     * @tc.name testBigInt64ArrayReduceTwo046
     * @tc.desc Verify reduce adds the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(9223372036854775806n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0470
     * @tc.name testBigInt64ArrayReduceTwo047
     * @tc.desc Verify reduce subtracts the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(9223372036854775806n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0480
     * @tc.name testBigInt64ArrayReduceTwo048
     * @tc.desc Verify reduce multiplies the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(9223372036854775806n * 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0490
     * @tc.name testBigInt64ArrayReduceTwo049
     * @tc.desc Verify reduce returns the previous value for the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0500
     * @tc.name testBigInt64ArrayReduceTwo050
     * @tc.desc Verify reduce returns the current value for the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0510
     * @tc.name testBigInt64ArrayReduceTwo051
     * @tc.desc Verify reduce adds the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(-9223372036854775807n + -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0520
     * @tc.name testBigInt64ArrayReduceTwo052
     * @tc.desc Verify reduce subtracts the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(-9223372036854775807n - -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0530
     * @tc.name testBigInt64ArrayReduceTwo053
     * @tc.desc Verify reduce multiplies the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(-9223372036854775807n * -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0540
     * @tc.name testBigInt64ArrayReduceTwo054
     * @tc.desc Verify reduce returns the previous value for the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0550
     * @tc.name testBigInt64ArrayReduceTwo055
     * @tc.desc Verify reduce returns the current value for the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0560
     * @tc.name testBigInt64ArrayReduceTwo056
     * @tc.desc Verify reduce adds the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(42n + 42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0570
     * @tc.name testBigInt64ArrayReduceTwo057
     * @tc.desc Verify reduce subtracts the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(42n - 42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0580
     * @tc.name testBigInt64ArrayReduceTwo058
     * @tc.desc Verify reduce multiplies the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(42n * 42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0590
     * @tc.name testBigInt64ArrayReduceTwo059
     * @tc.desc Verify reduce returns the previous value for the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0600
     * @tc.name testBigInt64ArrayReduceTwo060
     * @tc.desc Verify reduce returns the current value for the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0610
     * @tc.name testBigInt64ArrayReduceTwo061
     * @tc.desc Verify reduce adds the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(500n + -500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0620
     * @tc.name testBigInt64ArrayReduceTwo062
     * @tc.desc Verify reduce subtracts the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(500n - -500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0630
     * @tc.name testBigInt64ArrayReduceTwo063
     * @tc.desc Verify reduce multiplies the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(500n * -500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0640
     * @tc.name testBigInt64ArrayReduceTwo064
     * @tc.desc Verify reduce returns the previous value for the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0650
     * @tc.name testBigInt64ArrayReduceTwo065
     * @tc.desc Verify reduce returns the current value for the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(-500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0660
     * @tc.name testBigInt64ArrayReduceTwo066
     * @tc.desc Verify reduce passes currentIndex values in scenario 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 1n]);
      let sumIndex = 0n;
      arr.reduce((p, c, currentIndex) => {
        sumIndex += BigInt(currentIndex);
        return p;
      });
      expect(sumIndex).assertEqual(1n + 2n + 3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0670
     * @tc.name testBigInt64ArrayReduceTwo067
     * @tc.desc Verify reduce passes the original array instance in scenario 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 1n]);
      let sameArray = true;
      arr.reduce((p, c, currentIndex, arrayArg) => {
        sameArray = sameArray && (arrayArg === arr);
        return p;
      });
      expect(sameArray).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0680
     * @tc.name testBigInt64ArrayReduceTwo068
     * @tc.desc Verify reduce propagates a custom error thrown when iteration reaches index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n]);
      let loops = 0;
      let caught = false;
      let errorMessage = '';
      try {
        arr.reduce((p, c, currentIndex) => {
          loops++;
          if (currentIndex === 1) {
            throw new Error('idx err');
            expect().assertFail();
          }
          return p + c;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(loops).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0690
     * @tc.name testBigInt64ArrayReduceTwo069
     * @tc.desc Verify reduce propagates a custom error thrown when iteration reaches index 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n]);
      let loops = 0;
      let caught = false;
      let errorMessage = '';
      try {
        arr.reduce((p, c, currentIndex) => {
          loops++;
          if (currentIndex === 10) {
            throw new Error('idx err');
            expect().assertFail();
          }
          return p + c;
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(loops).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0700
     * @tc.name testBigInt64ArrayReduceTwo070
     * @tc.desc Verify reduce observes in-loop array mutation during side-effect variant 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n, 8n]);
      let res = arr.reduce((p, c, currentIndex) => {
        if (currentIndex === 1) {
          arr.$_set(2, 1n);
        }
        return p + c;
      });
      expect(res).assertEqual(2n + 4n + 1n + 8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0710
     * @tc.name testBigInt64ArrayReduceTwo071
     * @tc.desc Verify reduce records accumulator flow in external state for trace variant 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let trace = 0n;
      arr.reduce((p, c) => {
        trace += p + c;
        return c;
      });
      expect(trace).assertEqual((1n + 2n) + (2n + 3n));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0720
     * @tc.name testBigInt64ArrayReduceTwo072
     * @tc.desc Verify reduce computes the chained bigint bitwise xor result for variant 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 7n, 15n, BigInt(0)]);
      let res = arr.reduce((p, c) => p ^ c);
      expect(res).assertEqual(1n ^ 3n ^ 7n ^ 15n ^ BigInt(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0730
     * @tc.name testBigInt64ArrayReduceTwo073
     * @tc.desc Verify reduce returns a bigint result and preserves the original two-element array for variant 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let res = arr.reduce((p, c) => p * c);
      expect(typeof res).assertEqual('bigint');
      expect(arr.$_get(0)).assertEqual(1n);
      expect(arr.$_get(1)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0740
     * @tc.name testBigInt64ArrayReduceTwo074
     * @tc.desc Verify reduce correctly sums 1000 consecutive integers starting from 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, BigInt(i + 1));
      }
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(500500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0750
     * @tc.name testBigInt64ArrayReduceTwo075
     * @tc.desc Verify reduce correctly sums 1000 elements of constant value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, 1n);
      }
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(1000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0760
     * @tc.name testBigInt64ArrayReduceTwo076
     * @tc.desc Verify reduce correctly counts non-zero elements in a 500-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(500);
      for (let i = 0; i < 500; i++) {
        arr.$_set(i, BigInt(i % 3 === 0 ? 1 : 0));
      }
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(167n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0770
     * @tc.name testBigInt64ArrayReduceTwo077
     * @tc.desc Verify reduce correctly processes a 100-element array with alternating signs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr.$_set(i, i % 2 === 0 ? BigInt(i + 1) : BigInt(-(i + 1)));
      }
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(-50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0780
     * @tc.name testBigInt64ArrayReduceTwo078
     * @tc.desc Verify reduce calls the callback for a single-element array when initialValue is provided.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let called = false;
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        called = true;
        return acc + curr;
      }, 10n);
      expect(res).assertEqual(15n);
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0790
     * @tc.name testBigInt64ArrayReduceTwo079
     * @tc.desc Verify reduce with single element and initialValue of 0n passes the element as currentValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let capturedCurr: BigInt = 0n;
      arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        capturedCurr = curr;
        return acc + curr;
      }, 0n);
      expect(capturedCurr).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0800
     * @tc.name testBigInt64ArrayReduceTwo080
     * @tc.desc Verify reduce with single element and initialValue passes index 0 to the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n]);
      let capturedIdx: int = -1;
      arr.reduce((acc: BigInt, curr: BigInt, idx: int): BigInt => {
        capturedIdx = idx;
        return acc + curr;
      }, 0n);
      expect(capturedIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0810
     * @tc.name testBigInt64ArrayReduceTwo081
     * @tc.desc Verify reduce with single element and initialValue passes the array reference as fourth argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n]);
      let arrRef: BigInt64Array | undefined = undefined;
      arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
        arrRef = a;
        return acc + curr;
      }, 0n);
      expect(arrRef!.$_get(0)).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0820
     * @tc.name testBigInt64ArrayReduceTwo082
     * @tc.desc Verify reduce callback receives correct sequential index values for a five-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let indices: int[] = [];
      arr.reduce((acc: BigInt, curr: BigInt, idx: int): BigInt => {
        indices.push(idx);
        return acc + curr;
      }, 0n);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
      expect(indices[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0830
     * @tc.name testBigInt64ArrayReduceTwo083
     * @tc.desc Verify reduce callback receives the same array reference as the source in each call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let same: boolean = true;
      arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
        if (a !== arr) same = false;
        return acc + curr;
      }, 0n);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0840
     * @tc.name testBigInt64ArrayReduceTwo084
     * @tc.desc Verify reduce callback accumulator reflects the running result across iterations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let accValues: BigInt[] = [];
      arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        accValues.push(acc);
        return acc + curr;
      }, 0n);
      expect(accValues[0]).assertEqual(0n);
      expect(accValues[1]).assertEqual(1n);
      expect(accValues[2]).assertEqual(3n);
      expect(accValues[3]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0850
     * @tc.name testBigInt64ArrayReduceTwo085
     * @tc.desc Verify reduce callback currentValue matches the array element at each index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      let currValues: BigInt[] = [];
      arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        currValues.push(curr);
        return acc + curr;
      }, 0n);
      expect(currValues[0]).assertEqual(5n);
      expect(currValues[1]).assertEqual(15n);
      expect(currValues[2]).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0860
     * @tc.name testBigInt64ArrayReduceTwo086
     * @tc.desc Verify reduce without initialValue uses first element as initial accumulator and starts iteration from index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let firstAcc: BigInt = 0n;
      let firstIdx: int = -1;
      arr.reduce((acc: BigInt, curr: BigInt, idx: int): BigInt => {
        if (idx === 1) {
          firstAcc = acc;
          firstIdx = idx;
        }
        return acc + curr;
      });
      expect(firstAcc).assertEqual(100n);
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0870
     * @tc.name testBigInt64ArrayReduceTwo087
     * @tc.desc Verify reduce with initialValue starts iteration from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let firstIdx: int = -1;
      arr.reduce((acc: BigInt, curr: BigInt, idx: int): BigInt => {
        if (idx === 0) firstIdx = idx;
        return acc + curr;
      }, 0n);
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0880
     * @tc.name testBigInt64ArrayReduceTwo088
     * @tc.desc Verify reduce correctly adds MAX_INT64 and MIN_INT64 producing -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0890
     * @tc.name testBigInt64ArrayReduceTwo089
     * @tc.desc Verify reduce correctly accumulates MAX_INT64 with 0n producing MAX_INT64.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0900
     * @tc.name testBigInt64ArrayReduceTwo090
     * @tc.desc Verify reduce correctly accumulates MIN_INT64 with 0n producing MIN_INT64.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 0n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(res).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0910
     * @tc.name testBigInt64ArrayReduceTwo091
     * @tc.desc Verify reduce with MAX_INT64 subtraction returns 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc - curr;
      });
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0920
     * @tc.name testBigInt64ArrayReduceTwo092
     * @tc.desc Verify reduce with MAX_INT64 bitwise AND with itself returns MAX_INT64.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc & curr;
      });
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0930
     * @tc.name testBigInt64ArrayReduceTwo093
     * @tc.desc Verify reduce with MIN_INT64 and MAX_INT64 bitwise OR produces -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc | curr;
      });
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0940
     * @tc.name testBigInt64ArrayReduceTwo094
     * @tc.desc Verify reduce works correctly on a filled array created with fill().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(7n);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0950
     * @tc.name testBigInt64ArrayReduceTwo095
     * @tc.desc Verify reduce works correctly on a reversed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let rev = arr.reverse();
      let res = rev.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc * 10n + curr;
      }, 0n);
      expect(res).assertEqual(4321n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0960
     * @tc.name testBigInt64ArrayReduceTwo096
     * @tc.desc Verify reduce works correctly after copyWithin operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 3);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(18n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0970
     * @tc.name testBigInt64ArrayReduceTwo097
     * @tc.desc Verify reduce works correctly after a sort operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 10n, 40n, 20n, 30n]);
      let srt = arr.sort((a: BigInt, b: BigInt): int => {
        if (a < b) return -1;
        if (a > b) return 1;
        return 0;
      });
      let res = srt.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(150n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0980
     * @tc.name testBigInt64ArrayReduceTwo098
     * @tc.desc Verify reduce on a subarray view correctly accumulates only the visible elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      full[0] = 1n; full[1] = 2n; full[2] = 3n; full[3] = 4n; full[4] = 5n;
      let sub = full.subarray(1, 4);
      let res = sub.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0990
     * @tc.name testBigInt64ArrayReduceTwo099
     * @tc.desc Verify reduce on a source array reflects mutations made to the shared buffer via a subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf);
      arr[0] = 10n; arr[1] = 20n; arr[2] = 30n;
      let sub = arr.subarray(0, 3);
      arr[1] = 50n;
      let res = sub.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(90n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1000
     * @tc.name testBigInt64ArrayReduceTwo100
     * @tc.desc Verify reduce on a subarray with initialValue correctly starts from the provided value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let sub = arr.subarray(1, 4);
      let res = sub.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc * curr;
      }, 1n);
      expect(res).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1010
     * @tc.name testBigInt64ArrayReduceTwo101
     * @tc.desc Verify reduce with string accumulator concatenates bigint values as decimal strings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.reduce((acc: string, curr: BigInt): string => {
        return acc + curr.toString();
      }, "");
      expect(res).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1020
     * @tc.name testBigInt64ArrayReduceTwo102
     * @tc.desc Verify reduce with string accumulator works with a prefix initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.reduce((acc: string, curr: BigInt): string => {
        return acc + "," + curr.toString();
      }, "vals");
      expect(res).assertEqual("vals,10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1030
     * @tc.name testBigInt64ArrayReduceTwo103
     * @tc.desc Verify reduce with number accumulator sums up bigint values converted to number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.reduce((acc: number, curr: BigInt): number => {
        return acc + Number(curr);
      }, 0);
      expect(res).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1040
     * @tc.name testBigInt64ArrayReduceTwo104
     * @tc.desc Verify reduce with boolean accumulator using OR detects any non-zero element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 1n, 0n]);
      let res = arr.reduce((acc: boolean, curr: BigInt): boolean => {
        return acc || (curr !== 0n);
      }, false);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1050
     * @tc.name testBigInt64ArrayReduceTwo105
     * @tc.desc Verify reduce with boolean accumulator using AND detects all non-zero elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.reduce((acc: boolean, curr: BigInt): boolean => {
        return acc && (curr !== 0n);
      }, true);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1060
     * @tc.name testBigInt64ArrayReduceTwo106
     * @tc.desc Verify reduce with boolean accumulator using AND returns false for array containing zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 0n, 3n]);
      let res = arr.reduce((acc: boolean, curr: BigInt): boolean => {
        return acc && (curr !== 0n);
      }, true);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1070
     * @tc.name testBigInt64ArrayReduceTwo107
     * @tc.desc Verify reduce can find the minimum value in an array using conditional logic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 20n, 80n, 10n, 40n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc < curr ? acc : curr;
      });
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1080
     * @tc.name testBigInt64ArrayReduceTwo108
     * @tc.desc Verify reduce can find the maximum value in an array using conditional logic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 20n, 80n, 10n, 40n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc > curr ? acc : curr;
      });
      expect(res).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1090
     * @tc.name testBigInt64ArrayReduceTwo109
     * @tc.desc Verify reduce propagates an error thrown at the first iteration when initialValue is provided.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
          throw new Error("cb_error");
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1100
     * @tc.name testBigInt64ArrayReduceTwo110
     * @tc.desc Verify reduce propagates an error thrown at a mid-iteration based on current value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, -99n, 4n]);
      try {
        arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
          if (curr < -50n) throw new Error("negative_overflow");
          return acc + curr;
        }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

      expect(typeof res).assertEqual('bigint');
    });

  });
}
