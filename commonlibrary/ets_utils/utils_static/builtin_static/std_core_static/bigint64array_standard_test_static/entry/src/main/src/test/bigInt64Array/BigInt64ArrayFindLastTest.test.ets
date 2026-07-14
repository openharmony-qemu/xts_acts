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
     * @tc.desc Verify findLast throws Error when callback always returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      try {
        arr.findLast((value: bigint): boolean => false);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
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
     * @tc.desc Verify BigInt64Array.of traversal begins at the final index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(11n, 22n, 33n, 44n, 55n);
      let firstIndex = -1;
      let result = arr.findLast((_value: bigint, index: int): boolean => {
        firstIndex = index;
        return true;
      });
      expect(firstIndex).assertEqual(4);
      expect(String(result)).assertEqual('55');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1200
     * @tc.name testBigInt64ArrayFindLast1200
     * @tc.desc Verify a callback mutation of a left-side element is visible later in reverse traversal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let visited: int[] = [];
      let result = arr.findLast((value: bigint, index: int): boolean => {
        visited.push(index);
        if (index === 2) {
          arr[1] = 99n;
        }
        return value === 99n;
      });
      expect(visited.join(',')).assertEqual('2,1');
      expect(String(result)).assertEqual('99');
      expect(arr.join()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1300
     * @tc.name testBigInt64ArrayFindLast1300
     * @tc.desc Verify an external flag set at the tail can control the following callback decision.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 6n, 12n, 24n]);
      let armed = false;
      let hitIndex = -1;
      let result = arr.findLast((_value: bigint, index: int): boolean => {
        if (index === arr.length - 1) {
          armed = true;
          return false;
        }
        if (armed) {
          hitIndex = index;
          return true;
        }
        return false;
      });
      expect(hitIndex).assertEqual(2);
      expect(String(result)).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_1400
     * @tc.name testBigInt64ArrayFindLast1400
     * @tc.desc Verify callback array metadata matches the BigInt64Array.of source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(2n, 4n, 6n);
      let observedBytes = 0;
      let sameBuffer = false;
      let result = arr.findLast(
        (_value: bigint, index: int, array: BigInt64Array): boolean => {
          observedBytes = array.byteLength;
          sameBuffer = array.buffer === arr.buffer;
          return index === array.length - 1;
        }
      );
      expect(observedBytes).assertEqual(24);
      expect(sameBuffer).assertTrue();
      expect(String(result)).assertEqual('6');
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
     * @tc.desc Verify empty arrays throw Error without invoking callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let calls: int = 0;
      try {
        arr.findLast((value: bigint): boolean => {
          calls++;
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
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
     * @tc.desc Verify a non-matching single-element array throws Error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      try {
        arr.findLast((value: bigint): boolean => value === 24n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_2000
     * @tc.name testBigInt64ArrayFindLast2000
     * @tc.desc Verify an Error thrown by the predicate stops reverse traversal and is propagated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n, 28n]);
      let calls = 0;
      try {
        arr.findLast((_value: bigint, index: int): boolean => {
          calls++;
          if (index === 2) {
            throw new Error('predicate-stop');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(2);
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
     * @tc.desc Verify a no-match predicate visits every element exactly once
     * before findLast throws Error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n, 7n]);
      let calls: int = 0;
      try {
        arr.findLast((value: bigint): boolean => {
          calls++;
          return value % 2n === 0n;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
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
      try {
        arr.findLast((value: bigint): boolean => {
          if (value === 2n) {
            throw new Error('test');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('test');
      }
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
     * @tc.desc Verify missing matches cause findLast to throw Error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLast3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      try {
        arr.findLast((value: bigint): boolean => value === 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
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
