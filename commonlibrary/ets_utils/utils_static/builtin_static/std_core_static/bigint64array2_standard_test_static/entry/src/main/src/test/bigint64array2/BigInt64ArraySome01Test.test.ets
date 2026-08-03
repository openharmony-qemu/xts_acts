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

export default function BigInt64ArraySome01Test(): void {
  describe('BigInt64ArraySome01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0010
     * @tc.name testBigInt64ArraySomeOne001
     * @tc.desc Verify some returns false for an empty array when predicate always returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.some(() => true);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0020
     * @tc.name testBigInt64ArraySomeOne002
     * @tc.desc Verify some callback is never invoked for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let callCount = 0;
      let res = arr.some(() => { callCount++; return true; });
      expect(res).assertFalse();
      expect(callCount).assertEqual(0);
    });

    /**
     * Parameterized replacement covering boundary values for single-element arrays.
     * Tests some() on single-element arrays with various boundary values.
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0030
     * @tc.name testBigInt64ArraySomeOne003
     * @tc.desc Verify some on single-element arrays matches/mismatches correctly for various BigInt values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const MAX = 9223372036854775807n;
      const MIN = -9223372036854775808n;

      expect(new BigInt64Array([MAX]).some(e => e === MAX)).assertTrue();
      expect(new BigInt64Array([MIN]).some(e => e === MIN)).assertTrue();
      expect(new BigInt64Array([0n]).some(e => e === 0n)).assertTrue();

      expect(new BigInt64Array([1n]).some(e => e === 0n)).assertFalse();
      expect(new BigInt64Array([MAX]).some(e => e === MIN)).assertFalse();
      expect(new BigInt64Array([MIN]).some(e => e === MAX)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0040
     * @tc.name testBigInt64ArraySomeOne004
     * @tc.desc Verify some matches the first element in a multi-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.some(e => e === 10n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0050
     * @tc.name testBigInt64ArraySomeOne005
     * @tc.desc Verify some matches a middle element in a multi-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.some(e => e === 30n);
      expect(res).assertTrue();;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0060
     * @tc.name testBigInt64ArraySomeOne006
     * @tc.desc Verify some matches the last element in a multi-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.some(e => e === 50n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0070
     * @tc.name testBigInt64ArraySomeOne007
     * @tc.desc Verify some matches in an array where all elements have the same value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([22n, 22n, 22n, 22n]);
      let res = arr.some(e => e === 22n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0080
     * @tc.name testBigInt64ArraySomeOne008
     * @tc.desc Verify some matches the first element in a negative-value array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -20n, -30n]);
      let res = arr.some(e => e === -10n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0090
     * @tc.name testBigInt64ArraySomeOne009
     * @tc.desc Verify some returns false when the target value is absent from a positive array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.some(e => e === 40n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0100
     * @tc.name testBigInt64ArraySomeOne010
     * @tc.desc Verify some returns false when the target value is absent from an array containing extremes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 0n, 9223372036854775807n]);
      let res = arr.some(e => e === 1n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0110
     * @tc.name testBigInt64ArraySomeOne011
     * @tc.desc Verify some returns false when the target differs from all identical elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([22n, 22n, 22n]);
      let res = arr.some(e => e === 23n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0120
     * @tc.name testBigInt64ArraySomeOne012
     * @tc.desc Verify some returns false when 0n is absent from a negative array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -20n, -30n]);
      let res = arr.some(e => e === 0n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0130
     * @tc.name testBigInt64ArraySomeOne013
     * @tc.desc Verify some returns false when a larger-than-max value is sought in a small range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.some(e => e === 100n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0140
     * @tc.name testBigInt64ArraySomeOne014
     * @tc.desc Verify some matches the wrapped result of overflow literal 9223372036854775808n as MIN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775808n]);
      let res = arr.some(e => e === -9223372036854775808n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0150
     * @tc.name testBigInt64ArraySomeOne015
     * @tc.desc Verify some matches the wrapped result of underflow literal -9223372036854775809n as MAX.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775809n]);
      let res = arr.some(e => e === 9223372036854775807n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0160
     * @tc.name testBigInt64ArraySomeOne016
     * @tc.desc Verify some after fill operation detects the filled value in the modified array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n]);
      arr.fill(5n);
      let res = arr.some(e => e === 5n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0170
     * @tc.name testBigInt64ArraySomeOne017
     * @tc.desc Verify some callback receives correct element and index: element matches array[index] at each visited position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let allMatch = true;
      let res = arr.some((e: bigint, idx: int, bigArr: BigInt64Array) => {
        if (e !== bigArr[idx]) allMatch = false;
        return false;
      });
      expect(res).assertFalse();
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0180
     * @tc.name testBigInt64ArraySomeOne018
     * @tc.desc Verify some on a subarray finds a matching element within the subarray range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4);
      let res = sub.some(e => e === 3n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0190
     * @tc.name testBigInt64ArraySomeOne019
     * @tc.desc Verify some short-circuits when callback returns true, visiting only elements until the match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let visited: bigint[] = [];
      let res = arr.some((e: bigint): boolean => {
        visited.push(e);
        return e === 3n;
      });
      expect(res).assertTrue();
      expect(visited[0]).assertEqual(1n);
      expect(visited[1]).assertEqual(2n);
      expect(visited[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0200
     * @tc.name testBigInt64ArraySomeOne020
     * @tc.desc Verify some on an empty BigInt64Array returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.some((e: bigint): boolean => e === 1n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0210
     * @tc.name testBigInt64ArraySomeOne021
     * @tc.desc Verify some with callback using modulo operator finds the first even number via e % 2n === 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n, 8n, 9n]);
      let count = 0;
      let res = arr.some((e: bigint): boolean => {
        count++;
        return e % 2n === 0n;
      });
      expect(res).assertTrue();
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0220
     * @tc.name testBigInt64ArraySomeOne022
     * @tc.desc Verify some correctly matches the element 0n in a mixed array with non-zero elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 0n, 2n]);
      let res = arr.some((e: bigint): boolean => e === 0n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0230
     * @tc.name testBigInt64ArraySomeOne023
     * @tc.desc Verify some on a toReversed array finds an element from the original first position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let reversed = arr.toReversed();
      let res = reversed.some((e: bigint): boolean => e === 1n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0240
     * @tc.name testBigInt64ArraySomeOne024
     * @tc.desc Verify some matches the wrapped result of large overflow 27670116110564327423n as MAX.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([27670116110564327423n]);
      let res = arr.some(e => e === 9223372036854775807n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0250
     * @tc.name testBigInt64ArraySomeOne025
     * @tc.desc Verify some matches the wrapped result of large underflow -27670116110564327424n as MIN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-27670116110564327424n]);
      let res = arr.some(e => e === -9223372036854775808n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0260
     * @tc.name testBigInt64ArraySomeOne026
     * @tc.desc Verify some does not match the original large overflow 27670116110564327423n after wrapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([27670116110564327423n]);
      let res = arr.some(e => e === 27670116110564327423n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0270
     * @tc.name testBigInt64ArraySomeOne027
     * @tc.desc Verify some does not match the original large underflow -27670116110564327424n after wrapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-27670116110564327424n]);
      let res = arr.some(e => e === -27670116110564327424n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0280
     * @tc.name testBigInt64ArraySomeOne028
     * @tc.desc Verify some short-circuits on first match with callback called exactly once.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n]);
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 5n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0290
     * @tc.name testBigInt64ArraySomeOne029
     * @tc.desc Verify some iterates all elements when only the last element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 5n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0300
     * @tc.name testBigInt64ArraySomeOne030
     * @tc.desc Verify some iterates all elements and returns false when no match exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 99n; });
      expect(res).assertFalse();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0310
     * @tc.name testBigInt64ArraySomeOne031
     * @tc.desc Verify some short-circuits with correct count when matching MAX in mixed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 9223372036854775807n, 2n]);
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 9223372036854775807n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0320
     * @tc.name testBigInt64ArraySomeOne032
     * @tc.desc Verify some callback receives the correct element value for the first position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.some((e: bigint) => e === 100n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0330
     * @tc.name testBigInt64ArraySomeOne033
     * @tc.desc Verify some callback receives a negative element value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-50n, 10n]);
      let res = arr.some((e: bigint) => e === -50n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0340
     * @tc.name testBigInt64ArraySomeOne034
     * @tc.desc Verify some callback receives the correct element at index 1 in a two-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.some((e: bigint) => e === 200n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0350
     * @tc.name testBigInt64ArraySomeOne035
     * @tc.desc Verify some sets callback index to 0 for the first element in a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n]);
      let res = arr.some((e: bigint, i: int) => i === 0);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0360
     * @tc.name testBigInt64ArraySomeOne036
     * @tc.desc Verify some sets callback index to 1 for the second element in a two-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.some((e: bigint, i: int) => e === 200n && i === 1);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0370
     * @tc.name testBigInt64ArraySomeOne037
     * @tc.desc Verify some sets callback index to 2 for the third element in a three-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.some((e: bigint, i: int) => i === 2);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0380
     * @tc.name testBigInt64ArraySomeOne038
     * @tc.desc Verify some never calls the callback with an out-of-range index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.some((e: bigint, i: int) => i === 4);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0390
     * @tc.name testBigInt64ArraySomeOne039
     * @tc.desc Verify some observes an index greater than 0 during iteration of multi-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let res = arr.some((e: bigint, i: int) => i > 0);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0400
     * @tc.name testBigInt64ArraySomeOne040
     * @tc.desc Verify some never observes a negative index during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n]);
      let res = arr.some((e: bigint, i: int) => i < 0);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0410
     * @tc.name testBigInt64ArraySomeOne041
     * @tc.desc Verify some callback can access the array parameter to check element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([888n]);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array) => a[0] === 888n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0420
     * @tc.name testBigInt64ArraySomeOne042
     * @tc.desc Verify some callback can read the first element from the array parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([888n, 999n]);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array) => a[0] === 888n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0430
     * @tc.name testBigInt64ArraySomeOne043
     * @tc.desc Verify some callback can read the second element from the array parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([888n, 999n]);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array) => a[1] === 999n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0440
     * @tc.name testBigInt64ArraySomeOne044
     * @tc.desc Verify some callback confirms that array[index] equals current element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array) => a[i] === e);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0450
     * @tc.name testBigInt64ArraySomeOne045
     * @tc.desc Verify some stops immediately when the first element satisfies the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -20n]);
      let callCount = 0;
      let res = arr.some((e: bigint, i: int, a: BigInt64Array): boolean => {
        callCount++;
        return a[0] === -10n;
      });
      expect(res).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0460
     * @tc.name testBigInt64ArraySomeOne046
     * @tc.desc Verify some matches when both index and element conditions are satisfied together.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n, 7n]);
      let res = arr.some((e: bigint, i: int) => i >= 2 && e === 7n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0470
     * @tc.name testBigInt64ArraySomeOne047
     * @tc.desc Verify some matches the last element via value comparison on a three-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array) => e === 30n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0480
     * @tc.name testBigInt64ArraySomeOne048
     * @tc.desc Verify some callback can compare the first and second array elements via array param.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array) => a[0] === a[1]);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0490
     * @tc.name testBigInt64ArraySomeOne049
     * @tc.desc Verify some callback can modify an unvisited element to create a future match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n]);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array): boolean => {
        if (i === 0) {
          a[3] = -1n;
          return false;
        }
        if (i === 3) {
          return e === -1n;
        }
        return false;
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0500
     * @tc.name testBigInt64ArraySomeOne050
     * @tc.desc Verify some callback modifying an already-visited element does not re-trigger match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let callCount = 0;
      let res = arr.some((e: bigint, i: int, a: BigInt64Array): boolean => {
        callCount++;
        if (i === 2) {
          a[0] = -99n;
        }
        return e === -99n;
      });
      expect(res).assertFalse();
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0510
     * @tc.name testBigInt64ArraySomeOne051
     * @tc.desc Verify some propagates an Error thrown from the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.some((e: bigint) => { throw new Error('test error'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0520
     * @tc.name testBigInt64ArraySomeOne052
     * @tc.desc Verify some propagates a RangeError thrown mid-iteration and stops visiting.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let visited = 0;
      try {
        arr.some((e: bigint) => { visited++; if (e === 20n) { throw new RangeError('out of range'); } return false; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(visited).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0530
     * @tc.name testBigInt64ArraySomeOne053
     * @tc.desc Verify some propagates a TypeError thrown from the callback on the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      try {
        arr.some((e: bigint) => { throw new TypeError('type error'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0540
     * @tc.name testBigInt64ArraySomeOne054
     * @tc.desc Verify some does not continue iteration after the callback throws.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let callCount = 0;
      try {
        arr.some((e: bigint) => { callCount++; if (callCount === 3) { throw new Error('stop'); } return false; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0550
     * @tc.name testBigInt64ArraySomeOne055
     * @tc.desc Verify some propagates an error with a non-English message.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      try {
        arr.some((e: bigint) => { throw new Error('中断错误'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('中断错误');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0560
     * @tc.name testBigInt64ArraySomeOne056
     * @tc.desc Verify some with a 500-element array matches the first element and short-circuits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(500);
      for (let i = 0; i < 500; i++) {
        arr[i] = BigInt(i);
      }
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 0n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0570
     * @tc.name testBigInt64ArraySomeOne057
     * @tc.desc Verify some with a 300-element array iterates all elements when no match exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(300);
      for (let i = 0; i < 300; i++) {
        arr[i] = BigInt(i);
      }
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === -1n; });
      expect(res).assertFalse();
      expect(callCount).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0580
     * @tc.name testBigInt64ArraySomeOne058
     * @tc.desc Verify some with a 200-element array matches the last element and traverses all.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(200);
      for (let i = 0; i < 200; i++) {
        arr[i] = BigInt(i + 100);
      }
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 299n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0590
     * @tc.name testBigInt64ArraySomeOne059
     * @tc.desc Verify some with a 1000-element array matches a middle element and short-circuits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr[i] = BigInt(i);
      }
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 500n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(501);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0600
     * @tc.name testBigInt64ArraySomeOne060
     * @tc.desc Verify some with a 50-element array of negative values finds a match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = BigInt(-i - 1);
      }
      let res = arr.some((e: bigint) => e === -25n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0610
     * @tc.name testBigInt64ArraySomeOne061
     * @tc.desc Verify some on an array with non-zero byteOffset returns correct result for elements in view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigInt64Array(buffer);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      fullView[3] = 400n;
      let arr = new BigInt64Array(buffer, 8, 2);
      let res = arr.some((e: bigint) => e === 200n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0620
     * @tc.name testBigInt64ArraySomeOne062
     * @tc.desc Verify some on a non-zero byteOffset array uses index starting from 0 regardless of offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigInt64Array(buffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      let arr = new BigInt64Array(buffer, 16, 1);
      let res = arr.some((e: bigint, i: int) => i === 0 && e === 30n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0630
     * @tc.name testBigInt64ArraySomeOne063
     * @tc.desc Verify some on a non-zero byteOffset array has correct length parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(48);
      let fullView = new BigInt64Array(buffer);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 4n;
      fullView[4] = 5n;
      fullView[5] = 6n;
      let arr = new BigInt64Array(buffer, 16, 3);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array) => a[2] === 5n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0640
     * @tc.name testBigInt64ArraySomeOne064
     * @tc.desc Verify some on offset+length view returns false when target is outside the view range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigInt64Array(buffer);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      fullView[3] = 400n;
      let arr = new BigInt64Array(buffer, 8, 2);
      let res = arr.some((e: bigint) => e === 400n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0650
     * @tc.name testBigInt64ArraySomeOne065
     * @tc.desc Verify some with byteOffset view where the matching element is at the last position in view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let fullView = new BigInt64Array(buffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      let arr = new BigInt64Array(buffer, 8, 2);
      let res = arr.some((e: bigint) => e === 30n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0660
     * @tc.name testBigInt64ArraySomeOne066
     * @tc.desc Verify some with byteOffset view iterates only elements within the view length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(40);
      let fullView = new BigInt64Array(buffer);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 4n;
      fullView[4] = 5n;
      let arr = new BigInt64Array(buffer, 8, 3);
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return false; });
      expect(res).assertFalse();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0670
     * @tc.name testBigInt64ArraySomeOne067
     * @tc.desc Verify some on a subarray finds a matching element within the subarray range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 5n, 8n, 2n]);
      let sub = arr.subarray(1, 4);
      let res = sub.some((e: bigint) => e === 8n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0680
     * @tc.name testBigInt64ArraySomeOne068
     * @tc.desc Verify some on a subarray does not find an element outside the subarray range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 5n, 8n, 2n]);
      let sub = arr.subarray(1, 3);
      let res = sub.some((e: bigint) => e === 10n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0690
     * @tc.name testBigInt64ArraySomeOne069
     * @tc.desc Verify some on a zero-length subarray returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 5n, 8n]);
      let sub = arr.subarray(1, 1);
      let res = sub.some((e: bigint) => true);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0700
     * @tc.name testBigInt64ArraySomeOne070
     * @tc.desc Verify some after with operation on a copy finds the modified element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let modified = arr.with(1, 99n);
      let res = modified.some((e: bigint) => e === 99n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0710
     * @tc.name testBigInt64ArraySomeOne071
     * @tc.desc Verify some after sort finds an element in the sorted array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 10n, 30n, 20n, 40n]);
      arr.sort();
      let res = arr.some((e: bigint) => e === 10n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0720
     * @tc.name testBigInt64ArraySomeOne072
     * @tc.desc Verify some after fill detects the filled value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.fill(99n, 1, 3);
      let res = arr.some((e: bigint) => e === 99n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0730
     * @tc.name testBigInt64ArraySomeOne073
     * @tc.desc Verify some after copyWithin detects the copied value at the target position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(0, 2, 4);
      let res = arr.some((e: bigint) => e === 30n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0740
     * @tc.name testBigInt64ArraySomeOne074
     * @tc.desc Verify some after reverse finds the relocated element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.reverse();
      let res = arr.some((e: bigint) => e === 10n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0750
     * @tc.name testBigInt64ArraySomeOne075
     * @tc.desc Verify consecutive some calls on the same array produce consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      let res1 = arr.some((e: bigint) => e === 15n);
      let res2 = arr.some((e: bigint) => e === 15n);
      expect(res1).assertTrue();
      expect(res2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0760
     * @tc.name testBigInt64ArraySomeOne076
     * @tc.desc Verify some result can be used in a conditional statement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let found = arr.some((e: bigint) => e > 1n);
      let result = found ? 100n : 0n;
      expect(result).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0770
     * @tc.name testBigInt64ArraySomeOne077
     * @tc.desc Verify some identifies no negative value in an all-positive array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.some((e: bigint) => e < 0n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0780
     * @tc.name testBigInt64ArraySomeOne078
     * @tc.desc Verify some with complex logical condition in predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 0n, 5n, 10n]);
      let res = arr.some((e: bigint) => e > 0n && e < 8n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0790
     * @tc.name testBigInt64ArraySomeOne079
     * @tc.desc Verify some predicate can perform bigint arithmetic comparison.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 5n, 7n]);
      let res = arr.some((e: bigint) => e * 2n === 10n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0800
     * @tc.name testBigInt64ArraySomeOne080
     * @tc.desc Verify some matches in an array with alternating values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 1n, -1n, 1n]);
      let res = arr.some((e: bigint) => e === -1n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0810
     * @tc.name testBigInt64ArraySomeOne081
     * @tc.desc Verify some does not match when checking for MAX+1n in an array containing MAX.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n, 1n]);
      let maxVal: bigint = 9223372036854775807n;
      let res = arr.some((e: bigint) => e === maxVal + 1n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0820
     * @tc.name testBigInt64ArraySomeOne082
     * @tc.desc Verify some does not match when checking for MIN-1n in an array containing MIN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 0n, -1n]);
      let minVal: bigint = -9223372036854775808n;
      let res = arr.some((e: bigint) => e === minVal - 1n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0830
     * @tc.name testBigInt64ArraySomeOne083
     * @tc.desc Verify some with a predicate that modifies an outer boolean flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let flag = false;
      let res = arr.some((e: bigint) => { if (e === 2n) { flag = true; return true; } return false; });
      expect(res).assertTrue();
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0840
     * @tc.name testBigInt64ArraySomeOne084
     * @tc.desc Verify some predicate comparing with a BigInt-constructed value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let target = BigInt(20);
      let res = arr.some((e: bigint) => e === target);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0850
     * @tc.name testBigInt64ArraySomeOne085
     * @tc.desc Verify some with nested conditional returns in predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.some((e: bigint): boolean => {
        if (e > 2n) {
          return e < 4n;
        }
        return false;
      });
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0860
     * @tc.name testBigInt64ArraySomeOne086
     * @tc.desc Verify some predicate using modulo-like check with division and multiplication.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n]);
      let res = arr.some((e: bigint) => e / 7n * 7n === e);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0870
     * @tc.name testBigInt64ArraySomeOne087
     * @tc.desc Verify some predicate evaluates NOT-equal condition correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.some((e: bigint) => e !== 10n && e !== 20n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0880
     * @tc.name testBigInt64ArraySomeOne088
     * @tc.desc Verify some predicate with greater-than-or-equal comparison.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.some((e: bigint) => e >= 4n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0890
     * @tc.name testBigInt64ArraySomeOne089
     * @tc.desc Verify some on two views sharing the same buffer produce independent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let view1 = new BigInt64Array(buffer, 0, 2);
      let view2 = new BigInt64Array(buffer, 16, 1);
      view1[0] = 100n;
      view1[1] = 200n;
      view2[0] = 300n;
      let res1 = view1.some((e: bigint) => e === 100n);
      let res2 = view2.some((e: bigint) => e === 300n);
      expect(res1).assertTrue();
      expect(res2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0900
     * @tc.name testBigInt64ArraySomeOne090
     * @tc.desc Verify some on parent view after child view modification finds the new value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let parent = new BigInt64Array(buffer);
      parent[0] = 1n;
      parent[1] = 2n;
      parent[2] = 3n;
      let child = new BigInt64Array(buffer, 8, 1);
      child[0] = 99n;
      let res = parent.some((e: bigint) => e === 99n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0910
     * @tc.name testBigInt64ArraySomeOne091
     * @tc.desc Verify some on different offsets of the same buffer see different data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let full = new BigInt64Array(buffer);
      full[0] = 10n;
      full[1] = 20n;
      full[2] = 30n;
      full[3] = 40n;
      let viewA = new BigInt64Array(buffer, 0, 2);
      let viewB = new BigInt64Array(buffer, 16, 2);
      let resA = viewA.some((e: bigint) => e === 20n);
      let resB = viewB.some((e: bigint) => e === 20n);
      expect(resA).assertTrue();
      expect(resB).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0920
     * @tc.name testBigInt64ArraySomeOne092
     * @tc.desc Verify some on parent buffer after modifying through offset view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let full = new BigInt64Array(buffer);
      full[0] = 1n;
      full[1] = 2n;
      let offsetView = new BigInt64Array(buffer, 8, 1);
      offsetView[0] = 99n;
      let res = full.some((e: bigint) => e === 99n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0930
     * @tc.name testBigInt64ArraySomeOne093
     * @tc.desc Verify some on all three views of a shared buffer reading consistent data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let v1 = new BigInt64Array(buffer, 0, 4);
      v1[0] = 10n;
      v1[1] = 20n;
      v1[2] = 30n;
      v1[3] = 40n;
      let v2 = new BigInt64Array(buffer, 8, 2);
      let v3 = new BigInt64Array(buffer, 24, 1);
      let res2 = v2.some((e: bigint) => e === 30n);
      let res3 = v3.some((e: bigint) => e === 40n);
      expect(res2).assertTrue();
      expect(res3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0940
     * @tc.name testBigInt64ArraySomeOne094
     * @tc.desc Verify some on a very large array (10000 elements) matches first element quickly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10000);
      for (let i = 0; i < 10000; i++) {
        arr[i] = BigInt(i);
      }
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 0n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0950
     * @tc.name testBigInt64ArraySomeOne095
     * @tc.desc Verify some finds a match in an array with repeated MAX values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n, 9223372036854775807n, 2n]);
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === 9223372036854775807n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0960
     * @tc.name testBigInt64ArraySomeOne096
     * @tc.desc Verify some finds a match in an array with repeated MIN values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -9223372036854775808n, -9223372036854775808n, 1n]);
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === -9223372036854775808n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0970
     * @tc.name testBigInt64ArraySomeOne097
     * @tc.desc Verify some with mixed extreme values finds the first extreme match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 9223372036854775807n, -9223372036854775808n]);
      let callCount = 0;
      let res = arr.some((e: bigint) => { callCount++; return e === -9223372036854775808n; });
      expect(res).assertTrue();
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0980
     * @tc.name testBigInt64ArraySomeOne098
     * @tc.desc Verify some on a non-empty array does not modify the original array elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.some((e: bigint) => e === 99n);
      expect(res).assertFalse();
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_0990
     * @tc.name testBigInt64ArraySomeOne099
     * @tc.desc Verify some with MAX and MIN in same array can match MIN at position 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 0n, 9223372036854775807n]);
      let res = arr.some((e: bigint) => e === -9223372036854775808n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1000
     * @tc.name testBigInt64ArraySomeOne100
     * @tc.desc Verify some on a sorted array finds the middle element efficiently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n]);
      let callCount = 0;
      let res = arr.some((e: bigint): boolean => {
        callCount++;
        return e === 4n;
      });
      expect(res).assertTrue();
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1010
     * @tc.name testBigInt64ArraySomeOne101
     * @tc.desc Verify some with boolean result chaining across two arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n, 3n]);
      let arr2 = new BigInt64Array([4n, 5n, 6n]);
      let res = arr1.some((e: bigint) => e === 2n) && arr2.some((e: bigint) => e === 5n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1020
     * @tc.name testBigInt64ArraySomeOne102
     * @tc.desc Verify nested some calls on two independent arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n]);
      let arr2 = new BigInt64Array([10n, 20n]);
      let res = arr1.some((e1: bigint) => arr2.some((e2: bigint) => e2 === e1 * 10n));
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1030
     * @tc.name testBigInt64ArraySomeOne103
     * @tc.desc Verify some inside a conditional assigns the correct value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 0n, 5n]);
      let status = 0;
      if (arr.some((e: bigint) => e > 0n)) {
        status = 1;
      } else {
        status = -1;
      }
      expect(status).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1040
     * @tc.name testBigInt64ArraySomeOne104
     * @tc.desc Verify some result assigned to a typed variable for later use.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let found: boolean = arr.some((e: bigint) => e === 2n);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1050
     * @tc.name testBigInt64ArraySomeOne105
     * @tc.desc Verify some with index-dependent condition spanning the full array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n, 400n]);
      let res = arr.some((e: bigint, i: int) => BigInt(i + 1) * 100n === e);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1060
     * @tc.name testBigInt64ArraySomeOne106
     * @tc.desc Verify some() callback throwing exception preserves array state and reports correct call count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let callCount = 0;
      try {
        arr.some((e: bigint, i: int): boolean => {
          callCount++;
          if (i === 2) {
            throw new Error('test error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr[0]).assertEqual(10n);
      expect(arr[4]).assertEqual(50n);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1070
     * @tc.name testBigInt64ArraySomeOne107
     * @tc.desc Verify some callback can reference an outer-scope variable via closure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let threshold: bigint = 2n;
      let result = arr.some((element: bigint): boolean => {
        return element > threshold;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1080
     * @tc.name testBigInt64ArraySomeOne108
     * @tc.desc Verify some with closure variable returns false when no element matches the threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let threshold: bigint = 10n;
      let result = arr.some((element: bigint): boolean => {
        return element > threshold;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_ONE_1090
     * @tc.name testBigInt64ArraySomeOne109
     * @tc.desc Verify some callback receives correct sequential indices even when index param is modified.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeOne109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let indices: int[] = [];
      arr.some((element: bigint, index: int): boolean => {
        indices.push(index);
        index = 999;
        return false;
      });
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

  });
}
