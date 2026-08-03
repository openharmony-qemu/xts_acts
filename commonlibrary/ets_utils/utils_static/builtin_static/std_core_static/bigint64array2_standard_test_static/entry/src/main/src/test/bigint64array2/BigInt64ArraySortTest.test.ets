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

const BIGINT64_MAX = 9223372036854775807n;
const BIGINT64_MIN = -9223372036854775808n;
const BYTE_OFFSET_ONE = 8;

function compareAsc(a: bigint, b: bigint): bigint {
  if (a > b) {
    return 1n;
  }
  if (a < b) {
    return -1n;
  }
  return 0n;
}

function compareDesc(a: bigint, b: bigint): bigint {
  if (a > b) {
    return -1n;
  }
  if (a < b) {
    return 1n;
  }
  return 0n;
}

export default function BigInt64ArraySortTest(): void {
  describe('BigInt64ArraySortTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0100
     * @tc.name testBigInt64ArraySort001
     * @tc.desc Verify default sort returns ascending numeric order for positive values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n]);
      let res = arr.sort();
      expect(res.at(0)).assertEqual(2n);
      expect(res.at(1)).assertEqual(5n);
      expect(res.at(2)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0200
     * @tc.name testBigInt64ArraySort002
     * @tc.desc Verify sort with compareAsc returns ascending numeric order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n]);
      let res = arr.sort(compareAsc);
      expect(res.at(0)).assertEqual(2n);
      expect(res.at(1)).assertEqual(5n);
      expect(res.at(2)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0300
     * @tc.name testBigInt64ArraySort003
     * @tc.desc Verify default sort orders mixed negative and positive values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -5n, 3n, -1n]);
      let res = arr.sort();
      expect(res.at(0)).assertEqual(-5n);
      expect(res.at(1)).assertEqual(-1n);
      expect(res.at(2)).assertEqual(0n);
      expect(res.at(3)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0400
     * @tc.name testBigInt64ArraySort004
     * @tc.desc Verify sort with compareDesc returns descending numeric order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n]);
      let res = arr.sort(compareDesc);
      expect(res.at(0)).assertEqual(8n);
      expect(res.at(1)).assertEqual(5n);
      expect(res.at(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0500
     * @tc.name testBigInt64ArraySort005
     * @tc.desc Verify sort orders MAX with smaller values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MAX, 1n, 0n]);
      let res = arr.sort();
      expect(res.at(0)).assertEqual(0n);
      expect(res.at(1)).assertEqual(1n);
      expect(res.at(2)).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0600
     * @tc.name testBigInt64ArraySort006
     * @tc.desc Verify sort orders MIN with larger values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MIN, 1n, 0n]);
      let res = arr.sort();
      expect(res.at(0)).assertEqual(BIGINT64_MIN);
      expect(res.at(1)).assertEqual(0n);
      expect(res.at(2)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0700
     * @tc.name testBigInt64ArraySort007
     * @tc.desc Verify sort orders MAX, MIN, and 0n together correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN, 0n]);
      let res = arr.sort();
      expect(res.at(0)).assertEqual(BIGINT64_MIN);
      expect(res.at(1)).assertEqual(0n);
      expect(res.at(2)).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0800
     * @tc.name testBigInt64ArraySort008
     * @tc.desc Verify sort on an empty array returns array where OOB access throws RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.sort();
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_0900
     * @tc.name testBigInt64ArraySort009
     * @tc.desc Verify sort on a single-element array preserves the element and length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.sort();
      expect(res.at(0)).assertEqual(1n);
      expect(res.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1000
     * @tc.name testBigInt64ArraySort010
     * @tc.desc Verify sort on a subarray only reorders elements within the subarray view, not the parent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      let sub = arr.subarray(1, 4);
      sub.sort();
      expect(sub[0]).assertEqual(2n);
      expect(sub[1]).assertEqual(3n);
      expect(sub[2]).assertEqual(4n);
      expect(arr[0]).assertEqual(5n);
      expect(arr[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1100
     * @tc.name testBigInt64ArraySort011
     * @tc.desc Verify sort with custom compare function ordering elements by their last digit (modulo 10).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([23n, 5n, 81n, 14n, 7n]);
      arr.sort((a: bigint, b: bigint): int => {
        let la = a % 10n;
        let lb = b % 10n;
        if (la < lb) return -1;
        if (la > lb) return 1;
        return 0;
      });
      expect(arr[0]).assertEqual(81n);
      expect(arr[1]).assertEqual(23n);
      expect(arr[2]).assertEqual(14n);
      expect(arr[3]).assertEqual(5n);
      expect(arr[4]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1200
     * @tc.name testBigInt64ArraySort012
     * @tc.desc Verify sort with compareDesc mutates the original array in place.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.sort(compareDesc);
      expect(arr.at(0)).assertEqual(3n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1300
     * @tc.name testBigInt64ArraySort013
     * @tc.desc Verify sort with custom compare function grouping elements by remainder modulo 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 2n, 12n, 3n, 8n]);
      arr.sort((a: bigint, b: bigint): int => {
        let modA = a % 5n;
        let modB = b % 5n;
        if (modA < modB) return -1;
        if (modA > modB) return 1;
        return 0;
      });
      expect(arr[0] % 5n).assertEqual(2n);
      expect(arr[1] % 5n).assertEqual(2n);
      expect(arr[2] % 5n).assertEqual(2n);
      expect(arr[3] % 5n).assertEqual(3n);
      expect(arr[4] % 5n).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1400
     * @tc.name testBigInt64ArraySort014
     * @tc.desc Verify sort with default (no-argument) comparator preserves the same ArrayBuffer reference after in-place mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let bufBefore = arr.buffer;
      arr.sort();
      let bufAfter = arr.buffer;
      expect(bufBefore).assertEqual(bufAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1500
     * @tc.name testBigInt64ArraySort015
     * @tc.desc Verify sort with compareDesc (explicit descending comparator) preserves the same ArrayBuffer reference after in-place mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let bufBefore = arr.buffer;
      arr.sort(compareDesc);
      let bufAfter = arr.buffer;
      expect(bufBefore).assertEqual(bufAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1600
     * @tc.name testBigInt64ArraySort016
     * @tc.desc Verify sort returns the same this object (assertEqual).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.sort();
      expect(res).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1700
     * @tc.name testBigInt64ArraySort017
     * @tc.desc Verify chained sort: descending then ascending restores ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.sort(compareDesc).sort();
      expect(res.at(0)).assertEqual(1n);
      expect(res.at(1)).assertEqual(2n);
      expect(res.at(2)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1800
     * @tc.name testBigInt64ArraySort018
     * @tc.desc Verify chained sort: ascending then descending produces descending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 2n]);
      let res = arr.sort().sort(compareDesc);
      expect(res.at(0)).assertEqual(3n);
      expect(res.at(1)).assertEqual(2n);
      expect(res.at(2)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_1900
     * @tc.name testBigInt64ArraySort019
     * @tc.desc Verify sort orders negative values numerically in ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, -10n, -1n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(-10n);
      expect(arr.at(1)).assertEqual(-5n);
      expect(arr.at(2)).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2000
     * @tc.name testBigInt64ArraySort020
     * @tc.desc Verify sort orders multi-digit values by numeric value, not string length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 2n, 5n, 1n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(5n);
      expect(arr.at(3)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2100
     * @tc.name testBigInt64ArraySort021
     * @tc.desc Verify sort orders mixed large-negative and small-positive correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, 2n, -5n, 1n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(-100n);
      expect(arr.at(1)).assertEqual(-5n);
      expect(arr.at(2)).assertEqual(1n);
      expect(arr.at(3)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2200
     * @tc.name testBigInt64ArraySort022
     * @tc.desc Verify sort orders equal magnitudes with opposite signs correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, -10n, 1n, -1n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(-10n);
      expect(arr.at(1)).assertEqual(-1n);
      expect(arr.at(2)).assertEqual(1n);
      expect(arr.at(3)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2300
     * @tc.name testBigInt64ArraySort023
     * @tc.desc Verify sort orders values with different digit lengths numerically.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([999n, 1000n, 50n, 5000n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(50n);
      expect(arr.at(1)).assertEqual(999n);
      expect(arr.at(2)).assertEqual(1000n);
      expect(arr.at(3)).assertEqual(5000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2400
     * @tc.name testBigInt64ArraySort024
     * @tc.desc Verify sort orders zero with negative values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -1n, -2n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(-2n);
      expect(arr.at(1)).assertEqual(-1n);
      expect(arr.at(2)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2500
     * @tc.name testBigInt64ArraySort025
     * @tc.desc Verify sort orders MAX and MIN as the two extremes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN]);
      arr.sort();
      expect(arr.at(0)).assertEqual(BIGINT64_MIN);
      expect(arr.at(1)).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2600
     * @tc.name testBigInt64ArraySort026
     * @tc.desc Verify sort orders near-MAX values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n - 1n, 9223372036854775807n - 2n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(9223372036854775807n - 2n);
      expect(arr.at(1)).assertEqual(9223372036854775807n - 1n);
      expect(arr.at(2)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2700
     * @tc.name testBigInt64ArraySort027
     * @tc.desc Verify sort orders near-MIN values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n + 2n, -9223372036854775808n, -9223372036854775808n + 1n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(-9223372036854775808n);
      expect(arr.at(1)).assertEqual(-9223372036854775808n + 1n);
      expect(arr.at(2)).assertEqual(-9223372036854775808n + 2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2800
     * @tc.name testBigInt64ArraySort028
     * @tc.desc Verify sort propagates a general Error thrown from the compare function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      try {
        arr.sort((a: bigint, b: bigint): bigint => {
          throw new Error('custom sort error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_2900
     * @tc.name testBigInt64ArraySort029
     * @tc.desc Verify sort propagates a TypeError thrown from the compare function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      try {
        arr.sort((a: bigint, b: bigint): bigint => {
          throw new TypeError('sort type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3000
     * @tc.name testBigInt64ArraySort030
     * @tc.desc Verify sort propagates a RangeError thrown from the compare function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      try {
        arr.sort((a: bigint, b: bigint): bigint => {
          throw new RangeError('sort range error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3100
     * @tc.name testBigInt64ArraySort031
     * @tc.desc Verify sort propagates an error for a specific compared value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -5n, 10n]);
      try {
        arr.sort((a: bigint, b: bigint): bigint => {
          if (a === -5n || b === -5n) {
            throw new Error('negative value not allowed');
          }
          return compareAsc(a, b);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3200
     * @tc.name testBigInt64ArraySort032
     * @tc.desc Verify sort stops and reports correct call count when compare function throws.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 1n, 4n, 2n]);
      let compareCount = 0;
      try {
        arr.sort((a: bigint, b: bigint): bigint => {
          compareCount++;
          if (compareCount > 2) {
            throw new Error('stop sorting');
          }
          return compareAsc(a, b);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(compareCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3300
     * @tc.name testBigInt64ArraySort033
     * @tc.desc Verify sort can be called again successfully after a previous compare function threw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n]);
      try {
        arr.sort((a: bigint, b: bigint): bigint => {
          throw new Error('err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      let res = arr.sort();
      expect(res.at(0)).assertEqual(1n);
      expect(res.at(1)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3400
     * @tc.name testBigInt64ArraySort034
     * @tc.desc Verify sort propagates an error with a localized non-English message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      try {
        arr.sort((a: bigint, b: bigint): bigint => {
          throw new Error('中断排序');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('中断排序');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3500
     * @tc.name testBigInt64ArraySort035
     * @tc.desc Verify sorting a subarray in ascending order updates the parent buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 5n, 8n, 2n]);
      let sub = arr.subarray(1, 4);
      sub.sort();
      expect(arr.at(0)).assertEqual(10n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(5n);
      expect(arr.at(3)).assertEqual(8n);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3600
     * @tc.name testBigInt64ArraySort036
     * @tc.desc Verify sorting a subarray in descending order updates the parent buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 5n, 8n, 2n]);
      let sub = arr.subarray(1, 4);
      sub.sort(compareDesc);
      expect(arr.at(0)).assertEqual(10n);
      expect(arr.at(1)).assertEqual(8n);
      expect(arr.at(2)).assertEqual(5n);
      expect(arr.at(3)).assertEqual(2n);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3700
     * @tc.name testBigInt64ArraySort037
     * @tc.desc Verify sorting the parent view updates the child subarray contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let sub = arr.subarray(1, 3);
      arr.sort();
      expect(sub.at(0)).assertEqual(2n);
      expect(sub.at(1)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3800
     * @tc.name testBigInt64ArraySort038
     * @tc.desc Verify sorting a subarray keeps byteOffset and byteLength unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n]);
      let sub = arr.subarray(1);
      sub.sort();
      expect(sub.byteOffset).assertEqual(8);
      expect(sub.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_3900
     * @tc.name testBigInt64ArraySort039
     * @tc.desc Verify sorting a zero-length subarray leaves parent data unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let sub = arr.subarray(1, 1);
      sub.sort();
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.at(0)).assertEqual(3n);
      expect(arr.at(1)).assertEqual(1n);
      expect(arr.at(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4000
     * @tc.name testBigInt64ArraySort040
     * @tc.desc Verify sorting an offset view updates its underlying buffer correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, BYTE_OFFSET_ONE, 2);
      arr[0] = 5n;
      arr[1] = 2n;
      arr.sort();
      expect(arr.at(0)).assertEqual(2n);
      expect(arr.at(1)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4100
     * @tc.name testBigInt64ArraySort041
     * @tc.desc Verify descending sort on offset view synchronizes to the full buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let full = new BigInt64Array(buf);
      full[0] = 1n;
      full[1] = 2n;
      full[2] = 5n;
      let part = new BigInt64Array(buf, BYTE_OFFSET_ONE, 2);
      part.sort(compareDesc);
      expect(full.at(1)).assertEqual(5n);
      expect(full.at(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4200
     * @tc.name testBigInt64ArraySort042
     * @tc.desc Verify offset+length view sort doesn't affect elements outside its range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[0] = 10n;
      full[1] = 5n;
      full[2] = 1n;
      full[3] = 8n;
      let part = new BigInt64Array(buf, BYTE_OFFSET_ONE, 2);
      part.sort();
      expect(full.at(0)).assertEqual(10n);
      expect(full.at(1)).assertEqual(1n);
      expect(full.at(2)).assertEqual(5n);
      expect(full.at(3)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4300
     * @tc.name testBigInt64ArraySort043
     * @tc.desc Verify sorting one overlapping view updates another overlapping view correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n, 1n]);
      let viewA = arr.subarray(0, 3);
      let viewB = arr.subarray(1, 4);
      viewA.sort();
      expect(viewB.at(0)).assertEqual(5n);
      expect(viewB.at(1)).assertEqual(8n);
      expect(viewB.at(2)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4400
     * @tc.name testBigInt64ArraySort044
     * @tc.desc Verify sorting one view and checking from the reverse overlapping view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n, 1n]);
      let viewA = arr.subarray(1, 4);
      let viewB = arr.subarray(0, 3);
      viewA.sort();
      expect(viewB.at(0)).assertEqual(5n);
      expect(viewB.at(1)).assertEqual(1n);
      expect(viewB.at(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4500
     * @tc.name testBigInt64ArraySort045
     * @tc.desc Verify sorting the middle overlapping view of three views.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 3n, 7n, 1n, 5n]);
      let v1 = arr.subarray(0, 2);
      let v2 = arr.subarray(1, 4);
      let v3 = arr.subarray(3, 5);
      v2.sort();
      expect(v1.at(1)).assertEqual(1n);
      expect(v3.at(0)).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4600
     * @tc.name testBigInt64ArraySort046
     * @tc.desc Verify a compare function can update outer state during sorting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n, 3n]);
      let flag = false;
      arr.sort((a: bigint, b: bigint): bigint => {
        flag = true;
        return compareAsc(a, b);
      });
      expect(flag).assertTrue();
      expect(arr.at(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4700
     * @tc.name testBigInt64ArraySort047
     * @tc.desc Verify a compare function can read array length during sorting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      arr.sort((a: bigint, b: bigint): bigint => {
        return compareAsc(a, b) + BigInt(2 - 2);
      });
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4800
     * @tc.name testBigInt64ArraySort048
     * @tc.desc Verify a compare function can read sibling elements during sorting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n, 3n]);
      arr.sort((a: bigint, b: bigint): bigint => {
        let sum = (arr.at(0) as bigint) + (arr.at(1) as bigint) + (arr.at(2) as bigint);
        if (sum > 0n) {
          return compareAsc(a, b);
        }
        return compareAsc(a, b);
      });
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_4900
     * @tc.name testBigInt64ArraySort049
     * @tc.desc Verify compare function can access buffer property during sorting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let bufAccessed = false;
      arr.sort((a: bigint, b: bigint): bigint => {
        if (arr.buffer instanceof ArrayBuffer) {
          bufAccessed = true;
        }
        return compareAsc(a, b);
      });
      expect(bufAccessed).assertTrue();
      expect(arr.at(0)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5000
     * @tc.name testBigInt64ArraySort050
     * @tc.desc Verify sort produces stable ordering for an already-sorted ascending array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(3n);
      expect(arr.at(3)).assertEqual(4n);
      expect(arr.at(4)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5100
     * @tc.name testBigInt64ArraySort051
     * @tc.desc Verify sort correctly handles a reverse-sorted array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(3n);
      expect(arr.at(3)).assertEqual(4n);
      expect(arr.at(4)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5200
     * @tc.name testBigInt64ArraySort052
     * @tc.desc Verify sort handles array with repeated MAX and MIN values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(-9223372036854775808n);
      expect(arr.at(1)).assertEqual(-9223372036854775808n);
      expect(arr.at(2)).assertEqual(9223372036854775807n);
      expect(arr.at(3)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5300
     * @tc.name testBigInt64ArraySort053
     * @tc.desc Verify fill after sort on a specific range only modifies that range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 10n, 30n, 20n, 40n]);
      arr.sort();
      arr.fill(0n, 1, 3);
      expect(arr.at(0)).assertEqual(10n);
      expect(arr.at(1)).assertEqual(0n);
      expect(arr.at(2)).assertEqual(0n);
      expect(arr.at(3)).assertEqual(40n);
      expect(arr.at(4)).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5400
     * @tc.name testBigInt64ArraySort054
     * @tc.desc Verify copyWithin on a sorted array copies elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 10n, 30n, 20n, 40n]);
      arr.sort();
      arr.copyWithin(0, 3, 5);
      expect(arr.at(0)).assertEqual(40n);
      expect(arr.at(1)).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5500
     * @tc.name testBigInt64ArraySort055
     * @tc.desc Verify reverse after sort produces descending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n]);
      arr.sort();
      arr.reverse();
      expect(arr.at(0)).assertEqual(30n);
      expect(arr.at(1)).assertEqual(20n);
      expect(arr.at(2)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5600
     * @tc.name testBigInt64ArraySort056
     * @tc.desc Verify sort with a compare function that always returns 0n preserves original order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n]);
      arr.sort((a: bigint, b: bigint): bigint => 0n);
      expect(arr.at(0)).assertEqual(5n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5700
     * @tc.name testBigInt64ArraySort057
     * @tc.desc Verify sort with a conditional compare function that inverts for specific values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 1n, 5n, 2n]);
      arr.sort((a: bigint, b: bigint): bigint => {
        if (a === 5n && b === 1n) {
          return -1n;
        }
        return compareAsc(a, b);
      });
      expect(arr.at(3)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5800
     * @tc.name testBigInt64ArraySort058
     * @tc.desc Verify sort with a compare function that sorts by absolute value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 3n, -1n, 7n]);
      arr.sort((a: bigint, b: bigint): bigint => {
        let absA = a < 0n ? -a : a;
        let absB = b < 0n ? -b : b;
        if (absA > absB) { return 1n; }
        if (absA < absB) { return -1n; }
        return 0n;
      });
      expect(arr.at(0)).assertEqual(-1n);
      expect(arr.at(1)).assertEqual(3n);
      expect(arr.at(2)).assertEqual(7n);
      expect(arr.at(3)).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_5900
     * @tc.name testBigInt64ArraySort059
     * @tc.desc Verify sort keeps array length unchanged after in-place mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n]);
      arr.sort();
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(3n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6000
     * @tc.name testBigInt64ArraySort060
     * @tc.desc Verify parent sort updates subarray view contents correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n, 40n]);
      let sub = arr.subarray(1, 3);
      arr.sort();
      expect(sub.at(0)).assertEqual(20n);
      expect(sub.at(1)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6100
     * @tc.name testBigInt64ArraySort061
     * @tc.desc Verify multi-level subarray sort: sort sub-subarray updates all views.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n, 1n, 9n]);
      let sub = arr.subarray(0, 4);
      let subsub = sub.subarray(1, 3);
      subsub.sort(compareDesc);
      expect(arr.at(1)).assertEqual(8n);
      expect(arr.at(2)).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6200
     * @tc.name testBigInt64ArraySort062
     * @tc.desc Verify sort on an offset+length view with compareAsc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let full = new BigInt64Array(buf);
      full[0] = 1n;
      full[1] = 3n;
      full[2] = 2n;
      let part = new BigInt64Array(buf, BYTE_OFFSET_ONE, 2);
      part.sort(compareAsc);
      expect(full.at(1)).assertEqual(2n);
      expect(full.at(2)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6300
     * @tc.name testBigInt64ArraySort063
     * @tc.desc Verify sort on an already-sorted descending array with compareAsc restores ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      arr.sort(compareAsc);
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(3n);
      expect(arr.at(3)).assertEqual(4n);
      expect(arr.at(4)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6400
     * @tc.name testBigInt64ArraySort064
     * @tc.desc Verify empty array sort with compareDesc returns array where OOB access throws RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.sort(compareDesc);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6500
     * @tc.name testBigInt64ArraySort065
     * @tc.desc Verify single element sort with compareDesc preserves the element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n]);
      let res = arr.sort(compareDesc);
      expect(res.at(0)).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6600
     * @tc.name testBigInt64ArraySort066
     * @tc.desc Verify sort with compareAsc on MAX, MIN, 0n produces correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN, 0n]);
      arr.sort(compareAsc);
      expect(arr.at(0)).assertEqual(BIGINT64_MIN);
      expect(arr.at(1)).assertEqual(0n);
      expect(arr.at(2)).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6700
     * @tc.name testBigInt64ArraySort067
     * @tc.desc Verify buffer byteLength is unchanged after sort.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let byteLenBefore = arr.buffer.byteLength;
      arr.sort();
      let byteLenAfter = arr.buffer.byteLength;
      expect(byteLenBefore).assertEqual(byteLenAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6800
     * @tc.name testBigInt64ArraySort068
     * @tc.desc Verify sort on a newly constructed array with sequential values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = BigInt(10 - i);
      }
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(9)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_6900
     * @tc.name testBigInt64ArraySort069
     * @tc.desc Verify sort on subarray that starts at index 1 preserves parent[0] correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 1n, 2n]);
      let sub = arr.subarray(1, 3);
      sub.sort();
      expect(arr.at(0)).assertEqual(5n);
      expect(arr.at(1)).assertEqual(1n);
      expect(arr.at(2)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7000
     * @tc.name testBigInt64ArraySort070
     * @tc.desc Verify sort with context variable correctly controls ascending order via closure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let ascending: boolean = true;
      arr.sort((a: bigint, b: bigint): bigint => {
        if (ascending) {
          return a < b ? -1n : a > b ? 1n : 0n;
        }
        return a > b ? -1n : a < b ? 1n : 0n;
      });
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7100
     * @tc.name testBigInt64ArraySort071
     * @tc.desc Verify sort with context variable correctly controls descending order via closure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 2n, 4n]);
      let ascending: boolean = false;
      arr.sort((a: bigint, b: bigint): bigint => {
        if (ascending) {
          return a < b ? -1n : a > b ? 1n : 0n;
        }
        return a > b ? -1n : a < b ? 1n : 0n;
      });
      expect(arr[0]).assertEqual(4n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7200
     * @tc.name testBigInt64ArraySort072
     * @tc.desc Verify sort on a copyWithin-mutated array produces correct ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 10n, 40n, 20n, 30n]);
      arr.copyWithin(1, 3, 5);
      arr.sort();
      expect(arr[0]).assertEqual(20n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(30n);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7300
     * @tc.name testBigInt64ArraySort073
     * @tc.desc Verify sort on a fill-mutated array produces correct ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 4n, 1n, 2n]);
      arr.fill(99n, 0, 2);
      arr.sort();
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(4n);
      expect(arr[3]).assertEqual(99n);
      expect(arr[4]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7400
     * @tc.name testBigInt64ArraySort074
     * @tc.desc Verify sort on subarray writes through to parent array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 30n, 40n, 10n, 20n]);
      let sub = arr.subarray(1, 4);
      sub.sort();
      expect(arr[0]).assertEqual(50n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[4]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7500
     * @tc.name testBigInt64ArraySort075
     * @tc.desc Verify sort with all-equal non-boundary values [7n,7n,7n,7n] preserves all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n, 7n, 7n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(7n);
      expect(arr.at(1)).assertEqual(7n);
      expect(arr.at(2)).assertEqual(7n);
      expect(arr.at(3)).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7600
     * @tc.name testBigInt64ArraySort076
     * @tc.desc Verify sort on partially-sorted array where first half is ascending and second half is random.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 7n, 4n, 6n, 5n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(3n);
      expect(arr.at(3)).assertEqual(4n);
      expect(arr.at(4)).assertEqual(5n);
      expect(arr.at(5)).assertEqual(6n);
      expect(arr.at(6)).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7700
     * @tc.name testBigInt64ArraySort077
     * @tc.desc Verify sort with compareFn that references array elements via closure reads current values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n]);
      arr.sort((a: bigint, b: bigint): bigint => {
        let first = arr.at(0) as bigint;
        if (first > 5n) {
          return compareAsc(a, b);
        }
        return compareDesc(a, b);
      });
      expect(arr.at(0)).assertEqual(10n);
      expect(arr.at(1)).assertEqual(20n);
      expect(arr.at(2)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7800
     * @tc.name testBigInt64ArraySort078
     * @tc.desc Verify sort ascending compareFn using exact (a - b) bigint arithmetic produces correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 50n, 20n, 40n]);
      arr.sort((a: bigint, b: bigint): bigint => a - b);
      expect(arr.at(0)).assertEqual(10n);
      expect(arr.at(1)).assertEqual(20n);
      expect(arr.at(2)).assertEqual(30n);
      expect(arr.at(3)).assertEqual(40n);
      expect(arr.at(4)).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_7900
     * @tc.name testBigInt64ArraySort079
     * @tc.desc Verify sort descending compareFn using (b - a) bigint arithmetic produces correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 30n, 20n, 50n, 40n]);
      arr.sort((a: bigint, b: bigint): bigint => b - a);
      expect(arr.at(0)).assertEqual(50n);
      expect(arr.at(1)).assertEqual(40n);
      expect(arr.at(2)).assertEqual(30n);
      expect(arr.at(3)).assertEqual(20n);
      expect(arr.at(4)).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8000
     * @tc.name testBigInt64ArraySort080
     * @tc.desc Verify sort on an array partially modified by fill sorts correctly with mixed original and filled values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 30n, 10n, 20n, 40n]);
      arr.fill(25n, 1, 4);
      arr.sort();
      expect(arr.at(0)).assertEqual(25n);
      expect(arr.at(1)).assertEqual(25n);
      expect(arr.at(2)).assertEqual(25n);
      expect(arr.at(3)).assertEqual(40n);
      expect(arr.at(4)).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8100
     * @tc.name testBigInt64ArraySort081
     * @tc.desc Verify sort immediately after copyWithin overlapping regions produces correct ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 3n, 7n, 1n, 5n]);
      arr.copyWithin(0, 3, 5);
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(1n);
      expect(arr.at(2)).assertEqual(5n);
      expect(arr.at(3)).assertEqual(5n);
      expect(arr.at(4)).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8200
     * @tc.name testBigInt64ArraySort082
     * @tc.desc Verify sort after reverse produces correct ascending order from the reversed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n, 1n, 4n]);
      arr.reverse();
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(4n);
      expect(arr.at(3)).assertEqual(5n);
      expect(arr.at(4)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8300
     * @tc.name testBigInt64ArraySort083
     * @tc.desc Verify double default sort is idempotent and preserves correct ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 2n, 5n, 1n, 9n]);
      arr.sort();
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(2n);
      expect(arr.at(2)).assertEqual(5n);
      expect(arr.at(3)).assertEqual(7n);
      expect(arr.at(4)).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8400
     * @tc.name testBigInt64ArraySort084
     * @tc.desc Verify two non-overlapping subarrays sorted independently both reflect in parent correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n, 3n, 6n, 1n, 4n, 9n, 2n]);
      let subA = arr.subarray(0, 3);
      let subB = arr.subarray(4, 7);
      subA.sort(compareDesc);
      subB.sort();
      expect(arr.at(0)).assertEqual(8n);
      expect(arr.at(1)).assertEqual(6n);
      expect(arr.at(2)).assertEqual(3n);
      expect(arr.at(3)).assertEqual(1n);
      expect(arr.at(4)).assertEqual(2n);
      expect(arr.at(5)).assertEqual(4n);
      expect(arr.at(6)).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8500
     * @tc.name testBigInt64ArraySort085
     * @tc.desc Verify subarray(2,5).sort() only sorts elements at indices 2-4 in the parent array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 8n, 7n, 4n, 6n, 5n, 1n]);
      let sub = arr.subarray(2, 5);
      sub.sort();
      expect(arr.at(0)).assertEqual(9n);
      expect(arr.at(1)).assertEqual(8n);
      expect(arr.at(2)).assertEqual(4n);
      expect(arr.at(3)).assertEqual(6n);
      expect(arr.at(4)).assertEqual(7n);
      expect(arr.at(5)).assertEqual(5n);
      expect(arr.at(6)).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8600
     * @tc.name testBigInt64ArraySort086
     * @tc.desc Verify sort on subarray keeps byteOffset and length unchanged after operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n, 3n, 6n, 1n, 5n]);
      let sub = arr.subarray(1, 4);
      let offsetBefore = sub.byteOffset;
      sub.sort();
      expect(sub.byteOffset).assertEqual(offsetBefore);
      expect(sub[0]).assertEqual(1n);
      expect(sub[1]).assertEqual(3n);
      expect(sub[2]).assertEqual(6n);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8700
     * @tc.name testBigInt64ArraySort087
     * @tc.desc Verify sort on 200-element descending array produces correct ascending order end to end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(200);
      for (let i = 0; i < 200; i++) {
        arr[i] = BigInt(200 - i);
      }
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(100)).assertEqual(101n);
      expect(arr.at(199)).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8800
     * @tc.name testBigInt64ArraySort088
     * @tc.desc Verify sort orders BIGINT64_MIN to index 0 and BIGINT64_MAX to the last index in a 302-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(302);
      arr[0] = BIGINT64_MAX;
      for (let i = 1; i < 301; i++) {
        arr[i] = BigInt(i);
      }
      arr[301] = BIGINT64_MIN;
      arr.sort();
      expect(arr.at(0)).assertEqual(BIGINT64_MIN);
      expect(arr.at(1)).assertEqual(1n);
      expect(arr.at(300)).assertEqual(300n);
      expect(arr.at(301)).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_8900
     * @tc.name testBigInt64ArraySort089
     * @tc.desc Verify sort on 100-element array then iterate via values() confirms ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt((i * 7 + 31) % 100);
      }
      arr.sort();
      let iter = arr.values();
      let prev = iter.next().value as bigint;
      let isOrdered = true;
      for (let i = 1; i < 100; i++) {
        let curr = iter.next().value as bigint;
        if (curr < prev) { isOrdered = false; }
        prev = curr;
      }
      expect(isOrdered).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_9000
     * @tc.name testBigInt64ArraySort090
     * @tc.desc Verify sort on BigInt64Array.of(8n,3n,5n) produces correct ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(8n, 3n, 5n);
      arr.sort();
      expect(arr.at(0)).assertEqual(3n);
      expect(arr.at(1)).assertEqual(5n);
      expect(arr.at(2)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_9100
     * @tc.name testBigInt64ArraySort091
     * @tc.desc Verify sort on BigInt64Array.from([7n,1n,9n]) produces correct ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([7n, 1n, 9n]);
      arr.sort();
      expect(arr.at(0)).assertEqual(1n);
      expect(arr.at(1)).assertEqual(7n);
      expect(arr.at(2)).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_9200
     * @tc.name testBigInt64ArraySort092
     * @tc.desc Verify sort on array constructed with ArrayBuffer offset sorts only the viewed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[0] = 1n;
      full[1] = 8n;
      full[2] = 3n;
      full[3] = 6n;
      let arr = new BigInt64Array(buf, BYTE_OFFSET_ONE, 2);
      arr.sort();
      expect(arr.at(0)).assertEqual(3n);
      expect(arr.at(1)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_9300
     * @tc.name testBigInt64ArraySort093
     * @tc.desc Verify sort on array from new BigInt64Array(buffer, 16, 4) with compareDesc updates parent buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let full = new BigInt64Array(buf);
      full[0] = 1n;
      full[1] = 2n;
      full[2] = 10n;
      full[3] = 3n;
      full[4] = 8n;
      full[5] = 5n;
      let arr = new BigInt64Array(buf, 16, 4);
      arr.sort(compareDesc);
      expect(full.at(2)).assertEqual(10n);
      expect(full.at(3)).assertEqual(8n);
      expect(full.at(4)).assertEqual(5n);
      expect(full.at(5)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_9400
     * @tc.name testBigInt64ArraySort094
     * @tc.desc Verify sort keeps array byteLength unchanged after in-place mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n, 1n, 3n, 2n, 5n]);
      let byteLenBefore = arr.byteLength;
      arr.sort();
      expect(arr.byteLength).assertEqual(byteLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_9500
     * @tc.name testBigInt64ArraySort095
     * @tc.desc Verify sort keeps array byteOffset unchanged after in-place mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let offsetBefore = arr.byteOffset;
      arr.sort();
      expect(arr.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SORT_9600
     * @tc.name testBigInt64ArraySort096
     * @tc.desc Verify sorting of overflow wrap-around values (MAX + 1n wraps to MIN) by sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySort096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal: bigint = 9223372036854775807n;
      let arr = new BigInt64Array(3);
      arr[0] = maxVal + 1n;
      arr[1] = 0n;
      arr[2] = 9223372036854775807n;
      arr.sort();
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(9223372036854775807n);
    });

  });
}
