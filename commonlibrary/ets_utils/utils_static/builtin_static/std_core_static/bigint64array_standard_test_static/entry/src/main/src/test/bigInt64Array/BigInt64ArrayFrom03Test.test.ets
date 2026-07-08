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

const BIGINT64_MAX = 9223372036854775807n;
const BIGINT64_MIN = -9223372036854775807n - 1n;

export default function BigInt64ArrayFrom0301Test(): void {
  describe('BigInt64ArrayFrom0301Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0100
     * @tc.name testBigInt64ArrayFromThreeOne0100
     * @tc.desc Verify from Array source preserves the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [10n, 20n, 30n];
        let res = BigInt64Array.from(src);
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0200
     * @tc.name testBigInt64ArrayFromThreeOne0200
     * @tc.desc Verify from Set source preserves the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0300
     * @tc.name testBigInt64ArrayFromThreeOne0300
     * @tc.desc Verify from BigInt64Array source preserves the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0400
     * @tc.name testBigInt64ArrayFromThreeOne0400
     * @tc.desc Verify from ArrayLike<number> source preserves the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number): BigInt => BigInt(v)
        );
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0500
     * @tc.name testBigInt64ArrayFromThreeOne0500
     * @tc.desc Verify from Set values iterator source preserves the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src);
        expect(res.length).assertEqual(3);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0600
     * @tc.name testBigInt64ArrayFromThreeOne0600
     * @tc.desc Verify from Array source preserves the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [10n, 20n, 30n];
        let res = BigInt64Array.from(src);
        expect(res.byteLength).assertEqual(24);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0700
     * @tc.name testBigInt64ArrayFromThreeOne0700
     * @tc.desc Verify from Set source preserves the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res.byteLength).assertEqual(24);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0800
     * @tc.name testBigInt64ArrayFromThreeOne0800
     * @tc.desc Verify from BigInt64Array source preserves the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res.byteLength).assertEqual(24);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_0900
     * @tc.name testBigInt64ArrayFromThreeOne0900
     * @tc.desc Verify from ArrayLike<number> source preserves the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number): BigInt => BigInt(v)
        );
        expect(res.byteLength).assertEqual(24);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1000
     * @tc.name testBigInt64ArrayFromThreeOne1000
     * @tc.desc Verify from Set values iterator source preserves the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src);
        expect(res.byteLength).assertEqual(24);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1100
     * @tc.name testBigInt64ArrayFromThreeOne1100
     * @tc.desc Verify from Array source preserves the first element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [10n, 20n, 30n];
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(10n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1200
     * @tc.name testBigInt64ArrayFromThreeOne1200
     * @tc.desc Verify from Set source preserves the first element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(10n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1300
     * @tc.name testBigInt64ArrayFromThreeOne1300
     * @tc.desc Verify from BigInt64Array source preserves the first element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(10n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1400
     * @tc.name testBigInt64ArrayFromThreeOne1400
     * @tc.desc Verify from ArrayLike<number> source preserves the first element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number): BigInt => BigInt(v)
        );
        expect(res[0]).assertEqual(10n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1500
     * @tc.name testBigInt64ArrayFromThreeOne1500
     * @tc.desc Verify from Set values iterator source preserves the first element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(10n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1600
     * @tc.name testBigInt64ArrayFromThreeOne1600
     * @tc.desc Verify from Array source preserves the last element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [10n, 20n, 30n];
        let res = BigInt64Array.from(src);
        expect(res[2]).assertEqual(30n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1700
     * @tc.name testBigInt64ArrayFromThreeOne1700
     * @tc.desc Verify from Set source preserves the last element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res[2]).assertEqual(30n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1800
     * @tc.name testBigInt64ArrayFromThreeOne1800
     * @tc.desc Verify from BigInt64Array source preserves the last element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res[2]).assertEqual(30n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_1900
     * @tc.name testBigInt64ArrayFromThreeOne1900
     * @tc.desc Verify from ArrayLike<number> source preserves the last element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number): BigInt => BigInt(v)
        );
        expect(res[2]).assertEqual(30n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2000
     * @tc.name testBigInt64ArrayFromThreeOne2000
     * @tc.desc Verify from Set values iterator source preserves the last element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src);
        expect(res[2]).assertEqual(30n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2100
     * @tc.name testBigInt64ArrayFromThreeOne2100
     * @tc.desc Verify empty Array source yields length zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [];
        let res = BigInt64Array.from(src);
        expect(res.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2200
     * @tc.name testBigInt64ArrayFromThreeOne2200
     * @tc.desc Verify empty Set source yields length zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([]);
        let res = BigInt64Array.from(src);
        expect(res.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2300
     * @tc.name testBigInt64ArrayFromThreeOne2300
     * @tc.desc Verify empty BigInt64Array source yields length zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([]);
        let res = BigInt64Array.from(src);
        expect(res.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2400
     * @tc.name testBigInt64ArrayFromThreeOne2400
     * @tc.desc Verify empty ArrayLike<number> source yields length zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number): BigInt => BigInt(v)
        );
        expect(res.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2500
     * @tc.name testBigInt64ArrayFromThreeOne2500
     * @tc.desc Verify empty Set values iterator source yields length zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src);
        expect(res.length).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2600
     * @tc.name testBigInt64ArrayFromThreeOne2600
     * @tc.desc Verify empty Array source yields zero byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [];
        let res = BigInt64Array.from(src);
        expect(res.byteLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2700
     * @tc.name testBigInt64ArrayFromThreeOne2700
     * @tc.desc Verify empty Set source yields zero byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([]);
        let res = BigInt64Array.from(src);
        expect(res.byteLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2800
     * @tc.name testBigInt64ArrayFromThreeOne2800
     * @tc.desc Verify empty BigInt64Array source yields zero byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([]);
        let res = BigInt64Array.from(src);
        expect(res.byteLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_2900
     * @tc.name testBigInt64ArrayFromThreeOne2900
     * @tc.desc Verify empty ArrayLike<number> source yields zero byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number): BigInt => BigInt(v)
        );
        expect(res.byteLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3000
     * @tc.name testBigInt64ArrayFromThreeOne3000
     * @tc.desc Verify empty Set values iterator source yields zero byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src);
        expect(res.byteLength).assertEqual(0);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3100
     * @tc.name testBigInt64ArrayFromThreeOne3100
     * @tc.desc Verify from Array source preserves the signed 64-bit maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [BIGINT64_MAX, 20n, 30n];
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(BIGINT64_MAX);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3200
     * @tc.name testBigInt64ArrayFromThreeOne3200
     * @tc.desc Verify from Set source preserves the signed 64-bit maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([BIGINT64_MAX, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(BIGINT64_MAX);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3300
     * @tc.name testBigInt64ArrayFromThreeOne3300
     * @tc.desc Verify from BigInt64Array source preserves the signed 64-bit maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([BIGINT64_MAX, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(BIGINT64_MAX);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3400
     * @tc.name testBigInt64ArrayFromThreeOne3400
     * @tc.desc Verify from ArrayLike<number> source preserves the signed 64-bit maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(BIGINT64_MAX), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            if (k === 0) {
              return BIGINT64_MAX;
            }
            return BigInt(v);
          }
        );
        expect(res[0]).assertEqual(BIGINT64_MAX);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3500
     * @tc.name testBigInt64ArrayFromThreeOne3500
     * @tc.desc Verify from Set values iterator source preserves the signed 64-bit maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([BIGINT64_MAX, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(BIGINT64_MAX);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3600
     * @tc.name testBigInt64ArrayFromThreeOne3600
     * @tc.desc Verify from Array source preserves the signed 64-bit minimum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [BIGINT64_MIN, 20n, 30n];
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(BIGINT64_MIN);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3700
     * @tc.name testBigInt64ArrayFromThreeOne3700
     * @tc.desc Verify from Set source preserves the signed 64-bit minimum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([BIGINT64_MIN, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(BIGINT64_MIN);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3800
     * @tc.name testBigInt64ArrayFromThreeOne3800
     * @tc.desc Verify from BigInt64Array source preserves the signed 64-bit minimum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([BIGINT64_MIN, 20n, 30n]);
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(BIGINT64_MIN);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_3900
     * @tc.name testBigInt64ArrayFromThreeOne3900
     * @tc.desc Verify from ArrayLike<number> source preserves the signed 64-bit minimum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(BIGINT64_MIN), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            if (k === 0) {
              return BIGINT64_MIN;
            }
            return BigInt(v);
          }
        );
        expect(res[0]).assertEqual(BIGINT64_MIN);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4000
     * @tc.name testBigInt64ArrayFromThreeOne4000
     * @tc.desc Verify from Set values iterator source preserves the signed 64-bit minimum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([BIGINT64_MIN, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src);
        expect(res[0]).assertEqual(BIGINT64_MIN);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4100
     * @tc.name testBigInt64ArrayFromThreeOne4100
     * @tc.desc Verify Array source maps the first index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [10n, 20n, 30n];
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          return BigInt(k);
        });
        expect(res[0]).assertEqual(0n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4200
     * @tc.name testBigInt64ArrayFromThreeOne4200
     * @tc.desc Verify Set source maps the first index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          return BigInt(k);
        });
        expect(res[0]).assertEqual(0n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4300
     * @tc.name testBigInt64ArrayFromThreeOne4300
     * @tc.desc Verify BigInt64Array source maps the first index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
        let res = BigInt64Array.from(
          src as Iterable<BigInt>,
          (v: BigInt, k: number): BigInt => {
            return BigInt(k);
          }
        );
        expect(res[0]).assertEqual(0n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4400
     * @tc.name testBigInt64ArrayFromThreeOne4400
     * @tc.desc Verify ArrayLike<number> source maps the first index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            return BigInt(k);
          }
        );
        expect(res[0]).assertEqual(0n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4500
     * @tc.name testBigInt64ArrayFromThreeOne4500
     * @tc.desc Verify Set values iterator source maps the first index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          return BigInt(k);
        });
        expect(res[0]).assertEqual(0n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4600
     * @tc.name testBigInt64ArrayFromThreeOne4600
     * @tc.desc Verify Array source maps the second index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [10n, 20n, 30n];
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          return BigInt(k);
        });
        expect(res[1]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4700
     * @tc.name testBigInt64ArrayFromThreeOne4700
     * @tc.desc Verify Set source maps the second index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          return BigInt(k);
        });
        expect(res[1]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4800
     * @tc.name testBigInt64ArrayFromThreeOne4800
     * @tc.desc Verify BigInt64Array source maps the second index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
        let res = BigInt64Array.from(
          src as Iterable<BigInt>,
          (v: BigInt, k: number): BigInt => {
            return BigInt(k);
          }
        );
        expect(res[1]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_4900
     * @tc.name testBigInt64ArrayFromThreeOne4900
     * @tc.desc Verify ArrayLike<number> source maps the second index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            return BigInt(k);
          }
        );
        expect(res[1]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5000
     * @tc.name testBigInt64ArrayFromThreeOne5000
     * @tc.desc Verify Set values iterator source maps the second index through mapFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          return BigInt(k);
        });
        expect(res[1]).assertEqual(1n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5100
     * @tc.name testBigInt64ArrayFromThreeOne5100
     * @tc.desc Verify Array source doubles the first mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [10n, 20n, 30n];
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          let val = v;
          return val * 2n;
        });
        expect(res[0]).assertEqual(20n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5200
     * @tc.name testBigInt64ArrayFromThreeOne5200
     * @tc.desc Verify Set source doubles the first mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          let val = v;
          return val * 2n;
        });
        expect(res[0]).assertEqual(20n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5300
     * @tc.name testBigInt64ArrayFromThreeOne5300
     * @tc.desc Verify BigInt64Array source doubles the first mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
        let res = BigInt64Array.from(
          src as Iterable<BigInt>,
          (v: BigInt, k: number): BigInt => {
            let val = v;
            return val * 2n;
          }
        );
        expect(res[0]).assertEqual(20n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5400
     * @tc.name testBigInt64ArrayFromThreeOne5400
     * @tc.desc Verify ArrayLike<number> source doubles the first mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            let val = BigInt(v);
            return val * 2n;
          }
        );
        expect(res[0]).assertEqual(20n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5500
     * @tc.name testBigInt64ArrayFromThreeOne5500
     * @tc.desc Verify Set values iterator source doubles the first mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          let val = v;
          return val * 2n;
        });
        expect(res[0]).assertEqual(20n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5600
     * @tc.name testBigInt64ArrayFromThreeOne5600
     * @tc.desc Verify Array source adds the index to the last mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<BigInt> = [10n, 20n, 30n];
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          let val = v;
          return val + BigInt(k);
        });
        expect(res[2]).assertEqual(32n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5700
     * @tc.name testBigInt64ArrayFromThreeOne5700
     * @tc.desc Verify Set source adds the index to the last mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          let val = v;
          return val + BigInt(k);
        });
        expect(res[2]).assertEqual(32n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5800
     * @tc.name testBigInt64ArrayFromThreeOne5800
     * @tc.desc Verify BigInt64Array source adds the index to the last mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: BigInt64Array = new BigInt64Array([10n, 20n, 30n]);
        let res = BigInt64Array.from(
          src as Iterable<BigInt>,
          (v: BigInt, k: number): BigInt => {
            let val = v;
            return val + BigInt(k);
          }
        );
        expect(res[2]).assertEqual(32n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_5900
     * @tc.name testBigInt64ArrayFromThreeOne5900
     * @tc.desc Verify ArrayLike<number> source adds the index to the last mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne5900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let src: Array<number> = [Number(10n), Number(20n), Number(30n)];
        let res = BigInt64Array.from(
          src as ArrayLike<number>,
          (v: number, k: number): BigInt => {
            let val = BigInt(v);
            return val + BigInt(k);
          }
        );
        expect(res[2]).assertEqual(32n);
      }
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FROM_THREE_ONE_6000
     * @tc.name testBigInt64ArrayFromThreeOne6000
     * @tc.desc Verify Set values iterator source adds the index to the last mapped value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      'testBigInt64ArrayFromThreeOne6000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let set: Set<BigInt> = new Set<BigInt>([10n, 20n, 30n]);
        let src: IterableIterator<BigInt> = set.values();
        let res = BigInt64Array.from(src, (v: BigInt, k: number): BigInt => {
          let val = v;
          return val + BigInt(k);
        });
        expect(res[2]).assertEqual(32n);
      }
    );

  });
}
