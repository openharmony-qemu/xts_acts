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

export default function BigInt64ArrayIndexOf02Test(): void {
  describe('BigInt64ArrayIndexOf02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0100
     * @tc.name testBigInt64ArrayIndexOfTwo0100
     * @tc.desc Verify indexOf returns an int type for array [11n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n]);
      let res = arr.indexOf(11n);
      expect(typeof res).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0200
     * @tc.name testBigInt64ArrayIndexOfTwo0200
     * @tc.desc Verify indexOf with 41n returns 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([41n]);
      let res = arr.indexOf(41n);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0300
     * @tc.name testBigInt64ArrayIndexOfTwo0300
     * @tc.desc Verify indexOf with 43n returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 43n]);
      let res = arr.indexOf(43n);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0400
     * @tc.name testBigInt64ArrayIndexOfTwo0400
     * @tc.desc Verify indexOf with 46n returns 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([44n, 45n, 46n]);
      let res = arr.indexOf(46n);
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0500
     * @tc.name testBigInt64ArrayIndexOfTwo0500
     * @tc.desc Verify indexOf with 9223372036854775807n returns 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n]);
      let res = arr.indexOf(9223372036854775807n);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0600
     * @tc.name testBigInt64ArrayIndexOfTwo0600
     * @tc.desc Verify indexOf with -9223372036854775808n returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -9223372036854775808n]);
      let res = arr.indexOf(-9223372036854775808n);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0700
     * @tc.name testBigInt64ArrayIndexOfTwo0700
     * @tc.desc Verify indexOf with 0n returns 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n]);
      let res = arr.indexOf(0n);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0800
     * @tc.name testBigInt64ArrayIndexOfTwo0800
     * @tc.desc Verify indexOf with 0xBn returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 11n]);
      let res = arr.indexOf(11n);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_0900
     * @tc.name testBigInt64ArrayIndexOfTwo0900
     * @tc.desc Verify indexOf with 0o11n returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n, 9n]);
      let res = arr.indexOf(9n);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1000
     * @tc.name testBigInt64ArrayIndexOfTwo1000
     * @tc.desc Verify indexOf with 0b10n returns 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 3n]);
      let res = arr.indexOf(2n);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1100
     * @tc.name testBigInt64ArrayIndexOfTwo1100
     * @tc.desc Verify indexOf with 52n returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([51n]);
      let res = arr.indexOf(52n);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1200
     * @tc.name testBigInt64ArrayIndexOfTwo1200
     * @tc.desc Verify indexOf with -53n returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([53n]);
      let res = arr.indexOf(-53n);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1300
     * @tc.name testBigInt64ArrayIndexOfTwo1300
     * @tc.desc Verify indexOf with 9223372036854775806n returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.indexOf(9223372036854775806n);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1400
     * @tc.name testBigInt64ArrayIndexOfTwo1400
     * @tc.desc Verify indexOf with -9223372036854775807n returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      let res = arr.indexOf(-9223372036854775807n);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1500
     * @tc.name testBigInt64ArrayIndexOfTwo1500
     * @tc.desc Verify indexOf with 0n returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.indexOf(0n);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1600
     * @tc.name testBigInt64ArrayIndexOfTwo1600
     * @tc.desc Verify indexOf with 62n, 1 returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([61n, 62n, 63n]);
      let res = arr.indexOf(62n, 1);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1700
     * @tc.name testBigInt64ArrayIndexOfTwo1700
     * @tc.desc Verify indexOf with 65n, 2 returns 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([65n, 65n, 65n]);
      let res = arr.indexOf(65n, 2);
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1800
     * @tc.name testBigInt64ArrayIndexOfTwo1800
     * @tc.desc Verify indexOf with 67n, 0 returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([66n, 67n]);
      let res = arr.indexOf(67n, 0);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_1900
     * @tc.name testBigInt64ArrayIndexOfTwo1900
     * @tc.desc Verify indexOf with 69n, 0x1 returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([68n, 69n]);
      let res = arr.indexOf(69n, 0x1);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2000
     * @tc.name testBigInt64ArrayIndexOfTwo2000
     * @tc.desc Verify indexOf with 71n, -1 returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([70n, 71n]);
      let res = arr.indexOf(71n, -1);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2100
     * @tc.name testBigInt64ArrayIndexOfTwo2100
     * @tc.desc Verify indexOf with 73n, -2 returns 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([72n, 73n, 74n]);
      let res = arr.indexOf(73n, -2);
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2200
     * @tc.name testBigInt64ArrayIndexOfTwo2200
     * @tc.desc Verify indexOf with 75n, -3 returns 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([75n, 76n, 77n]);
      let res = arr.indexOf(75n, -3);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2300
     * @tc.name testBigInt64ArrayIndexOfTwo2300
     * @tc.desc Verify indexOf with 79n, -100 returns 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([79n]);
      let res = arr.indexOf(79n, -100);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2400
     * @tc.name testBigInt64ArrayIndexOfTwo2400
     * @tc.desc Verify indexOf with 81n, 1 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([81n, 82n]);
      let res = arr.indexOf(81n, 1);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2500
     * @tc.name testBigInt64ArrayIndexOfTwo2500
     * @tc.desc Verify indexOf with 84n, 2 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([83n, 84n]);
      let res = arr.indexOf(84n, 2);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2600
     * @tc.name testBigInt64ArrayIndexOfTwo2600
     * @tc.desc Verify indexOf with 86n, 100 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([85n, 86n]);
      let res = arr.indexOf(86n, 100);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2700
     * @tc.name testBigInt64ArrayIndexOfTwo2700
     * @tc.desc Verify indexOf with 87n, 0 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.indexOf(87n, 0);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2800
     * @tc.name testBigInt64ArrayIndexOfTwo2800
     * @tc.desc Verify indexOf with 91n, -1 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([91n, 92n]);
      let res = arr.indexOf(91n, -1);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_2900
     * @tc.name testBigInt64ArrayIndexOfTwo2900
     * @tc.desc Verify indexOf with 9223372036854775807n, 1 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.indexOf(9223372036854775807n, 1);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3000
     * @tc.name testBigInt64ArrayIndexOfTwo3000
     * @tc.desc Verify indexOf with 0n, 2 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      let res = arr.indexOf(0n, 2);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3100
     * @tc.name testBigInt64ArrayIndexOfTwo3100
     * @tc.desc Verify indexOf with -1n, -1 returns -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let res = arr.indexOf(-1n, -1);
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3200
     * @tc.name testBigInt64ArrayIndexOfTwo3200
     * @tc.desc Verify indexOf does not change length and keeps it at 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([101n]);
      arr.indexOf(101n);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3300
     * @tc.name testBigInt64ArrayIndexOfTwo3300
     * @tc.desc Verify indexOf does not change length and keeps it at 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.indexOf(112n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3400
     * @tc.name testBigInt64ArrayIndexOfTwo3400
     * @tc.desc Verify indexOf does not change length and keeps it at 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([113n, 114n]);
      arr.indexOf(114n, 1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3500
     * @tc.name testBigInt64ArrayIndexOfTwo3500
     * @tc.desc Verify indexOf does not change length and keeps it at 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([117n, 118n]);
      arr.indexOf(117n, -1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3600
     * @tc.name testBigInt64ArrayIndexOfTwo3600
     * @tc.desc Verify indexOf does not change length and keeps it at 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([119n]);
      arr.indexOf(119n, -10);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3700
     * @tc.name testBigInt64ArrayIndexOfTwo3700
     * @tc.desc Verify indexOf does not change byteLength and keeps it at 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([121n]);
      arr.indexOf(121n);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3800
     * @tc.name testBigInt64ArrayIndexOfTwo3800
     * @tc.desc Verify indexOf does not change byteLength and keeps it at 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([122n, 123n]);
      arr.indexOf(123n);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_3900
     * @tc.name testBigInt64ArrayIndexOfTwo3900
     * @tc.desc Verify indexOf does not change byteLength and keeps it at 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.indexOf(127n);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4000
     * @tc.name testBigInt64ArrayIndexOfTwo4000
     * @tc.desc Verify indexOf does not change the backing buffer byteLength of 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([141n]);
      let b = arr.buffer;
      arr.indexOf(141n);
      expect(b.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4100
     * @tc.name testBigInt64ArrayIndexOfTwo4100
     * @tc.desc Verify indexOf does not change the backing buffer byteLength of 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let b = arr.buffer;
      arr.indexOf(144n);
      expect(b.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4200
     * @tc.name testBigInt64ArrayIndexOfTwo4200
     * @tc.desc Verify indexOf does not change byteOffset and keeps it at 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([145n]);
      arr.indexOf(145n);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4300
     * @tc.name testBigInt64ArrayIndexOfTwo4300
     * @tc.desc Verify indexOf does not change byteOffset and keeps it at 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(new ArrayBuffer(16), 8, 1);
      arr.indexOf(148n);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4400
     * @tc.name testBigInt64ArrayIndexOfTwo4400
     * @tc.desc Verify indexOf does not change the byteLength of the exposed buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([150n]);
      let bLen = arr.buffer.byteLength;
      arr.indexOf(150n);
      expect(arr.buffer.byteLength).assertEqual(bLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4500
     * @tc.name testBigInt64ArrayIndexOfTwo4500
     * @tc.desc Verify indexOf does not change the constructor name of BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([151n]);
      arr.indexOf(151n);
      expect(arr instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4600
     * @tc.name testBigInt64ArrayIndexOfTwo4600
     * @tc.desc Verify indexOf does not change the sliced buffer byteLength of 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([152n, 153n]);
      arr.indexOf(153n);
      expect(arr.buffer.slice(0).byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4700
     * @tc.name testBigInt64ArrayIndexOfTwo4700
     * @tc.desc Verify indexOf does not modify the observed array element 161n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([161n]);
      arr.indexOf(161n);
      expect(arr.$_get(0)).assertEqual(161n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4800
     * @tc.name testBigInt64ArrayIndexOfTwo4800
     * @tc.desc Verify indexOf does not modify the observed array element 166n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([164n, 165n, 166n]);
      arr.indexOf(165n);
      expect(arr.$_get(2)).assertEqual(166n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_4900
     * @tc.name testBigInt64ArrayIndexOfTwo4900
     * @tc.desc Verify indexOf does not modify the observed array element 172n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([172n]);
      arr.indexOf(172n, 0);
      expect(arr.$_get(0)).assertEqual(172n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_5000
     * @tc.name testBigInt64ArrayIndexOfTwo5000
     * @tc.desc Verify indexOf does not modify the observed array element 175n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([175n, 176n]);
      arr.indexOf(176n, -1);
      expect(arr.$_get(0)).assertEqual(175n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_5100
     * @tc.name testBigInt64ArrayIndexOfTwo5100
     * @tc.desc Verify indexOf does not modify the observed array element
     * 9223372036854775807n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      arr.indexOf(0n);
      expect(arr.$_get(0)).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_INDEX_OF_TWO_5200
     * @tc.name testBigInt64ArrayIndexOfTwo5200
     * @tc.desc Verify indexOf does not modify the observed array element
     * -9223372036854775808n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayIndexOfTwo5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      arr.indexOf(0n);
      expect(arr.$_get(0)).assertEqual(-9223372036854775808n);
    });
  });
}
