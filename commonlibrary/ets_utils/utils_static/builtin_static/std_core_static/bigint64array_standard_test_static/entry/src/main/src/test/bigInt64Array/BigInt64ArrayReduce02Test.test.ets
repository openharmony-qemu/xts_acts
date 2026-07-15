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
     * @tc.name testBigInt64ArrayReduceTwo0010
     * @tc.desc Verify reduce returns 0n without invoking the callback for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0020
     * @tc.desc Verify reduce ignores a throwing callback and returns 0n for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.reduce((p, c) => {
        throw new Error('should not call');
      });
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0030
     * @tc.name testBigInt64ArrayReduceTwo0030
     * @tc.desc Verify reduce returns 1n without invoking the callback for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0040
     * @tc.desc Verify reduce ignores a throwing callback and returns 1n for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.reduce((p, c) => {
        throw new Error('should not call');
      });
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0050
     * @tc.name testBigInt64ArrayReduceTwo0050
     * @tc.desc Verify reduce throws TypeError for an empty array without an initial value using callback variant 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      try {
        arr.reduce((p, c) => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0060
     * @tc.name testBigInt64ArrayReduceTwo0060
     * @tc.desc Verify reduce adds the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(0n + 0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0070
     * @tc.name testBigInt64ArrayReduceTwo0070
     * @tc.desc Verify reduce subtracts the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(0n - 0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0080
     * @tc.name testBigInt64ArrayReduceTwo0080
     * @tc.desc Verify reduce multiplies the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(0n * 0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0090
     * @tc.name testBigInt64ArrayReduceTwo0090
     * @tc.desc Verify reduce returns the previous value for the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0100
     * @tc.name testBigInt64ArrayReduceTwo0100
     * @tc.desc Verify reduce returns the current value for the two-element array [0n, 0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0110
     * @tc.name testBigInt64ArrayReduceTwo0110
     * @tc.desc Verify reduce adds the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(1n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0120
     * @tc.name testBigInt64ArrayReduceTwo0120
     * @tc.desc Verify reduce subtracts the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(1n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0130
     * @tc.name testBigInt64ArrayReduceTwo0130
     * @tc.desc Verify reduce multiplies the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(1n * 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0140
     * @tc.name testBigInt64ArrayReduceTwo0140
     * @tc.desc Verify reduce returns the previous value for the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0150
     * @tc.name testBigInt64ArrayReduceTwo0150
     * @tc.desc Verify reduce returns the current value for the two-element array [1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0160
     * @tc.name testBigInt64ArrayReduceTwo0160
     * @tc.desc Verify reduce adds the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(-1n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0170
     * @tc.name testBigInt64ArrayReduceTwo0170
     * @tc.desc Verify reduce subtracts the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(-1n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0180
     * @tc.name testBigInt64ArrayReduceTwo0180
     * @tc.desc Verify reduce multiplies the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(-1n * 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0190
     * @tc.name testBigInt64ArrayReduceTwo0190
     * @tc.desc Verify reduce returns the previous value for the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0200
     * @tc.name testBigInt64ArrayReduceTwo0200
     * @tc.desc Verify reduce returns the current value for the two-element array [-1n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0210
     * @tc.name testBigInt64ArrayReduceTwo0210
     * @tc.desc Verify reduce adds the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(1n + -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0220
     * @tc.name testBigInt64ArrayReduceTwo0220
     * @tc.desc Verify reduce subtracts the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(1n - -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0230
     * @tc.name testBigInt64ArrayReduceTwo0230
     * @tc.desc Verify reduce multiplies the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(1n * -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0240
     * @tc.name testBigInt64ArrayReduceTwo0240
     * @tc.desc Verify reduce returns the previous value for the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0250
     * @tc.name testBigInt64ArrayReduceTwo0250
     * @tc.desc Verify reduce returns the current value for the two-element array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0260
     * @tc.name testBigInt64ArrayReduceTwo0260
     * @tc.desc Verify reduce adds the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(100n + 200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0270
     * @tc.name testBigInt64ArrayReduceTwo0270
     * @tc.desc Verify reduce subtracts the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(100n - 200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0280
     * @tc.name testBigInt64ArrayReduceTwo0280
     * @tc.desc Verify reduce multiplies the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(100n * 200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0290
     * @tc.name testBigInt64ArrayReduceTwo0290
     * @tc.desc Verify reduce returns the previous value for the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0300
     * @tc.name testBigInt64ArrayReduceTwo0300
     * @tc.desc Verify reduce returns the current value for the two-element array [100n, 200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0310
     * @tc.name testBigInt64ArrayReduceTwo0310
     * @tc.desc Verify reduce adds the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(-100n + -200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0320
     * @tc.name testBigInt64ArrayReduceTwo0320
     * @tc.desc Verify reduce subtracts the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(-100n - -200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0330
     * @tc.name testBigInt64ArrayReduceTwo0330
     * @tc.desc Verify reduce multiplies the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(-100n * -200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0340
     * @tc.name testBigInt64ArrayReduceTwo0340
     * @tc.desc Verify reduce returns the previous value for the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0350
     * @tc.name testBigInt64ArrayReduceTwo0350
     * @tc.desc Verify reduce returns the current value for the two-element array [-100n, -200n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -200n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(-200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0360
     * @tc.name testBigInt64ArrayReduceTwo0360
     * @tc.desc Verify reduce adds the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(255n + 17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0370
     * @tc.name testBigInt64ArrayReduceTwo0370
     * @tc.desc Verify reduce subtracts the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(255n - 17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0380
     * @tc.name testBigInt64ArrayReduceTwo0380
     * @tc.desc Verify reduce multiplies the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(255n * 17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0390
     * @tc.name testBigInt64ArrayReduceTwo0390
     * @tc.desc Verify reduce returns the previous value for the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0400
     * @tc.name testBigInt64ArrayReduceTwo0400
     * @tc.desc Verify reduce returns the current value for the two-element array [255n, 17n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 17n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0410
     * @tc.name testBigInt64ArrayReduceTwo0410
     * @tc.desc Verify reduce adds the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(2n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0420
     * @tc.name testBigInt64ArrayReduceTwo0420
     * @tc.desc Verify reduce subtracts the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(2n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0430
     * @tc.name testBigInt64ArrayReduceTwo0430
     * @tc.desc Verify reduce multiplies the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(2n * 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0440
     * @tc.name testBigInt64ArrayReduceTwo0440
     * @tc.desc Verify reduce returns the previous value for the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0450
     * @tc.name testBigInt64ArrayReduceTwo0450
     * @tc.desc Verify reduce returns the current value for the two-element array [2n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0460
     * @tc.name testBigInt64ArrayReduceTwo0460
     * @tc.desc Verify reduce adds the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(9223372036854775806n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0470
     * @tc.name testBigInt64ArrayReduceTwo0470
     * @tc.desc Verify reduce subtracts the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(9223372036854775806n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0480
     * @tc.name testBigInt64ArrayReduceTwo0480
     * @tc.desc Verify reduce multiplies the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(9223372036854775806n * 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0490
     * @tc.name testBigInt64ArrayReduceTwo0490
     * @tc.desc Verify reduce returns the previous value for the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0500
     * @tc.name testBigInt64ArrayReduceTwo0500
     * @tc.desc Verify reduce returns the current value for the two-element array [9223372036854775806n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0510
     * @tc.name testBigInt64ArrayReduceTwo0510
     * @tc.desc Verify reduce adds the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(-9223372036854775807n + -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0520
     * @tc.name testBigInt64ArrayReduceTwo0520
     * @tc.desc Verify reduce subtracts the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(-9223372036854775807n - -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0530
     * @tc.name testBigInt64ArrayReduceTwo0530
     * @tc.desc Verify reduce multiplies the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(-9223372036854775807n * -1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0540
     * @tc.name testBigInt64ArrayReduceTwo0540
     * @tc.desc Verify reduce returns the previous value for the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0550
     * @tc.name testBigInt64ArrayReduceTwo0550
     * @tc.desc Verify reduce returns the current value for the two-element array [-9223372036854775807n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -1n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0560
     * @tc.name testBigInt64ArrayReduceTwo0560
     * @tc.desc Verify reduce adds the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(42n + 42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0570
     * @tc.name testBigInt64ArrayReduceTwo0570
     * @tc.desc Verify reduce subtracts the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(42n - 42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0580
     * @tc.name testBigInt64ArrayReduceTwo0580
     * @tc.desc Verify reduce multiplies the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(42n * 42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0590
     * @tc.name testBigInt64ArrayReduceTwo0590
     * @tc.desc Verify reduce returns the previous value for the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0600
     * @tc.name testBigInt64ArrayReduceTwo0600
     * @tc.desc Verify reduce returns the current value for the two-element array [42n, 42n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 42n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0610
     * @tc.name testBigInt64ArrayReduceTwo0610
     * @tc.desc Verify reduce adds the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => p + c);
      expect(res).assertEqual(500n + -500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0620
     * @tc.name testBigInt64ArrayReduceTwo0620
     * @tc.desc Verify reduce subtracts the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => p - c);
      expect(res).assertEqual(500n - -500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0630
     * @tc.name testBigInt64ArrayReduceTwo0630
     * @tc.desc Verify reduce multiplies the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => p * c);
      expect(res).assertEqual(500n * -500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0640
     * @tc.name testBigInt64ArrayReduceTwo0640
     * @tc.desc Verify reduce returns the previous value for the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => p);
      expect(res).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0650
     * @tc.name testBigInt64ArrayReduceTwo0650
     * @tc.desc Verify reduce returns the current value for the two-element array [500n, -500n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, -500n]);
      let res = arr.reduce((p, c) => c);
      expect(res).assertEqual(-500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0660
     * @tc.name testBigInt64ArrayReduceTwo0660
     * @tc.desc Verify reduce passes currentIndex values in scenario 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0670
     * @tc.desc Verify reduce passes the original array instance in scenario 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0680
     * @tc.desc Verify reduce propagates a custom error thrown when iteration reaches index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n]);
      let loops = 0;
      try {
        arr.reduce((p, c, currentIndex) => {
          loops++;
          if (currentIndex === 1) {
            throw new Error('idx err');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(loops).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0690
     * @tc.name testBigInt64ArrayReduceTwo0690
     * @tc.desc Verify reduce propagates a custom error thrown when iteration reaches index 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n, 11n, 12n]);
      let loops = 0;
      try {
        arr.reduce((p, c, currentIndex) => {
          loops++;
          if (currentIndex === 10) {
            throw new Error('idx err');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(loops).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0700
     * @tc.name testBigInt64ArrayReduceTwo0700
     * @tc.desc Verify reduce observes in-loop array mutation during side-effect variant 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0710
     * @tc.desc Verify reduce records accumulator flow in external state for trace variant 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0720
     * @tc.desc Verify reduce computes the chained bigint bitwise xor result for variant 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 7n, 15n, BigInt(0)]);
      let res = arr.reduce((p, c) => p ^ c);
      expect(res).assertEqual(1n ^ 3n ^ 7n ^ 15n ^ BigInt(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0730
     * @tc.name testBigInt64ArrayReduceTwo0730
     * @tc.desc Verify reduce returns a bigint result and preserves the original two-element array for variant 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let res = arr.reduce((p, c) => p * c);
      expect(typeof res).assertEqual('bigint');
      expect(arr.$_get(0)).assertEqual(1n);
      expect(arr.$_get(1)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0740
     * @tc.name testBigInt64ArrayReduceTwo0740
     * @tc.desc Verify reduce combines currentIndex and array argument in a weighted sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n, 5n, 6n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
        return acc + curr * BigInt(idx) + a[0];
      }, 0n);
      expect(res).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0750
     * @tc.name testBigInt64ArrayReduceTwo0750
     * @tc.desc Verify reduce correctly sums 1000 elements of constant value 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0760
     * @tc.desc Verify reduce correctly counts non-zero elements in a 500-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0770
     * @tc.desc Verify reduce correctly processes a 100-element array with alternating signs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0780
     * @tc.desc Verify reduce calls the callback for a single-element array when initialValue is provided.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0790
     * @tc.desc Verify reduce with single element and initialValue of 0n passes the element as currentValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0800
     * @tc.desc Verify reduce with single element and initialValue passes index 0 to the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0810
     * @tc.desc Verify reduce with single element and initialValue passes the array reference as fourth argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0820
     * @tc.desc Verify reduce callback receives correct sequential index values for a five-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0830
     * @tc.desc Verify reduce callback receives the same array reference as the source in each call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0840
     * @tc.desc Verify reduce callback accumulator reflects the running result across iterations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0850
     * @tc.desc Verify reduce callback currentValue matches the array element at each index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0860
     * @tc.desc Verify reduce without initialValue uses first element as initial accumulator
     * and starts iteration from index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0870
     * @tc.desc Verify reduce with initialValue starts iteration from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0880
     * @tc.desc Verify reduce correctly adds MAX_INT64 and MIN_INT64 producing -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0890
     * @tc.name testBigInt64ArrayReduceTwo0890
     * @tc.desc Verify reduce correctly accumulates MAX_INT64 with 0n producing MAX_INT64.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0900
     * @tc.name testBigInt64ArrayReduceTwo0900
     * @tc.desc Verify reduce correctly accumulates MIN_INT64 with 0n producing MIN_INT64.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 0n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(res).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0910
     * @tc.name testBigInt64ArrayReduceTwo0910
     * @tc.desc Verify reduce with MAX_INT64 subtraction returns 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc - curr;
      });
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0920
     * @tc.name testBigInt64ArrayReduceTwo0920
     * @tc.desc Verify reduce with MAX_INT64 bitwise AND with itself returns MAX_INT64.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc & curr;
      });
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0930
     * @tc.name testBigInt64ArrayReduceTwo0930
     * @tc.desc Verify reduce with MIN_INT64 and MAX_INT64 bitwise OR produces -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc | curr;
      });
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0940
     * @tc.name testBigInt64ArrayReduceTwo0940
     * @tc.desc Verify reduce works correctly on a filled array created with fill().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(7n);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0950
     * @tc.name testBigInt64ArrayReduceTwo0950
     * @tc.desc Verify reduce works correctly on a reversed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let rev = arr.reverse();
      let res = rev.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc * 10n + curr;
      }, 0n);
      expect(res).assertEqual(4321n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0960
     * @tc.name testBigInt64ArrayReduceTwo0960
     * @tc.desc Verify reduce works correctly after copyWithin operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 3);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_0970
     * @tc.name testBigInt64ArrayReduceTwo0970
     * @tc.desc Verify reduce works correctly after a sort operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0980
     * @tc.desc Verify reduce on a subarray view correctly accumulates only the visible elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo0990
     * @tc.desc Verify reduce on a source array reflects mutations made to the shared buffer via a subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo1000
     * @tc.desc Verify reduce on a subarray with initialValue correctly starts from the provided value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let sub = arr.subarray(1, 4);
      let res = sub.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc * curr;
      }, 1n);
      expect(res).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1010
     * @tc.name testBigInt64ArrayReduceTwo1010
     * @tc.desc Verify reduce with string accumulator concatenates bigint values as decimal strings.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.reduce((acc: string, curr: BigInt): string => {
        return acc + curr.toString();
      }, "");
      expect(res).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1020
     * @tc.name testBigInt64ArrayReduceTwo1020
     * @tc.desc Verify reduce with string accumulator works with a prefix initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.reduce((acc: string, curr: BigInt): string => {
        return acc + "," + curr.toString();
      }, "vals");
      expect(res).assertEqual("vals,10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1030
     * @tc.name testBigInt64ArrayReduceTwo1030
     * @tc.desc Verify reduce with number accumulator sums up bigint values converted to number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.reduce((acc: number, curr: BigInt): number => {
        return acc + Number(curr);
      }, 0);
      expect(res).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1040
     * @tc.name testBigInt64ArrayReduceTwo1040
     * @tc.desc Verify reduce with boolean accumulator using OR detects any non-zero element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 1n, 0n]);
      let res = arr.reduce((acc: boolean, curr: BigInt): boolean => {
        return acc || (curr !== 0n);
      }, false);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1050
     * @tc.name testBigInt64ArrayReduceTwo1050
     * @tc.desc Verify reduce with boolean accumulator using AND detects all non-zero elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.reduce((acc: boolean, curr: BigInt): boolean => {
        return acc && (curr !== 0n);
      }, true);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1060
     * @tc.name testBigInt64ArrayReduceTwo1060
     * @tc.desc Verify reduce with boolean accumulator using AND returns false for array containing zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 0n, 3n]);
      let res = arr.reduce((acc: boolean, curr: BigInt): boolean => {
        return acc && (curr !== 0n);
      }, true);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1070
     * @tc.name testBigInt64ArrayReduceTwo1070
     * @tc.desc Verify reduce can find the minimum value in an array using conditional logic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 20n, 80n, 10n, 40n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc < curr ? acc : curr;
      });
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1080
     * @tc.name testBigInt64ArrayReduceTwo1080
     * @tc.desc Verify reduce can find the maximum value in an array using conditional logic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 20n, 80n, 10n, 40n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc > curr ? acc : curr;
      });
      expect(res).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1090
     * @tc.name testBigInt64ArrayReduceTwo1090
     * @tc.desc Verify reduce propagates an error thrown at the first iteration when initialValue is provided.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceTwo1100
     * @tc.desc Verify reduce propagates an error thrown at a mid-iteration based on current value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1110
     * @tc.name testBigInt64ArrayReduceTwo1110
     * @tc.desc Verify reduce with mixed positive and negative values correctly sums to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, -5n, 3n, -8n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1120
     * @tc.name testBigInt64ArrayReduceTwo1120
     * @tc.desc Verify reduce with all negative values without initialValue returns the correct sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n, -4n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(res).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1130
     * @tc.name testBigInt64ArrayReduceTwo1130
     * @tc.desc Verify reduce with array containing only zero values returns 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1140
     * @tc.name testBigInt64ArrayReduceTwo1140
     * @tc.desc Verify reduce with modulus operation accumulates the remainder chain.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 30n, 7n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc % curr;
      });
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1150
     * @tc.name testBigInt64ArrayReduceTwo1150
     * @tc.desc Verify reduce with exponentiation operation accumulates correctly from left to right.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 3n, 2n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc ** curr;
      });
      expect(res).assertEqual(64n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1160
     * @tc.name testBigInt64ArrayReduceTwo1160
     * @tc.desc Verify reduce with left shift operation accumulates shift amounts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n, 2n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc << curr;
      }, 1n);
      expect(res).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1170
     * @tc.name testBigInt64ArrayReduceTwo1170
     * @tc.desc Verify reduce with right shift operation accumulates shift amounts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n, 1n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc >> curr;
      }, 256n);
      expect(res).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1180
     * @tc.name testBigInt64ArrayReduceTwo1180
     * @tc.desc Verify reduce with the same value repeated many times sums correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr.$_set(i, 2n);
      }
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1190
     * @tc.name testBigInt64ArrayReduceTwo1190
     * @tc.desc Verify reduce reflects in-loop mutation of a future element via the array reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
        if (idx === 1) a.$_set(3, 99n);
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(105n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1200
     * @tc.name testBigInt64ArrayReduceTwo1200
     * @tc.desc Verify reduce does not revisit an already-processed element mutated in-loop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
        if (idx === 2) a.$_set(0, 99n);
        return acc + curr;
      }, 0n);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1210
     * @tc.name testBigInt64ArrayReduceTwo1210
     * @tc.desc Verify reduce with in-loop mutation of the current element does not affect the current callback value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let captured: BigInt[] = [];
      arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
        captured.push(curr);
        a.$_set(idx, 0n);
        return acc + curr;
      }, 0n);
      expect(captured[0]).assertEqual(10n);
      expect(captured[1]).assertEqual(20n);
      expect(captured[2]).assertEqual(30n);
      expect(arr.$_get(0)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1220
     * @tc.name testBigInt64ArrayReduceTwo1220
     * @tc.desc Verify reduce on a typed array iterates exactly length times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount = 0;
      arr.reduce((acc: BigInt, curr: BigInt, idx: int, a: BigInt64Array): BigInt => {
        callCount++;
        return acc + curr;
      }, 0n);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1230
     * @tc.name testBigInt64ArrayReduceTwo1230
     * @tc.desc Verify reduce on a typed array from ArrayBuffer with offset iterates the correct number of times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let full = new BigInt64Array(buf);
      for (let i = 0; i < 6; i++) full[i] = BigInt(i + 1);
      let view = new BigInt64Array(buf, 16, 3);
      let count = 0;
      let res = view.reduce((acc: BigInt, curr: BigInt): BigInt => {
        count++;
        return acc + curr;
      }, 0n);
      expect(count).assertEqual(3);
      expect(res).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1240
     * @tc.name testBigInt64ArrayReduceTwo1240
     * @tc.desc Verify reduce with an array where all elements are the same value using XOR returns 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n, 7n, 7n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc ^ curr;
      }, 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1250
     * @tc.name testBigInt64ArrayReduceTwo1250
     * @tc.desc Verify reduce with an array of alternating 0n and 1n using bitwise OR returns 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 0n, 1n, 0n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc | curr;
      }, 0n);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1260
     * @tc.name testBigInt64ArrayReduceTwo1260
     * @tc.desc Verify reduce accumulates values exceeding MAX_INT64 resulting in wrap-around via two-element addition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 2n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(res).assertEqual(9223372036854775809n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1270
     * @tc.name testBigInt64ArrayReduceTwo1270
     * @tc.desc Verify reduce correctly computes the product of two large values that fit within int64.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000000n, 2000000n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc * curr;
      });
      expect(res).assertEqual(2000000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1280
     * @tc.name testBigInt64ArrayReduceTwo1280
     * @tc.desc Verify reduce handles shift left beyond 63 bits producing the minimum int64 value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 63n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc << curr;
      });
      expect(res).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1290
     * @tc.name testBigInt64ArrayReduceTwo1290
     * @tc.desc Verify reduce with decrementing accumulator pattern across multiple values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n, 1n, 1n, 1n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc - curr;
      }, 100n);
      expect(res).assertEqual(95n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1300
     * @tc.name testBigInt64ArrayReduceTwo1300
     * @tc.desc Verify reduce with division chain produces the correct integer quotient.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 2n, 2n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc / curr;
      }, 120n);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1310
     * @tc.name testBigInt64ArrayReduceTwo1310
     * @tc.desc Verify reduce does not modify the original array elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 5n, 7n]);
      arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(arr.$_get(0)).assertEqual(3n);
      expect(arr.$_get(1)).assertEqual(5n);
      expect(arr.$_get(2)).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1320
     * @tc.name testBigInt64ArrayReduceTwo1320
     * @tc.desc Verify reduce does not change the length of the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1330
     * @tc.name testBigInt64ArrayReduceTwo1330
     * @tc.desc Verify reduce does not change the byteLength of the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let blBefore = arr.byteLength;
      arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc * curr;
      }, 1n);
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1340
     * @tc.name testBigInt64ArrayReduceTwo1340
     * @tc.desc Verify reduce does not change the byteOffset of the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let boBefore = arr.byteOffset;
      arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(arr.byteOffset).assertEqual(boBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1350
     * @tc.name testBigInt64ArrayReduceTwo1350
     * @tc.desc Verify reduce result is independent of subsequent mutations to the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      arr.$_set(0, 999n);
      arr.$_set(1, 999n);
      arr.$_set(2, 999n);
      expect(res).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1360
     * @tc.name testBigInt64ArrayReduceTwo1360
     * @tc.desc Verify multiple reduce calls on the same array produce the same result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let r1 = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      let r2 = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      }, 0n);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_TWO_1370
     * @tc.name testBigInt64ArrayReduceTwo1370
     * @tc.desc Verify reduce typeof result is bigint for bigint accumulator operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceTwo1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.reduce((acc: BigInt, curr: BigInt): BigInt => {
        return acc + curr;
      });
      expect(typeof res).assertEqual('bigint');
    });

  });
}
