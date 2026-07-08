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

export default function BigInt64ArrayAt02Test(): void {
  describe('BigInt64ArrayAt02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0100
     * @tc.name testBigInt64ArrayAtTwo0100
     * @tc.desc Verify `arr.at(0)` produces a result where `typeof arr.at(0)` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let result = arr.at(0);
        expect(typeof result).assertEqual('bigint');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0200
     * @tc.name testBigInt64ArrayAtTwo0200
     * @tc.desc Verify `arr.at(arr.length - 1)` produces a result where `typeof arr.at(arr.length - 1)` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([5n, 10n, 15n]);
        let result = arr.at(arr.length - 1);
        expect(typeof result).assertEqual('bigint');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0300
     * @tc.name testBigInt64ArrayAtTwo0300
     * @tc.desc Verify `arr.at(-1)` produces a result where `typeof arr.at(-1)` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n, 8n, 9n]);
        let result = arr.at(-1);
        expect(typeof result).assertEqual('bigint');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0400
     * @tc.name testBigInt64ArrayAtTwo0400
     * @tc.desc Verify `arr.at(-arr.length)` produces a result where `typeof arr.at(-arr.length)` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let result = arr.at(-arr.length);
        expect(typeof result).assertEqual('bigint');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0500
     * @tc.name testBigInt64ArrayAtTwo0500
     * @tc.desc Verify `arr.at(arr.length)` produces a result where `typeof arr.at(arr.length)` equals `'undefined'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let result = arr.at(arr.length);
        expect(typeof result).assertEqual('undefined');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0600
     * @tc.name testBigInt64ArrayAtTwo0600
     * @tc.desc Verify `arr.at(arr.length + 5)` produces a result where `typeof arr.at(arr.length + 5)` equals `'undefined'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([30n, 40n]);
        let result = arr.at(arr.length + 5);
        expect(typeof result).assertEqual('undefined');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0700
     * @tc.name testBigInt64ArrayAtTwo0700
     * @tc.desc Verify `arr.at(-arr.length - 1)` produces a result where `typeof arr.at(-arr.length - 1)` equals `'undefined'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([50n, 60n]);
        let result = arr.at(-arr.length - 1);
        expect(typeof result).assertEqual('undefined');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0800
     * @tc.name testBigInt64ArrayAtTwo0800
     * @tc.desc Verify `arr.at(0)` produces a result where `typeof arr.at(0)` equals `'undefined'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        let result = arr.at(0);
        expect(typeof result).assertEqual('undefined');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_0900
     * @tc.name testBigInt64ArrayAtTwo0900
     * @tc.desc Verify `arr.at(-1)` produces a result where `typeof arr.at(-1)` equals `'undefined'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        let result = arr.at(-1);
        expect(typeof result).assertEqual('undefined');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1000
     * @tc.name testBigInt64ArrayAtTwo1000
     * @tc.desc Verify `typeof arr.at(0)` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([99n]);
        let resultType = typeof arr.at(0);
        expect(resultType).assertEqual('bigint');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1100
     * @tc.name testBigInt64ArrayAtTwo1100
     * @tc.desc Verify `arr.at(0)` produces a result where `typeof arr.at(0)` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n]);
        let val = arr.at(0) as bigint;
        expect(typeof val).assertEqual('bigint');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1200
     * @tc.name testBigInt64ArrayAtTwo1200
     * @tc.desc Verify `new BigInt64Array([15n, 25n])` produces a result where `arr.at(0)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 25n]);
        expect(arr.at(0)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1300
     * @tc.name testBigInt64ArrayAtTwo1300
     * @tc.desc Verify `new BigInt64Array([255n])` produces a result where `arr.at(0)` equals `255n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([255n]);
        expect(arr.at(0)).assertEqual(255n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1400
     * @tc.name testBigInt64ArrayAtTwo1400
     * @tc.desc Verify `new BigInt64Array([10n])` produces a result where `arr.at(0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n]);
        expect(arr.at(0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1500
     * @tc.name testBigInt64ArrayAtTwo1500
     * @tc.desc Verify `new BigInt64Array([10n])` produces a result where `arr.at(0)` equals `BigInt(10)`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n]);
        expect(arr.at(0)).assertEqual(BigInt(10));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1600
     * @tc.name testBigInt64ArrayAtTwo1600
     * @tc.desc Verify `new BigInt64Array([-99n])` produces a result where `arr.at(0)` equals `-99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-99n]);
        expect(arr.at(0)).assertEqual(-99n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1700
     * @tc.name testBigInt64ArrayAtTwo1700
     * @tc.desc Verify `new BigInt64Array([0n, 1n])` produces a result where `arr.at(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n]);
        expect(arr.at(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1800
     * @tc.name testBigInt64ArrayAtTwo1800
     * @tc.desc Verify `new BigInt64Array([9007199254740991n])` produces a result where `arr.at(0)` equals `9007199254740991n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9007199254740991n]);
        expect(arr.at(0)).assertEqual(9007199254740991n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_1900
     * @tc.name testBigInt64ArrayAtTwo1900
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n])` produces a result where `arr.at(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        expect(arr.at(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2000
     * @tc.name testBigInt64ArrayAtTwo2000
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n])` produces a result where `arr.at(-1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        expect(arr.at(-1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2100
     * @tc.name testBigInt64ArrayAtTwo2100
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n])` produces a result where `arr.at(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n]);
        expect(arr.at(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2200
     * @tc.name testBigInt64ArrayAtTwo2200
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n])` produces a result where `arr.at(-1)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n]);
        expect(arr.at(-1)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2300
     * @tc.name testBigInt64ArrayAtTwo2300
     * @tc.desc Verify `new BigInt64Array(buffer)` produces a result where `arr.at(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(8);
        let arr = new BigInt64Array(buffer);
        expect(arr.at(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2400
     * @tc.name testBigInt64ArrayAtTwo2400
     * @tc.desc Verify `new BigInt64Array([23n, 45n, 67n])` produces a result where `arr.at(1)` equals `arr[1]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([23n, 45n, 67n]);
        expect(arr.at(1)).assertEqual(arr[1]);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2500
     * @tc.name testBigInt64ArrayAtTwo2500
     * @tc.desc Verify `new BigInt64Array([89n, 12n, 34n])` produces a result where `arr.at(-1)` equals `arr[arr.length - 1]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([89n, 12n, 34n]);
        expect(arr.at(-1)).assertEqual(arr[arr.length - 1]);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2600
     * @tc.name testBigInt64ArrayAtTwo2600
     * @tc.desc Verify `new BigInt64Array([9n, 19n, 29n])` produces a result where `arr.at(0)` equals `arr.$_get(0)`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9n, 19n, 29n]);
        expect(arr.at(0)).assertEqual(arr.$_get(0));
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2700
     * @tc.name testBigInt64ArrayAtTwo2700
     * @tc.desc Verify `arr.at(0)` produces a result where `val + 5n` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let val = arr.at(0) as bigint;
        expect(val + 5n).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2800
     * @tc.name testBigInt64ArrayAtTwo2800
     * @tc.desc Verify `arr.at(1)` produces a result where `val * 2n` equals `40n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let val = arr.at(1) as bigint;
        expect(val * 2n).assertEqual(40n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_2900
     * @tc.name testBigInt64ArrayAtTwo2900
     * @tc.desc Verify `arr.at(-1)` produces a result where `val - 1n` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([50n, 100n]);
        let val = arr.at(-1) as bigint;
        expect(val - 1n).assertEqual(99n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3000
     * @tc.name testBigInt64ArrayAtTwo3000
     * @tc.desc Verify `arr.at(0)` produces a result where `val / 2n` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([30n, 60n]);
        let val = arr.at(0) as bigint;
        expect(val / 2n).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3100
     * @tc.name testBigInt64ArrayAtTwo3100
     * @tc.desc Verify `arr.at(1)` produces a result where `val % 3n` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([17n, 33n]);
        let val = arr.at(1) as bigint;
        expect(val % 3n).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3200
     * @tc.name testBigInt64ArrayAtTwo3200
     * @tc.desc Verify `arr.at(0)` produces a result where `val ** 2n` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([3n, 2n]);
        let val = arr.at(0) as bigint;
        expect(val ** 2n).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3300
     * @tc.name testBigInt64ArrayAtTwo3300
     * @tc.desc Verify `arr.at(0)` produces a result where `val & 1n` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([11n, 22n]);
        let val = arr.at(0) as bigint;
        expect(val & 1n).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3400
     * @tc.name testBigInt64ArrayAtTwo3400
     * @tc.desc Verify `arr.at(0)` produces a result where `val | 1n` equals `11n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let val = arr.at(0) as bigint;
        expect(val | 1n).assertEqual(11n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3500
     * @tc.name testBigInt64ArrayAtTwo3500
     * @tc.desc Verify `arr.at(0)` produces a result where `~val` equals `~10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n]);
        let val = arr.at(0) as bigint;
        expect(~val).assertEqual(~10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3600
     * @tc.name testBigInt64ArrayAtTwo3600
     * @tc.desc Verify `arr.at(0)` produces a result where `val << 1n` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 12n]);
        let val = arr.at(0) as bigint;
        expect(val << 1n).assertEqual(20n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3700
     * @tc.name testBigInt64ArrayAtTwo3700
     * @tc.desc Verify `arr.at(1)` produces a result where `val >> 1n` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([18n, 20n]);
        let val = arr.at(1) as bigint;
        expect(val >> 1n).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3800
     * @tc.name testBigInt64ArrayAtTwo3800
     * @tc.desc Verify `arr.at(-1)` produces a result where `val ^ 1n` equals `14n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9n, 15n]);
        let val = arr.at(-1) as bigint;
        expect(val ^ 1n).assertEqual(14n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_3900
     * @tc.name testBigInt64ArrayAtTwo3900
     * @tc.desc Verify `arr.at(0)` produces a result where `arr.at(1) > v1` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let v1 = arr.at(0) as bigint;
        let v2 = arr.at(1) as bigint;
        expect(v2 > v1).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4000
     * @tc.name testBigInt64ArrayAtTwo4000
     * @tc.desc Verify `arr.at(0)` produces a result where `arr.at(-1) < v1` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([50n, 1n]);
        let v1 = arr.at(0) as bigint;
        let v2 = arr.at(-1) as bigint;
        expect(v2 < v1).assertTrue();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4100
     * @tc.name testBigInt64ArrayAtTwo4100
     * @tc.desc Verify `arr.at(0)` equals `tail`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([99n, 88n, 77n]);
        let head = arr.at(0) as bigint;
        let tail = arr.at(-arr.length) as bigint;
        expect(head).assertEqual(tail);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4200
     * @tc.name testBigInt64ArrayAtTwo4200
     * @tc.desc Verify `arr.at(1)` equals `v2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let v1 = arr.at(1) as bigint;
        let v2 = arr.at(-2) as bigint;
        expect(v1).assertEqual(v2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4300
     * @tc.name testBigInt64ArrayAtTwo4300
     * @tc.desc Verify `arr1.at(0)` equals `val2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr1 = new BigInt64Array([100n]);
        let arr2 = new BigInt64Array([10n, 100n]);
        let val1 = arr1.at(0) as bigint;
        let val2 = arr2.at(-1) as bigint;
        expect(val1).assertEqual(val2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4400
     * @tc.name testBigInt64ArrayAtTwo4400
     * @tc.desc Verify `String(arr.at(0))` equals `'123456'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([123456n]);
        let val = String(arr.at(0));
        expect(val).assertEqual('123456');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4500
     * @tc.name testBigInt64ArrayAtTwo4500
     * @tc.desc Verify `arr.at(1)` produces a result where `new BigInt64Array([1n, 2n, 3n]).length` equals `lenOriginal`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let lenOriginal = arr.length;
        arr.at(1);
        expect(arr.length).assertEqual(lenOriginal);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4600
     * @tc.name testBigInt64ArrayAtTwo4600
     * @tc.desc Verify `arr.at(-1)` produces a result where `new BigInt64Array([4n, 5n, 6n]).length` equals `lenOriginal`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([4n, 5n, 6n]);
        let lenOriginal = arr.length;
        arr.at(-1);
        expect(arr.length).assertEqual(lenOriginal);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4700
     * @tc.name testBigInt64ArrayAtTwo4700
     * @tc.desc Verify `arr.at(arr.length + 5)` produces a result where `new BigInt64Array([7n, 8n]).length` equals `lenOriginal`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n, 8n]);
        let lenOriginal = arr.length;
        arr.at(arr.length + 5);
        expect(arr.length).assertEqual(lenOriginal);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4800
     * @tc.name testBigInt64ArrayAtTwo4800
     * @tc.desc Verify `arr.at(-arr.length - 10)` produces a result where `new BigInt64Array([9n, 10n]).length` equals `lenOriginal`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9n, 10n]);
        let lenOriginal = arr.length;
        arr.at(-arr.length - 10);
        expect(arr.length).assertEqual(lenOriginal);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_4900
     * @tc.name testBigInt64ArrayAtTwo4900
     * @tc.desc Verify `arr.at(-1)` produces a result where `new BigInt64Array(source).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        arr.at(-1);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5000
     * @tc.name testBigInt64ArrayAtTwo5000
     * @tc.desc Verify `arr.at(0)` produces a result where `new BigInt64Array([1n, 2n]).byteLength` equals `size`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let size = arr.byteLength;
        arr.at(0);
        expect(arr.byteLength).assertEqual(size);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5100
     * @tc.name testBigInt64ArrayAtTwo5100
     * @tc.desc Verify `arr.at(-2)` produces a result where `new BigInt64Array([3n, 4n, 5n]).byteLength` equals `size`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([3n, 4n, 5n]);
        let size = arr.byteLength;
        arr.at(-2);
        expect(arr.byteLength).assertEqual(size);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5200
     * @tc.name testBigInt64ArrayAtTwo5200
     * @tc.desc Verify `arr.at(5)` produces a result where `new BigInt64Array([6n, 7n]).byteLength` equals `size`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([6n, 7n]);
        let size = arr.byteLength;
        arr.at(5);
        expect(arr.byteLength).assertEqual(size);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5300
     * @tc.name testBigInt64ArrayAtTwo5300
     * @tc.desc Verify `arr.at(-10)` produces a result where `new BigInt64Array([8n, 9n]).byteLength` equals `size`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([8n, 9n]);
        let size = arr.byteLength;
        arr.at(-10);
        expect(arr.byteLength).assertEqual(size);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5400
     * @tc.name testBigInt64ArrayAtTwo5400
     * @tc.desc Verify `arr.at(0)` produces a result where `new BigInt64Array(source).byteLength` equals `size`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let source: bigint[] = [];
        let arr = new BigInt64Array(source);
        let size = arr.byteLength;
        arr.at(0);
        expect(arr.byteLength).assertEqual(size);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5500
     * @tc.name testBigInt64ArrayAtTwo5500
     * @tc.desc Verify `arr.at(1)` produces a result where `new BigInt64Array([111n, 222n, 333n])[0]` equals `111n`, `new BigInt64Array([111n, 222n, 333n])[1]` equals `222n`, and `new BigInt64Array([111n, 222n, 333n])[2]` equals `333n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([111n, 222n, 333n]);
        arr.at(1);
        expect(arr[0]).assertEqual(111n);
        expect(arr[1]).assertEqual(222n);
        expect(arr[2]).assertEqual(333n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5600
     * @tc.name testBigInt64ArrayAtTwo5600
     * @tc.desc Verify `arr.at(-1)` produces a result where `new BigInt64Array([444n, 555n])[0]` equals `444n`, `new BigInt64Array([444n, 555n])[1]` equals `555n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([444n, 555n]);
        arr.at(-1);
        expect(arr[0]).assertEqual(444n);
        expect(arr[1]).assertEqual(555n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5700
     * @tc.name testBigInt64ArrayAtTwo5700
     * @tc.desc Verify `arr.at(10)` produces a result where `new BigInt64Array([666n, 777n, 888n])[0]` equals `666n`, `new BigInt64Array([666n, 777n, 888n])[1]` equals `777n`, and `new BigInt64Array([666n, 777n, 888n])[2]` equals `888n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([666n, 777n, 888n]);
        arr.at(10);
        expect(arr[0]).assertEqual(666n);
        expect(arr[1]).assertEqual(777n);
        expect(arr[2]).assertEqual(888n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5800
     * @tc.name testBigInt64ArrayAtTwo5800
     * @tc.desc Verify `arr.at(-100)` produces a result where `new BigInt64Array([999n])[0]` equals `999n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([999n]);
        arr.at(-100);
        expect(arr[0]).assertEqual(999n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_5900
     * @tc.name testBigInt64ArrayAtTwo5900
     * @tc.desc Verify `arr.at(0)` produces a result where `new BigInt64Array([max, 15n])[0]` equals `max`, `new BigInt64Array([max, 15n])[1]` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let max = 9223372036854775807n;
        let arr = new BigInt64Array([max, 15n]);
        arr.at(0);
        expect(arr[0]).assertEqual(max);
        expect(arr[1]).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6000
     * @tc.name testBigInt64ArrayAtTwo6000
     * @tc.desc Verify `arr.at(-1)` produces a result where `new BigInt64Array([15n, min])[0]` equals `15n`, `new BigInt64Array([15n, min])[1]` equals `min`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let min = -9223372036854775807n - 1n;
        let arr = new BigInt64Array([15n, min]);
        arr.at(-1);
        expect(arr[0]).assertEqual(15n);
        expect(arr[1]).assertEqual(min);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6100
     * @tc.name testBigInt64ArrayAtTwo6100
     * @tc.desc Verify `arr.at(0)` produces a result where `new BigInt64Array([1n, 2n, 3n])[0]` equals `1n`, `new BigInt64Array([1n, 2n, 3n])[1]` equals `2n`, and `new BigInt64Array([1n, 2n, 3n])[2]` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        arr.at(0);
        arr.at(-1);
        arr.at(2);
        arr.at(-3);
        expect(arr[0]).assertEqual(1n);
        expect(arr[1]).assertEqual(2n);
        expect(arr[2]).assertEqual(3n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6200
     * @tc.name testBigInt64ArrayAtTwo6200
     * @tc.desc Verify `arr.at(0)` produces a result where `new BigInt64Array(buffer, 16, 2).byteOffset` equals `oldOffset`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(64);
        let arr = new BigInt64Array(buffer, 16, 2);
        let oldOffset = arr.byteOffset;
        arr.at(0);
        expect(arr.byteOffset).assertEqual(oldOffset);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6300
     * @tc.name testBigInt64ArrayAtTwo6300
     * @tc.desc Verify `arr.at(-1)` produces a result where `new BigInt64Array(buffer, 8, 3).byteOffset` equals `oldOffset`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(64);
        let arr = new BigInt64Array(buffer, 8, 3);
        let oldOffset = arr.byteOffset;
        arr.at(-1);
        expect(arr.byteOffset).assertEqual(oldOffset);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6400
     * @tc.name testBigInt64ArrayAtTwo6400
     * @tc.desc Verify `arr.at(10)` produces a result where `new BigInt64Array(buffer, 24, 1).byteOffset` equals `oldOffset`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(64);
        let arr = new BigInt64Array(buffer, 24, 1);
        let oldOffset = arr.byteOffset;
        arr.at(10);
        expect(arr.byteOffset).assertEqual(oldOffset);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6500
     * @tc.name testBigInt64ArrayAtTwo6500
     * @tc.desc Verify `arr.at(-20)` produces a result where `new BigInt64Array(buffer, 32, 5).byteOffset` equals `oldOffset`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(128);
        let arr = new BigInt64Array(buffer, 32, 5);
        let oldOffset = arr.byteOffset;
        arr.at(-20);
        expect(arr.byteOffset).assertEqual(oldOffset);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6600
     * @tc.name testBigInt64ArrayAtTwo6600
     * @tc.desc Verify `arr.at(0)` produces a result where `new BigInt64Array(buffer).buffer.byteLength` equals `bufLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(16);
        let arr = new BigInt64Array(buffer);
        let bufLen = arr.buffer.byteLength;
        arr.at(0);
        expect(arr.buffer.byteLength).assertEqual(bufLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6700
     * @tc.name testBigInt64ArrayAtTwo6700
     * @tc.desc Verify `arr.at(-1)` produces a result where `new BigInt64Array(buffer).buffer.byteLength` equals `bufLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(24);
        let arr = new BigInt64Array(buffer);
        let bufLen = arr.buffer.byteLength;
        arr.at(-1);
        expect(arr.buffer.byteLength).assertEqual(bufLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6800
     * @tc.name testBigInt64ArrayAtTwo6800
     * @tc.desc Verify `arr.at(100)` produces a result where `new BigInt64Array(buffer).buffer.byteLength` equals `bufLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(80);
        let arr = new BigInt64Array(buffer);
        let bufLen = arr.buffer.byteLength;
        arr.at(100);
        expect(arr.buffer.byteLength).assertEqual(bufLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_6900
     * @tc.name testBigInt64ArrayAtTwo6900
     * @tc.desc Verify `arr.at(-50)` produces a result where `new BigInt64Array(buffer).buffer.byteLength` equals `bufLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(56);
        let arr = new BigInt64Array(buffer);
        let bufLen = arr.buffer.byteLength;
        arr.at(-50);
        expect(arr.buffer.byteLength).assertEqual(bufLen);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_TWO_7000
     * @tc.name testBigInt64ArrayAtTwo7000
     * @tc.desc Verify `a1.at(0)` produces a result where `new BigInt64Array(buffer, 16, 2).byteOffset` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtTwo7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(80);
        let a1 = new BigInt64Array(buffer, 0, 2);
        let a2 = new BigInt64Array(buffer, 16, 2);
        a1.at(0);
        expect(a2.byteOffset).assertEqual(16);
      });

  });
}
