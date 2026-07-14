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

export default function BigInt64ArrayFind01Test(): void {
  describe('BigInt64ArrayFind01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0100
     * @tc.name testBigInt64ArrayFindOne0100
     * @tc.desc Verify `arr.find((v, i, a) => v === 9223372036854775807n)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v === 9223372036854775807n);
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0200
     * @tc.name testBigInt64ArrayFindOne0200
     * @tc.desc Verify `arr.find((v, i, a) => v !== 9223372036854775807n)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v !== 9223372036854775807n);
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0300
     * @tc.name testBigInt64ArrayFindOne0300
     * @tc.desc Verify `arr.find((v, i, a) => v === -9223372036854775808n)` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v === -9223372036854775807n - 1n);
      expect(res).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0400
     * @tc.name testBigInt64ArrayFindOne0400
     * @tc.desc Verify `arr.find((v, i, a) => v !== -9223372036854775808n)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v !== -9223372036854775807n - 1n);
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0500
     * @tc.name testBigInt64ArrayFindOne0500
     * @tc.desc Verify `arr.find((v, i, a) => v === 0n)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v === 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0600
     * @tc.name testBigInt64ArrayFindOne0600
     * @tc.desc Verify `arr.find((v, i, a) => v !== 0n)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v !== 0n);
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0700
     * @tc.name testBigInt64ArrayFindOne0700
     * @tc.desc Verify `arr.find((v, i, a) => v === 1n)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v === 1n);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0800
     * @tc.name testBigInt64ArrayFindOne0800
     * @tc.desc Verify `arr.find((v, i, a) => v !== 1n)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v !== 1n);
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_0900
     * @tc.name testBigInt64ArrayFindOne0900
     * @tc.desc Verify `arr.find((v, i, a) => v === -1n)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v === -1n);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_1000
     * @tc.name testBigInt64ArrayFindOne1000
     * @tc.desc Verify `arr.find((v, i, a) => v !== -1n)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.find((v: bigint, i: int, a: BigInt64Array) => v !== -1n);
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_1100
     * @tc.name testBigInt64ArrayFindOne1100
     * @tc.desc Verify `arr.find((v, idx, a) => idx === 0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => idx === 0);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_1200
     * @tc.name testBigInt64ArrayFindOne1200
     * @tc.desc Verify `arr.find((v, idx, a) => idx === 5)` equals `6n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => idx === 5);
      expect(res).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_1300
     * @tc.name testBigInt64ArrayFindOne1300
     * @tc.desc Verify `arr.find((v, idx, a) => idx === 9)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => idx === 9);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_1400
     * @tc.name testBigInt64ArrayFindOne1400
     * @tc.desc Verify `arr.find((v, idx, a) => v === 16n)` equals `16n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([15n, 16n, 17n]);
      let res = arr.find((v: bigint, idx: int, a: BigInt64Array) => v === 16n);
      expect(res).assertEqual(16n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_1500
     * @tc.name testBigInt64ArrayFindOne1500
     * @tc.desc Verify `arr.find((v, idx, a) => { count++; return idx === 0; })` produces a result where `count` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let count = 0;
      arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        count++;
        return idx === 0;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_1600
     * @tc.name testBigInt64ArrayFindOne1600
     * @tc.desc Verify `arr.find((v, idx, a) => { count++; return idx === 3; })` produces a result where `count` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let count = 0;
      arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        count++;
        return idx === 3;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_ONE_1700
     * @tc.name testBigInt64ArrayFindOne1700
     * @tc.desc Verify `arr.find((v, idx, a) => { count++; return idx === 7; })` produces a result where `count` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let count = 0;
      arr.find((v: bigint, idx: int, a: BigInt64Array) => {
        count++;
        return idx === 7;
      });
      expect(count).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_1800
     * @tc.name testBigInt64ArrayFindFour1800
     * @tc.desc Verify find returns 11n when step parity matches odd values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 11n, 12n, 13n, 14n, 15n, 16n]);
      let step = 11n;
      let res = arr.find((v: bigint) => (v % 2n) === (step % 2n));
      expect(res).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_1900
     * @tc.name testBigInt64ArrayFindFour1900
     * @tc.desc Verify find returns 10n when step parity matches even values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 11n, 12n, 13n, 14n, 15n, 16n]);
      let step = 12n;
      let res = arr.find((v: bigint) => (v % 2n) === (step % 2n));
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_2000
     * @tc.name testBigInt64ArrayFindFour2000
     * @tc.desc Verify find receives indices relative to a subarray and the subarray as its array argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let view = root.subarray(1, 4);
      let res = view.find((v: bigint, idx: int, array: BigInt64Array): boolean => {
        return array === view && idx === 1 && v === 30n;
      });
      expect(res).assertEqual(30n);
      expect(root.join()).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_2100
     * @tc.name testBigInt64ArrayFindFour2100
     * @tc.desc Verify a no-match find evaluates every element exactly once.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n, 8n]);
      let calls = 0;
      let res = arr.find((v: bigint): boolean => {
        calls++;
        return v < 0n;
      });
      expect(res).assertEqual(undefined);
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_2200
     * @tc.name testBigInt64ArrayFindFour2200
     * @tc.desc Verify find returns 1n when shifted index sum equals 0 modulo 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.find((v: bigint, idx: int) => (idx + 0) % 5 === 0);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_2300
     * @tc.name testBigInt64ArrayFindFour2300
     * @tc.desc Verify find observes the element order produced by reverse.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 4n, 2n, 5n, 3n]);
      arr.reverse();
      let res = arr.find((v: bigint): boolean => v > 4n);
      expect(res).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_2400
     * @tc.name testBigInt64ArrayFindFour2400
     * @tc.desc Verify find returns the first value written by a partial fill operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.fill(9n, 1, 3);
      let res = arr.find((v: bigint): boolean => v === 9n);
      expect(res).assertEqual(9n);
      expect(arr.join()).assertEqual('1,9,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_2500
     * @tc.name testBigInt64ArrayFindFour2500
     * @tc.desc Verify find distinguishes signed 64-bit boundary values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min = -9223372036854775807n - 1n;
      let max = 9223372036854775807n;
      let arr = new BigInt64Array([min, max]);
      let res = arr.find((v: bigint): boolean => v > 0n);
      expect(res).assertEqual(max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_FOUR_2600
     * @tc.name testBigInt64ArrayFindFour2600
     * @tc.desc Verify find on a view does not inspect elements outside the view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindFour2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root = new BigInt64Array([5n, 10n, 15n, 20n, 25n]);
      let view = root.subarray(1, 4);
      let res = view.find((v: bigint): boolean => v % 10n === 0n);
      expect(res).assertEqual(10n);
      expect(view.byteOffset).assertEqual(8);
    });
  });
}
