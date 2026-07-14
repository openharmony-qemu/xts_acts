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

export default function BigInt64ArrayFill01Test(): void {
  describe('BigInt64ArrayFill01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0100
     * @tc.name testBigInt64ArrayFillOne0100
     * @tc.desc Verify `arr.fill(0n)` produces a result where `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[0]` equals `0n`, `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[2]` equals `0n`, and `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[4]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(0n);
      expect(arr[0]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0200
     * @tc.name testBigInt64ArrayFillOne0200
     * @tc.desc Verify `arr.fill(0n)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.fill(0n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0300
     * @tc.name testBigInt64ArrayFillOne0300
     * @tc.desc Verify `arr.fill(0n)` produces a result where `new BigInt64Array([10n])[0]` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      arr.fill(0n);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0400
     * @tc.name testBigInt64ArrayFillOne0400
     * @tc.desc Verify `arr.fill(1n)` produces a result where `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[0]` equals `1n`, `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[2]` equals `1n`, and `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[4]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(1n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(1n);
      expect(arr[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0500
     * @tc.name testBigInt64ArrayFillOne0500
     * @tc.desc Verify `arr.fill(1n)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.fill(1n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0600
     * @tc.name testBigInt64ArrayFillOne0600
     * @tc.desc Verify `arr.fill(1n)` produces a result where `new BigInt64Array([10n])[0]` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      arr.fill(1n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0700
     * @tc.name testBigInt64ArrayFillOne0700
     * @tc.desc Verify `arr.fill(-1n)` produces a result where `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[0]` equals `-1n`, `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[2]` equals `-1n`, and `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[4]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(-1n);
      expect(arr[0]).assertEqual(-1n);
      expect(arr[2]).assertEqual(-1n);
      expect(arr[4]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0800
     * @tc.name testBigInt64ArrayFillOne0800
     * @tc.desc Verify `arr.fill(-1n)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.fill(-1n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_0900
     * @tc.name testBigInt64ArrayFillOne0900
     * @tc.desc Verify `arr.fill(-1n)` produces a result where `new BigInt64Array([10n])[0]` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      arr.fill(-1n);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1000
     * @tc.name testBigInt64ArrayFillOne1000
     * @tc.desc Verify `arr.fill(9223372036854775807n)` produces a result where `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[0]` equals `9223372036854775807n`, `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[2]` equals `9223372036854775807n`, and `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[4]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(9223372036854775807n);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[2]).assertEqual(9223372036854775807n);
      expect(arr[4]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1100
     * @tc.name testBigInt64ArrayFillOne1100
     * @tc.desc Verify `arr.fill(9223372036854775807n)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.fill(9223372036854775807n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1200
     * @tc.name testBigInt64ArrayFillOne1200
     * @tc.desc Verify `arr.fill(9223372036854775807n)` produces a result where `new BigInt64Array([10n])[0]` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      arr.fill(9223372036854775807n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1300
     * @tc.name testBigInt64ArrayFillOne1300
     * @tc.desc Verify `arr.fill(-9223372036854775808n)` produces a result where `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[0]` equals `-9223372036854775808n`, `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[2]` equals `-9223372036854775808n`, and `new BigInt64Array([10n, 20n, 30n, 40n, 50n])[4]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(-9223372036854775807n - 1n);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
      expect(arr[2]).assertEqual(-9223372036854775807n - 1n);
      expect(arr[4]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1400
     * @tc.name testBigInt64ArrayFillOne1400
     * @tc.desc Verify `arr.fill(-9223372036854775808n)` produces a result where `new BigInt64Array([]).length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr.fill(-9223372036854775807n - 1n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1500
     * @tc.name testBigInt64ArrayFillOne1500
     * @tc.desc Verify `arr.fill(-9223372036854775808n)` produces a result where `new BigInt64Array([10n])[0]` equals `-9223372036854775808n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      arr.fill(-9223372036854775807n - 1n);
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1600
     * @tc.name testBigInt64ArrayFillOne1600
     * @tc.desc Verify `arr.fill(99n, 0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, 0);
      for (let i = 0; i < 5; i++) {
        if (i >= 0) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1700
     * @tc.name testBigInt64ArrayFillOne1700
     * @tc.desc Verify `arr.fill(-99n, 0)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(-99n, 0);
      for (let i = 0; i < 5; i++) {
        if (i >= 0) {
          expect(arr[i]).assertEqual(-99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1800
     * @tc.name testBigInt64ArrayFillOne1800
     * @tc.desc Verify `arr.fill(99n, 1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, 1);
      for (let i = 0; i < 5; i++) {
        if (i >= 1) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_1900
     * @tc.name testBigInt64ArrayFillOne1900
     * @tc.desc Verify `arr.fill(-99n, 1)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(-99n, 1);
      for (let i = 0; i < 5; i++) {
        if (i >= 1) {
          expect(arr[i]).assertEqual(-99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_2000
     * @tc.name testBigInt64ArrayFillOne2000
     * @tc.desc Verify `arr.fill(99n, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, 2);
      for (let i = 0; i < 5; i++) {
        if (i >= 2) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_2100
     * @tc.name testBigInt64ArrayFillOne2100
     * @tc.desc Verify `arr.fill(-99n, 2)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(-99n, 2);
      for (let i = 0; i < 5; i++) {
        if (i >= 2) {
          expect(arr[i]).assertEqual(-99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_2200
     * @tc.name testBigInt64ArrayFillOne2200
     * @tc.desc Verify `arr.fill(99n, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, 4);
      for (let i = 0; i < 5; i++) {
        if (i >= 4) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_2300
     * @tc.name testBigInt64ArrayFillOne2300
     * @tc.desc Verify `arr.fill(-99n, 4)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(-99n, 4);
      for (let i = 0; i < 5; i++) {
        if (i >= 4) {
          expect(arr[i]).assertEqual(-99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_2400
     * @tc.name testBigInt64ArrayFillOne2400
     * @tc.desc Verify `arr.fill(99n, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, 5);
      for (let i = 0; i < 5; i++) {
        if (i >= 5) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_2500
     * @tc.name testBigInt64ArrayFillOne2500
     * @tc.desc Verify `arr.fill(-99n, 5)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(-99n, 5);
      for (let i = 0; i < 5; i++) {
        if (i >= 5) {
          expect(arr[i]).assertEqual(-99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FILL_ONE_2600
     * @tc.name testBigInt64ArrayFillOne2600
     * @tc.desc Verify `arr.fill(99n, 6)` behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFillOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.fill(99n, 6);
      for (let i = 0; i < 5; i++) {
        if (i >= 5) {
          expect(arr[i]).assertEqual(99n);
        } else {
          expect(arr[i]).assertEqual(BigInt((i + 1) * 10));
        }
      }
    });

  });
}
