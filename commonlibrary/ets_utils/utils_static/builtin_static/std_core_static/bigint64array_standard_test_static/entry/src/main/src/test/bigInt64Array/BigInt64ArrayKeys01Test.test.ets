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

export default function BigInt64ArrayKeys01Test(): void {
  describe('BigInt64ArrayKeys01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0100
     * @tc.name testBigInt64ArrayKeysOne0100
     * @tc.desc Verify keys on an empty BigInt64Array returns done immediately.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let iter = arr.keys();
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0200
     * @tc.name testBigInt64ArrayKeysOne0200
     * @tc.desc Verify keys on a length-one BigInt64Array yields index zero then completes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      let iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0300
     * @tc.name testBigInt64ArrayKeysOne0300
     * @tc.desc Verify keys on a length-two BigInt64Array yields the second index correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      let iter = arr.keys();
      iter.next();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0400
     * @tc.name testBigInt64ArrayKeysOne0400
     * @tc.desc Verify keys on a length-three BigInt64Array iterates to index two correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0500
     * @tc.name testBigInt64ArrayKeysOne0500
     * @tc.desc Verify keys on a length-fourteen BigInt64Array reaches the final boundary index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(14);
      let iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0600
     * @tc.name testBigInt64ArrayKeysOne0600
     * @tc.desc Verify keys returns index zero for a single element array created from 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0700
     * @tc.name testBigInt64ArrayKeysOne0700
     * @tc.desc Verify keys returns index zero for a single element array created from -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0800
     * @tc.name testBigInt64ArrayKeysOne0800
     * @tc.desc Verify keys returns index zero for a single element array at the signed 64-bit min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      let iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_0900
     * @tc.name testBigInt64ArrayKeysOne0900
     * @tc.desc Verify keys returns index zero for a single element array created from -0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-0n]);
      let iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1000
     * @tc.name testBigInt64ArrayKeysOne1000
     * @tc.desc Verify keys returns index zero for a single element array created from 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1100
     * @tc.name testBigInt64ArrayKeysOne1100
     * @tc.desc Verify keys yields index one for a two-element array [1n, 2n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.keys();
      iter.next();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1200
     * @tc.name testBigInt64ArrayKeysOne1200
     * @tc.desc Verify keys yields index two for a three-element array [1n, 2n, 3n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1300
     * @tc.name testBigInt64ArrayKeysOne1300
     * @tc.desc Verify keys yields index one for a two-element array [-1n, -2n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let iter = arr.keys();
      iter.next();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1400
     * @tc.name testBigInt64ArrayKeysOne1400
     * @tc.desc Verify keys yields index two for a three-element array [-1n, -2n, -3n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n]);
      let iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1500
     * @tc.name testBigInt64ArrayKeysOne1500
     * @tc.desc Verify keys yields index one for a two-element array filled with zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let iter = arr.keys();
      iter.next();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1600
     * @tc.name testBigInt64ArrayKeysOne1600
     * @tc.desc Verify keys yields index two for a three-element array filled with zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1700
     * @tc.name testBigInt64ArrayKeysOne1700
     * @tc.desc Verify keys yields index one for a mixed sign array [1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let iter = arr.keys();
      iter.next();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1800
     * @tc.name testBigInt64ArrayKeysOne1800
     * @tc.desc Verify keys yields index two for a mixed array [0n, 1n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, -1n]);
      let iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_1900
     * @tc.name testBigInt64ArrayKeysOne1900
     * @tc.desc Verify keys on an ArrayBuffer-backed array yields index zero for one element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let arr = new BigInt64Array(buffer);
      let iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_2000
     * @tc.name testBigInt64ArrayKeysOne2000
     * @tc.desc Verify keys on a sixteen-byte buffer yields the final index one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr = new BigInt64Array(buffer);
      let iter = arr.keys();
      iter.next();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_2100
     * @tc.name testBigInt64ArrayKeysOne2100
     * @tc.desc Verify keys on a twenty-four-byte buffer yields the final index two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer);
      let iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_2200
     * @tc.name testBigInt64ArrayKeysOne2200
     * @tc.desc Verify keys on a forty-byte buffer yields the final index four.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(40);
      let arr = new BigInt64Array(buffer);
      let iter = arr.keys();
      iter.next();
      iter.next();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_2300
     * @tc.name testBigInt64ArrayKeysOne2300
     * @tc.desc Verify keys on a byteOffset eight view still starts from index zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr = new BigInt64Array(buffer, 8);
      let iter = arr.keys();
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_2400
     * @tc.name testBigInt64ArrayKeysOne2400
     * @tc.desc Verify keys on a byteOffset eight subview yields the final index one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 8);
      let iter = arr.keys();
      iter.next();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_2500
     * @tc.name testBigInt64ArrayKeysOne2500
     * @tc.desc Verify keys on a larger offset subview yields the final index two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let arr = new BigInt64Array(buffer, 8);
      let iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_ONE_2600
     * @tc.name testBigInt64ArrayKeysOne2600
     * @tc.desc Verify keys on a forty-byte buffer with offset sixteen yields the final index two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(40);
      let arr = new BigInt64Array(buffer, 16);
      let iter = arr.keys();
      iter.next();
      iter.next();
      expect(iter.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_2700
     * @tc.name testBigInt64ArrayKeysTwo2700
     * @tc.desc Verify the iterator from an empty array has typeof object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let it = arr.keys();
      expect(typeof it).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_2800
     * @tc.name testBigInt64ArrayKeysTwo2800
     * @tc.desc Verify next on the empty array iterator has typeof function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let it = arr.keys();
      expect(typeof it.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_2900
     * @tc.name testBigInt64ArrayKeysTwo2900
     * @tc.desc Verify next().value on the empty array iterator has typeof undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let it = arr.keys();
      expect(typeof it.next().value).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3000
     * @tc.name testBigInt64ArrayKeysTwo3000
     * @tc.desc Verify next().done on the empty array iterator has typeof boolean.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let it = arr.keys();
      expect(typeof it.next().done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3100
     * @tc.name testBigInt64ArrayKeysTwo3100
     * @tc.desc Verify next().value on a single-element iterator has typeof number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let it = arr.keys();
      expect(typeof it.next().value).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3200
     * @tc.name testBigInt64ArrayKeysTwo3200
     * @tc.desc Verify exhausted iterator value on a single-element array is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let it = arr.keys();
      it.next();
      expect(typeof it.next().value).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3300
     * @tc.name testBigInt64ArrayKeysTwo3300
     * @tc.desc Verify the first next() on an empty array returns done as true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let it = arr.keys();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3400
     * @tc.name testBigInt64ArrayKeysTwo3400
     * @tc.desc Verify the second next() on an empty array still returns done as true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let it = arr.keys();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3500
     * @tc.name testBigInt64ArrayKeysTwo3500
     * @tc.desc Verify the first next().done on a single-element array is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n]);
      let it = arr.keys();
      expect(it.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3600
     * @tc.name testBigInt64ArrayKeysTwo3600
     * @tc.desc Verify the second next().done on a single-element array is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n]);
      let it = arr.keys();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3700
     * @tc.name testBigInt64ArrayKeysTwo3700
     * @tc.desc Verify the third next().done on a single-element array remains true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n]);
      let it = arr.keys();
      it.next();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3800
     * @tc.name testBigInt64ArrayKeysTwo3800
     * @tc.desc Verify the second next().value on a two-element array is 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let it = arr.keys();
      it.next();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_3900
     * @tc.name testBigInt64ArrayKeysTwo3900
     * @tc.desc Verify the second next().done on a two-element array is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let it = arr.keys();
      it.next();
      expect(it.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4000
     * @tc.name testBigInt64ArrayKeysTwo4000
     * @tc.desc Verify the third next().done on a two-element array is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let it = arr.keys();
      it.next();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4100
     * @tc.name testBigInt64ArrayKeysTwo4100
     * @tc.desc Verify the fourth next().done on a two-element array remains true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4200
     * @tc.name testBigInt64ArrayKeysTwo4200
     * @tc.desc Verify the third next().value on a three-element array is 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let it = arr.keys();
      it.next();
      it.next();
      expect(it.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4300
     * @tc.name testBigInt64ArrayKeysTwo4300
     * @tc.desc Verify the third next().done on a three-element array is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let it = arr.keys();
      it.next();
      it.next();
      expect(it.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4400
     * @tc.name testBigInt64ArrayKeysTwo4400
     * @tc.desc Verify the fourth next().done on a three-element array is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let it = arr.keys();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4500
     * @tc.name testBigInt64ArrayKeysTwo4500
     * @tc.desc Verify the fifth next().done on a three-element array is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let it = arr.keys();
      it.next();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4600
     * @tc.name testBigInt64ArrayKeysTwo4600
     * @tc.desc Verify calling keys() does not change the array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.keys();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4700
     * @tc.name testBigInt64ArrayKeysTwo4700
     * @tc.desc Verify calling keys() does not change the array byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.keys();
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4800
     * @tc.name testBigInt64ArrayKeysTwo4800
     * @tc.desc Verify calling keys() does not change the array byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr.keys();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_4900
     * @tc.name testBigInt64ArrayKeysTwo4900
     * @tc.desc Verify calling keys() does not change the array elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([999n]);
      arr.keys();
      expect(arr[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5000
     * @tc.name testBigInt64ArrayKeysTwo5000
     * @tc.desc Verify two iteration steps do not change the length of a two-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([888n, 777n]);
      let it = arr.keys();
      it.next();
      it.next();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5100
     * @tc.name testBigInt64ArrayKeysTwo5100
     * @tc.desc Verify two iteration steps do not change the first element of a two-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([888n, 777n]);
      let it = arr.keys();
      it.next();
      it.next();
      expect(arr[0]).assertEqual(888n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5200
     * @tc.name testBigInt64ArrayKeysTwo5200
     * @tc.desc Verify the first key is 0 for the first shared-buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr1 = new BigInt64Array(buffer, 0, 1);
      let it = arr1.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5300
     * @tc.name testBigInt64ArrayKeysTwo5300
     * @tc.desc Verify the first key is 0 for the second shared-buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr2 = new BigInt64Array(buffer, 8, 1);
      let it = arr2.keys();
      expect(it.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5400
     * @tc.name testBigInt64ArrayKeysTwo5400
     * @tc.desc Verify out-of-range access returns done as true for the first shared-buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr1 = new BigInt64Array(buffer, 0, 1);
      let it = arr1.keys();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5500
     * @tc.name testBigInt64ArrayKeysTwo5500
     * @tc.desc Verify out-of-range access returns done as true for the second shared-buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr2 = new BigInt64Array(buffer, 8, 1);
      let it = arr2.keys();
      it.next();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5600
     * @tc.name testBigInt64ArrayKeysTwo5600
     * @tc.desc Verify iter1 returns the first key as 0 before iter2 advances.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let iter1 = arr.keys();
      let iter2 = arr.keys();
      expect(iter1.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5700
     * @tc.name testBigInt64ArrayKeysTwo5700
     * @tc.desc Verify iter1 reports done as true after it is exhausted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let iter1 = arr.keys();
      let iter2 = arr.keys();
      iter1.next();
      iter1.next();
      expect(iter1.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5800
     * @tc.name testBigInt64ArrayKeysTwo5800
     * @tc.desc Verify iter2 can still read the first key while iter1 is exhausted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let iter1 = arr.keys();
      let iter2 = arr.keys();
      iter1.next();
      iter1.next();
      iter1.next();
      expect(iter2.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_5900
     * @tc.name testBigInt64ArrayKeysTwo5900
     * @tc.desc Verify iter2 still reports done as false while iter1 is exhausted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let iter1 = arr.keys();
      let iter2 = arr.keys();
      iter1.next();
      iter1.next();
      iter1.next();
      expect(iter2.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6000
     * @tc.name testBigInt64ArrayKeysTwo6000
     * @tc.desc Verify iter2 still returns the first key after iter1 advances first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let iter1 = arr.keys();
      let iter2 = arr.keys();
      iter1.next();
      expect(iter2.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6100
     * @tc.name testBigInt64ArrayKeysTwo6100
     * @tc.desc Verify iter1 returns the second key based on its own position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let iter1 = arr.keys();
      let iter2 = arr.keys();
      iter1.next();
      iter2.next();
      expect(iter1.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6200
     * @tc.name testBigInt64ArrayKeysTwo6200
     * @tc.desc Verify mutating the first element after iterator creation does not change the first key.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n]);
      let iter = arr.keys();
      arr[0] = 555n;
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6300
     * @tc.name testBigInt64ArrayKeysTwo6300
     * @tc.desc Verify mutating the array after one step does not change the second key.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n]);
      let iter = arr.keys();
      iter.next();
      arr[0] = 555n;
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6400
     * @tc.name testBigInt64ArrayKeysTwo6400
     * @tc.desc Verify mutating the second element does not change retrieval of the second key.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n]);
      let iter = arr.keys();
      arr[1] = 666n;
      iter.next();
      expect(iter.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6500
     * @tc.name testBigInt64ArrayKeysTwo6500
     * @tc.desc Verify mutating the first element does not change the first done flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n]);
      let iter = arr.keys();
      arr[0] = 555n;
      expect(iter.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6600
     * @tc.name testBigInt64ArrayKeysTwo6600
     * @tc.desc Verify mutating the first element after one step does not change the second done flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n]);
      let iter = arr.keys();
      iter.next();
      arr[0] = 555n;
      expect(iter.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6700
     * @tc.name testBigInt64ArrayKeysTwo6700
     * @tc.desc Verify changing to the maximum value does not change the first key.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n]);
      let iter = arr.keys();
      arr[0] = 9223372036854775807n;
      expect(iter.next().value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_KEYS_TWO_6800
     * @tc.name testBigInt64ArrayKeysTwo6800
     * @tc.desc Verify changing to the minimum value does not change the first key.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayKeysTwo6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([111n, 222n]);
      let iter = arr.keys();
      arr[0] = -9223372036854775808n;
      expect(iter.next().value).assertEqual(0);
    });
  });
}
