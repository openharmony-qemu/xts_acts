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

export default function BigInt64ArrayGet01Test(): void {
  describe('BigInt64ArrayGet01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0100
     * @tc.name testBigInt64ArrayGetOne0100
     * @tc.desc Verify `new BigInt64Array([0n])` produces a result where `arr[0]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        expect(arr[0]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0200
     * @tc.name testBigInt64ArrayGetOne0200
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr[0]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        expect(arr[0]).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0300
     * @tc.name testBigInt64ArrayGetOne0300
     * @tc.desc Verify `new BigInt64Array([-1n])` produces a result where `arr[0]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n]);
        expect(arr[0]).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0400
     * @tc.name testBigInt64ArrayGetOne0400
     * @tc.desc Verify `new BigInt64Array([100n])` produces a result where `arr[0]` equals `100n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n]);
        expect(arr[0]).assertEqual(100n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0500
     * @tc.name testBigInt64ArrayGetOne0500
     * @tc.desc Verify `new BigInt64Array([-100n])` produces a result where `arr[0]` equals `-100n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-100n]);
        expect(arr[0]).assertEqual(-100n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0600
     * @tc.name testBigInt64ArrayGetOne0600
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n])` produces a result where `arr[0]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n]);
        expect(arr[0]).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0700
     * @tc.name testBigInt64ArrayGetOne0700
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n])` produces a result where `arr[0]` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n]);
        expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0800
     * @tc.name testBigInt64ArrayGetOne0800
     * @tc.desc Verify `new BigInt64Array([1n, 2n, 3n])` produces a result where `arr[0]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        expect(arr[0]).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_0900
     * @tc.name testBigInt64ArrayGetOne0900
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 0n, -922337, ...])` produces a result where `arr[0]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775807n - 1n]);
        expect(arr[0]).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_ONE_1000
     * @tc.name testBigInt64ArrayGetOne1000
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 0n, -922337, ...])` produces a result where `arr[2]` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775807n - 1n]);
        expect(arr[2]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1100
     * @tc.name testBigInt64ArrayGetThree1100
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[10000]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[10000]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1200
     * @tc.name testBigInt64ArrayGetThree1200
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[-0x1]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[-0x1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1300
     * @tc.name testBigInt64ArrayGetThree1300
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[-10000]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[-10000]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1400
     * @tc.name testBigInt64ArrayGetThree1400
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[0 + 1]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[0 + 1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1500
     * @tc.name testBigInt64ArrayGetThree1500
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[2 - 3]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[2 - 3]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1600
     * @tc.name testBigInt64ArrayGetThree1600
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = 1 + (-2);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1700
     * @tc.name testBigInt64ArrayGetThree1700
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = 1 + (1);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1800
     * @tc.name testBigInt64ArrayGetThree1800
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = 1 + (10000);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_1900
     * @tc.name testBigInt64ArrayGetThree1900
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = 1 + (-10000);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2000
     * @tc.name testBigInt64ArrayGetThree2000
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = 1 + (0 + 1);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2100
     * @tc.name testBigInt64ArrayGetThree2100
     * @tc.desc Verify `new BigInt64Array([1n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = 1 + (-2 * 2);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2200
     * @tc.name testBigInt64ArrayGetThree2200
     * @tc.desc Verify `new BigInt64Array([1n, 2n, 3n, 4n, 5n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let idx = 5 + (-10);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2300
     * @tc.name testBigInt64ArrayGetThree2300
     * @tc.desc Verify `new BigInt64Array([1n, 2n, 3n, 4n, 5n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let idx = 5 + (1);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2400
     * @tc.name testBigInt64ArrayGetThree2400
     * @tc.desc Verify `new BigInt64Array([1n, 2n, 3n, 4n, 5n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let idx = 5 + (10000);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2500
     * @tc.name testBigInt64ArrayGetThree2500
     * @tc.desc Verify `new BigInt64Array([1n, 2n, 3n, 4n, 5n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let idx = 5 + (-10000);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2600
     * @tc.name testBigInt64ArrayGetThree2600
     * @tc.desc Verify `new BigInt64Array([1n, 2n, 3n, 4n, 5n])` produces a result where `arr[idx]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let idx = 5 + (0 + 1);
      expect(arr[idx]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2700
     * @tc.name testBigInt64ArrayGetThree2700
     * @tc.desc Verify `arr[0]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2800
     * @tc.name testBigInt64ArrayGetThree2800
     * @tc.desc Verify `arr[0]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_2900
     * @tc.name testBigInt64ArrayGetThree2900
     * @tc.desc Verify `arr[0]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-1n);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_3000
     * @tc.name testBigInt64ArrayGetThree3000
     * @tc.desc Verify `arr[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_3100
     * @tc.name testBigInt64ArrayGetThree3100
     * @tc.desc Verify `arr[0]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775807n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_3200
     * @tc.name testBigInt64ArrayGetThree3200
     * @tc.desc Verify `arr[0]` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(-9223372036854775807n - 1n);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_THREE_3300
     * @tc.name testBigInt64ArrayGetThree3300
     * @tc.desc Verify `typeof arr[0]` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetThree3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(0n);
      expect(typeof arr[0]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_3400
     * @tc.name testBigInt64ArrayGetTwo3400
     * @tc.desc Verify `new BigInt64Array([12345678n, 12345679n, 12345680n])` produces a result where `arr[0]` equals `12345678n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([12345678n, 12345679n, 12345680n]);
      expect(arr[0]).assertEqual(12345678n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_3500
     * @tc.name testBigInt64ArrayGetTwo3500
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_3600
     * @tc.name testBigInt64ArrayGetTwo3600
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[4]` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_3700
     * @tc.name testBigInt64ArrayGetTwo3700
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[0x1]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[0x1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_3800
     * @tc.name testBigInt64ArrayGetTwo3800
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[0o1]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[0o1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_3900
     * @tc.name testBigInt64ArrayGetTwo3900
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[0b10]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[0b10]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_4000
     * @tc.name testBigInt64ArrayGetTwo4000
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[1 + 1]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[1 + 1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_4100
     * @tc.name testBigInt64ArrayGetTwo4100
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[1 * 2]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[1 * 2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_4200
     * @tc.name testBigInt64ArrayGetTwo4200
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[3 - 1]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[3 - 1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_4300
     * @tc.name testBigInt64ArrayGetTwo4300
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr[4 / 2]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      expect(arr[4 / 2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_4400
     * @tc.name testBigInt64ArrayGetTwo4400
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[-1]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[-1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_4500
     * @tc.name testBigInt64ArrayGetTwo4500
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[1]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_4600
     * @tc.name testBigInt64ArrayGetTwo4600
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[0xff]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[0xff]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_GET_TWO_4700
     * @tc.name testBigInt64ArrayGetTwo4700
     * @tc.desc Verify `new BigInt64Array(source)` produces a result where `arr[1000]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayGetTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      expect(arr[1000]).assertUndefined();
    });
  });
}
