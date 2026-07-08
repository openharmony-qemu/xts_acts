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

export default function BigInt64ArrayFilter02Test(): void {
  describe('BigInt64ArrayFilter02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0100
     * @tc.name testBigInt64ArrayFilterTwo0100
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `isInst` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n]);
      let ret = src.filter((val: bigint) => val > 0n);
      let isInst = ret instanceof BigInt64Array;
      expect(isInst).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0200
     * @tc.name testBigInt64ArrayFilterTwo0200
     * @tc.desc Verify `src.filter((val) => val < 0n)` produces a result where `isInst` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n]);
      let ret = src.filter((val: bigint) => val < 0n);
      let isInst = ret instanceof BigInt64Array;
      expect(isInst).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0300
     * @tc.name testBigInt64ArrayFilterTwo0300
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `typeof src.filter((val) => val > 0n)` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(typeof ret).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0400
     * @tc.name testBigInt64ArrayFilterTwo0400
     * @tc.desc Verify `src.filter((val) => val < 0n)` produces a result where `typeof src.filter((val) => val < 0n)` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n]);
      let ret = src.filter((val: bigint) => val < 0n);
      expect(typeof ret).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0500
     * @tc.name testBigInt64ArrayFilterTwo0500
     * @tc.desc Verify `src.filter((val, idx) => idx % 2 === 0)` produces a result where `typeof src.filter((val, idx) => idx % 2 === 0)` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n, 30n, 40n]);
      let ret = src.filter((val: bigint, idx: int) => idx % 2 === 0);
      expect(typeof ret).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0600
     * @tc.name testBigInt64ArrayFilterTwo0600
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `viewFlag` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([9223372036854775807n]);
      let ret = src.filter((val: bigint) => val > 0n);
      let viewFlag: boolean = ArrayBuffer.isView(ret);
      expect(viewFlag).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0700
     * @tc.name testBigInt64ArrayFilterTwo0700
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `viewFlag` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-9223372036854775807n - 1n]);
      let ret = src.filter((val: bigint) => val > 0n);
      let viewFlag: boolean = ArrayBuffer.isView(ret);
      expect(viewFlag).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0800
     * @tc.name testBigInt64ArrayFilterTwo0800
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_0900
     * @tc.name testBigInt64ArrayFilterTwo0900
     * @tc.desc Verify `src.filter((val) => val < 0n)` produces a result where `ret.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n]);
      let ret = src.filter((val: bigint) => val < 0n);
      expect(ret.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1000
     * @tc.name testBigInt64ArrayFilterTwo1000
     * @tc.desc Verify `src.filter((val) => val === 10n)` produces a result where `ret.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n]);
      let ret = src.filter((val: bigint) => val === 10n);
      expect(ret.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1100
     * @tc.name testBigInt64ArrayFilterTwo1100
     * @tc.desc Verify `src.filter((val) => val === 10n)` produces a result where `ret.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n]);
      let ret = src.filter((val: bigint) => val === 10n);
      expect(ret.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1200
     * @tc.name testBigInt64ArrayFilterTwo1200
     * @tc.desc Verify `src.filter((val) => val === 20n)` produces a result where `ret.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n]);
      let ret = src.filter((val: bigint) => val === 20n);
      expect(ret.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1300
     * @tc.name testBigInt64ArrayFilterTwo1300
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, -20n, 30n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1400
     * @tc.name testBigInt64ArrayFilterTwo1400
     * @tc.desc Verify `src.filter((val, idx) => idx % 2 === 0)` produces a result where `ret.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([11n, 22n, 33n, 44n]);
      let ret = src.filter((val: bigint, idx: int) => idx % 2 === 0);
      expect(ret.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1500
     * @tc.name testBigInt64ArrayFilterTwo1500
     * @tc.desc Verify `src.filter((val, idx) => idx % 2 !== 0)` produces a result where `ret.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([11n, 22n, 33n, 44n]);
      let ret = src.filter((val: bigint, idx: int) => idx % 2 !== 0);
      expect(ret.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1600
     * @tc.name testBigInt64ArrayFilterTwo1600
     * @tc.desc Verify `src.filter((val) => val === -9223372036854775808n)` produces a result where `ret.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-9223372036854775807n - 1n, 1n, 2n]);
      let ret = src.filter((val: bigint) => val === -9223372036854775807n - 1n);
      expect(ret.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1700
     * @tc.name testBigInt64ArrayFilterTwo1700
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([9223372036854775807n, 0n, 0n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1800
     * @tc.name testBigInt64ArrayFilterTwo1800
     * @tc.desc Verify `src.filter((val) => val === 0n)` produces a result where `ret.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([0n, 0n, 1n, 2n]);
      let ret = src.filter((val: bigint) => val === 0n);
      expect(ret.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_1900
     * @tc.name testBigInt64ArrayFilterTwo1900
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `ret.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-10n, 20n, -30n, 40n]);
      let ret = src.filter((val: bigint) => true);
      expect(ret.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2000
     * @tc.name testBigInt64ArrayFilterTwo2000
     * @tc.desc Verify `src.filter((val) => val > 10n)` produces a result where `ret.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n]);
      let ret = src.filter((val: bigint) => val > 10n);
      expect(ret.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2100
     * @tc.name testBigInt64ArrayFilterTwo2100
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, -2n, -3n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2200
     * @tc.name testBigInt64ArrayFilterTwo2200
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, -3n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2300
     * @tc.name testBigInt64ArrayFilterTwo2300
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n, -4n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2400
     * @tc.name testBigInt64ArrayFilterTwo2400
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2500
     * @tc.name testBigInt64ArrayFilterTwo2500
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `40`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2600
     * @tc.name testBigInt64ArrayFilterTwo2600
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let src = new BigInt64Array(buf, 8, 2);
      src[0] = 100n;
      src[1] = -100n;
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2700
     * @tc.name testBigInt64ArrayFilterTwo2700
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let src = new BigInt64Array(buf, 16, 2);
      src[0] = 10n;
      src[1] = 20n;
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2800
     * @tc.name testBigInt64ArrayFilterTwo2800
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let src = new BigInt64Array([max, max, max, -1n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_2900
     * @tc.name testBigInt64ArrayFilterTwo2900
     * @tc.desc Verify `src.filter((val) => val < 0n)` produces a result where `ret.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min = -9223372036854775807n - 1n;
      let src = new BigInt64Array([min, min, 1n]);
      let ret = src.filter((val: bigint) => val < 0n);
      expect(ret.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3000
     * @tc.name testBigInt64ArrayFilterTwo3000
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n, 4n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3100
     * @tc.name testBigInt64ArrayFilterTwo3100
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n, 4n, -1n, -2n, -3n, -4n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3200
     * @tc.name testBigInt64ArrayFilterTwo3200
     * @tc.desc Verify `src.filter((val) => val > 10n)` produces a result where `ret.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n]);
      let ret = src.filter((val: bigint) => val > 10n);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3300
     * @tc.name testBigInt64ArrayFilterTwo3300
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3400
     * @tc.name testBigInt64ArrayFilterTwo3400
     * @tc.desc Verify `src.filter((val) => val === 55n)` produces a result where `ret.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let src = new BigInt64Array(buf, 16, 1);
      src[0] = 55n;
      let ret = src.filter((val: bigint) => val === 55n);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3500
     * @tc.name testBigInt64ArrayFilterTwo3500
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array([10n, 20n, 30n]);
      let src = orig.subarray(1, 3);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3600
     * @tc.name testBigInt64ArrayFilterTwo3600
     * @tc.desc Verify `src.filter((val) => val === 0xAAn)` produces a result where `ret.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([170n, 187n, 204n]);
      let ret = src.filter((val: bigint) => val === 170n);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3700
     * @tc.name testBigInt64ArrayFilterTwo3700
     * @tc.desc Verify `src.filter((val) => val === 0n)` produces a result where `ret.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([0n, 0n, 0n]);
      let ret = src.filter((val: bigint) => val === 0n);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3800
     * @tc.name testBigInt64ArrayFilterTwo3800
     * @tc.desc Verify `src.filter((val) => val < -100n)` produces a result where `ret.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-1n, -200n]);
      let ret = src.filter((val: bigint) => val < -100n);
      expect(ret.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_3900
     * @tc.name testBigInt64ArrayFilterTwo3900
     * @tc.desc Verify `src.filter((val) => val === 30n)` produces a result where `ret[0]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([15n, 30n, 45n]);
      let ret = src.filter((val: bigint) => val === 30n);
      expect(ret[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4000
     * @tc.name testBigInt64ArrayFilterTwo4000
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([-15n, 10n, 20n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4100
     * @tc.name testBigInt64ArrayFilterTwo4100
     * @tc.desc Verify `src.filter((val) => val > 10n)` produces a result where `ret[0]` equals `max`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let src = new BigInt64Array([1n, max, 2n]);
      let ret = src.filter((val: bigint) => val > 10n);
      expect(ret[0]).assertEqual(max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4200
     * @tc.name testBigInt64ArrayFilterTwo4200
     * @tc.desc Verify `src.filter((val) => val < 0n)` produces a result where `ret[0]` equals `min`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min = -9223372036854775807n - 1n;
      let src = new BigInt64Array([min, 0n, 1n]);
      let ret = src.filter((val: bigint) => val < 0n);
      expect(ret[0]).assertEqual(min);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4300
     * @tc.name testBigInt64ArrayFilterTwo4300
     * @tc.desc Verify `src.filter((val) => val > 10n)` produces a result where `ret[0]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n]);
      let ret = src.filter((val: bigint) => val > 10n);
      expect(ret[0]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4400
     * @tc.name testBigInt64ArrayFilterTwo4400
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `ret[1]` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([100n, -200n]);
      let ret = src.filter((val: bigint) => val > 0n);
      expect(ret[1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4500
     * @tc.name testBigInt64ArrayFilterTwo4500
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `ret[0]` equals `11n`, `ret[2]` equals `33n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([11n, 22n, 33n]);
      let ret = src.filter((val: bigint) => true);
      expect(ret[0]).assertEqual(11n);
      expect(ret[2]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4600
     * @tc.name testBigInt64ArrayFilterTwo4600
     * @tc.desc Verify `src.filter((val) => val < 0n)` produces a result where `ret[0]` equals `-2n`, `ret[1]` equals `-4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, -2n, 3n, -4n]);
      let ret = src.filter((val: bigint) => val < 0n);
      expect(ret[0]).assertEqual(-2n);
      expect(ret[1]).assertEqual(-4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4700
     * @tc.name testBigInt64ArrayFilterTwo4700
     * @tc.desc Verify `src.filter((val) => val !== 0n)` produces a result where `ret[0]` equals `0x1An`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([0n, 26n, 0n]);
      let ret = src.filter((val: bigint) => val !== 0n);
      expect(ret[0]).assertEqual(26n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4800
     * @tc.name testBigInt64ArrayFilterTwo4800
     * @tc.desc Verify `src.filter((val) => val === 10n)` produces a result where `ret[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([0n, 10n, 2n]);
      let ret = src.filter((val: bigint) => val === 10n);
      expect(ret[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_4900
     * @tc.name testBigInt64ArrayFilterTwo4900
     * @tc.desc Verify `src.filter((val) => val > 10n)` produces a result where `ret[0]` equals `0o77n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([63n, 1n]);
      let ret = src.filter((val: bigint) => val > 10n);
      expect(ret[0]).assertEqual(63n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5000
     * @tc.name testBigInt64ArrayFilterTwo5000
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `ret[0]` equals `max`, `ret[1]` equals `max`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let max = 9223372036854775807n;
      let src = new BigInt64Array([max, max]);
      let ret = src.filter((val: bigint) => true);
      expect(ret[0]).assertEqual(max);
      expect(ret[1]).assertEqual(max);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5100
     * @tc.name testBigInt64ArrayFilterTwo5100
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `ret[0]` equals `min`, `ret[1]` equals `min`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let min = -9223372036854775807n - 1n;
      let src = new BigInt64Array([min, min]);
      let ret = src.filter((val: bigint) => true);
      expect(ret[0]).assertEqual(min);
      expect(ret[1]).assertEqual(min);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5200
     * @tc.name testBigInt64ArrayFilterTwo5200
     * @tc.desc Verify `src.filter((val) => val === 0n)` produces a result where `ret[0]` equals `0n`, `ret[1]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([0n, -0n]);
      let ret = src.filter((val: bigint) => val === 0n);
      expect(ret[0]).assertEqual(0n);
      expect(ret[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5300
     * @tc.name testBigInt64ArrayFilterTwo5300
     * @tc.desc Verify `src.filter((val) => (val * 2n) === 10n)` produces a result where `ret[0]` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([3n, 5n, 7n]);
      let ret = src.filter((val: bigint) => (val * 2n) === 10n);
      expect(ret[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5400
     * @tc.name testBigInt64ArrayFilterTwo5400
     * @tc.desc Verify `src.filter((val) => val > 10n)` produces a result where `(ret.buffer === src.buffer)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n]);
      let ret = src.filter((val: bigint) => val > 10n);
      let isSameBuf = (ret.buffer === src.buffer);
      expect(isSameBuf).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5500
     * @tc.name testBigInt64ArrayFilterTwo5500
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `(ret.buffer === src.buffer)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n]);
      let ret = src.filter((val: bigint) => true);
      let isSameBuf = (ret.buffer === src.buffer);
      expect(isSameBuf).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5600
     * @tc.name testBigInt64ArrayFilterTwo5600
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `(ret.buffer === src.buffer)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, -2n]);
      let ret = src.filter((val: bigint) => val > 0n);
      let isSameBuf = (ret.buffer === src.buffer);
      expect(isSameBuf).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5700
     * @tc.name testBigInt64ArrayFilterTwo5700
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `new BigInt64Array([10n, 20n])[0]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n]);
      let ret = src.filter((val: bigint) => true);
      ret[0] = 99n;
      expect(src[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5800
     * @tc.name testBigInt64ArrayFilterTwo5800
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `new BigInt64Array([10n, 20n, 30n])[2]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n, 30n]);
      let ret = src.filter((val: bigint) => true);
      ret[2] = 99n;
      expect(src[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_5900
     * @tc.name testBigInt64ArrayFilterTwo5900
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `ret[0]` equals `100n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([100n, 200n]);
      let ret = src.filter((val: bigint) => true);
      src[0] = 555n;
      expect(ret[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6000
     * @tc.name testBigInt64ArrayFilterTwo6000
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `ret[2]` equals `300n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([100n, 200n, 300n]);
      let ret = src.filter((val: bigint) => true);
      src[2] = 555n;
      expect(ret[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6100
     * @tc.name testBigInt64ArrayFilterTwo6100
     * @tc.desc Verify `src.filter((val) => val > 10n)` produces a result where `ret.buffer.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array(2);
      src[0] = 1n;
      src[1] = 2n;
      let ret = src.filter((val: bigint) => val > 10n);
      expect(ret.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6200
     * @tc.name testBigInt64ArrayFilterTwo6200
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `new BigInt64Array([9n, 8n])[0]` equals `9n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([9n, 8n]);
      let ret = src.filter((val: bigint) => true);
      let dv = new DataView(ret.buffer);
      dv.setBigInt64(0, 1000n, true);
      expect(src[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6300
     * @tc.name testBigInt64ArrayFilterTwo6300
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `(ret2.buffer === ret1.buffer)` is false, `(ret1.buffer === src.buffer)` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n]);
      let ret1 = src.filter((val: bigint) => val > 0n);
      let ret2 = ret1.filter((val: bigint) => val < 3n);
      let isBuf2Buf1 = (ret2.buffer === ret1.buffer);
      let isBuf1Src = (ret1.buffer === src.buffer);
      expect(isBuf2Buf1).assertEqual(false);
      expect(isBuf1Src).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6400
     * @tc.name testBigInt64ArrayFilterTwo6400
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `isSameInst` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([88n, 99n]);
      let ret = src.filter((val: bigint) => true);
      let isSameInst = (ret === src);
      expect(isSameInst).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6500
     * @tc.name testBigInt64ArrayFilterTwo6500
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `new BigInt64Array([5n, -5n]).length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([5n, -5n]);
      src.filter((val: bigint) => val > 0n);
      expect(src.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6600
     * @tc.name testBigInt64ArrayFilterTwo6600
     * @tc.desc Verify `src.filter((val) => true)` produces a result where `new BigInt64Array([2n, 4n, 6n]).byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([2n, 4n, 6n]);
      src.filter((val: bigint) => true);
      expect(src.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6700
     * @tc.name testBigInt64ArrayFilterTwo6700
     * @tc.desc Verify `src.filter((val) => val === 2n)` produces a result where `new BigInt64Array([1n, 2n, 3n]).byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([1n, 2n, 3n]);
      src.filter((val: bigint) => val === 2n);
      expect(src.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6800
     * @tc.name testBigInt64ArrayFilterTwo6800
     * @tc.desc Verify `src.filter((val, idx, arr) => { let temp = arr[idx]; return temp > 0n; })` produces a result where `new BigInt64Array([11n, 22n])[1]` equals `22n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([11n, 22n]);
      src.filter((val: bigint, idx: int, arr: BigInt64Array) => {
        let temp = arr[idx];
        return temp > 0n;
      });
      expect(src[1]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_6900
     * @tc.name testBigInt64ArrayFilterTwo6900
     * @tc.desc Verify `src.filter((val) => val > 1n)` produces a result where `new BigInt64Array(buf)[0]` equals `1n`, `new BigInt64Array(buf)[1]` equals `2n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let src = new BigInt64Array(buf);
      src[0] = 1n;
      src[1] = 2n;
      let sibling = new BigInt64Array(buf);
      src.filter((val: bigint) => val > 1n);
      expect(sibling[0]).assertEqual(1n);
      expect(sibling[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_7000
     * @tc.name testBigInt64ArrayFilterTwo7000
     * @tc.desc Verify `new BigInt64Array([10n, 20n])` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n]);
      try {
        src.filter((val: bigint) => {
          if (val === 20n) {
            throw new Error("test");
          }
          return true;
        });
      } catch (e) {
        expect(src.length).assertEqual(2);
        expect(src[0]).assertEqual(10n);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_7100
     * @tc.name testBigInt64ArrayFilterTwo7100
     * @tc.desc Verify `src.filter((val) => val > 0n)` produces a result where `new BigInt64Array([33n, -33n])[1]` equals `-33n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([33n, -33n]);
      src.filter((val: bigint) => val > 0n);
      expect(src[1]).assertEqual(-33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILTER_TWO_7200
     * @tc.name testBigInt64ArrayFilterTwo7200
     * @tc.desc Verify `src.filter((val) => val === 60n)` produces a result where `isSameRef` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFilterTwo7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([50n, 60n, 70n]);
      let srcRef = src;
      src.filter((val: bigint) => val === 60n);
      let isSameRef = (srcRef === src);
      expect(isSameRef).assertEqual(true);
    });

  });
}
