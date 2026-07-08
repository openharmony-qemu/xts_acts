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

export default function BigInt64ArrayAt01Test(): void {
  describe('BigInt64ArrayAt01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0100
     * @tc.name testBigInt64ArrayAtOne0100
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0200
     * @tc.name testBigInt64ArrayAtOne0200
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(5)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(5)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0300
     * @tc.name testBigInt64ArrayAtOne0300
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-1)` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-1)).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0400
     * @tc.name testBigInt64ArrayAtOne0400
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0x0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0x0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0500
     * @tc.name testBigInt64ArrayAtOne0500
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0x5)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0x5)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0600
     * @tc.name testBigInt64ArrayAtOne0600
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0xA)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0xA)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0700
     * @tc.name testBigInt64ArrayAtOne0700
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0xFF)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0xFF)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0800
     * @tc.name testBigInt64ArrayAtOne0800
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-0x1)` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-0x1)).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_0900
     * @tc.name testBigInt64ArrayAtOne0900
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-0x6)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-0x6)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1000
     * @tc.name testBigInt64ArrayAtOne1000
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-0xA)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-0xA)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1100
     * @tc.name testBigInt64ArrayAtOne1100
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-0xFF)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-0xFF)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1200
     * @tc.name testBigInt64ArrayAtOne1200
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0o0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0o0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1300
     * @tc.name testBigInt64ArrayAtOne1300
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0o5)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0o5)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1400
     * @tc.name testBigInt64ArrayAtOne1400
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-0o1)` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-0o1)).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1500
     * @tc.name testBigInt64ArrayAtOne1500
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0b0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0b0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1600
     * @tc.name testBigInt64ArrayAtOne1600
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0b101)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0b101)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1700
     * @tc.name testBigInt64ArrayAtOne1700
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-0b1)` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-0b1)).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1800
     * @tc.name testBigInt64ArrayAtOne1800
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-0b110)` is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-0b110)).assertEqual(undefined);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_1900
     * @tc.name testBigInt64ArrayAtOne1900
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(+0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(+0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2000
     * @tc.name testBigInt64ArrayAtOne2000
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2100
     * @tc.name testBigInt64ArrayAtOne2100
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0 + 0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0 + 0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2200
     * @tc.name testBigInt64ArrayAtOne2200
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(0 - 0)` equals `10n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(0 - 0)).assertEqual(10n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2300
     * @tc.name testBigInt64ArrayAtOne2300
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(1 + 1)` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(1 + 1)).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2400
     * @tc.name testBigInt64ArrayAtOne2400
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(5 - 4)` equals `20n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(5 - 4)).assertEqual(20n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2500
     * @tc.name testBigInt64ArrayAtOne2500
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(2 * 2)` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(2 * 2)).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2600
     * @tc.name testBigInt64ArrayAtOne2600
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-1 * 2)` equals `40n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-1 * 2)).assertEqual(40n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2700
     * @tc.name testBigInt64ArrayAtOne2700
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(7 % 4)` equals `40n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(7 % 4)).assertEqual(40n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2800
     * @tc.name testBigInt64ArrayAtOne2800
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(-(8 % 5))` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(-(8 % 5))).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_2900
     * @tc.name testBigInt64ArrayAtOne2900
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(1 | 2)` equals `40n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(1 | 2)).assertEqual(40n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_3000
     * @tc.name testBigInt64ArrayAtOne3000
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(3 & 2)` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(3 & 2)).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_3100
     * @tc.name testBigInt64ArrayAtOne3100
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(1 ^ 3)` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(1 ^ 3)).assertEqual(30n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_3200
     * @tc.name testBigInt64ArrayAtOne3200
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(1 << 2)` equals `50n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(1 << 2)).assertEqual(50n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_AT_ONE_3300
     * @tc.name testBigInt64ArrayAtOne3300
     * @tc.desc Verify `new BigInt64Array([10n, 20n, 30n, 40n, 50n])` produces a result where `arr.at(4 >> 1)` equals `30n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayAtOne3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
        expect(arr.at(4 >> 1)).assertEqual(30n);
      });

  });
}
