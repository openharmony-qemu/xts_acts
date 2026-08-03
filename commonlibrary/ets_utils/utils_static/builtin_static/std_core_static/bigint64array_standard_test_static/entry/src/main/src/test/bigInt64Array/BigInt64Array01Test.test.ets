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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function BigInt64Array01Test(): void {
  describe('BigInt64Array01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0100
     * @tc.name testBigInt64ArrayOne0100
     * @tc.desc Verify static BYTES_PER_ELEMENT equals 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array()
      expect(arr.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0200
     * @tc.name testBigInt64ArrayOne0200
     * @tc.desc Verify a created instance is recognized as BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0300
     * @tc.name testBigInt64ArrayOne0300
     * @tc.desc Verify instance BYTES_PER_ELEMENT equals 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0400
     * @tc.name testBigInt64ArrayOne0400
     * @tc.desc Verify length constructor creates iterable zero-filled elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      let count = 0;
      for (const value of arr) {
        count++;
        expect(value).assertEqual(0n);
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0500
     * @tc.name testBigInt64ArrayOne0500
     * @tc.desc Verify byteLength equals 0 when the length argument is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0600
     * @tc.name testBigInt64ArrayOne0600
     * @tc.desc Verify buffer.byteLength equals 0 when the length argument is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0700
     * @tc.name testBigInt64ArrayOne0700
     * @tc.desc Verify byteOffset equals 0 when the length argument is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0800
     * @tc.name testBigInt64ArrayOne0800
     * @tc.desc Verify out-of-range read throws RangeError for a fixed length instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      try {
        arr[2];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_0900
     * @tc.name testBigInt64ArrayOne0900
     * @tc.desc Verify byteLength equals 8 when the length argument is 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1000
     * @tc.name testBigInt64ArrayOne1000
     * @tc.desc Verify buffer.byteLength equals 8 when the length argument is 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1100
     * @tc.name testBigInt64ArrayOne1100
     * @tc.desc Verify byteOffset equals 0 when the length argument is 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1200
     * @tc.name testBigInt64ArrayOne1200
     * @tc.desc Verify length equals 5 when the length argument is 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1300
     * @tc.name testBigInt64ArrayOne1300
     * @tc.desc Verify byteLength equals 40 when the length argument is 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      expect(arr.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1400
     * @tc.name testBigInt64ArrayOne1400
     * @tc.desc Verify buffer.byteLength equals 40 when the length argument is 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      expect(arr.buffer.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1500
     * @tc.name testBigInt64ArrayOne1500
     * @tc.desc Verify byteOffset equals 0 when the length argument is 5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1600
     * @tc.name testBigInt64ArrayOne1600
     * @tc.desc Verify length equals 99 when the length argument is 99.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(99);
      expect(arr.length).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1700
     * @tc.name testBigInt64ArrayOne1700
     * @tc.desc Verify byteLength equals 792 when the length argument is 99.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(99);
      expect(arr.byteLength).assertEqual(792);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1800
     * @tc.name testBigInt64ArrayOne1800
     * @tc.desc Verify buffer.byteLength equals 792 when the length argument is 99.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(99);
      expect(arr.buffer.byteLength).assertEqual(792);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_1900
     * @tc.name testBigInt64ArrayOne1900
     * @tc.desc Verify byteOffset equals 0 when the length argument is 99.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(99);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2000
     * @tc.name testBigInt64ArrayOne2000
     * @tc.desc Verify length equals 0 for an empty source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2100
     * @tc.name testBigInt64ArrayOne2100
     * @tc.desc Verify byteLength equals 0 for an empty source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2200
     * @tc.name testBigInt64ArrayOne2200
     * @tc.desc Verify buffer.byteLength equals 0 for an empty source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2300
     * @tc.name testBigInt64ArrayOne2300
     * @tc.desc Verify byteOffset equals 0 for an empty source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2400
     * @tc.name testBigInt64ArrayOne2400
     * @tc.desc Verify length equals 1 for the source array [0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2500
     * @tc.name testBigInt64ArrayOne2500
     * @tc.desc Verify byteLength equals 8 for the source array [0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2600
     * @tc.name testBigInt64ArrayOne2600
     * @tc.desc Verify buffer.byteLength equals 8 for the source array [0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2700
     * @tc.name testBigInt64ArrayOne2700
     * @tc.desc Verify byteOffset equals 0 for the source array [0n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2800
     * @tc.name testBigInt64ArrayOne2800
     * @tc.desc Verify length equals 3 for the source array [1n, 2n, 3n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_2900
     * @tc.name testBigInt64ArrayOne2900
     * @tc.desc Verify byteLength equals 24 for the source array [1n, 2n, 3n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3000
     * @tc.name testBigInt64ArrayOne3000
     * @tc.desc Verify buffer.byteLength equals 24 for the source array [1n, 2n, 3n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3100
     * @tc.name testBigInt64ArrayOne3100
     * @tc.desc Verify byteOffset equals 0 for the source array [1n, 2n, 3n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3200
     * @tc.name testBigInt64ArrayOne3200
     * @tc.desc Verify length equals 1 for the max positive source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3300
     * @tc.name testBigInt64ArrayOne3300
     * @tc.desc Verify byteLength equals 8 for the max positive source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3400
     * @tc.name testBigInt64ArrayOne3400
     * @tc.desc Verify buffer.byteLength equals 8 for the max positive source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3500
     * @tc.name testBigInt64ArrayOne3500
     * @tc.desc Verify byteOffset equals 0 for the max positive source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3600
     * @tc.name testBigInt64ArrayOne3600
     * @tc.desc Verify length equals 1 for the min negative source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3700
     * @tc.name testBigInt64ArrayOne3700
     * @tc.desc Verify byteLength equals 8 for the min negative source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3800
     * @tc.name testBigInt64ArrayOne3800
     * @tc.desc Verify buffer.byteLength equals 8 for the min negative source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_3900
     * @tc.name testBigInt64ArrayOne3900
     * @tc.desc Verify byteOffset equals 0 for the min negative source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4000
     * @tc.name testBigInt64ArrayOne4000
     * @tc.desc Verify two views over the same ArrayBuffer observe the same write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let writer = new BigInt64Array(buf);
      let reader = new BigInt64Array(buf);
      writer[1] = -7n;
      expect(reader[1]).assertEqual(-7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4100
     * @tc.name testBigInt64ArrayOne4100
     * @tc.desc Verify byteLength equals 0 for a view over ArrayBuffer(0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new BigInt64Array(buf);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4200
     * @tc.name testBigInt64ArrayOne4200
     * @tc.desc Verify byteOffset equals 0 for a view over ArrayBuffer(0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new BigInt64Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4300
     * @tc.name testBigInt64ArrayOne4300
     * @tc.desc Verify ArrayBuffer bytes map to element length and visible byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf);
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4400
     * @tc.name testBigInt64ArrayOne4400
     * @tc.desc Verify byteLength equals 8 for a view over ArrayBuffer(8).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4500
     * @tc.name testBigInt64ArrayOne4500
     * @tc.desc Verify byteOffset equals 0 for a view over ArrayBuffer(8).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4600
     * @tc.name testBigInt64ArrayOne4600
     * @tc.desc Verify an offset view write is visible through the full buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 16);
      view[0] = 55n;
      expect(full[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4700
     * @tc.name testBigInt64ArrayOne4700
     * @tc.desc Verify byteLength maps correctly for a view over ArrayBuffer(1024).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1024);
      let arr = new BigInt64Array(buf);
      expect(arr.byteLength).assertEqual(1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4800
     * @tc.name testBigInt64ArrayOne4800
     * @tc.desc Verify length equals 4 when creating a view with offset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_4900
     * @tc.name testBigInt64ArrayOne4900
     * @tc.desc Verify byteLength equals 32 when creating a view with offset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 0);
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5000
     * @tc.name testBigInt64ArrayOne5000
     * @tc.desc Verify offset 8 maps view index zero to the second buffer element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 8);
      view[0] = 33n;
      expect(full[1]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5100
     * @tc.name testBigInt64ArrayOne5100
     * @tc.desc Verify an explicit length limits an aligned offset view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5200
     * @tc.name testBigInt64ArrayOne5200
     * @tc.desc Verify an explicit-length view retains the original ArrayBuffer reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 8, 3);
      expect(arr.byteLength).assertEqual(24);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5300
     * @tc.name testBigInt64ArrayOne5300
     * @tc.desc Verify full buffer writes are visible through an offset view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 8);
      full[2] = -44n;
      expect(view[1]).assertEqual(-44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5400
     * @tc.name testBigInt64ArrayOne5400
     * @tc.desc Verify a subarray reports its relative length and shares writes with its parent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([1n, 2n, 3n, 4n]);
      let arr = parent.subarray(1, 3);
      arr[0] = 20n;
      expect(arr.length).assertEqual(2);
      expect(parent[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5500
     * @tc.name testBigInt64ArrayOne5500
     * @tc.desc Verify a subarray byte length matches its visible two-element range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([5n, 6n, 7n, 8n, 9n]);
      let arr = parent.subarray(2, 4);
      expect(arr.byteLength).assertEqual(16);
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5600
     * @tc.name testBigInt64ArrayOne5600
     * @tc.desc Verify offset 16 view writes map to the fifth full-buffer element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 16);
      view[2] = 77n;
      expect(full[4]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5700
     * @tc.name testBigInt64ArrayOne5700
     * @tc.desc Verify an explicit zero-length view can begin in the middle of a buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 16, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5800
     * @tc.name testBigInt64ArrayOne5800
     * @tc.desc Verify an empty middle view has zero byte length while retaining its buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let arr = new BigInt64Array(buf, 24, 0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.buffer).assertEqual(buf);
      expect(arr.byteOffset).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_5900
     * @tc.name testBigInt64ArrayOne5900
     * @tc.desc Verify tail offset view writes the last element in the backing buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 24);
      view[1] = 88n;
      expect(full[4]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6000
     * @tc.name testBigInt64ArrayOne6000
     * @tc.desc Verify an explicit one-element tail view writes through to the backing buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let parent = new BigInt64Array(buf);
      let arr = new BigInt64Array(buf, 24, 1);
      arr[0] = 77n;
      expect(arr.length).assertEqual(1);
      expect(parent[3]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6100
     * @tc.name testBigInt64ArrayOne6100
     * @tc.desc Verify a tail view keeps its byte length after a parent-buffer update.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let parent = new BigInt64Array(buf);
      let arr = new BigInt64Array(buf, 24);
      parent[3] = -88n;
      expect(arr.byteLength).assertEqual(8);
      expect(arr[0]).assertEqual(-88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6200
     * @tc.name testBigInt64ArrayOne6200
     * @tc.desc Verify byteOffset equals 32 for a boundary view with offset 32.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 32);
      expect(arr.byteOffset).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6300
     * @tc.name testBigInt64ArrayOne6300
     * @tc.desc Verify explicit offset view does not overwrite the preceding element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(72);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 24, 3);
      full[2] = 12n;
      view[0] = 21n;
      expect(full[2]).assertEqual(12n);
      expect(full[3]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6400
     * @tc.name testBigInt64ArrayOne6400
     * @tc.desc Verify explicit length makes later buffer elements out of range for the view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(72);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 24, 3);
      full[6] = 99n;
      try {
        view[3];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(full[6]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6500
     * @tc.name testBigInt64ArrayOne6500
     * @tc.desc Verify byteOffset equals 0 when offset 0 and length 0 are passed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(64);
      let arr = new BigInt64Array(buf, 0, 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6600
     * @tc.name testBigInt64ArrayOne6600
     * @tc.desc Verify explicit views at different offsets do not overlap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let left = new BigInt64Array(buf, 0, 4);
      let right = new BigInt64Array(buf, 32, 4);
      left[3] = 5n;
      right[0] = 6n;
      expect(left[3]).assertEqual(5n);
      expect(right[0]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6700
     * @tc.name testBigInt64ArrayOne6700
     * @tc.desc Verify explicit view last index maps to the full buffer index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 32, 4);
      view[3] = -9n;
      expect(full[7]).assertEqual(-9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6800
     * @tc.name testBigInt64ArrayOne6800
     * @tc.desc Verify byteOffset equals 0 when offset 0 and length 2 are passed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(64);
      let arr = new BigInt64Array(buf, 0, 2);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_6900
     * @tc.name testBigInt64ArrayOne6900
     * @tc.desc Verify explicit offset and length write through the final visible element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 8, 5);
      view[4] = 123n;
      expect(full[5]).assertEqual(123n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_7000
     * @tc.name testBigInt64ArrayOne7000
     * @tc.desc Verify explicit length makes the next full-buffer element out of range for the view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let full = new BigInt64Array(buf);
      let view = new BigInt64Array(buf, 8, 5);
      full[6] = 456n;
      try {
        view[5];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(full[6]).assertEqual(456n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_7100
     * @tc.name testBigInt64ArrayOne7100
     * @tc.desc Verify byteOffset equals 8 when offset 8 and length 3 are passed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(64);
      let arr = new BigInt64Array(buf, 8, 3);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_7200
     * @tc.name testBigInt64ArrayOne7200
     * @tc.desc Verify explicit view keeps the backing buffer and visible byte length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(96);
      let arr = new BigInt64Array(buf, 32, 4);
      expect(arr.buffer === buf).assertTrue();
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_7300
     * @tc.name testBigInt64ArrayOne7300
     * @tc.desc Verify separate explicit views over one buffer keep independent ranges.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(96);
      let first = new BigInt64Array(buf, 0, 2);
      let second = new BigInt64Array(buf, 16, 2);
      first[1] = 11n;
      second[0] = 22n;
      expect(first[1]).assertEqual(11n);
      expect(second[0]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ONE_7400
     * @tc.name testBigInt64ArrayOne7400
     * @tc.desc Verify byteOffset equals 16 when offset 16 and length 4 are passed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayOne7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(64);
      let arr = new BigInt64Array(buf, 16, 4);
      expect(arr.byteOffset).assertEqual(16);
    });

  });
}
