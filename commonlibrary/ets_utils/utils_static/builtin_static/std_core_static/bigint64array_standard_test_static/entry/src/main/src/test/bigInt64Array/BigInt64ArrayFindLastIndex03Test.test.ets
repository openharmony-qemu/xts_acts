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
import Utils from './../Util.test';

export default function BigInt64ArrayFindLastIndex03Test(): void {
  describe('BigInt64ArrayFindLastIndex03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0100
     * @tc.name testBigInt64ArrayFindLastIndexThree0100
     * @tc.desc Verify findLastIndex propagates an Error thrown by the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr.findLastIndex((v: bigint): boolean => {
          throw new Error('test');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('test');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0200
     * @tc.name testBigInt64ArrayFindLastIndexThree0200
     * @tc.desc Verify findLastIndex propagates a TypeError thrown by the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr.findLastIndex((v: bigint): boolean => {
          throw new TypeError('te');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0300
     * @tc.name testBigInt64ArrayFindLastIndexThree0300
     * @tc.desc Verify findLastIndex propagates a RangeError thrown by the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr.findLastIndex((v: bigint): boolean => {
          throw new RangeError('re');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0400
     * @tc.name testBigInt64ArrayFindLastIndexThree0400
     * @tc.desc Verify the predicate updates an outer counter for a single reverse match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let cnt = 0;
      let index = arr.findLastIndex((v: bigint): boolean => {
        cnt++;
        return v === 3n;
      });
      expect(index).assertEqual(2);
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0500
     * @tc.name testBigInt64ArrayFindLastIndexThree0500
     * @tc.desc Verify the predicate updates an outer counter until the first element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let cnt = 0;
      let index = arr.findLastIndex((v: bigint): boolean => {
        cnt++;
        return v === 1n;
      });
      expect(index).assertEqual(0);
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0600
     * @tc.name testBigInt64ArrayFindLastIndexThree0600
     * @tc.desc Verify the predicate visits elements in reverse order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let seq: Array<bigint> = [];
      arr.findLastIndex((v: bigint): boolean => {
        seq.push(v);
        return false;
      });
      expect(seq.length).assertEqual(2);
      expect(seq[0]).assertEqual(2n);
      expect(seq[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0700
     * @tc.name testBigInt64ArrayFindLastIndexThree0700
     * @tc.desc Verify findLastIndex stops after the first truthy reverse match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let cnt = 0;
      let index = arr.findLastIndex((v: bigint): boolean => {
        cnt++;
        return v === 2n;
      });
      expect(index).assertEqual(1);
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0800
     * @tc.name testBigInt64ArrayFindLastIndexThree0800
     * @tc.desc Verify updating an earlier element lets a later reverse visit match it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let index = arr.findLastIndex((v: bigint, i: int, a: BigInt64Array): boolean => {
        a[0] = 9n;
        return v === 9n;
      });
      expect(index).assertEqual(0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_0900
     * @tc.name testBigInt64ArrayFindLastIndexThree0900
     * @tc.desc Verify updating the current element does not change the current callback result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let index = arr.findLastIndex((v: bigint, i: int, a: BigInt64Array): boolean => {
        a[2] = 5n;
        return false;
      });
      expect(index).assertEqual(-1);
      expect(arr[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1000
     * @tc.name testBigInt64ArrayFindLastIndexThree1000
     * @tc.desc Verify the predicate can capture an outer target value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let target = 20n;
      let index = arr.findLastIndex((v: bigint): boolean => v === target);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1100
     * @tc.name testBigInt64ArrayFindLastIndexThree1100
     * @tc.desc Verify the predicate can mutate closure state and match later.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let matched = false;
      let index = arr.findLastIndex((v: bigint): boolean => {
        let result = matched;
        matched = true;
        return result;
      });
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1200
     * @tc.name testBigInt64ArrayFindLastIndexThree1200
     * @tc.desc Verify the predicate can reference the array in a nested expression.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let index = arr.findLastIndex((v: bigint): boolean => arr.length === 2 && v === 1n);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1300
     * @tc.name testBigInt64ArrayFindLastIndexThree1300
     * @tc.desc Verify the predicate can match with value and index parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let index = arr.findLastIndex((v: bigint, i: int): boolean => i === 1 && v === 200n);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1400
     * @tc.name testBigInt64ArrayFindLastIndexThree1400
     * @tc.desc Verify the predicate can match with value index and array parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => a.length === 2 && v === 100n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1500
     * @tc.name testBigInt64ArrayFindLastIndexThree1500
     * @tc.desc Verify the predicate can omit unused parameters and still match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let index = arr.findLastIndex((v: bigint): boolean => v === 200n);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1600
     * @tc.name testBigInt64ArrayFindLastIndexThree1600
     * @tc.desc Verify the predicate can ignore all parameters and match the tail element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let index = arr.findLastIndex((): boolean => true);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1700
     * @tc.name testBigInt64ArrayFindLastIndexThree1700
     * @tc.desc Verify the predicate can ignore all parameters and return -1 when false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let index = arr.findLastIndex((): boolean => false);
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1800
     * @tc.name testBigInt64ArrayFindLastIndexThree1800
     * @tc.desc Verify findLastIndex sees values through another view on the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr1 = new BigInt64Array(buffer);
      arr1[1] = 5n;
      let arr2 = new BigInt64Array(buffer);
      let index = arr2.findLastIndex((v: bigint): boolean => v === 5n);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_1900
     * @tc.name testBigInt64ArrayFindLastIndexThree1900
     * @tc.desc Verify findLastIndex works on a view created with a byte offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 8);
      arr[1] = 9n;
      let index = arr.findLastIndex((v: bigint): boolean => v === 9n);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2000
     * @tc.name testBigInt64ArrayFindLastIndexThree2000
     * @tc.desc Verify findLastIndex works on an offset and length constrained view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let arr = new BigInt64Array(buffer, 16, 2);
      arr[0] = 7n;
      arr[1] = 8n;
      let index = arr.findLastIndex((v: bigint): boolean => v === 7n);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2100
     * @tc.name testBigInt64ArrayFindLastIndexThree2100
     * @tc.desc Verify cross typed views on one buffer affect findLastIndex results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let int32 = new Int32Array(buffer);
      int32[0] = 5;
      let big = new BigInt64Array(buffer);
      let index = big.findLastIndex((v: bigint): boolean => v === 5n);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2200
     * @tc.name testBigInt64ArrayFindLastIndexThree2200
     * @tc.desc Verify a block bodied predicate can return the head element match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n]);
      let index = arr.findLastIndex((v: bigint): boolean => {
        return v === 3n;
      });
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2300
     * @tc.name testBigInt64ArrayFindLastIndexThree2300
     * @tc.desc Verify the predicate runs across the full array when nothing matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n, 0n]);
      let cnt = 0;
      let index = arr.findLastIndex((v: bigint): boolean => {
        cnt++;
        return false;
      });
      expect(index).assertEqual(-1);
      expect(cnt).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2400
     * @tc.name testBigInt64ArrayFindLastIndexThree2400
     * @tc.desc Verify findLastIndex propagates a custom error name from the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      try {
        arr.findLastIndex((): boolean => {
          let error = new Error('c');
          error.name = 'Custom';
          throw error;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Custom');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2500
     * @tc.name testBigInt64ArrayFindLastIndexThree2500
     * @tc.desc Verify the predicate can write through a closure owned typed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let out = new BigInt64Array(1);
      let index = arr.findLastIndex((v: bigint, i: int): boolean => {
        out[0] = v;
        return out[0] === 1n;
      });
      expect(index).assertEqual(0);
      expect(out[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2600
     * @tc.name testBigInt64ArrayFindLastIndexThree2600
     * @tc.desc Verify the predicate can compare BigInt values through toString.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let index = arr.findLastIndex((v: bigint): boolean => v.toString() === '5');
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2700
     * @tc.name testBigInt64ArrayFindLastIndexThree2700
     * @tc.desc Verify the predicate can compare BigInt values through valueOf.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let index = arr.findLastIndex((v: bigint): boolean => v.valueOf() === 5n);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2800
     * @tc.name testBigInt64ArrayFindLastIndexThree2800
     * @tc.desc Verify the predicate can compare a long decimal string form.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let index = arr.findLastIndex(
        (v: bigint): boolean => v.toString() === '9223372036854775807'
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_2900
     * @tc.name testBigInt64ArrayFindLastIndexThree2900
     * @tc.desc Verify Number conversion is allowed in the predicate despite precision loss.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let index = arr.findLastIndex((v: bigint): boolean => Number(v) > 0);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_3000
     * @tc.name testBigInt64ArrayFindLastIndexThree3000
     * @tc.desc Verify the predicate is not invoked for an empty BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let run = false;
      let index = arr.findLastIndex((): boolean => {
        run = true;
        return true;
      });
      expect(index).assertEqual(-1);
      expect(run).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_3100
     * @tc.name testBigInt64ArrayFindLastIndexThree3100
     * @tc.desc Verify the predicate can match with mixed BigInt arithmetic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let index = arr.findLastIndex((v: bigint): boolean => v * 2n === 40n);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_3200
     * @tc.name testBigInt64ArrayFindLastIndexThree3200
     * @tc.desc Verify the predicate can match with combined bitwise operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 7n]);
      let index = arr.findLastIndex(
        (v: bigint): boolean => (v & 1n) === 1n && (v >> 1n) === 3n
      );
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_3300
     * @tc.name testBigInt64ArrayFindLastIndexThree3300
     * @tc.desc Verify a read only predicate does not mutate the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let index = arr.findLastIndex((v: bigint): boolean => v === 2n);
      expect(index).assertEqual(1);
      expect(arr[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_THREE_3400
     * @tc.name testBigInt64ArrayFindLastIndexThree3400
     * @tc.desc Verify the predicate can find the last non zero element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexThree3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 5n]);
      let index = arr.findLastIndex((v: bigint): boolean => v !== 0n);
      expect(index).assertEqual(2);
    });
  });
}
