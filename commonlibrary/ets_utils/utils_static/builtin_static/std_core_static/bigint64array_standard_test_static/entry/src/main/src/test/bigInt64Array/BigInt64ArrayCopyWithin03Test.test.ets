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

export default function BigInt64ArrayCopyWithin03Test(): void {
  describe('BigInt64ArrayCopyWithin03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0010
     * @tc.name testBigInt64ArrayCopyWithinThree0010
     * @tc.desc Verify `arr.copyWithin(5, 0, 3)` produces a result where `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[0]` equals `10n`, `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[4]` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        arr.copyWithin(5, 0, 3);
        expect(arr[0]).assertEqual(10n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0020
     * @tc.name testBigInt64ArrayCopyWithinThree0020
     * @tc.desc Verify `arr.copyWithin(6, 1, 4)` produces a result where `new BigInt64Array([11n, 21n, 31n, 41n, 51n])[1]` equals `21n`, `new BigInt64Array([11n, 21n, 31n, 41n, 51n])[3]` equals `41n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([11n, 21n, 31n, 41n, 51n]);
        arr.copyWithin(6, 1, 4);
        expect(arr[1]).assertEqual(21n);
        expect(arr[3]).assertEqual(41n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0030
     * @tc.name testBigInt64ArrayCopyWithinThree0030
     * @tc.desc Verify `arr.copyWithin(10, 2, 5)` produces a result where `new BigInt64Array([12n, 22n, 32n, 42n, 52n])[2]` equals `32n`, `new BigInt64Array([12n, 22n, 32n, 42n, 52n])[4]` equals `52n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([12n, 22n, 32n, 42n, 52n]);
        arr.copyWithin(10, 2, 5);
        expect(arr[2]).assertEqual(32n);
        expect(arr[4]).assertEqual(52n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0040
     * @tc.name testBigInt64ArrayCopyWithinThree0040
     * @tc.desc Verify `arr.copyWithin(100, 0, 2)` produces a result where `new BigInt64Array([13n, 23n, 33n, 43n, 53n])[0]` equals `13n`, `new BigInt64Array([13n, 23n, 33n, 43n, 53n])[1]` equals `23n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([13n, 23n, 33n, 43n, 53n]);
        arr.copyWithin(100, 0, 2);
        expect(arr[0]).assertEqual(13n);
        expect(arr[1]).assertEqual(23n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0050
     * @tc.name testBigInt64ArrayCopyWithinThree0050
     * @tc.desc Verify `arr.copyWithin(2147483647, 1, 3)` produces a result where `new BigInt64Array([14n, 24n, 34n, 44n, 54n])[1]` equals `24n`, `new BigInt64Array([14n, 24n, 34n, 44n, 54n])[2]` equals `34n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([14n, 24n, 34n, 44n, 54n]);
        arr.copyWithin(2147483647, 1, 3);
        expect(arr[1]).assertEqual(24n);
        expect(arr[2]).assertEqual(34n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0060
     * @tc.name testBigInt64ArrayCopyWithinThree0060
     * @tc.desc Verify `arr.copyWithin(-5, 3, 5)` produces a result where `new BigInt64Array([20n, 30n, 40n, 50n, 60n])[0]` equals `50n`, `new BigInt64Array([20n, 30n, 40n, 50n, 60n])[1]` equals `60n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([20n, 30n, 40n, 50n, 60n]);
        arr.copyWithin(-5, 3, 5);
        expect(arr[0]).assertEqual(50n);
        expect(arr[1]).assertEqual(60n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0070
     * @tc.name testBigInt64ArrayCopyWithinThree0070
     * @tc.desc Verify `arr.copyWithin(-6, 2, 4)` produces a result where `new BigInt64Array([21n, 31n, 41n, 51n, 61n])[0]` equals `41n`, `new BigInt64Array([21n, 31n, 41n, 51n, 61n])[1]` equals `51n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([21n, 31n, 41n, 51n, 61n]);
        arr.copyWithin(-6, 2, 4);
        expect(arr[0]).assertEqual(41n);
        expect(arr[1]).assertEqual(51n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0080
     * @tc.name testBigInt64ArrayCopyWithinThree0080
     * @tc.desc Verify `arr.copyWithin(-10, 1, 3)` produces a result where `new BigInt64Array([22n, 32n, 42n, 52n, 62n])[0]` equals `32n`, `new BigInt64Array([22n, 32n, 42n, 52n, 62n])[1]` equals `42n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([22n, 32n, 42n, 52n, 62n]);
        arr.copyWithin(-10, 1, 3);
        expect(arr[0]).assertEqual(32n);
        expect(arr[1]).assertEqual(42n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0090
     * @tc.name testBigInt64ArrayCopyWithinThree0090
     * @tc.desc Verify `arr.copyWithin(-100, 4, 5)` produces a result where `new BigInt64Array([23n, 33n, 43n, 53n, 63n])[0]` equals `63n`, `new BigInt64Array([23n, 33n, 43n, 53n, 63n])[1]` equals `33n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([23n, 33n, 43n, 53n, 63n]);
        arr.copyWithin(-100, 4, 5);
        expect(arr[0]).assertEqual(63n);
        expect(arr[1]).assertEqual(33n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0100
     * @tc.name testBigInt64ArrayCopyWithinThree0100
     * @tc.desc Verify `arr.copyWithin(-2147483648, 2, 5)` produces a result where `new BigInt64Array([24n, 34n, 44n, 54n, 64n])[0]` equals `44n`, `new BigInt64Array([24n, 34n, 44n, 54n, 64n])[2]` equals `64n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([24n, 34n, 44n, 54n, 64n]);
        arr.copyWithin(-2147483648, 2, 5);
        expect(arr[0]).assertEqual(44n);
        expect(arr[2]).assertEqual(64n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0110
     * @tc.name testBigInt64ArrayCopyWithinThree0110
     * @tc.desc Verify `arr.copyWithin(0, 5, 5)` produces a result where `new BigInt64Array([30n, 40n, 50n, 60n, 70n])[0]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([30n, 40n, 50n, 60n, 70n]);
        arr.copyWithin(0, 5, 5);
        expect(arr[0]).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0120
     * @tc.name testBigInt64ArrayCopyWithinThree0120
     * @tc.desc Verify `arr.copyWithin(1, 6, 6)` produces a result where `new BigInt64Array([31n, 41n, 51n, 61n, 71n])[1]` equals `41n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([31n, 41n, 51n, 61n, 71n]);
        arr.copyWithin(1, 6, 6);
        expect(arr[1]).assertEqual(41n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0130
     * @tc.name testBigInt64ArrayCopyWithinThree0130
     * @tc.desc Verify `arr.copyWithin(2, 10, 12)` produces a result where `new BigInt64Array([32n, 42n, 52n, 62n, 72n])[2]` equals `52n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([32n, 42n, 52n, 62n, 72n]);
        arr.copyWithin(2, 10, 12);
        expect(arr[2]).assertEqual(52n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0140
     * @tc.name testBigInt64ArrayCopyWithinThree0140
     * @tc.desc Verify `arr.copyWithin(3, 100, 105)` produces a result where `new BigInt64Array([33n, 43n, 53n, 63n, 73n])[3]` equals `63n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([33n, 43n, 53n, 63n, 73n]);
        arr.copyWithin(3, 100, 105);
        expect(arr[3]).assertEqual(63n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0150
     * @tc.name testBigInt64ArrayCopyWithinThree0150
     * @tc.desc Verify `arr.copyWithin(4, 2147483647, 2147483647)` produces a result where `new BigInt64Array([34n, 44n, 54n, 64n, 74n])[4]` equals `74n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([34n, 44n, 54n, 64n, 74n]);
        arr.copyWithin(4, 2147483647, 2147483647);
        expect(arr[4]).assertEqual(74n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0160
     * @tc.name testBigInt64ArrayCopyWithinThree0160
     * @tc.desc Verify `arr.copyWithin(2, -5, 2)` produces a result where `new BigInt64Array([40n, 50n, 60n, 70n, 80n])[2]` equals `40n`, `new BigInt64Array([40n, 50n, 60n, 70n, 80n])[3]` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([40n, 50n, 60n, 70n, 80n]);
        arr.copyWithin(2, -5, 2);
        expect(arr[2]).assertEqual(40n);
        expect(arr[3]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0170
     * @tc.name testBigInt64ArrayCopyWithinThree0170
     * @tc.desc Verify `arr.copyWithin(3, -6, 2)` produces a result where `new BigInt64Array([41n, 51n, 61n, 71n, 81n])[3]` equals `41n`, `new BigInt64Array([41n, 51n, 61n, 71n, 81n])[4]` equals `51n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([41n, 51n, 61n, 71n, 81n]);
        arr.copyWithin(3, -6, 2);
        expect(arr[3]).assertEqual(41n);
        expect(arr[4]).assertEqual(51n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0180
     * @tc.name testBigInt64ArrayCopyWithinThree0180
     * @tc.desc Verify `arr.copyWithin(1, -10, 3)` produces a result where `new BigInt64Array([42n, 52n, 62n, 72n, 82n])[1]` equals `42n`, `new BigInt64Array([42n, 52n, 62n, 72n, 82n])[2]` equals `52n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([42n, 52n, 62n, 72n, 82n]);
        arr.copyWithin(1, -10, 3);
        expect(arr[1]).assertEqual(42n);
        expect(arr[2]).assertEqual(52n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0190
     * @tc.name testBigInt64ArrayCopyWithinThree0190
     * @tc.desc Verify `arr.copyWithin(2, -100, 4)` produces a result where `new BigInt64Array([43n, 53n, 63n, 73n, 83n])[2]` equals `43n`, `new BigInt64Array([43n, 53n, 63n, 73n, 83n])[3]` equals `53n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([43n, 53n, 63n, 73n, 83n]);
        arr.copyWithin(2, -100, 4);
        expect(arr[2]).assertEqual(43n);
        expect(arr[3]).assertEqual(53n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0200
     * @tc.name testBigInt64ArrayCopyWithinThree0200
     * @tc.desc Verify `arr.copyWithin(0, -2147483648, 2)` produces a result where `new BigInt64Array([44n, 54n, 64n, 74n, 84n])[0]` equals `44n`, `new BigInt64Array([44n, 54n, 64n, 74n, 84n])[1]` equals `54n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([44n, 54n, 64n, 74n, 84n]);
        arr.copyWithin(0, -2147483648, 2);
        expect(arr[0]).assertEqual(44n);
        expect(arr[1]).assertEqual(54n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0210
     * @tc.name testBigInt64ArrayCopyWithinThree0210
     * @tc.desc Verify `arr.copyWithin(0, 2, 5)` produces a result where `new BigInt64Array([50n, 60n, 70n, 80n, 90n])[0]` equals `70n`, `new BigInt64Array([50n, 60n, 70n, 80n, 90n])[2]` equals `90n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([50n, 60n, 70n, 80n, 90n]);
        arr.copyWithin(0, 2, 5);
        expect(arr[0]).assertEqual(70n);
        expect(arr[2]).assertEqual(90n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0220
     * @tc.name testBigInt64ArrayCopyWithinThree0220
     * @tc.desc Verify `arr.copyWithin(1, 3, 6)` produces a result where `new BigInt64Array([51n, 61n, 71n, 81n, 91n])[1]` equals `81n`, `new BigInt64Array([51n, 61n, 71n, 81n, 91n])[2]` equals `91n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([51n, 61n, 71n, 81n, 91n]);
        arr.copyWithin(1, 3, 6);
        expect(arr[1]).assertEqual(81n);
        expect(arr[2]).assertEqual(91n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0230
     * @tc.name testBigInt64ArrayCopyWithinThree0230
     * @tc.desc Verify `arr.copyWithin(2, 1, 10)` produces a result where `new BigInt64Array([52n, 62n, 72n, 82n, 92n])[2]` equals `62n`, `new BigInt64Array([52n, 62n, 72n, 82n, 92n])[4]` equals `82n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([52n, 62n, 72n, 82n, 92n]);
        arr.copyWithin(2, 1, 10);
        expect(arr[2]).assertEqual(62n);
        expect(arr[4]).assertEqual(82n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0240
     * @tc.name testBigInt64ArrayCopyWithinThree0240
     * @tc.desc Verify `arr.copyWithin(0, 1, 100)` produces a result where `new BigInt64Array([53n, 63n, 73n, 83n, 93n])[0]` equals `63n`, `new BigInt64Array([53n, 63n, 73n, 83n, 93n])[3]` equals `93n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([53n, 63n, 73n, 83n, 93n]);
        arr.copyWithin(0, 1, 100);
        expect(arr[0]).assertEqual(63n);
        expect(arr[3]).assertEqual(93n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0250
     * @tc.name testBigInt64ArrayCopyWithinThree0250
     * @tc.desc Verify `arr.copyWithin(2, 0, 2147483647)` produces a result where `new BigInt64Array([54n, 64n, 74n, 84n, 94n])[2]` equals `54n`, `new BigInt64Array([54n, 64n, 74n, 84n, 94n])[4]` equals `74n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([54n, 64n, 74n, 84n, 94n]);
        arr.copyWithin(2, 0, 2147483647);
        expect(arr[2]).assertEqual(54n);
        expect(arr[4]).assertEqual(74n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0260
     * @tc.name testBigInt64ArrayCopyWithinThree0260
     * @tc.desc Verify `arr.copyWithin(0, 1, -5)` produces a result where `new BigInt64Array([60n, 70n, 80n, 90n, 100n])[0]` equals `60n`, `new BigInt64Array([60n, 70n, 80n, 90n, 100n])[1]` equals `70n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([60n, 70n, 80n, 90n, 100n]);
        arr.copyWithin(0, 1, -5);
        expect(arr[0]).assertEqual(60n);
        expect(arr[1]).assertEqual(70n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0270
     * @tc.name testBigInt64ArrayCopyWithinThree0270
     * @tc.desc Verify `arr.copyWithin(1, 2, -6)` produces a result where `new BigInt64Array([61n, 71n, 81n, 91n, 101n])[1]` equals `71n`, `new BigInt64Array([61n, 71n, 81n, 91n, 101n])[2]` equals `81n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([61n, 71n, 81n, 91n, 101n]);
        arr.copyWithin(1, 2, -6);
        expect(arr[1]).assertEqual(71n);
        expect(arr[2]).assertEqual(81n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0280
     * @tc.name testBigInt64ArrayCopyWithinThree0280
     * @tc.desc Verify `arr.copyWithin(2, 3, -10)` produces a result where `new BigInt64Array([62n, 72n, 82n, 92n, 102n])[2]` equals `82n`, `new BigInt64Array([62n, 72n, 82n, 92n, 102n])[3]` equals `92n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([62n, 72n, 82n, 92n, 102n]);
        arr.copyWithin(2, 3, -10);
        expect(arr[2]).assertEqual(82n);
        expect(arr[3]).assertEqual(92n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0290
     * @tc.name testBigInt64ArrayCopyWithinThree0290
     * @tc.desc Verify `arr.copyWithin(3, 0, -100)` produces a result where `new BigInt64Array([63n, 73n, 83n, 93n, 103n])[3]` equals `93n`, `new BigInt64Array([63n, 73n, 83n, 93n, 103n])[0]` equals `63n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([63n, 73n, 83n, 93n, 103n]);
        arr.copyWithin(3, 0, -100);
        expect(arr[3]).assertEqual(93n);
        expect(arr[0]).assertEqual(63n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0300
     * @tc.name testBigInt64ArrayCopyWithinThree0300
     * @tc.desc Verify `arr.copyWithin(4, 1, -2147483648)` produces a result where `new BigInt64Array([64n, 74n, 84n, 94n, 104n])[4]` equals `104n`, `new BigInt64Array([64n, 74n, 84n, 94n, 104n])[1]` equals `74n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([64n, 74n, 84n, 94n, 104n]);
        arr.copyWithin(4, 1, -2147483648);
        expect(arr[4]).assertEqual(104n);
        expect(arr[1]).assertEqual(74n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0310
     * @tc.name testBigInt64ArrayCopyWithinThree0310
     * @tc.desc Verify `arr.copyWithin(0, 3, 2)` produces a result where `new BigInt64Array([70n, 80n, 90n, 100n, 110n])[0]` equals `70n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([70n, 80n, 90n, 100n, 110n]);
        arr.copyWithin(0, 3, 2);
        expect(arr[0]).assertEqual(70n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0320
     * @tc.name testBigInt64ArrayCopyWithinThree0320
     * @tc.desc Verify `arr.copyWithin(1, 3, 3)` produces a result where `new BigInt64Array([71n, 81n, 91n, 101n, 111n])[1]` equals `81n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([71n, 81n, 91n, 101n, 111n]);
        arr.copyWithin(1, 3, 3);
        expect(arr[1]).assertEqual(81n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0330
     * @tc.name testBigInt64ArrayCopyWithinThree0330
     * @tc.desc Verify `arr.copyWithin(2, 4, 1)` produces a result where `new BigInt64Array([72n, 82n, 92n, 102n, 112n])[2]` equals `92n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([72n, 82n, 92n, 102n, 112n]);
        arr.copyWithin(2, 4, 1);
        expect(arr[2]).assertEqual(92n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0340
     * @tc.name testBigInt64ArrayCopyWithinThree0340
     * @tc.desc Verify `arr.copyWithin(0, 5, 5)` produces a result where `new BigInt64Array([73n, 83n, 93n, 103n, 113n])[0]` equals `73n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([73n, 83n, 93n, 103n, 113n]);
        arr.copyWithin(0, 5, 5);
        expect(arr[0]).assertEqual(73n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0350
     * @tc.name testBigInt64ArrayCopyWithinThree0350
     * @tc.desc Verify `arr.copyWithin(1, -1, -2)` produces a result where `new BigInt64Array([74n, 84n, 94n, 104n, 114n])[1]` equals `84n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([74n, 84n, 94n, 104n, 114n]);
        arr.copyWithin(1, -1, -2);
        expect(arr[1]).assertEqual(84n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0360
     * @tc.name testBigInt64ArrayCopyWithinThree0360
     * @tc.desc Verify `arr.copyWithin(0, -2, -2)` produces a result where `new BigInt64Array([75n, 85n, 95n, 105n, 115n])[0]` equals `75n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([75n, 85n, 95n, 105n, 115n]);
        arr.copyWithin(0, -2, -2);
        expect(arr[0]).assertEqual(75n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0370
     * @tc.name testBigInt64ArrayCopyWithinThree0370
     * @tc.desc Verify `arr.copyWithin(2, -2, -3)` produces a result where `new BigInt64Array([76n, 86n, 96n, 106n, 116n])[2]` equals `96n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([76n, 86n, 96n, 106n, 116n]);
        arr.copyWithin(2, -2, -3);
        expect(arr[2]).assertEqual(96n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0380
     * @tc.name testBigInt64ArrayCopyWithinThree0380
     * @tc.desc Verify `arr.copyWithin(1, 0, -5)` produces a result where `new BigInt64Array([77n, 87n, 97n, 107n, 117n])[1]` equals `87n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([77n, 87n, 97n, 107n, 117n]);
        arr.copyWithin(1, 0, -5);
        expect(arr[1]).assertEqual(87n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0390
     * @tc.name testBigInt64ArrayCopyWithinThree0390
     * @tc.desc Verify `arr.copyWithin(0, 5, -5)` produces a result where `new BigInt64Array([78n, 88n, 98n, 108n, 118n])[0]` equals `78n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([78n, 88n, 98n, 108n, 118n]);
        arr.copyWithin(0, 5, -5);
        expect(arr[0]).assertEqual(78n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0400
     * @tc.name testBigInt64ArrayCopyWithinThree0400
     * @tc.desc Verify `arr.copyWithin(0, -1, -10)` produces a result where `new BigInt64Array([79n, 89n, 99n, 109n, 119n])[0]` equals `79n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([79n, 89n, 99n, 109n, 119n]);
        arr.copyWithin(0, -1, -10);
        expect(arr[0]).assertEqual(79n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0410
     * @tc.name testBigInt64ArrayCopyWithinThree0410
     * @tc.desc Verify `arr.copyWithin(4, 0, 5)` produces a result where `new BigInt64Array([1n, 2n, 3n, 4n, 5n])[4]` equals `1n`, `new BigInt64Array([1n, 2n, 3n, 4n, 5n])[3]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
        arr.copyWithin(4, 0, 5);
        expect(arr[4]).assertEqual(1n);
        expect(arr[3]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0420
     * @tc.name testBigInt64ArrayCopyWithinThree0420
     * @tc.desc Verify `arr.copyWithin(3, 0, 5)` produces a result where `new BigInt64Array([3n, 4n, 5n, 6n, 7n])[3]` equals `3n`, `new BigInt64Array([3n, 4n, 5n, 6n, 7n])[4]` equals `4n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([3n, 4n, 5n, 6n, 7n]);
        arr.copyWithin(3, 0, 5);
        expect(arr[3]).assertEqual(3n);
        expect(arr[4]).assertEqual(4n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0430
     * @tc.name testBigInt64ArrayCopyWithinThree0430
     * @tc.desc Verify `arr.copyWithin(2, 0, 5)` produces a result where `new BigInt64Array([5n, 6n, 7n, 8n, 9n])[2]` equals `5n`, `new BigInt64Array([5n, 6n, 7n, 8n, 9n])[4]` equals `7n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([5n, 6n, 7n, 8n, 9n]);
        arr.copyWithin(2, 0, 5);
        expect(arr[2]).assertEqual(5n);
        expect(arr[4]).assertEqual(7n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0440
     * @tc.name testBigInt64ArrayCopyWithinThree0440
     * @tc.desc Verify `arr.copyWithin(1, 0, 5)` produces a result where `new BigInt64Array([7n, 8n, 9n, 10n, 11n])[1]` equals `7n`, `new BigInt64Array([7n, 8n, 9n, 10n, 11n])[4]` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n, 8n, 9n, 10n, 11n]);
        arr.copyWithin(1, 0, 5);
        expect(arr[1]).assertEqual(7n);
        expect(arr[4]).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0450
     * @tc.name testBigInt64ArrayCopyWithinThree0450
     * @tc.desc Verify `arr.copyWithin(4, 1, 5)` produces a result where `new BigInt64Array([9n, 10n, 11n, 12n, 13n])[4]` equals `10n`, `new BigInt64Array([9n, 10n, 11n, 12n, 13n])[3]` equals `12n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9n, 10n, 11n, 12n, 13n]);
        arr.copyWithin(4, 1, 5);
        expect(arr[4]).assertEqual(10n);
        expect(arr[3]).assertEqual(12n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0460
     * @tc.name testBigInt64ArrayCopyWithinThree0460
     * @tc.desc Verify `arr.copyWithin(3, 1, 5)` produces a result where `new BigInt64Array([11n, 12n, 13n, 14n, 15n])[3]` equals `12n`, `new BigInt64Array([11n, 12n, 13n, 14n, 15n])[4]` equals `13n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([11n, 12n, 13n, 14n, 15n]);
        arr.copyWithin(3, 1, 5);
        expect(arr[3]).assertEqual(12n);
        expect(arr[4]).assertEqual(13n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0470
     * @tc.name testBigInt64ArrayCopyWithinThree0470
     * @tc.desc Verify `arr.copyWithin(2, 1, 5)` produces a result where `new BigInt64Array([13n, 14n, 15n, 16n, 17n])[2]` equals `14n`, `new BigInt64Array([13n, 14n, 15n, 16n, 17n])[4]` equals `16n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([13n, 14n, 15n, 16n, 17n]);
        arr.copyWithin(2, 1, 5);
        expect(arr[2]).assertEqual(14n);
        expect(arr[4]).assertEqual(16n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0480
     * @tc.name testBigInt64ArrayCopyWithinThree0480
     * @tc.desc Verify `arr.copyWithin(4, 2, 5)` produces a result where `new BigInt64Array([15n, 16n, 17n, 18n, 19n])[4]` equals `17n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 16n, 17n, 18n, 19n]);
        arr.copyWithin(4, 2, 5);
        expect(arr[4]).assertEqual(17n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0490
     * @tc.name testBigInt64ArrayCopyWithinThree0490
     * @tc.desc Verify `arr.copyWithin(3, 2, 5)` produces a result where `new BigInt64Array([17n, 18n, 19n, 20n, 21n])[3]` equals `19n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([17n, 18n, 19n, 20n, 21n]);
        arr.copyWithin(3, 2, 5);
        expect(arr[3]).assertEqual(19n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0500
     * @tc.name testBigInt64ArrayCopyWithinThree0500
     * @tc.desc Verify `arr.copyWithin(4, 3, 5)` produces a result where `new BigInt64Array([19n, 20n, 21n, 22n, 23n])[4]` equals `22n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([19n, 20n, 21n, 22n, 23n]);
        arr.copyWithin(4, 3, 5);
        expect(arr[4]).assertEqual(22n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0510
     * @tc.name testBigInt64ArrayCopyWithinThree0510
     * @tc.desc Verify `arr.copyWithin(4, 0)` produces a result where `new BigInt64Array([21n, 22n, 23n, 24n, 25n])[4]` equals `21n`, `new BigInt64Array([21n, 22n, 23n, 24n, 25n])[3]` equals `24n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([21n, 22n, 23n, 24n, 25n]);
        arr.copyWithin(4, 0);
        expect(arr[4]).assertEqual(21n);
        expect(arr[3]).assertEqual(24n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0520
     * @tc.name testBigInt64ArrayCopyWithinThree0520
     * @tc.desc Verify `arr.copyWithin(3, 0)` produces a result where `new BigInt64Array([23n, 24n, 25n, 26n, 27n])[3]` equals `23n`, `new BigInt64Array([23n, 24n, 25n, 26n, 27n])[4]` equals `24n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([23n, 24n, 25n, 26n, 27n]);
        arr.copyWithin(3, 0);
        expect(arr[3]).assertEqual(23n);
        expect(arr[4]).assertEqual(24n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0530
     * @tc.name testBigInt64ArrayCopyWithinThree0530
     * @tc.desc Verify `arr.copyWithin(2, 0)` produces a result where `new BigInt64Array([25n, 26n, 27n, 28n, 29n])[2]` equals `25n`, `new BigInt64Array([25n, 26n, 27n, 28n, 29n])[4]` equals `27n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([25n, 26n, 27n, 28n, 29n]);
        arr.copyWithin(2, 0);
        expect(arr[2]).assertEqual(25n);
        expect(arr[4]).assertEqual(27n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0540
     * @tc.name testBigInt64ArrayCopyWithinThree0540
     * @tc.desc Verify `arr.copyWithin(1, 0)` produces a result where `new BigInt64Array([27n, 28n, 29n, 30n, 31n])[1]` equals `27n`, `new BigInt64Array([27n, 28n, 29n, 30n, 31n])[4]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([27n, 28n, 29n, 30n, 31n]);
        arr.copyWithin(1, 0);
        expect(arr[1]).assertEqual(27n);
        expect(arr[4]).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0550
     * @tc.name testBigInt64ArrayCopyWithinThree0550
     * @tc.desc Verify `arr.copyWithin(4, 1)` produces a result where `new BigInt64Array([29n, 30n, 31n, 32n, 33n])[4]` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([29n, 30n, 31n, 32n, 33n]);
        arr.copyWithin(4, 1);
        expect(arr[4]).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0560
     * @tc.name testBigInt64ArrayCopyWithinThree0560
     * @tc.desc Verify `arr.copyWithin(3, 1)` produces a result where `new BigInt64Array([31n, 32n, 33n, 34n, 35n])[3]` equals `32n`, `new BigInt64Array([31n, 32n, 33n, 34n, 35n])[4]` equals `33n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([31n, 32n, 33n, 34n, 35n]);
        arr.copyWithin(3, 1);
        expect(arr[3]).assertEqual(32n);
        expect(arr[4]).assertEqual(33n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0570
     * @tc.name testBigInt64ArrayCopyWithinThree0570
     * @tc.desc Verify `arr.copyWithin(2, 1)` produces a result where `new BigInt64Array([33n, 34n, 35n, 36n, 37n])[2]` equals `34n`, `new BigInt64Array([33n, 34n, 35n, 36n, 37n])[4]` equals `36n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([33n, 34n, 35n, 36n, 37n]);
        arr.copyWithin(2, 1);
        expect(arr[2]).assertEqual(34n);
        expect(arr[4]).assertEqual(36n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0580
     * @tc.name testBigInt64ArrayCopyWithinThree0580
     * @tc.desc Verify a source range exactly matching the remaining target space is not over-truncated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n, 70n, 80n]);
        arr.copyWithin(6, 2, 4);
        expect(arr.join()).assertEqual('10,20,30,40,50,60,30,40');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0590
     * @tc.name testBigInt64ArrayCopyWithinThree0590
     * @tc.desc Verify `arr.copyWithin(3, 2)` produces a result where `new BigInt64Array([37n, 38n, 39n, 40n, 41n])[3]` equals `39n`, `new BigInt64Array([37n, 38n, 39n, 40n, 41n])[4]` equals `40n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([37n, 38n, 39n, 40n, 41n]);
        arr.copyWithin(3, 2);
        expect(arr[3]).assertEqual(39n);
        expect(arr[4]).assertEqual(40n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0600
     * @tc.name testBigInt64ArrayCopyWithinThree0600
     * @tc.desc Verify negative target, start, and end values are resolved before truncating the copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n]);
        arr.copyWithin(-1, -6, -3);
        expect(arr.join()).assertEqual('1,2,3,4,5,6,7,3');
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0610
     * @tc.name testBigInt64ArrayCopyWithinThree0610
     * @tc.desc Verify `arr.copyWithin(-1, 0, 5)` produces a result where `new BigInt64Array([41n, 42n, 43n, 44n, 45n])[4]` equals `41n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([41n, 42n, 43n, 44n, 45n]);
        arr.copyWithin(-1, 0, 5);
        expect(arr[4]).assertEqual(41n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0620
     * @tc.name testBigInt64ArrayCopyWithinThree0620
     * @tc.desc Verify `arr.copyWithin(-2, 0, 5)` produces a result where `new BigInt64Array([43n, 44n, 45n, 46n, 47n])[3]` equals `43n`, `new BigInt64Array([43n, 44n, 45n, 46n, 47n])[4]` equals `44n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([43n, 44n, 45n, 46n, 47n]);
        arr.copyWithin(-2, 0, 5);
        expect(arr[3]).assertEqual(43n);
        expect(arr[4]).assertEqual(44n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0630
     * @tc.name testBigInt64ArrayCopyWithinThree0630
     * @tc.desc Verify `arr.copyWithin(-3, 0, 5)` produces a result where `new BigInt64Array([45n, 46n, 47n, 48n, 49n])[2]` equals `45n`, `new BigInt64Array([45n, 46n, 47n, 48n, 49n])[4]` equals `47n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([45n, 46n, 47n, 48n, 49n]);
        arr.copyWithin(-3, 0, 5);
        expect(arr[2]).assertEqual(45n);
        expect(arr[4]).assertEqual(47n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0640
     * @tc.name testBigInt64ArrayCopyWithinThree0640
     * @tc.desc Verify `arr.copyWithin(-4, 0, 5)` produces a result where `new BigInt64Array([47n, 48n, 49n, 50n, 51n])[1]` equals `47n`, `new BigInt64Array([47n, 48n, 49n, 50n, 51n])[4]` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([47n, 48n, 49n, 50n, 51n]);
        arr.copyWithin(-4, 0, 5);
        expect(arr[1]).assertEqual(47n);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0650
     * @tc.name testBigInt64ArrayCopyWithinThree0650
     * @tc.desc Verify `arr.copyWithin(-1, 1, 5)` produces a result where `new BigInt64Array([49n, 50n, 51n, 52n, 53n])[4]` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([49n, 50n, 51n, 52n, 53n]);
        arr.copyWithin(-1, 1, 5);
        expect(arr[4]).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0660
     * @tc.name testBigInt64ArrayCopyWithinThree0660
     * @tc.desc Verify `arr.copyWithin(-2, 1, 5)` produces a result where `new BigInt64Array([51n, 52n, 53n, 54n, 55n])[3]` equals `52n`, `new BigInt64Array([51n, 52n, 53n, 54n, 55n])[4]` equals `53n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([51n, 52n, 53n, 54n, 55n]);
        arr.copyWithin(-2, 1, 5);
        expect(arr[3]).assertEqual(52n);
        expect(arr[4]).assertEqual(53n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0670
     * @tc.name testBigInt64ArrayCopyWithinThree0670
     * @tc.desc Verify `arr.copyWithin(-3, 1, 5)` produces a result where `new BigInt64Array([53n, 54n, 55n, 56n, 57n])[2]` equals `54n`, `new BigInt64Array([53n, 54n, 55n, 56n, 57n])[4]` equals `56n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([53n, 54n, 55n, 56n, 57n]);
        arr.copyWithin(-3, 1, 5);
        expect(arr[2]).assertEqual(54n);
        expect(arr[4]).assertEqual(56n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0680
     * @tc.name testBigInt64ArrayCopyWithinThree0680
     * @tc.desc Verify `arr.copyWithin(-1, 2, 5)` produces a result where `new BigInt64Array([55n, 56n, 57n, 58n, 59n])[4]` equals `57n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([55n, 56n, 57n, 58n, 59n]);
        arr.copyWithin(-1, 2, 5);
        expect(arr[4]).assertEqual(57n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0690
     * @tc.name testBigInt64ArrayCopyWithinThree0690
     * @tc.desc Verify `arr.copyWithin(-2, 2, 5)` produces a result where `new BigInt64Array([57n, 58n, 59n, 60n, 61n])[3]` equals `59n`, `new BigInt64Array([57n, 58n, 59n, 60n, 61n])[4]` equals `60n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([57n, 58n, 59n, 60n, 61n]);
        arr.copyWithin(-2, 2, 5);
        expect(arr[3]).assertEqual(59n);
        expect(arr[4]).assertEqual(60n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0700
     * @tc.name testBigInt64ArrayCopyWithinThree0700
     * @tc.desc Verify `arr.copyWithin(-1, 3, 5)` produces a result where `new BigInt64Array([59n, 60n, 61n, 62n, 63n])[4]` equals `62n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([59n, 60n, 61n, 62n, 63n]);
        arr.copyWithin(-1, 3, 5);
        expect(arr[4]).assertEqual(62n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0710
     * @tc.name testBigInt64ArrayCopyWithinThree0710
     * @tc.desc Verify `arr1.copyWithin(0, 0)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr1 = new BigInt64Array([]);
        arr1.copyWithin(0, 0);
        expect(arr1.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0720
     * @tc.name testBigInt64ArrayCopyWithinThree0720
     * @tc.desc Verify `arr2.copyWithin(1, 0)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr2 = new BigInt64Array([]);
        arr2.copyWithin(1, 0);
        expect(arr2.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0730
     * @tc.name testBigInt64ArrayCopyWithinThree0730
     * @tc.desc Verify `arr3.copyWithin(-1, 0)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr3 = new BigInt64Array([]);
        arr3.copyWithin(-1, 0);
        expect(arr3.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0740
     * @tc.name testBigInt64ArrayCopyWithinThree0740
     * @tc.desc Verify `arr4.copyWithin(0, 1)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr4 = new BigInt64Array([]);
        arr4.copyWithin(0, 1);
        expect(arr4.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0750
     * @tc.name testBigInt64ArrayCopyWithinThree0750
     * @tc.desc Verify `arr5.copyWithin(0, -1)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr5 = new BigInt64Array([]);
        arr5.copyWithin(0, -1);
        expect(arr5.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0760
     * @tc.name testBigInt64ArrayCopyWithinThree0760
     * @tc.desc Verify `arr6.copyWithin(100, 100)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr6 = new BigInt64Array([]);
        arr6.copyWithin(100, 100);
        expect(arr6.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0770
     * @tc.name testBigInt64ArrayCopyWithinThree0770
     * @tc.desc Verify `arr7.copyWithin(-100, -100)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr7 = new BigInt64Array([]);
        arr7.copyWithin(-100, -100);
        expect(arr7.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0780
     * @tc.name testBigInt64ArrayCopyWithinThree0780
     * @tc.desc Verify `arr8.copyWithin(0, 0, 0)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr8 = new BigInt64Array([]);
        arr8.copyWithin(0, 0, 0);
        expect(arr8.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0790
     * @tc.name testBigInt64ArrayCopyWithinThree0790
     * @tc.desc Verify `arr9.copyWithin(1, 2, 3)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr9 = new BigInt64Array([]);
        arr9.copyWithin(1, 2, 3);
        expect(arr9.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0800
     * @tc.name testBigInt64ArrayCopyWithinThree0800
     * @tc.desc Verify `arr10.copyWithin(5, -5, 10)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr10 = new BigInt64Array([]);
        arr10.copyWithin(5, -5, 10);
        expect(arr10.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0810
     * @tc.name testBigInt64ArrayCopyWithinThree0810
     * @tc.desc Verify `arr_s1.copyWithin(0, 0)` produces a result where `new BigInt64Array([101n])[0]` equals `101n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s1 = new BigInt64Array([101n]);
        arr_s1.copyWithin(0, 0);
        expect(arr_s1[0]).assertEqual(101n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0820
     * @tc.name testBigInt64ArrayCopyWithinThree0820
     * @tc.desc Verify `arr_s2.copyWithin(1, 0)` produces a result where `new BigInt64Array([102n])[0]` equals `102n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s2 = new BigInt64Array([102n]);
        arr_s2.copyWithin(1, 0);
        expect(arr_s2[0]).assertEqual(102n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0830
     * @tc.name testBigInt64ArrayCopyWithinThree0830
     * @tc.desc Verify `arr_s3.copyWithin(0, 1)` produces a result where `new BigInt64Array([103n])[0]` equals `103n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s3 = new BigInt64Array([103n]);
        arr_s3.copyWithin(0, 1);
        expect(arr_s3[0]).assertEqual(103n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0840
     * @tc.name testBigInt64ArrayCopyWithinThree0840
     * @tc.desc Verify `arr_s4.copyWithin(-1, 0)` produces a result where `new BigInt64Array([104n])[0]` equals `104n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s4 = new BigInt64Array([104n]);
        arr_s4.copyWithin(-1, 0);
        expect(arr_s4[0]).assertEqual(104n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0850
     * @tc.name testBigInt64ArrayCopyWithinThree0850
     * @tc.desc Verify `arr_s5.copyWithin(0, -1)` produces a result where `new BigInt64Array([105n])[0]` equals `105n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s5 = new BigInt64Array([105n]);
        arr_s5.copyWithin(0, -1);
        expect(arr_s5[0]).assertEqual(105n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0860
     * @tc.name testBigInt64ArrayCopyWithinThree0860
     * @tc.desc Verify `arr_s6.copyWithin(0, 2)` produces a result where `new BigInt64Array([106n])[0]` equals `106n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s6 = new BigInt64Array([106n]);
        arr_s6.copyWithin(0, 2);
        expect(arr_s6[0]).assertEqual(106n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0870
     * @tc.name testBigInt64ArrayCopyWithinThree0870
     * @tc.desc Verify `arr_s7.copyWithin(2, 0)` produces a result where `new BigInt64Array([107n])[0]` equals `107n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s7 = new BigInt64Array([107n]);
        arr_s7.copyWithin(2, 0);
        expect(arr_s7[0]).assertEqual(107n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0880
     * @tc.name testBigInt64ArrayCopyWithinThree0880
     * @tc.desc Verify `arr_s8.copyWithin(0, 0, 0)` produces a result where `new BigInt64Array([108n])[0]` equals `108n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s8 = new BigInt64Array([108n]);
        arr_s8.copyWithin(0, 0, 0);
        expect(arr_s8[0]).assertEqual(108n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0890
     * @tc.name testBigInt64ArrayCopyWithinThree0890
     * @tc.desc Verify `arr_s9.copyWithin(0, 0, 1)` produces a result where `new BigInt64Array([109n])[0]` equals `109n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s9 = new BigInt64Array([109n]);
        arr_s9.copyWithin(0, 0, 1);
        expect(arr_s9[0]).assertEqual(109n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0900
     * @tc.name testBigInt64ArrayCopyWithinThree0900
     * @tc.desc Verify `arr_s10.copyWithin(0, -5, 10)` produces a result where `new BigInt64Array([110n])[0]` equals `110n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_s10 = new BigInt64Array([110n]);
        arr_s10.copyWithin(0, -5, 10);
        expect(arr_s10[0]).assertEqual(110n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0910
     * @tc.name testBigInt64ArrayCopyWithinThree0910
     * @tc.desc Verify `arr_a1.copyWithin(1, 0)` updates the array to `[7n, 7n, 8n, 9n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_a1 = new BigInt64Array([7n, 8n, 9n, 10n]);
        let ref_a1 = arr_a1.copyWithin(1, 0);
        expect(ref_a1.length).assertEqual(4);
        expect(arr_a1[0]).assertEqual(7n);
        expect(arr_a1[1]).assertEqual(7n);
        expect(arr_a1[2]).assertEqual(8n);
        expect(arr_a1[3]).assertEqual(9n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0920
     * @tc.name testBigInt64ArrayCopyWithinThree0920
     * @tc.desc Verify `arr_a2.copyWithin(0, 1)` updates the array to `[9n, 10n, 11n, 11n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_a2 = new BigInt64Array([8n, 9n, 10n, 11n]);
        arr_a2.copyWithin(0, 1);
        expect(arr_a2[0]).assertEqual(9n);
        expect(arr_a2[1]).assertEqual(10n);
        expect(arr_a2[2]).assertEqual(11n);
        expect(arr_a2[3]).assertEqual(11n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0930
     * @tc.name testBigInt64ArrayCopyWithinThree0930
     * @tc.desc Verify `arr_a3.copyWithin(2, 0)` updates the array to `[9n, 10n, 9n, 10n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_a3 = new BigInt64Array([9n, 10n, 11n, 12n]);
        arr_a3.copyWithin(2, 0);
        expect(arr_a3[0]).assertEqual(9n);
        expect(arr_a3[1]).assertEqual(10n);
        expect(arr_a3[2]).assertEqual(9n);
        expect(arr_a3[3]).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0940
     * @tc.name testBigInt64ArrayCopyWithinThree0940
     * @tc.desc Verify `arr_a4.copyWithin(0, 2)` updates the array to `[12n, 13n, 12n, 13n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_a4 = new BigInt64Array([10n, 11n, 12n, 13n]);
        arr_a4.copyWithin(0, 2);
        expect(arr_a4[0]).assertEqual(12n);
        expect(arr_a4[1]).assertEqual(13n);
        expect(arr_a4[2]).assertEqual(12n);
        expect(arr_a4[3]).assertEqual(13n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0950
     * @tc.name testBigInt64ArrayCopyWithinThree0950
     * @tc.desc Verify `arr_a5.copyWithin(-1, 0)` updates the array to `[11n, 12n, 13n, 11n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_a5 = new BigInt64Array([11n, 12n, 13n, 14n]);
        arr_a5.copyWithin(-1, 0);
        expect(arr_a5[0]).assertEqual(11n);
        expect(arr_a5[1]).assertEqual(12n);
        expect(arr_a5[2]).assertEqual(13n);
        expect(arr_a5[3]).assertEqual(11n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0960
     * @tc.name testBigInt64ArrayCopyWithinThree0960
     * @tc.desc Verify `arr_a6.copyWithin(0, -1)` updates the array to `[15n, 13n, 14n, 15n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_a6 = new BigInt64Array([12n, 13n, 14n, 15n]);
        arr_a6.copyWithin(0, -1);
        expect(arr_a6[0]).assertEqual(15n);
        expect(arr_a6[1]).assertEqual(13n);
        expect(arr_a6[2]).assertEqual(14n);
        expect(arr_a6[3]).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0970
     * @tc.name testBigInt64ArrayCopyWithinThree0970
     * @tc.desc Verify `arr_a7.copyWithin(1, 0, 2)` updates the array to `[13n, 13n, 14n, 16n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_a7 = new BigInt64Array([13n, 14n, 15n, 16n]);
        arr_a7.copyWithin(1, 0, 2);
        expect(arr_a7[0]).assertEqual(13n);
        expect(arr_a7[1]).assertEqual(13n);
        expect(arr_a7[2]).assertEqual(14n);
        expect(arr_a7[3]).assertEqual(16n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0980
     * @tc.name testBigInt64ArrayCopyWithinThree0980
     * @tc.desc Verify `arr_a8.copyWithin(0, 1, 3)` updates the array to `[15n, 16n, 16n, 17n]`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_a8 = new BigInt64Array([14n, 15n, 16n, 17n]);
        arr_a8.copyWithin(0, 1, 3);
        expect(arr_a8[0]).assertEqual(15n);
        expect(arr_a8[1]).assertEqual(16n);
        expect(arr_a8[2]).assertEqual(16n);
        expect(arr_a8[3]).assertEqual(17n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_0990
     * @tc.name testBigInt64ArrayCopyWithinThree0990
     * @tc.desc Verify `arr_e1.copyWithin(1, 0, 1)` produces a result where `new BigInt64Array([9223372036854775807n, 0n])[1]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_e1 = new BigInt64Array([9223372036854775807n, 0n]);
        arr_e1.copyWithin(1, 0, 1);
        expect(arr_e1[1]).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1000
     * @tc.name testBigInt64ArrayCopyWithinThree1000
     * @tc.desc Verify `arr_e2.copyWithin(0, 1, 2)` produces a result where `new BigInt64Array([0n, -9223372036854775808n])[0]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_e2 = new BigInt64Array([0n, -9223372036854775807n - 1n]);
        arr_e2.copyWithin(0, 1, 2);
        expect(arr_e2[0]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1010
     * @tc.name testBigInt64ArrayCopyWithinThree1010
     * @tc.desc Verify `arr_e3.copyWithin(2, 0, 2)` produces a result where `new BigInt64Array([9223372036854775807n, -9223372036, ...])[2]` equals `9223372036854775807n`, `new BigInt64Array([9223372036854775807n, -9223372036, ...])[3]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_e3 = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n, 0n, 0n]);
        arr_e3.copyWithin(2, 0, 2);
        expect(arr_e3[2]).assertEqual(9223372036854775807n);
        expect(arr_e3[3]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1020
     * @tc.name testBigInt64ArrayCopyWithinThree1020
     * @tc.desc Verify `arr_e4.copyWithin(0, 2, 4)` produces a result where `new BigInt64Array([0n, 0n, 9223372036854775807n, -92, ...])[0]` equals `9223372036854775807n`, `new BigInt64Array([0n, 0n, 9223372036854775807n, -92, ...])[1]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_e4 = new BigInt64Array([0n, 0n, 9223372036854775807n, -9223372036854775807n - 1n]);
        arr_e4.copyWithin(0, 2, 4);
        expect(arr_e4[0]).assertEqual(9223372036854775807n);
        expect(arr_e4[1]).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1030
     * @tc.name testBigInt64ArrayCopyWithinThree1030
     * @tc.desc Verify `arr_e5.copyWithin(1, 0)` produces a result where `new BigInt64Array([9223372036854775807n, -9223372036, ...])[1]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_e5 = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        arr_e5.copyWithin(1, 0);
        expect(arr_e5[1]).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1040
     * @tc.name testBigInt64ArrayCopyWithinThree1040
     * @tc.desc Verify `arr_e6.copyWithin(0, 2, 4)` produces a result where `new BigInt64Array([9223372036854775807n, -9223372036, ...])[0]` equals `0n`, `new BigInt64Array([9223372036854775807n, -9223372036, ...])[1]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_e6 = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n, 0n, 0n]);
        arr_e6.copyWithin(0, 2, 4);
        expect(arr_e6[0]).assertEqual(0n);
        expect(arr_e6[1]).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1050
     * @tc.name testBigInt64ArrayCopyWithinThree1050
     * @tc.desc Verify `arr_v1.copyWithin(-2, -4, 5)` produces a result where `new BigInt64Array([100n, 200n, 300n, 400n, 500n])[3]` equals `200n`, `new BigInt64Array([100n, 200n, 300n, 400n, 500n])[4]` equals `300n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_v1 = new BigInt64Array([100n, 200n, 300n, 400n, 500n]);
        arr_v1.copyWithin(-2, -4, 5);
        expect(arr_v1[3]).assertEqual(200n);
        expect(arr_v1[4]).assertEqual(300n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1060
     * @tc.name testBigInt64ArrayCopyWithinThree1060
     * @tc.desc Verify `arr_v2.copyWithin(1, -2, -1)` produces a result where `new BigInt64Array([101n, 201n, 301n, 401n, 501n])[1]` equals `401n`, `new BigInt64Array([101n, 201n, 301n, 401n, 501n])[2]` equals `301n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_v2 = new BigInt64Array([101n, 201n, 301n, 401n, 501n]);
        arr_v2.copyWithin(1, -2, -1);
        expect(arr_v2[1]).assertEqual(401n);
        expect(arr_v2[2]).assertEqual(301n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1070
     * @tc.name testBigInt64ArrayCopyWithinThree1070
     * @tc.desc Verify `arr_v3.copyWithin(-3, -1, 5)` produces a result where `new BigInt64Array([102n, 202n, 302n, 402n, 502n])[2]` equals `502n`, `new BigInt64Array([102n, 202n, 302n, 402n, 502n])[3]` equals `402n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_v3 = new BigInt64Array([102n, 202n, 302n, 402n, 502n]);
        arr_v3.copyWithin(-3, -1, 5);
        expect(arr_v3[2]).assertEqual(502n);
        expect(arr_v3[3]).assertEqual(402n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1080
     * @tc.name testBigInt64ArrayCopyWithinThree1080
     * @tc.desc Verify `arr_v4.copyWithin(1, 3, -3)` produces a result where `new BigInt64Array([103n, 203n, 303n, 403n, 503n])[1]` equals `203n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_v4 = new BigInt64Array([103n, 203n, 303n, 403n, 503n]);
        arr_v4.copyWithin(1, 3, -3);
        expect(arr_v4[1]).assertEqual(203n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1090
     * @tc.name testBigInt64ArrayCopyWithinThree1090
     * @tc.desc Verify `arr_v5.copyWithin(2, 4, -4)` produces a result where `new BigInt64Array([104n, 204n, 304n, 404n, 504n])[2]` equals `304n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_v5 = new BigInt64Array([104n, 204n, 304n, 404n, 504n]);
        arr_v5.copyWithin(2, 4, -4);
        expect(arr_v5[2]).assertEqual(304n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_THREE_1100
     * @tc.name testBigInt64ArrayCopyWithinThree1100
     * @tc.desc Verify `arr_v6.copyWithin(-5, -5, -5)` produces a result where `new BigInt64Array([105n, 205n, 305n, 405n, 505n])[0]` equals `105n`, `new BigInt64Array([105n, 205n, 305n, 405n, 505n])[1]` equals `205n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithinThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr_v6 = new BigInt64Array([105n, 205n, 305n, 405n, 505n]);
        arr_v6.copyWithin(-5, -5, -5);
        expect(arr_v6[0]).assertEqual(105n);
        expect(arr_v6[1]).assertEqual(205n);
      });

  });
}
