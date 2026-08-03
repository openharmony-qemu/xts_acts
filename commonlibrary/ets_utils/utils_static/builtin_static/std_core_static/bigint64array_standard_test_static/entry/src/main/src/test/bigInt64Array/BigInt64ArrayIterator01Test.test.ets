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

export default function BigInt64ArrayIterator01Test(): void {
  describe('BigInt64ArrayIterator01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0100
     * @tc.name testBigInt64ArrayIteratorOne0100
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().done` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: bigint[] = [];
      let arr = new BigInt64Array(source);
      let it = arr.$_iterator();
      expect(it.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0200
     * @tc.name testBigInt64ArrayIteratorOne0200
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0300
     * @tc.name testBigInt64ArrayIteratorOne0300
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0400
     * @tc.name testBigInt64ArrayIteratorOne0400
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0500
     * @tc.name testBigInt64ArrayIteratorOne0500
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `1000n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(1000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0600
     * @tc.name testBigInt64ArrayIteratorOne0600
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `9223372036854775806n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0700
     * @tc.name testBigInt64ArrayIteratorOne0700
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `-9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(-9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0800
     * @tc.name testBigInt64ArrayIteratorOne0800
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_ONE_0900
     * @tc.name testBigInt64ArrayIteratorOne0900
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1000
     * @tc.name testBigInt64ArrayIteratorTwo1000
     * @tc.desc Verify `arr.$_iterator()` produces a result where `typeof arr.$_iterator()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.$_iterator();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1100
     * @tc.name testBigInt64ArrayIteratorTwo1100
     * @tc.desc Verify `arr.$_iterator()` produces a result where `typeof iter.next` equals `'function'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.$_iterator();
      expect(typeof iter.next).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1200
     * @tc.name testBigInt64ArrayIteratorTwo1200
     * @tc.desc Verify `arr.$_iterator()` produces a result where `typeof iter.next()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.$_iterator();
      let res = iter.next();
      expect(typeof res).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1300
     * @tc.name testBigInt64ArrayIteratorTwo1300
     * @tc.desc Verify `arr.$_iterator()` produces a result where `typeof iter.next().done` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.$_iterator();
      let res = iter.next();
      expect(typeof res.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1400
     * @tc.name testBigInt64ArrayIteratorTwo1400
     * @tc.desc Verify `arr.$_iterator()` produces a result where `typeof iter.next().value` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.$_iterator();
      let res = iter.next();
      expect(typeof res.value).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1500
     * @tc.name testBigInt64ArrayIteratorTwo1500
     * @tc.desc Verify `arr.$_iterator()` produces a result where `typeof iter.next().value` equals `'undefined'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.$_iterator();
      let res = iter.next();
      expect(typeof res.value).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1600
     * @tc.name testBigInt64ArrayIteratorTwo1600
     * @tc.desc Verify `arr.$_iterator()` produces a result where `typeof iteratorText` equals `'string'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.$_iterator();
      let iteratorText = iter.toString();
      expect(typeof iteratorText).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1700
     * @tc.name testBigInt64ArrayIteratorTwo1700
     * @tc.desc Verify `arr.$_iterator()` keeps the source array length equal to `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.$_iterator();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1800
     * @tc.name testBigInt64ArrayIteratorTwo1800
     * @tc.desc Verify `arr.$_iterator()` produces a result where `new BigInt64Array([1n, 2n, 3n]).byteLength` equals `origByteLen`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let origByteLen = arr.byteLength;
      arr.$_iterator();
      expect(arr.byteLength).assertEqual(origByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_1900
     * @tc.name testBigInt64ArrayIteratorTwo1900
     * @tc.desc Verify `arr.$_iterator()` produces a result where `new BigInt64Array([1n, 2n, 3n]).byteOffset` equals `origByteOff`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let origByteOff = arr.byteOffset;
      arr.$_iterator();
      expect(arr.byteOffset).assertEqual(origByteOff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2000
     * @tc.name testBigInt64ArrayIteratorTwo2000
     * @tc.desc Verify `arr.$_iterator()` produces a result where `new BigInt64Array([42n, 2n, 3n])[0]` equals `42n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 2n, 3n]);
      arr.$_iterator();
      expect(arr[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2100
     * @tc.name testBigInt64ArrayIteratorTwo2100
     * @tc.desc Verify `arr.$_iterator()` produces a result where `new BigInt64Array([5n]).buffer.byteLength` equals `len`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let buf = arr.buffer;
      let len = buf.byteLength;
      let iter = arr.$_iterator();
      iter.next();
      expect(arr.buffer.byteLength).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2200
     * @tc.name testBigInt64ArrayIteratorTwo2200
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `77n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([77n]);
      let iter = arr.$_iterator();
      let res = iter.next();
      expect(res.value).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2300
     * @tc.name testBigInt64ArrayIteratorTwo2300
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([77n]);
      let iter = arr.$_iterator();
      iter.next();
      let res2 = iter.next();
      expect(res2.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2400
     * @tc.name testBigInt64ArrayIteratorTwo2400
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().done` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([77n]);
      let iter = arr.$_iterator();
      let res = iter.next();
      expect(res.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2500
     * @tc.name testBigInt64ArrayIteratorTwo2500
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().done` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([77n]);
      let iter = arr.$_iterator();
      iter.next();
      let res2 = iter.next();
      expect(res2.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2600
     * @tc.name testBigInt64ArrayIteratorTwo2600
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n, 99n]);
      let iter = arr.$_iterator();
      iter.next();
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2700
     * @tc.name testBigInt64ArrayIteratorTwo2700
     * @tc.desc Verify `arr.$_iterator()` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let iter = arr.$_iterator();
      let sum = 0n;
      let res = iter.next();
      while (!res.done) {
        sum += res.value as bigint;
        res = iter.next();
      }
      expect(sum).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2800
     * @tc.name testBigInt64ArrayIteratorTwo2800
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `31n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([31n]);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_2900
     * @tc.name testBigInt64ArrayIteratorTwo2900
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `-31n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-31n]);
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(-31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3000
     * @tc.name testBigInt64ArrayIteratorTwo3000
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value + 1n` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      let iter = arr.$_iterator();
      let v = iter.next().value as bigint;
      expect(v + 1n).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3100
     * @tc.name testBigInt64ArrayIteratorTwo3100
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(new ArrayBuffer(80));
      let iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3200
     * @tc.name testBigInt64ArrayIteratorTwo3200
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `22n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n]);
      let iter = arr.$_iterator();
      arr[0] = 22n;
      let res = iter.next();
      expect(res.value).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3300
     * @tc.name testBigInt64ArrayIteratorTwo3300
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 12n]);
      let iter = arr.$_iterator();
      iter.next();
      arr[1] = 99n;
      let res = iter.next();
      expect(res.value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3400
     * @tc.name testBigInt64ArrayIteratorTwo3400
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n]);
      let iter = arr.$_iterator();
      iter.next();
      arr[0] = 99n;
      let res = iter.next();
      expect(res.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3500
     * @tc.name testBigInt64ArrayIteratorTwo3500
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n]);
      let iter = arr.$_iterator();
      arr[0] = -9223372036854775807n - 1n;
      let res = iter.next();
      expect(res.value).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3600
     * @tc.name testBigInt64ArrayIteratorTwo3600
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n]);
      let iter = arr.$_iterator();
      arr[0] = 9223372036854775807n;
      let res = iter.next();
      expect(res.value).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3700
     * @tc.name testBigInt64ArrayIteratorTwo3700
     * @tc.desc Verify `arr1.$_iterator()` produces a result where `iter.next().value` equals `1234567n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let arr1 = new BigInt64Array(buffer);
      let arr2 = new BigInt64Array(buffer);
      let iter = arr1.$_iterator();
      arr2[0] = 1234567n;
      let res = iter.next();
      expect(res.value).assertEqual(1234567n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3800
     * @tc.name testBigInt64ArrayIteratorTwo3800
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `5555n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr = new BigInt64Array(buffer, 0, 2);
      let iter = arr.$_iterator();
      iter.next();
      let arrOffset = new BigInt64Array(buffer, 8, 1);
      arrOffset[0] = 5555n;
      let res = iter.next();
      expect(res.value).assertEqual(5555n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_3900
     * @tc.name testBigInt64ArrayIteratorTwo3900
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let iter = arr.$_iterator();
      iter.next();
      arr.fill(99n);
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4000
     * @tc.name testBigInt64ArrayIteratorTwo4000
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `88n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let iter = arr.$_iterator();
      let sub = arr.subarray(1, 2);
      sub[0] = 88n;
      iter.next();
      expect(iter.next().value).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4100
     * @tc.name testBigInt64ArrayIteratorTwo4100
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `1n`, `iter.next().value` equals `2n`, and `iter.next().value` equals `3n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let iter = arr.$_iterator();
      arr[0] = 1n;
      expect(iter.next().value).assertEqual(1n);
      arr[1] = 2n;
      expect(iter.next().value).assertEqual(2n);
      arr[2] = 3n;
      expect(iter.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4200
     * @tc.name testBigInt64ArrayIteratorTwo4200
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.$_iterator();
      iter.next();
      arr[0] = 99n;
      let res = iter.next();
      expect(res.value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4300
     * @tc.name testBigInt64ArrayIteratorTwo4300
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let iter = arr.$_iterator();
      iter.next();
      arr.reverse();
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4400
     * @tc.name testBigInt64ArrayIteratorTwo4400
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n]);
      let iter = arr.$_iterator();
      iter.next();
      arr.sort();
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4500
     * @tc.name testBigInt64ArrayIteratorTwo4500
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let iter = arr.$_iterator();
      iter.next();
      arr.copyWithin(1, 0, 1);
      expect(iter.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4600
     * @tc.name testBigInt64ArrayIteratorTwo4600
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter1.next().value` equals `5n`, `arr.$_iterator().next().value` equals `5n`, and `iter1.next().value` equals `6n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n, 7n]);
      let iter1 = arr.$_iterator();
      let iter2 = arr.$_iterator();
      expect(iter1.next().value).assertEqual(5n);
      expect(iter2.next().value).assertEqual(5n);
      expect(iter1.next().value).assertEqual(6n);
      expect(iter2.next().value).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4700
     * @tc.name testBigInt64ArrayIteratorTwo4700
     * @tc.desc Verify `arr.$_iterator()` produces a result where `v1` equals `100n`, `v2` equals `200n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let iter = arr.$_iterator();
      let callIter = (): bigint | undefined => {
        return iter.next().value;
      };
      let v1 = callIter();
      let v2 = callIter();
      expect(v1).assertEqual(100n);
      expect(v2).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4800
     * @tc.name testBigInt64ArrayIteratorTwo4800
     * @tc.desc Verify `arr.$_iterator()` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 8n]);
      let iter = arr.$_iterator();
      let out: Array<bigint> = [];
      let r = iter.next();
      while (!r.done) {
        out.push(r.value as bigint);
        r = iter.next();
      }
      expect(out[0]).assertEqual(9n);
      expect(out[1]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_4900
     * @tc.name testBigInt64ArrayIteratorTwo4900
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `33n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n]);
      let iter = arr.$_iterator();
      iter.next();
      arr.set([33n], 1);
      expect(iter.next().value).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_5000
     * @tc.name testBigInt64ArrayIteratorTwo5000
     * @tc.desc Verify `arr.$_iterator()` produces a result where `arr.$_iterator().next().value` equals `7n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n]);
      let i1 = arr.$_iterator();
      let i2 = arr.$_iterator();
      i1.next(); i1.next();
      expect(i2.next().value).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_5100
     * @tc.name testBigInt64ArrayIteratorTwo5100
     * @tc.desc Verify `arr.$_iterator()` produces a result where `iter.next().value` equals `33n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([33n, 44n]);
      let iter = arr.$_iterator();
      iter.next();
      iter = arr.$_iterator();
      expect(iter.next().value).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT_SIXTY_FOUR_ARRAY_ITERATOR_TWO_5200
     * @tc.name testBigInt64ArrayIteratorTwo5200
     * @tc.desc Verify `arr.$_iterator()` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.$_iterator();
      for (let i: int = 0; i < 100; i++) {
        iter.next();
      }
      expect(iter.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_THREE_5300
     * @tc.name testBigInt64ArrayIteratorThree5300
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().done` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorThree5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let it = arr.$_iterator();
      it.next();
      arr[0] = 50n;
      let res = it.next();
      expect(res.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_THREE_5400
     * @tc.name testBigInt64ArrayIteratorThree5400
     * @tc.desc Verify `view.$_iterator()` produces a result where `it.next().value` equals `66n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorThree5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let view = new BigInt64Array(buffer, 8, 1);
      view[0] = 66n;
      let it = view.$_iterator();
      expect(it.next().value).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_THREE_5500
     * @tc.name testBigInt64ArrayIteratorThree5500
     * @tc.desc Verify `view2.$_iterator()` produces a result where `it.next().value` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorThree5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let view1 = new Uint8Array(buffer);
      let view2 = new BigInt64Array(buffer);
      view1.fill(0);
      view1[0] = 1;
      let it = view2.$_iterator();
      expect(it.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_THREE_5600
     * @tc.name testBigInt64ArrayIteratorThree5600
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorThree5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.fill(99n);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_THREE_5700
     * @tc.name testBigInt64ArrayIteratorThree5700
     * @tc.desc Verify `arr.$_iterator()` produces a result where `new BigInt64Array([11n, 22n])[0]` equals `22n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorThree5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n]);
      let it = arr.$_iterator();
      arr[0] += it.next().value as bigint;
      expect(arr[0]).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_FOUR_5800
     * @tc.name testBigInt64ArrayIteratorFour5800
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorFour5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-0n]);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_FOUR_5900
     * @tc.name testBigInt64ArrayIteratorFour5900
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `-11n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorFour5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -11n, -12n]);
      let it = arr.$_iterator();
      it.next();
      expect(it.next().value).assertEqual(-11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_FOUR_6000
     * @tc.name testBigInt64ArrayIteratorFour6000
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorFour6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 3n, 5n);
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_FOUR_6100
     * @tc.name testBigInt64ArrayIteratorFour6100
     * @tc.desc Verify `arr.$_iterator()` produces a result where `it.next().value` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorFour6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      arr.reverse();
      let it = arr.$_iterator();
      expect(it.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_FOUR_6200
     * @tc.name testBigInt64ArrayIteratorFour6200
     * @tc.desc Verify `view.$_iterator().next()` produces a result where `res.done` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorFour6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0);
      let view = new BigInt64Array(buffer);
      let res = view.$_iterator().next();
      expect(res.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ITERATOR_FOUR_6300
     * @tc.name testBigInt64ArrayIteratorFour6300
     * @tc.desc Verify `arr.$_iterator()` produces a result where `res.done` is true, `it.next().value` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIteratorFour6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let it = arr.$_iterator();
      let res = it.next();
      let flag1 = res.done as boolean;
      expect(flag1).assertEqual(true);
      expect(res.value).assertUndefined();
    });
  });
}
