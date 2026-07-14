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

export default function BigInt64ArrayEvery01Test(): void {
  describe('BigInt64ArrayEvery01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0100
     * @tc.name testBigInt64ArrayEveryOne0100
     * @tc.desc Verify `arr.every(() => { return true; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.every(() => {
        return true;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0200
     * @tc.name testBigInt64ArrayEveryOne0200
     * @tc.desc Verify `arr.every((e) => { return e > 0n; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.every((e: bigint) => {
        return e > 0n;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0300
     * @tc.name testBigInt64ArrayEveryOne0300
     * @tc.desc Verify `arr.every((e, index) => { return index >= 0; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.every((e: bigint, index: int) => {
        return index >= 0;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0400
     * @tc.name testBigInt64ArrayEveryOne0400
     * @tc.desc Verify `arr.every((e, index, a) => { return a.length === 3; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.every((e: bigint, index: int, a: BigInt64Array) => {
        return a.length === 3;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0500
     * @tc.name testBigInt64ArrayEveryOne0500
     * @tc.desc Verify `arr.every((e) => { return e === 0n; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.every((e: bigint) => {
        return e === 0n;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0600
     * @tc.name testBigInt64ArrayEveryOne0600
     * @tc.desc Verify `arr.every((e) => { return e !== 0n; })` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.every((e: bigint) => {
        return e !== 0n;
      });
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0700
     * @tc.name testBigInt64ArrayEveryOne0700
     * @tc.desc Verify `arr.every((e) => { return e === 1n; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.every((e: bigint) => {
        return e === 1n;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0800
     * @tc.name testBigInt64ArrayEveryOne0800
     * @tc.desc Verify `arr.every((e) => { return e !== 1n; })` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.every((e: bigint) => {
        return e !== 1n;
      });
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_0900
     * @tc.name testBigInt64ArrayEveryOne0900
     * @tc.desc Verify `arr.every((e) => { return e === -1n; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.every((e: bigint) => {
        return e === -1n;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1000
     * @tc.name testBigInt64ArrayEveryOne1000
     * @tc.desc Verify `arr.every((e) => { return e !== -1n; })` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let res = arr.every((e: bigint) => {
        return e !== -1n;
      });
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1100
     * @tc.name testBigInt64ArrayEveryOne1100
     * @tc.desc Verify `arr.every((e) => { return e === 9223372036854775807n; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.every((e: bigint) => {
        return e === 9223372036854775807n;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1200
     * @tc.name testBigInt64ArrayEveryOne1200
     * @tc.desc Verify `arr.every((e) => { return e !== 9223372036854775807n; })` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.every((e: bigint) => {
        return e !== 9223372036854775807n;
      });
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1300
     * @tc.name testBigInt64ArrayEveryOne1300
     * @tc.desc Verify `arr.every((e) => { return e === -9223372036854775808n; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.every((e: bigint) => {
        return e === -9223372036854775807n - 1n;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1400
     * @tc.name testBigInt64ArrayEveryOne1400
     * @tc.desc Verify `arr.every((e) => { return e !== -9223372036854775808n; })` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.every((e: bigint) => {
        return e !== -9223372036854775807n - 1n;
      });
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1500
     * @tc.name testBigInt64ArrayEveryOne1500
     * @tc.desc Verify `arr.every((e) => { return e === -9223372036854775807n; })` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      let res = arr.every((e: bigint) => {
        return e === -9223372036854775807n;
      });
      expect(res).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1600
     * @tc.name testBigInt64ArrayEveryOne1600
     * @tc.desc Verify `arr.every((e) => { return e !== -9223372036854775807n; })` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      let res = arr.every((e: bigint) => {
        return e !== -9223372036854775807n;
      });
      expect(res).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1700
     * @tc.name testBigInt64ArrayEveryOne1700
     * @tc.desc Verify `arr.every((e, i) => { sum += i; return true; })` produces a result where `sum` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sum = 0;
      arr.every((e: bigint, i: int) => {
        sum += i;
        return true;
      });
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1800
     * @tc.name testBigInt64ArrayEveryOne1800
     * @tc.desc Verify `arr.every((e, i) => { lastIndex = i; return true; })` produces a result where `lastIndex` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n]);
      let lastIndex = -1;
      arr.every((e: bigint, i: int) => {
        lastIndex = i;
        return true;
      });
      expect(lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_1900
     * @tc.name testBigInt64ArrayEveryOne1900
     * @tc.desc Verify `arr.every((e, i, a) => { isSame = isSame && (a === arr); return true; })` produces a result where `isSame` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let isSame = true;
      arr.every((e: bigint, i: int, a: BigInt64Array) => {
        isSame = isSame && (a === arr);
        return true;
      });
      expect(isSame).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_2000
     * @tc.name testBigInt64ArrayEveryOne2000
     * @tc.desc Verify `arr.every((e, i, a) => { a.$_set(1, 99n); return true; })` produces a result where `arr.every((e, i, a) => { a.$_set(1, 99n); return true; })` is true, `new BigInt64Array([1n, 2n]).$_get(1)` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let res = arr.every((e: bigint, i: int, a: BigInt64Array) => {
        a.$_set(1, 99n);
        return true;
      });
      expect(res).assertEqual(true);
      expect(arr.$_get(1)).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_2100
     * @tc.name testBigInt64ArrayEveryOne2100
     * @tc.desc Verify `arr.every((e) => { called = true; return false; })` produces a result where `arr.every((e) => { called = true; return false; })` is true, `called` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let called = false;
      let res = arr.every((e: bigint) => {
        called = true;
        return false;
      });
      expect(res).assertEqual(true);
      expect(called).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_2200
     * @tc.name testBigInt64ArrayEveryOne2200
     * @tc.desc Verify `arr.every((e) => { count++; return false; })` produces a result where `arr.every((e) => { count++; return false; })` is false, `count` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let count = 0;
      let res = arr.every((e: bigint) => {
        count++;
        return false;
      });
      expect(res).assertEqual(false);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_2300
     * @tc.name testBigInt64ArrayEveryOne2300
     * @tc.desc Verify `arr.every((e) => { count++; return e === 1n; })` produces a result where `arr.every((e) => { count++; return e === 1n; })` is false, `count` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let count = 0;
      let res = arr.every((e: bigint) => {
        count++;
        return e === 1n;
      });
      expect(res).assertEqual(false);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_ONE_2400
     * @tc.name testBigInt64ArrayEveryOne2400
     * @tc.desc Verify `arr.every((e) => { count++; return e !== 0n; })` produces a result where `arr.every((e) => { count++; return e !== 0n; })` is false, `count` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 0n, 1n]);
      let count = 0;
      let res = arr.every((e: bigint) => {
        count++;
        return e !== 0n;
      });
      expect(res).assertEqual(false);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_2500
     * @tc.name testBigInt64ArrayEveryTwo2500
     * @tc.desc Verify `arr.every(v => v > 0n)` produces a result where `typeof arr.every(v => v > 0n)` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let result = arr.every(v => v > 0n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_2600
     * @tc.name testBigInt64ArrayEveryTwo2600
     * @tc.desc Verify `arr.every(v => v < 0n)` produces a result where `typeof arr.every(v => v < 0n)` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n]);
      let result = arr.every(v => v < 0n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_2700
     * @tc.name testBigInt64ArrayEveryTwo2700
     * @tc.desc Verify `arr.every(v => v === 0n)` produces a result where `typeof arr.every(v => v === 0n)` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let result = arr.every(v => v === 0n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_2800
     * @tc.name testBigInt64ArrayEveryTwo2800
     * @tc.desc Verify `arr.every(v => v > 50n)` produces a result where `typeof arr.every(v => v > 50n)` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let result = arr.every(v => v > 50n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_2900
     * @tc.name testBigInt64ArrayEveryTwo2900
     * @tc.desc Verify `arr.every(v => v === 300n)` produces a result where `typeof arr.every(v => v === 300n)` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([300n, 400n]);
      let result = arr.every(v => v === 300n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3000
     * @tc.name testBigInt64ArrayEveryTwo3000
     * @tc.desc Verify `arr.every(v => v > 0n)` produces a result where `typeof arr.every(v => v > 0n)` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let result = arr.every(v => v > 0n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3100
     * @tc.name testBigInt64ArrayEveryTwo3100
     * @tc.desc Verify `arr.every(v => v < 0n)` produces a result where `typeof arr.every(v => v < 0n)` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let result = arr.every(v => v < 0n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3200
     * @tc.name testBigInt64ArrayEveryTwo3200
     * @tc.desc Verify `arr.every((v, i) => i >= 0)` produces a result where `typeof arr.every((v, i) => i >= 0)` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n]);
      let result = arr.every((v, i) => i >= 0);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3300
     * @tc.name testBigInt64ArrayEveryTwo3300
     * @tc.desc Verify `arr.every(v => v < 0xan)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.every(v => v < 10n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3400
     * @tc.name testBigInt64ArrayEveryTwo3400
     * @tc.desc Verify `arr.every(v => v > 0b1n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 2n]);
      let result = arr.every(v => v > 1n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3500
     * @tc.name testBigInt64ArrayEveryTwo3500
     * @tc.desc Verify `arr.every(v => v < 0n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let result = arr.every(v => v < 0n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3600
     * @tc.name testBigInt64ArrayEveryTwo3600
     * @tc.desc Verify `arr.every(v => v > 0n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let result = arr.every(v => v > 0n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3700
     * @tc.name testBigInt64ArrayEveryTwo3700
     * @tc.desc Verify `arr.every(v => v === 0n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let result = arr.every(v => v === 0n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3800
     * @tc.name testBigInt64ArrayEveryTwo3800
     * @tc.desc Verify `arr.every(v => v === 9223372036854775807n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let result = arr.every(v => v === 9223372036854775807n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_3900
     * @tc.name testBigInt64ArrayEveryTwo3900
     * @tc.desc Verify `arr.every(v => v === -9223372036854775808n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let result = arr.every(v => v === -9223372036854775807n - 1n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4000
     * @tc.name testBigInt64ArrayEveryTwo4000
     * @tc.desc Verify `arr.every((v, i) => i < 3)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 12n, 13n]);
      let result = arr.every((v, i) => i < 3);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4100
     * @tc.name testBigInt64ArrayEveryTwo4100
     * @tc.desc Verify `arr.every((v, i, a) => a.length === 2)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([101n, 102n]);
      let result = arr.every((v, i, a) => a.length === 2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4200
     * @tc.name testBigInt64ArrayEveryTwo4200
     * @tc.desc Verify `arr.every(v => (v + 1n) === 51n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n]);
      let result = arr.every(v => (v + 1n) === 51n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4300
     * @tc.name testBigInt64ArrayEveryTwo4300
     * @tc.desc Verify `arr.every(v => (v % 2n) === 0n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      let result = arr.every(v => (v % 2n) === 0n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4400
     * @tc.name testBigInt64ArrayEveryTwo4400
     * @tc.desc Verify `arr.every(v => (v % 2n) !== 0n)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 5n, 7n]);
      let result = arr.every(v => (v % 2n) !== 0n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4500
     * @tc.name testBigInt64ArrayEveryTwo4500
     * @tc.desc Verify `arr.every(v => true)` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([55n, 65n]);
      let result = arr.every(v => true);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4600
     * @tc.name testBigInt64ArrayEveryTwo4600
     * @tc.desc Verify `arr.every(v => v < 0n)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, 10n]);
      let result = arr.every(v => v < 0n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4700
     * @tc.name testBigInt64ArrayEveryTwo4700
     * @tc.desc Verify `arr.every(v => v > 0n)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n]);
      let result = arr.every(v => v > 0n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4800
     * @tc.name testBigInt64ArrayEveryTwo4800
     * @tc.desc Verify `arr.every(v => v > -100n)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -10n]);
      let result = arr.every(v => v > -100n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_4900
     * @tc.name testBigInt64ArrayEveryTwo4900
     * @tc.desc Verify `arr.every(v => false)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([12n, 13n]);
      let result = arr.every(v => false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5000
     * @tc.name testBigInt64ArrayEveryTwo5000
     * @tc.desc Verify `arr.every(v => (v % 2n) === 0n)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 3n]);
      let result = arr.every(v => (v % 2n) === 0n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5100
     * @tc.name testBigInt64ArrayEveryTwo5100
     * @tc.desc Verify `arr.every(v => (v % 2n) !== 0n)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n]);
      let result = arr.every(v => (v % 2n) !== 0n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5200
     * @tc.name testBigInt64ArrayEveryTwo5200
     * @tc.desc Verify `arr.every(v => v > -2n)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let result = arr.every(v => v > -2n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5300
     * @tc.name testBigInt64ArrayEveryTwo5300
     * @tc.desc Verify `arr.every(v => v === 77n)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([77n, 88n]);
      let result = arr.every(v => v === 77n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5400
     * @tc.name testBigInt64ArrayEveryTwo5400
     * @tc.desc Verify `arr.every((v, i) => i > 0)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([31n, 32n, 33n]);
      let result = arr.every((v, i) => i > 0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5500
     * @tc.name testBigInt64ArrayEveryTwo5500
     * @tc.desc Verify `arr.every((v, i, a) => a.length === 1)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([41n, 42n]);
      let result = arr.every((v, i, a) => a.length === 1);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5600
     * @tc.name testBigInt64ArrayEveryTwo5600
     * @tc.desc Verify `arr.every(v => v === 0n)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n]);
      let result = arr.every(v => v === 0n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5700
     * @tc.name testBigInt64ArrayEveryTwo5700
     * @tc.desc Verify `arr41.every(v => { count41++; return v > 20n; })` produces a result where `count41` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count41 = 0;
      let arr41 = new BigInt64Array([11n, 12n, 13n]);
      arr41.every(v => {
        count41++;
        return v > 20n;
      });
      expect(count41).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5800
     * @tc.name testBigInt64ArrayEveryTwo5800
     * @tc.desc Verify `arr42.every(v => { count42++; return v < 15n; })` produces a result where `count42` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count42 = 0;
      let arr42 = new BigInt64Array([14n, 15n, 16n]);
      arr42.every(v => {
        count42++;
        return v < 15n;
      });
      expect(count42).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_5900
     * @tc.name testBigInt64ArrayEveryTwo5900
     * @tc.desc Verify `arr43.every(v => { count43++; return v < 19n; })` produces a result where `count43` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count43 = 0;
      let arr43 = new BigInt64Array([17n, 18n, 19n]);
      arr43.every(v => {
        count43++;
        return v < 19n;
      });
      expect(count43).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6000
     * @tc.name testBigInt64ArrayEveryTwo6000
     * @tc.desc Verify `arr44.every(v => { count44++; return v > 0n; })` produces a result where `count44` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count44 = 0;
      let arr44 = new BigInt64Array([21n, 22n, 23n]);
      arr44.every(v => {
        count44++;
        return v > 0n;
      });
      expect(count44).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6100
     * @tc.name testBigInt64ArrayEveryTwo6100
     * @tc.desc Verify `arr45.every(v => { sum45 += v; return v < 20n; })` produces a result where `sum45` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum45 = 0n;
      let arr45 = new BigInt64Array([30n, 40n, 50n]);
      arr45.every(v => {
        sum45 += v;
        return v < 20n;
      });
      expect(sum45).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6200
     * @tc.name testBigInt64ArrayEveryTwo6200
     * @tc.desc Verify `arr46.every(v => { sum46 += v; return v < 70n; })` produces a result where `sum46` equals `130n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum46 = 0n;
      let arr46 = new BigInt64Array([60n, 70n, 80n]);
      arr46.every(v => {
        sum46 += v;
        return v < 70n;
      });
      expect(sum46).assertEqual(130n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6300
     * @tc.name testBigInt64ArrayEveryTwo6300
     * @tc.desc Verify `arr47.every(v => { mul47 *= v; return v < 3n; })` produces a result where `mul47` equals `6n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mul47 = 1n;
      let arr47 = new BigInt64Array([2n, 3n, 4n]);
      arr47.every(v => {
        mul47 *= v;
        return v < 3n;
      });
      expect(mul47).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6400
     * @tc.name testBigInt64ArrayEveryTwo6400
     * @tc.desc Verify `arr48.every(v => { resArr48.push(v); return v < 50n; })` produces a result where `resArr48.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resArr48: bigint[] = [];
      let arr48 = new BigInt64Array([50n, 60n, 70n]);
      arr48.every(v => {
        resArr48.push(v);
        return v < 50n;
      });
      expect(resArr48.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6500
     * @tc.name testBigInt64ArrayEveryTwo6500
     * @tc.desc Verify `arr49.every(v => { resArr49.push(v); return v < 66n; })` produces a result where `resArr49.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resArr49: bigint[] = [];
      let arr49 = new BigInt64Array([55n, 66n, 77n]);
      arr49.every(v => {
        resArr49.push(v);
        return v < 66n;
      });
      expect(resArr49.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6600
     * @tc.name testBigInt64ArrayEveryTwo6600
     * @tc.desc Verify `arr50.every(v => { resArr50.push(v); return v < 111n; })` produces a result where `resArr50.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let resArr50: bigint[] = [];
      let arr50 = new BigInt64Array([88n, 99n, 111n]);
      arr50.every(v => {
        resArr50.push(v);
        return v < 111n;
      });
      expect(resArr50.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6700
     * @tc.name testBigInt64ArrayEveryTwo6700
     * @tc.desc Verify `arr51.every((v, i) => { maxIndex51 = i; return v < 80n; })` produces a result where `maxIndex51` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIndex51 = -1;
      let arr51 = new BigInt64Array([80n, 90n, 100n]);
      arr51.every((v, i) => {
        maxIndex51 = i;
        return v < 80n;
      });
      expect(maxIndex51).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6800
     * @tc.name testBigInt64ArrayEveryTwo6800
     * @tc.desc Verify `arr52.every((v, i) => { maxIndex52 = i; return v < 95n; })` produces a result where `maxIndex52` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxIndex52 = -1;
      let arr52 = new BigInt64Array([85n, 95n, 105n]);
      arr52.every((v, i) => {
        maxIndex52 = i;
        return v < 95n;
      });
      expect(maxIndex52).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_6900
     * @tc.name testBigInt64ArrayEveryTwo6900
     * @tc.desc Verify `arr53.every(v => { count53++; return v > 0n; })` produces a result where `count53` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count53 = 0;
      let arr53 = new BigInt64Array([-5n, 6n]);
      arr53.every(v => {
        count53++;
        return v > 0n;
      });
      expect(count53).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7000
     * @tc.name testBigInt64ArrayEveryTwo7000
     * @tc.desc Verify `arr54.every(v => { count54++; return v > 0n; })` produces a result where `count54` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count54 = 0;
      let arr54 = new BigInt64Array([9223372036854775807n, 0n]);
      arr54.every(v => {
        count54++;
        return v > 0n;
      });
      expect(count54).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7100
     * @tc.name testBigInt64ArrayEveryTwo7100
     * @tc.desc Verify `arr55.every(v => { count55++; return true; })` produces a result where `count55` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count55 = 0;
      let arr55 = new BigInt64Array(0);
      arr55.every(v => {
        count55++;
        return true;
      });
      expect(count55).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7200
     * @tc.name testBigInt64ArrayEveryTwo7200
     * @tc.desc Verify `len1.every(v => v > 0n)` produces a result where `new BigInt64Array([1n, 2n]).length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len1 = new BigInt64Array([1n, 2n]);
      len1.every(v => v > 0n);
      expect(len1.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7300
     * @tc.name testBigInt64ArrayEveryTwo7300
     * @tc.desc Verify `len2.every(v => v < 0n)` produces a result where `new BigInt64Array([3n, 4n]).length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len2 = new BigInt64Array([3n, 4n]);
      len2.every(v => v < 0n);
      expect(len2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7400
     * @tc.name testBigInt64ArrayEveryTwo7400
     * @tc.desc Verify `arr58.every(v => v > 0n)` produces a result where `new BigInt64Array([15n, 25n])[0]` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr58 = new BigInt64Array([15n, 25n]);
      arr58.every(v => v > 0n);
      expect(arr58[0]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7500
     * @tc.name testBigInt64ArrayEveryTwo7500
     * @tc.desc Verify `arr60.every(v => true)` produces a result where `new BigInt64Array([10n, 20n, 30n])[2]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr60 = new BigInt64Array([10n, 20n, 30n]);
      arr60.every(v => true);
      expect(arr60[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7600
     * @tc.name testBigInt64ArrayEveryTwo7600
     * @tc.desc Verify `arr61.every((v, i, a) => { innerLen61 = a.length; return true; })` produces a result where `innerLen61` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr61 = new BigInt64Array([5n, 6n]);
      let innerLen61 = 0;
      arr61.every((v, i, a) => {
        innerLen61 = a.length;
        return true;
      });
      expect(innerLen61).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7700
     * @tc.name testBigInt64ArrayEveryTwo7700
     * @tc.desc Verify `arr62.every((v, i, a) => { innerFirst62 = a[0]; return true; })` produces a result where `innerFirst62` equals `8n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr62 = new BigInt64Array([8n, 9n]);
      let innerFirst62 = 0n;
      arr62.every((v, i, a) => {
        innerFirst62 = a[0];
        return true;
      });
      expect(innerFirst62).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7800
     * @tc.name testBigInt64ArrayEveryTwo7800
     * @tc.desc Verify `arr63.every(v => { v = 99n; return true; })` produces a result where `new BigInt64Array([33n])[0]` equals `33n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr63 = new BigInt64Array([33n]);
      arr63.every(v => {
        v = 99n;
        return true;
      });
      expect(arr63[0]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_7900
     * @tc.name testBigInt64ArrayEveryTwo7900
     * @tc.desc Verify `arr64.every(v => { v = 100n; return true; })` produces a result where `new BigInt64Array([11n, 22n])[1]` equals `22n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr64 = new BigInt64Array([11n, 22n]);
      arr64.every(v => {
        v = 100n;
        return true;
      });
      expect(arr64[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8000
     * @tc.name testBigInt64ArrayEveryTwo8000
     * @tc.desc Verify `arr65.every(v => true)` produces a result where `new BigInt64Array([1n, 2n, 3n]).byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr65 = new BigInt64Array([1n, 2n, 3n]);
      arr65.every(v => true);
      expect(arr65.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8100
     * @tc.name testBigInt64ArrayEveryTwo8100
     * @tc.desc Verify `arr66.every(v => false)` produces a result where `new BigInt64Array([1n, 2n]).byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr66 = new BigInt64Array([1n, 2n]);
      arr66.every(v => false);
      expect(arr66.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8200
     * @tc.name testBigInt64ArrayEveryTwo8200
     * @tc.desc Verify `new BigInt64Array([100n, 200n])` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr67 = new BigInt64Array([100n, 200n]);
      try {
        arr67.every((v) => {
          throw new Error('halt');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr67[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8300
     * @tc.name testBigInt64ArrayEveryTwo8300
     * @tc.desc Verify `arr68.every(v => false)` produces a result where `new BigInt64Array(0).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr68 = new BigInt64Array(0);
      arr68.every(v => false);
      expect(arr68.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8400
     * @tc.name testBigInt64ArrayEveryTwo8400
     * @tc.desc Verify `arr70.every(v => true)` produces a result where `new BigInt64Array([0x1fan])[0]` equals `506n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr70 = new BigInt64Array([506n]);
      arr70.every(v => true);
      expect(arr70[0]).assertEqual(506n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8500
     * @tc.name testBigInt64ArrayEveryTwo8500
     * @tc.desc Verify `arr72.every(v => false)` produces a result where `new BigInt64Array([9223372036854775807n])[0]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr72 = new BigInt64Array([9223372036854775807n]);
      arr72.every(v => false);
      expect(arr72[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8600
     * @tc.name testBigInt64ArrayEveryTwo8600
     * @tc.desc Verify `arr73.every(v => true)` produces a result where `new BigInt64Array([-9223372036854775808n])[0]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr73 = new BigInt64Array([-9223372036854775807n - 1n]);
      arr73.every(v => true);
      expect(arr73[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8700
     * @tc.name testBigInt64ArrayEveryTwo8700
     * @tc.desc Verify `arr74.every(v => { new BigInt64Array([1n, 2n]).every(inner => inner > 0n); return true; })` produces a result where `new BigInt64Array([50n, 60n])[0]` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr74 = new BigInt64Array([50n, 60n]);
      arr74.every(v => {
        new BigInt64Array([1n, 2n]).every(inner => inner > 0n);
        return true;
      });
      expect(arr74[0]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_EVERY_TWO_8800
     * @tc.name testBigInt64ArrayEveryTwo8800
     * @tc.desc Verify `arr75.every((v, i, a) => { sum75 += i; return true; })` produces a result where `new BigInt64Array([123n, 456n])[1]` equals `456n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEveryTwo8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr75 = new BigInt64Array([123n, 456n]);
      let sum75 = 0;
      arr75.every((v, i, a) => {
        sum75 += i;
        return true;
      });
      expect(arr75[1]).assertEqual(456n);
    });

  });
}
