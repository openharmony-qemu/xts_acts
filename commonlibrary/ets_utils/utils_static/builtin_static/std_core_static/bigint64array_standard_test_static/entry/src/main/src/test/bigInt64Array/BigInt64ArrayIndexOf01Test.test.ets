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

export default function BigInt64ArrayIndexOf01Test(): void {
  describe('BigInt64ArrayIndexOf01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0100
     * @tc.name testBigInt64ArrayIndexOfOne0100
     * @tc.desc Verify indexOf accepts arity one and finds an existing element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      expect(arr.indexOf(20n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0200
     * @tc.name testBigInt64ArrayIndexOfOne0200
     * @tc.desc Verify indexOf accepts arity two and finds the element from the given index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      expect(arr.indexOf(20n, 0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0300
     * @tc.name testBigInt64ArrayIndexOfOne0300
     * @tc.desc Verify searchElement 11n is found in the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n, 55n, 66n, 77n, 88n, 99n, 110n]);
      expect(arr.indexOf(11n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0400
     * @tc.name testBigInt64ArrayIndexOfOne0400
     * @tc.desc Verify searchElement 110n is found in the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n, 55n, 66n, 77n, 88n, 99n, 110n]);
      expect(arr.indexOf(110n)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0500
     * @tc.name testBigInt64ArrayIndexOfOne0500
     * @tc.desc Verify searchElement 12n returns -1 when it is absent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n, 55n, 66n, 77n, 88n, 99n, 110n]);
      expect(arr.indexOf(12n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0600
     * @tc.name testBigInt64ArrayIndexOfOne0600
     * @tc.desc Verify searchElement 111n returns -1 when it is absent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n, 55n, 66n, 77n, 88n, 99n, 110n]);
      expect(arr.indexOf(111n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0700
     * @tc.name testBigInt64ArrayIndexOfOne0700
     * @tc.desc Verify isolated searchElement 13n is found at index 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 13n, 33n]);
      expect(arr.indexOf(13n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0800
     * @tc.name testBigInt64ArrayIndexOfOne0800
     * @tc.desc Verify the maximum signed 64-bit BigInt value is found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      expect(arr.indexOf(9223372036854775807n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_0900
     * @tc.name testBigInt64ArrayIndexOfOne0900
     * @tc.desc Verify the minimum signed 64-bit BigInt value is found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      expect(arr.indexOf(-9223372036854775808n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1000
     * @tc.name testBigInt64ArrayIndexOfOne1000
     * @tc.desc Verify decimal zero is found as a search element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      expect(arr.indexOf(0n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1100
     * @tc.name testBigInt64ArrayIndexOfOne1100
     * @tc.desc Verify negative one is found as a search element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      expect(arr.indexOf(-1n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1200
     * @tc.name testBigInt64ArrayIndexOfOne1200
     * @tc.desc Verify positive one is found as a search element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.indexOf(1n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1300
     * @tc.name testBigInt64ArrayIndexOfOne1300
     * @tc.desc Verify maximum signed 64-bit BigInt minus one is found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      expect(arr.indexOf(9223372036854775806n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1400
     * @tc.name testBigInt64ArrayIndexOfOne1400
     * @tc.desc Verify minimum signed 64-bit BigInt plus one is found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      expect(arr.indexOf(-9223372036854775807n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1500
     * @tc.name testBigInt64ArrayIndexOfOne1500
     * @tc.desc Verify a shifted maximum signed 64-bit BigInt value is not found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      expect(arr.indexOf(9223372036854775807n + 100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1600
     * @tc.name testBigInt64ArrayIndexOfOne1600
     * @tc.desc Verify a shifted minimum signed 64-bit BigInt value is not found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      expect(arr.indexOf(-9223372036854775808n + 100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1700
     * @tc.name testBigInt64ArrayIndexOfOne1700
     * @tc.desc Verify shifted decimal zero is not found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      expect(arr.indexOf(0n + 100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1800
     * @tc.name testBigInt64ArrayIndexOfOne1800
     * @tc.desc Verify shifted negative one is not found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      expect(arr.indexOf(-1n + 100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_1900
     * @tc.name testBigInt64ArrayIndexOfOne1900
     * @tc.desc Verify shifted positive one is not found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.indexOf(1n + 100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2000
     * @tc.name testBigInt64ArrayIndexOfOne2000
     * @tc.desc Verify shifted maximum signed 64-bit BigInt minus one is not found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      expect(arr.indexOf(9223372036854775806n + 100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2100
     * @tc.name testBigInt64ArrayIndexOfOne2100
     * @tc.desc Verify shifted minimum signed 64-bit BigInt plus one is not found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      expect(arr.indexOf(-9223372036854775807n + 100n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2200
     * @tc.name testBigInt64ArrayIndexOfOne2200
     * @tc.desc Verify hexadecimal 0xAn matches its decimal element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 11n]);
      expect(arr.indexOf(10n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2300
     * @tc.name testBigInt64ArrayIndexOfOne2300
     * @tc.desc Verify hexadecimal 0xFn matches its decimal element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([15n, 16n]);
      expect(arr.indexOf(15n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2400
     * @tc.name testBigInt64ArrayIndexOfOne2400
     * @tc.desc Verify hexadecimal 0x10n matches its decimal element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([16n, 17n]);
      expect(arr.indexOf(16n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2500
     * @tc.name testBigInt64ArrayIndexOfOne2500
     * @tc.desc Verify hexadecimal 0xFFn matches its decimal element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([255n, 256n]);
      expect(arr.indexOf(255n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2600
     * @tc.name testBigInt64ArrayIndexOfOne2600
     * @tc.desc Verify octal 0o10n matches its decimal element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n, 9n, 10n]);
      expect(arr.indexOf(8n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2700
     * @tc.name testBigInt64ArrayIndexOfOne2700
     * @tc.desc Verify octal 0o100n matches its decimal element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([64n, 65n, 66n]);
      expect(arr.indexOf(64n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2800
     * @tc.name testBigInt64ArrayIndexOfOne2800
     * @tc.desc Verify binary 0b10n matches its decimal element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 9n]);
      expect(arr.indexOf(2n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_2900
     * @tc.name testBigInt64ArrayIndexOfOne2900
     * @tc.desc Verify binary 0b1000n matches its decimal element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 8n, 9n]);
      expect(arr.indexOf(8n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3000
     * @tc.name testBigInt64ArrayIndexOfOne3000
     * @tc.desc Verify fromIndex 0 finds the element at the same position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        10n, 20n, 30n, 10n,
        20n, 30n, 10n, 20n,
        30n, 10n, 20n, 30n,
        10n, 20n, 30n, 10n,
      ]);
      expect(arr.indexOf(arr[0], 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3100
     * @tc.name testBigInt64ArrayIndexOfOne3100
     * @tc.desc Verify fromIndex 1 finds the element at the same position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        10n, 20n, 30n, 10n,
        20n, 30n, 10n, 20n,
        30n, 10n, 20n, 30n,
        10n, 20n, 30n, 10n,
      ]);
      expect(arr.indexOf(arr[1], 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3200
     * @tc.name testBigInt64ArrayIndexOfOne3200
     * @tc.desc Verify fromIndex 14 finds the element at the same position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        10n, 20n, 30n, 10n,
        20n, 30n, 10n, 20n,
        30n, 10n, 20n, 30n,
        10n, 20n, 30n, 10n,
      ]);
      expect(arr.indexOf(arr[14], 14)).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3300
     * @tc.name testBigInt64ArrayIndexOfOne3300
     * @tc.desc Verify fromIndex -1 counts from the end and finds the target element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        15n, 14n, 13n, 12n,
        11n, 10n, 9n, 8n,
        7n, 6n, 5n, 4n,
        3n, 2n, 1n, 0n,
      ]);
      let len = arr.length;
      let expected = len - 1;
      let target = arr[expected];
      expect(arr.indexOf(target, -1)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3400
     * @tc.name testBigInt64ArrayIndexOfOne3400
     * @tc.desc Verify fromIndex -2 counts from the end and finds the target element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        15n, 14n, 13n, 12n,
        11n, 10n, 9n, 8n,
        7n, 6n, 5n, 4n,
        3n, 2n, 1n, 0n,
      ]);
      let len = arr.length;
      let expected = len - 2;
      let target = arr[expected];
      expect(arr.indexOf(target, -2)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3500
     * @tc.name testBigInt64ArrayIndexOfOne3500
     * @tc.desc Verify fromIndex -15 counts from the end and finds the target element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        15n, 14n, 13n, 12n,
        11n, 10n, 9n, 8n,
        7n, 6n, 5n, 4n,
        3n, 2n, 1n, 0n,
      ]);
      let len = arr.length;
      let expected = len - 15;
      let target = arr[expected];
      expect(arr.indexOf(target, -15)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3600
     * @tc.name testBigInt64ArrayIndexOfOne3600
     * @tc.desc Verify fromIndex length plus 0 returns -1 when the search starts beyond the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let fromIdx = arr.length + 0;
      expect(arr.indexOf(1n, fromIdx)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3700
     * @tc.name testBigInt64ArrayIndexOfOne3700
     * @tc.desc Verify fromIndex length plus 1 returns -1 when the search starts beyond the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let fromIdx = arr.length + 1;
      expect(arr.indexOf(1n, fromIdx)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3800
     * @tc.name testBigInt64ArrayIndexOfOne3800
     * @tc.desc Verify fromIndex length plus 4 returns -1 when the search starts beyond the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let fromIdx = arr.length + 4;
      expect(arr.indexOf(1n, fromIdx)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_3900
     * @tc.name testBigInt64ArrayIndexOfOne3900
     * @tc.desc Verify fromIndex below negative length by 1 starts from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([22n, 33n, 44n, 55n]);
      let fromIdx = -arr.length - 1;
      expect(arr.indexOf(33n, fromIdx)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_4000
     * @tc.name testBigInt64ArrayIndexOfOne4000
     * @tc.desc Verify fromIndex below negative length by 5 starts from index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([22n, 33n, 44n, 55n]);
      let fromIdx = -arr.length - 5;
      expect(arr.indexOf(33n, fromIdx)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_4100
     * @tc.name testBigInt64ArrayIndexOfOne4100
     * @tc.desc Verify boundary element arr[0] is found from its own start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      expect(arr.indexOf(arr[0], 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_4200
     * @tc.name testBigInt64ArrayIndexOfOne4200
     * @tc.desc Verify boundary element arr[1] is found from its own start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      expect(arr.indexOf(arr[1], 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_4300
     * @tc.name testBigInt64ArrayIndexOfOne4300
     * @tc.desc Verify boundary element arr[2] is found from its own start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      expect(arr.indexOf(arr[2], 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_4400
     * @tc.name testBigInt64ArrayIndexOfOne4400
     * @tc.desc Verify boundary element arr[3] is found from its own start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      expect(arr.indexOf(arr[3], 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_4500
     * @tc.name testBigInt64ArrayIndexOfOne4500
     * @tc.desc Verify boundary element arr[4] is found from its own start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      expect(arr.indexOf(arr[4], 4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_4600
     * @tc.name testBigInt64ArrayIndexOfOne4600
     * @tc.desc Verify skipping the boundary target by offset 1 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      expect(arr.indexOf(arr[0], 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_ONE_4700
     * @tc.name testBigInt64ArrayIndexOfOne4700
     * @tc.desc Verify skipping the boundary target by offset 5 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfOne4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      expect(arr.indexOf(arr[4], 5)).assertEqual(-1);
    });
  });
}
