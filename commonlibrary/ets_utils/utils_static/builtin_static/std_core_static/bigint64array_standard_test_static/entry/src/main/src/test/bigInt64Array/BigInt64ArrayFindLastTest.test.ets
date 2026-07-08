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
import Utils from './../Util.test';

function createSequentialArray(length: int): BigInt64Array {
  let arr = new BigInt64Array(length);
  for (let i = 0; i < arr.length; i++) {
    arr[i] = BigInt(i);
  }
  return arr;
}

export default function BigInt64ArrayFindLastTest(): void {
  describe('BigInt64ArrayFindLastTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0100
     * @tc.name testBigInt64ArrayFindLast0100
     * @tc.desc Verify findLast returns the tail element when callback always returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      let result = arr.findLast((value: bigint): boolean => true);
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0200
     * @tc.name testBigInt64ArrayFindLast0200
     * @tc.desc Verify findLast returns undefined when callback always returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      let result = arr.findLast((value: bigint): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0300
     * @tc.name testBigInt64ArrayFindLast0300
     * @tc.desc Verify findLast returns the last positive bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 8n, -2n, 12n, -1n]);
      let result = arr.findLast((value: bigint): boolean => value > 0n);
      expect(result).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0400
     * @tc.name testBigInt64ArrayFindLast0400
     * @tc.desc Verify findLast returns the last negative bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, -8n, 2n, -12n, 1n]);
      let result = arr.findLast((value: bigint): boolean => value < 0n);
      expect(result).assertEqual(-12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0500
     * @tc.name testBigInt64ArrayFindLast0500
     * @tc.desc Verify findLast returns the final zero occurrence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 0n, 5n, 0n, 7n]);
      let result = arr.findLast((value: bigint): boolean => value === 0n);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0600
     * @tc.name testBigInt64ArrayFindLast0600
     * @tc.desc Verify findLast matches the maximum signed bigint boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxValue = 9223372036854775807n;
      let arr = new BigInt64Array([1n, maxValue, 3n]);
      let result = arr.findLast((value: bigint): boolean => value === maxValue);
      expect(result).assertEqual(maxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0700
     * @tc.name testBigInt64ArrayFindLast0700
     * @tc.desc Verify findLast matches the minimum signed bigint boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue = -9223372036854775807n - 1n;
      let arr = new BigInt64Array([1n, minValue, 3n]);
      let result = arr.findLast((value: bigint): boolean => value === minValue);
      expect(result).assertEqual(minValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0800
     * @tc.name testBigInt64ArrayFindLast0800
     * @tc.desc Verify findLast matches a hexadecimal literal value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([12n, 255n, 3n]);
      let result = arr.findLast((value: bigint): boolean => value === 255n);
      expect(result).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_0900
     * @tc.name testBigInt64ArrayFindLast0900
     * @tc.desc Verify findLast matches an octal literal value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([12n, 63n, 3n]);
      let result = arr.findLast((value: bigint): boolean => value === 63n);
      expect(result).assertEqual(63n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1000
     * @tc.name testBigInt64ArrayFindLast1000
     * @tc.desc Verify findLast matches a binary literal value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([12n, 10n, 3n]);
      let result = arr.findLast((value: bigint): boolean => value === 10n);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1100
     * @tc.name testBigInt64ArrayFindLast1100
     * @tc.desc Verify findLast can use only index to select the last even index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let result = arr.findLast((value: bigint, index: int): boolean => index % 2 === 0);
      expect(result).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1200
     * @tc.name testBigInt64ArrayFindLast1200
     * @tc.desc Verify findLast can use only index to select index zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n, 55n]);
      let result = arr.findLast((value: bigint, index: int): boolean => index === 0);
      expect(result).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1300
     * @tc.name testBigInt64ArrayFindLast1300
     * @tc.desc Verify findLast supports combined value and index predicates.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 9n, 12n, 15n]);
      let result = arr.findLast((value: bigint, index: int): boolean => {
        return value % 3n === 0n && index === 2;
      });
      expect(result).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1400
     * @tc.name testBigInt64ArrayFindLast1400
     * @tc.desc Verify callback receives the current array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      let sawSelf = false;
      let result = arr.findLast(
        (value: bigint, index: int, array: BigInt64Array): boolean => {
          sawSelf = array === arr && array[index] === value;
          return value === 6n;
        }
      );
      expect(result).assertEqual(6n);
      expect(sawSelf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1500
     * @tc.name testBigInt64ArrayFindLast1500
     * @tc.desc Verify findLast returns the rightmost element among multiple matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 4n, 6n, 8n, 3n]);
      let result = arr.findLast((value: bigint): boolean => value % 2n === 0n);
      expect(result).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1600
     * @tc.name testBigInt64ArrayFindLast1600
     * @tc.desc Verify matching head and tail values resolve to the tail element first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 4n, 9n]);
      let calls: int = 0;
      let result = arr.findLast((value: bigint): boolean => {
        calls++;
        return value === 9n;
      });
      expect(result).assertEqual(9n);
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1700
     * @tc.name testBigInt64ArrayFindLast1700
     * @tc.desc Verify empty arrays return undefined without invoking callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let calls: int = 0;
      let result = arr.findLast((value: bigint): boolean => {
        calls++;
        return true;
      });
      expect(result).assertUndefined();
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1800
     * @tc.name testBigInt64ArrayFindLast1800
     * @tc.desc Verify a matching single-element array returns that element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let result = arr.findLast((value: bigint): boolean => value === 42n);
      expect(result).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1900
     * @tc.name testBigInt64ArrayFindLast1900
     * @tc.desc Verify a non-matching single-element array returns undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let result = arr.findLast((value: bigint): boolean => value === 24n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2000
     * @tc.name testBigInt64ArrayFindLast2000
     * @tc.desc Verify identical values can still confirm reverse traversal by index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n, 7n, 7n]);
      let hitIndex: int = -1;
      let result = arr.findLast((value: bigint, index: int): boolean => {
        if (value === 7n && index < 3) {
          hitIndex = index;
          return true;
        }
        return false;
      });
      expect(result).assertEqual(7n);
      expect(hitIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2100
     * @tc.name testBigInt64ArrayFindLast2100
     * @tc.desc Verify all-zero arrays return zero for a zero predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n]);
      let result = arr.findLast((value: bigint): boolean => value === 0n);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2200
     * @tc.name testBigInt64ArrayFindLast2200
     * @tc.desc Verify findLast matches the truncated stored value after overflow conversion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(18446744073709551615n, 5n);
      let result = arr.findLast((value: bigint): boolean => value === -1n);
      expect(result).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2300
     * @tc.name testBigInt64ArrayFindLast2300
     * @tc.desc Verify long arrays can find a matching element near the front.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createSequentialArray(128);
      let result = arr.findLast((value: bigint): boolean => value === 7n);
      expect(result).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2400
     * @tc.name testBigInt64ArrayFindLast2400
     * @tc.desc Verify long arrays can find a matching element near the tail.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createSequentialArray(128);
      let result = arr.findLast((value: bigint): boolean => value === 120n);
      expect(result).assertEqual(120n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2500
     * @tc.name testBigInt64ArrayFindLast2500
     * @tc.desc Verify mixed radix literals are matched correctly in one array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(255n, 63n, 3n);
      let result = arr.findLast((value: bigint): boolean => value === 63n);
      expect(result).assertEqual(63n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2600
     * @tc.name testBigInt64ArrayFindLast2600
     * @tc.desc Verify callback logic can read external variables.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = 12n;
      let arr = new BigInt64Array([3n, 12n, 7n]);
      let result = arr.findLast((value: bigint): boolean => value === target);
      expect(result).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2700
     * @tc.name testBigInt64ArrayFindLast2700
     * @tc.desc Verify callback state tracking shows short-circuit from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let calls: int = 0;
      let result = arr.findLast((value: bigint): boolean => {
        calls++;
        return value % 2n === 0n;
      });
      expect(result).assertEqual(4n);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2800
     * @tc.name testBigInt64ArrayFindLast2800
     * @tc.desc Verify reverse search stops once the final matching element is found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 3n, 2n, 4n, 5n]);
      let calls: int = 0;
      let result = arr.findLast((value: bigint): boolean => {
        calls++;
        return value === 2n;
      });
      expect(result).assertEqual(2n);
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2900
     * @tc.name testBigInt64ArrayFindLast2900
     * @tc.desc Verify a no-match predicate visits every element exactly once.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n, 7n]);
      let calls: int = 0;
      let result = arr.findLast((value: bigint): boolean => {
        calls++;
        return value % 2n === 0n;
      });
      expect(result).assertUndefined();
      expect(calls).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_3000
     * @tc.name testBigInt64ArrayFindLast3000
     * @tc.desc Verify callback exceptions are propagated by findLast.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let caught = false;
      let errorMessage = '';
      try {
        arr.findLast((value: bigint): boolean => {
          if (value === 2n) {
            throw new Error('test');
          }
          return false;
        });
      } catch (error) {
        caught = true;
        errorMessage = error.message;
      }
      expect(caught).assertTrue();
      expect(errorMessage).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_3100
     * @tc.name testBigInt64ArrayFindLast3100
     * @tc.desc Verify the found result equals the expected bigint value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let result = arr.findLast((value: bigint): boolean => value === 10n);
      expect(result).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_3200
     * @tc.name testBigInt64ArrayFindLast3200
     * @tc.desc Verify missing matches produce strict undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let result = arr.findLast((value: bigint): boolean => value === 99n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_3300
     * @tc.name testBigInt64ArrayFindLast3300
     * @tc.desc Verify typeof the found result is bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let result = arr.findLast((value: bigint): boolean => value === 10n);
      expect(typeof result).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_3400
     * @tc.name testBigInt64ArrayFindLast3400
     * @tc.desc Verify findLast does not change array length, order, or values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 4n, 1n]);
      let snapshot = arr.join(',');
      let result = arr.findLast((value: bigint): boolean => value === 4n);
      expect(result).assertEqual(4n);
      expect(arr.length).assertEqual(4);
      expect(arr.join(',')).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_3500
     * @tc.name testBigInt64ArrayFindLast3500
     * @tc.desc Verify findLast can be nested inside another findLast predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -2n, 4n, 6n]);
      let result = arr.findLast((value: bigint): boolean => {
        let nested = arr.findLast((innerValue: bigint): boolean => innerValue < 0n);
        return nested === -2n && value % 2n === 0n;
      });
      expect(result).assertEqual(6n);
    });
  });
}
