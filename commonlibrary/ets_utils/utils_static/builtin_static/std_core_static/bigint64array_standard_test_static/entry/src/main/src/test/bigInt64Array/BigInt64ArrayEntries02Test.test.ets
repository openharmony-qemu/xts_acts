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

export default function BigInt64ArrayEntries02Test(): void {
  describe('BigInt64ArrayEntries02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0100
     * @tc.name testBigInt64ArrayEntriesTwo0100
     * @tc.desc Verify `arr.entries()` produces a result where `typeof arr.entries()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0200
     * @tc.name testBigInt64ArrayEntriesTwo0200
     * @tc.desc Verify `arr.entries()` produces a result where `typeof arr.entries()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0300
     * @tc.name testBigInt64ArrayEntriesTwo0300
     * @tc.desc Verify `arr.entries()` produces a result where `typeof arr.entries()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0400
     * @tc.name testBigInt64ArrayEntriesTwo0400
     * @tc.desc Verify `arr.entries()` produces a result where `typeof arr.entries()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0500
     * @tc.name testBigInt64ArrayEntriesTwo0500
     * @tc.desc Verify `arr.entries()` produces a result where `typeof arr.entries()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let arr = new BigInt64Array(buffer);
      let iter = arr.entries();
      expect(typeof iter).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0600
     * @tc.name testBigInt64ArrayEntriesTwo0600
     * @tc.desc Verify `arr.entries()` produces a result where `typeof iter.next()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(typeof nextObj).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0700
     * @tc.name testBigInt64ArrayEntriesTwo0700
     * @tc.desc Verify `arr.entries()` produces a result where `typeof iter.next()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(typeof nextObj).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0800
     * @tc.name testBigInt64ArrayEntriesTwo0800
     * @tc.desc Verify `arr.entries()` produces a result where `typeof iter.next()` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([291n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(typeof nextObj).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_0900
     * @tc.name testBigInt64ArrayEntriesTwo0900
     * @tc.desc Verify `arr.entries()` produces a result where `typeof iter.next().done` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(typeof nextObj.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1000
     * @tc.name testBigInt64ArrayEntriesTwo1000
     * @tc.desc Verify `arr.entries()` produces a result where `typeof iter.next().done` equals `'boolean'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(typeof nextObj.done).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1100
     * @tc.name testBigInt64ArrayEntriesTwo1100
     * @tc.desc Verify `arr.entries()` produces a result where `typeof iter.next().value` equals `'object'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(typeof nextObj.value).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1200
     * @tc.name testBigInt64ArrayEntriesTwo1200
     * @tc.desc Verify `arr.entries()` produces a result where `typeof nextObj.value[0]` equals `'int'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      let val = nextObj.value as [int, bigint];
      expect(typeof val[0]).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1300
     * @tc.name testBigInt64ArrayEntriesTwo1300
     * @tc.desc Verify `arr.entries()` produces a result where `typeof nextObj.value[1]` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      let val = nextObj.value as [int, bigint];
      expect(typeof val[1]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1400
     * @tc.name testBigInt64ArrayEntriesTwo1400
     * @tc.desc Verify `arr.entries()` produces a result where `typeof nextObj.value[1]` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      let val = nextObj.value as [int, bigint];
      expect(typeof val[1]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1500
     * @tc.name testBigInt64ArrayEntriesTwo1500
     * @tc.desc Verify `arr.entries()` produces a result where `typeof nextObj.value[1]` equals `'bigint'`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      let val = nextObj.value as [int, bigint];
      expect(typeof val[1]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1600
     * @tc.name testBigInt64ArrayEntriesTwo1600
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().done` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(nextObj.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1700
     * @tc.name testBigInt64ArrayEntriesTwo1700
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(nextObj.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1800
     * @tc.name testBigInt64ArrayEntriesTwo1800
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().done` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.entries();
      iter.next();
      let nextObj2 = iter.next();
      expect(nextObj2.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_1900
     * @tc.name testBigInt64ArrayEntriesTwo1900
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.entries();
      iter.next();
      let nextObj2 = iter.next();
      expect(nextObj2.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2000
     * @tc.name testBigInt64ArrayEntriesTwo2000
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().done` is false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      expect(nextObj.done).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2100
     * @tc.name testBigInt64ArrayEntriesTwo2100
     * @tc.desc Verify `arr.entries()` produces a result where `nextObj.value[0]` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      let val = nextObj.value as [int, bigint];
      expect(val[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2200
     * @tc.name testBigInt64ArrayEntriesTwo2200
     * @tc.desc Verify `arr.entries()` produces a result where `nextObj.value[1]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let iter = arr.entries();
      let nextObj = iter.next();
      let val = nextObj.value as [int, bigint];
      expect(val[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2300
     * @tc.name testBigInt64ArrayEntriesTwo2300
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().done` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.entries();
      iter.next();
      let nextObj2 = iter.next();
      expect(nextObj2.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2400
     * @tc.name testBigInt64ArrayEntriesTwo2400
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.entries();
      iter.next();
      let nextObj2 = iter.next();
      expect(nextObj2.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2500
     * @tc.name testBigInt64ArrayEntriesTwo2500
     * @tc.desc Verify `arr.entries()` produces a result where `nextObj2.value[0]` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.entries();
      iter.next();
      let nextObj2 = iter.next();
      let val = nextObj2.value as [int, bigint];
      expect(val[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2600
     * @tc.name testBigInt64ArrayEntriesTwo2600
     * @tc.desc Verify `arr.entries()` produces a result where `nextObj2.value[1]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.entries();
      iter.next();
      let nextObj2 = iter.next();
      let val = nextObj2.value as [int, bigint];
      expect(val[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2700
     * @tc.name testBigInt64ArrayEntriesTwo2700
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().done` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let nextObj3 = iter.next();
      expect(nextObj3.done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2800
     * @tc.name testBigInt64ArrayEntriesTwo2800
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let iter = arr.entries();
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_2900
     * @tc.name testBigInt64ArrayEntriesTwo2900
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let iter = arr.entries();
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3000
     * @tc.name testBigInt64ArrayEntriesTwo3000
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let iter = arr.entries();
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3100
     * @tc.name testBigInt64ArrayEntriesTwo3100
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `171n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([171n]);
      let iter = arr.entries();
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(171n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3200
     * @tc.name testBigInt64ArrayEntriesTwo3200
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `61n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([61n]);
      let iter = arr.entries();
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(61n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3300
     * @tc.name testBigInt64ArrayEntriesTwo3300
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `11n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n]);
      let iter = arr.entries();
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3400
     * @tc.name testBigInt64ArrayEntriesTwo3400
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[0]` equals `0`, `iter.next().value[1]` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 5n]);
      let iter = arr.entries();
      let val = iter.next().value as [int, bigint];
      expect(val[0]).assertEqual(0);
      expect(val[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3500
     * @tc.name testBigInt64ArrayEntriesTwo3500
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[0]` equals `2`, `iter.next().value[1]` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 5n]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let val3 = iter.next().value as [int, bigint];
      expect(val3[0]).assertEqual(2);
      expect(val3[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3600
     * @tc.name testBigInt64ArrayEntriesTwo3600
     * @tc.desc Verify `arr.entries()` produces a result where `arr.length` equals `len2`, `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let len1 = arr.length;
      let iter = arr.entries();
      let len2 = arr.length;
      expect(len1).assertEqual(len2);
      expect(len1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3700
     * @tc.name testBigInt64ArrayEntriesTwo3700
     * @tc.desc Verify `arr.entries()` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.entries();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3800
     * @tc.name testBigInt64ArrayEntriesTwo3800
     * @tc.desc Verify `arr.entries()` produces a result where `new BigInt64Array([10n, 20n, 30n]).length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let iter = arr.entries();
      iter.next();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_3900
     * @tc.name testBigInt64ArrayEntriesTwo3900
     * @tc.desc Verify `arr.entries()` produces a result where `arr.byteLength` equals `bLen2`, `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n, 5n]);
      let bLen1 = arr.byteLength;
      let iter = arr.entries();
      let bLen2 = arr.byteLength;
      expect(bLen1).assertEqual(bLen2);
      expect(bLen1).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4000
     * @tc.name testBigInt64ArrayEntriesTwo4000
     * @tc.desc Verify `arr.entries()` produces a result where `new BigInt64Array([4n, 5n]).byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n, 5n]);
      let iter = arr.entries();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4100
     * @tc.name testBigInt64ArrayEntriesTwo4100
     * @tc.desc Verify `arr.entries()` produces a result where `buf.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 8, 2);
      let iter = arr.entries();
      expect(buf.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4200
     * @tc.name testBigInt64ArrayEntriesTwo4200
     * @tc.desc Verify `arr.entries()` produces a result where `new BigInt64Array([1n, 2n]).length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4300
     * @tc.name testBigInt64ArrayEntriesTwo4300
     * @tc.desc Verify `arr.entries()` produces a result where `new BigInt64Array([88n, 99n])[0]` equals `88n`, `new BigInt64Array([88n, 99n])[1]` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n, 99n]);
      let iter = arr.entries();
      expect(arr[0]).assertEqual(88n);
      expect(arr[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4400
     * @tc.name testBigInt64ArrayEntriesTwo4400
     * @tc.desc Verify `arr.entries()` produces a result where `new BigInt64Array([70n, 80n])[0]` equals `70n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([70n, 80n]);
      let iter = arr.entries();
      iter.next();
      expect(arr[0]).assertEqual(70n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4500
     * @tc.name testBigInt64ArrayEntriesTwo4500
     * @tc.desc Verify `arr.entries()` produces a result where `type1` equals `type2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n]);
      let type1 = typeof arr;
      let iter = arr.entries();
      let type2 = typeof arr;
      expect(type1).assertEqual(type2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4600
     * @tc.name testBigInt64ArrayEntriesTwo4600
     * @tc.desc Verify `arr.entries()` produces a result where `new BigInt64Array([-30n, -40n])[1]` equals `-40n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-30n, -40n]);
      let iter = arr.entries();
      iter.next();
      expect(arr[1]).assertEqual(-40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4700
     * @tc.name testBigInt64ArrayEntriesTwo4700
     * @tc.desc Verify `arr.entries()` produces a result where `new BigInt64Array([2n, 4n]).toString()` equals `"2,4"`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n]);
      let iter = arr.entries();
      expect(arr.toString()).assertEqual("2,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4800
     * @tc.name testBigInt64ArrayEntriesTwo4800
     * @tc.desc Verify `arr.entries()` produces a result where `prevRef === arr` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let prevRef = arr;
      let iter = arr.entries();
      expect(prevRef === arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_4900
     * @tc.name testBigInt64ArrayEntriesTwo4900
     * @tc.desc Verify `arr.entries()` produces a result where `iter !== arr` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let iter = arr.entries() as Object;
      expect(iter !== arr).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5000
     * @tc.name testBigInt64ArrayEntriesTwo5000
     * @tc.desc Verify `arr.entries()` produces a result where `iter1 !== iter2` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter1 = arr.entries();
      let iter2 = arr.entries();
      expect(iter1 !== iter2).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5100
     * @tc.name testBigInt64ArrayEntriesTwo5100
     * @tc.desc Verify `arr.entries()` produces a result where `iter2.next().value[0]` equals `0`, `iter2.next().value[1]` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 60n]);
      let iter1 = arr.entries();
      let iter2 = arr.entries();
      iter1.next();
      let val2 = iter2.next().value as [int, bigint];
      expect(val2[0]).assertEqual(0);
      expect(val2[1]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5200
     * @tc.name testBigInt64ArrayEntriesTwo5200
     * @tc.desc Verify `arr.entries()` produces a result where `iter2.next().value[0]` equals `0`, `iter2.next().value[1]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter1 = arr.entries();
      let iter2 = arr.entries();
      iter1.next(); iter1.next(); iter1.next();
      let val2 = iter2.next().value as [int, bigint];
      expect(val2[0]).assertEqual(0);
      expect(val2[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5300
     * @tc.name testBigInt64ArrayEntriesTwo5300
     * @tc.desc Verify `arrA.entries()` produces a result where `iterB.next().value[1]` equals `8n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrA = new BigInt64Array([3n]);
      let arrB = new BigInt64Array([8n]);
      let iterA = arrA.entries();
      let iterB = arrB.entries();
      iterA.next();
      let valB = iterB.next().value as [int, bigint];
      expect(valB[1]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5400
     * @tc.name testBigInt64ArrayEntriesTwo5400
     * @tc.desc Verify `arr.entries()` produces a result where `iter2.next().value[1]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let iter1 = arr.entries();
      iter1.next();
      let iter2 = arr.entries();
      let val2 = iter2.next().value as [int, bigint];
      expect(val2[1]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5500
     * @tc.name testBigInt64ArrayEntriesTwo5500
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[0]` equals `0`, `iter.next().value[1]` equals `7n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n]);
      let iter = arr.entries();
      let val1 = iter.next().value as [int, bigint];
      expect(val1[0]).assertEqual(0);
      expect(val1[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5600
     * @tc.name testBigInt64ArrayEntriesTwo5600
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[0]` equals `0`, `iter.next().value[1]` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.entries();
      arr[0] = 99n;
      let val = iter.next().value as [int, bigint];
      expect(val[0]).assertEqual(0);
      expect(val[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5700
     * @tc.name testBigInt64ArrayEntriesTwo5700
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[0]` equals `1`, `iter.next().value[1]` equals `88n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let iter = arr.entries();
      iter.next();
      arr[1] = 88n;
      let val2 = iter.next().value as [int, bigint];
      expect(val2[0]).assertEqual(1);
      expect(val2[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5800
     * @tc.name testBigInt64ArrayEntriesTwo5800
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.entries();
      iter.next();
      arr[0] = 50n;
      let val2 = iter.next().value as [int, bigint];
      expect(val2[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_5900
     * @tc.name testBigInt64ArrayEntriesTwo5900
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.entries();
      iter.next();
      arr[1] = -9223372036854775807n - 1n;
      let val2 = iter.next().value as [int, bigint];
      expect(val2[1]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_6000
     * @tc.name testBigInt64ArrayEntriesTwo6000
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.entries();
      iter.next();
      arr[1] = 9223372036854775807n;
      let val2 = iter.next().value as [int, bigint];
      expect(val2[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_6100
     * @tc.name testBigInt64ArrayEntriesTwo6100
     * @tc.desc Verify `bArr.entries()` produces a result where `iter.next().value[1]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let bArr = new BigInt64Array(buf);
      let iArr = new Int8Array(buf);
      let iter = bArr.entries();
      iArr[0] = 1;
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_6200
     * @tc.name testBigInt64ArrayEntriesTwo6200
     * @tc.desc Verify `sub.entries()` produces a result where `iter.next().value[1]` equals `99n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      let iter = sub.entries();
      arr[1] = 99n;
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_6300
     * @tc.name testBigInt64ArrayEntriesTwo6300
     * @tc.desc Verify `sub.entries()` produces a result where `iter.next().value[1]` equals `800n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sub = new BigInt64Array([100n, 200n]).subarray(0, 2);
      let iter = sub.entries();
      iter.next();
      sub[1] = 800n;
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(800n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_6400
     * @tc.name testBigInt64ArrayEntriesTwo6400
     * @tc.desc Verify `view.entries()` produces a result where `iter.next().value[1]` equals `555n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buff = new ArrayBuffer(16);
      let view = new BigInt64Array(buff, 8, 1);
      let iter = view.entries();
      let originView = new BigInt64Array(buff);
      originView[1] = 555n;
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(555n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_ENTRIES_TWO_6500
     * @tc.name testBigInt64ArrayEntriesTwo6500
     * @tc.desc Verify `arr.entries()` produces a result where `iter.next().value[1]` equals `0n`, `iter.next().value[1] !== undefined` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayEntriesTwo6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.entries();
      iter.next();
      arr[1] = 0n;
      let val = iter.next().value as [int, bigint];
      expect(val[1]).assertEqual(0n);
      expect(val[1] !== undefined).assertEqual(true);
    });

  });
}
