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

export default function BigInt64ArrayConstructor01Test(): void {
  describe('BigInt64ArrayConstructor01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0010
     * @tc.name testBigInt64ArrayConstructorOne0010
     * @tc.desc Verify `new BigInt64Array()` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array();
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0020
     * @tc.name testBigInt64ArrayConstructorOne0020
     * @tc.desc Verify `new BigInt64Array()` produces a result where `arr instanceof BigInt64Array` is true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array();
        expect(arr instanceof BigInt64Array).assertEqual(true);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0030
     * @tc.name testBigInt64ArrayConstructorOne0030
     * @tc.desc Verify `new BigInt64Array()` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array();
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0040
     * @tc.name testBigInt64ArrayConstructorOne0040
     * @tc.desc Verify `new BigInt64Array(0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0050
     * @tc.name testBigInt64ArrayConstructorOne0050
     * @tc.desc Verify `new BigInt64Array(0)` produces a result where `arr.byteLength` equals `0 * 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0);
        expect(arr.byteLength).assertEqual(0 * 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0060
     * @tc.name testBigInt64ArrayConstructorOne0060
     * @tc.desc Verify `new BigInt64Array(0)` zero-initializes the first element when the array has elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0);
        if (arr.length > 0) {
          expect(arr.$_get(0)).assertEqual(0n);
        } else {
          expect(arr.length).assertEqual(0);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0070
     * @tc.name testBigInt64ArrayConstructorOne0070
     * @tc.desc Verify `new BigInt64Array(1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0080
     * @tc.name testBigInt64ArrayConstructorOne0080
     * @tc.desc Verify `new BigInt64Array(1)` produces a result where `arr.byteLength` equals `1 * 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(1);
        expect(arr.byteLength).assertEqual(1 * 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0090
     * @tc.name testBigInt64ArrayConstructorOne0090
     * @tc.desc Verify `new BigInt64Array(1)` zero-initializes the first element when the array has elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(1);
        if (arr.length > 0) {
          expect(arr.$_get(0)).assertEqual(0n);
        } else {
          expect(arr.length).assertEqual(0);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0100
     * @tc.name testBigInt64ArrayConstructorOne0100
     * @tc.desc Verify `new BigInt64Array(0x10)` produces a result where `arr.length` equals `0x10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0x10);
        expect(arr.length).assertEqual(0x10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0110
     * @tc.name testBigInt64ArrayConstructorOne0110
     * @tc.desc Verify `new BigInt64Array(0x10)` produces a result where `arr.byteLength` equals `0x10 * 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0x10);
        expect(arr.byteLength).assertEqual(0x10 * 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0120
     * @tc.name testBigInt64ArrayConstructorOne0120
     * @tc.desc Verify `new BigInt64Array(0x10)` zero-initializes the first element when the array has elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0x10);
        if (arr.length > 0) {
        expect(arr.$_get(0)).assertEqual(0n);
        } else {
        expect(arr.length).assertEqual(0);
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0130
     * @tc.name testBigInt64ArrayConstructorOne0130
     * @tc.desc Verify the tested operation behaves as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
        let arr = new BigInt64Array(-1);
        expect().assertFail();
        } catch (e) {
        expect(e.name).assertEqual('RangeError');
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0140
     * @tc.name testBigInt64ArrayConstructorOne0140
     * @tc.desc Verify `new BigInt64Array(new BigInt64Array())` produces a result where `copy.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let copy = new BigInt64Array(new BigInt64Array());
        expect(copy.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0150
     * @tc.name testBigInt64ArrayConstructorOne0150
     * @tc.desc Verify `new BigInt64Array(new BigInt64Array([1n, 2n]))` produces a result where `copy.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let copy = new BigInt64Array(new BigInt64Array([1n, 2n]));
        expect(copy.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0160
     * @tc.name testBigInt64ArrayConstructorOne0160
     * @tc.desc Verify `new BigInt64Array(new BigInt64Array([1n, 2n]))` produces a result where `copy.$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let copy = new BigInt64Array(new BigInt64Array([1n, 2n]));
        expect(copy.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0170
     * @tc.name testBigInt64ArrayConstructorOne0170
     * @tc.desc Verify `src.$_set(0, 5n)` produces a result where `new BigInt64Array(src).$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let src = new BigInt64Array([1n, 2n]);
        let copy = new BigInt64Array(src);
        src.$_set(0, 5n);
        expect(copy.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0180
     * @tc.name testBigInt64ArrayConstructorOne0180
     * @tc.desc Verify `new BigInt64Array(new BigInt64Array([9223372036854775807n]))` produces a result where `copy.$_get(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let copy = new BigInt64Array(new BigInt64Array([9223372036854775807n]));
        expect(copy.$_get(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0190
     * @tc.name testBigInt64ArrayConstructorOne0190
     * @tc.desc Verify `new BigInt64Array(new BigInt64Array([-9223372036854775807n - 1n]))` produces a result where `copy.$_get(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let copy = new BigInt64Array(new BigInt64Array([-9223372036854775807n - 1n]));
        expect(copy.$_get(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0200
     * @tc.name testBigInt64ArrayConstructorOne0200
     * @tc.desc Verify `new BigInt64Array([0n, 0n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 0n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0210
     * @tc.name testBigInt64ArrayConstructorOne0210
     * @tc.desc Verify `new BigInt64Array([0n, 0n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 0n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0220
     * @tc.name testBigInt64ArrayConstructorOne0220
     * @tc.desc Verify `new BigInt64Array([0n, 0n])` produces a result where `arr.$_get(1)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 0n]);
        expect(arr.$_get(1)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0230
     * @tc.name testBigInt64ArrayConstructorOne0230
     * @tc.desc Verify `new BigInt64Array([0n, 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0240
     * @tc.name testBigInt64ArrayConstructorOne0240
     * @tc.desc Verify `new BigInt64Array([0n, 1n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0250
     * @tc.name testBigInt64ArrayConstructorOne0250
     * @tc.desc Verify `new BigInt64Array([0n, 1n])` produces a result where `arr.$_get(1)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n]);
        expect(arr.$_get(1)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0260
     * @tc.name testBigInt64ArrayConstructorOne0260
     * @tc.desc Verify `new BigInt64Array([0n, -1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0270
     * @tc.name testBigInt64ArrayConstructorOne0270
     * @tc.desc Verify `new BigInt64Array([0n, -1n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -1n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0280
     * @tc.name testBigInt64ArrayConstructorOne0280
     * @tc.desc Verify `new BigInt64Array([0n, -1n])` produces a result where `arr.$_get(1)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -1n]);
        expect(arr.$_get(1)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0290
     * @tc.name testBigInt64ArrayConstructorOne0290
     * @tc.desc Verify `new BigInt64Array([0n, 9223372036854775807n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 9223372036854775807n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0300
     * @tc.name testBigInt64ArrayConstructorOne0300
     * @tc.desc Verify `new BigInt64Array([0n, 9223372036854775807n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 9223372036854775807n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0310
     * @tc.name testBigInt64ArrayConstructorOne0310
     * @tc.desc Verify `new BigInt64Array([0n, 9223372036854775807n])` produces a result where `arr.$_get(1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 9223372036854775807n]);
        expect(arr.$_get(1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0320
     * @tc.name testBigInt64ArrayConstructorOne0320
     * @tc.desc Verify `new BigInt64Array([0n, -9223372036854775807n - 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -9223372036854775807n - 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0330
     * @tc.name testBigInt64ArrayConstructorOne0330
     * @tc.desc Verify `new BigInt64Array([0n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -9223372036854775807n - 1n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0340
     * @tc.name testBigInt64ArrayConstructorOne0340
     * @tc.desc Verify `new BigInt64Array([0n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(1)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -9223372036854775807n - 1n]);
        expect(arr.$_get(1)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0350
     * @tc.name testBigInt64ArrayConstructorOne0350
     * @tc.desc Verify `new BigInt64Array([0n, 15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0360
     * @tc.name testBigInt64ArrayConstructorOne0360
     * @tc.desc Verify `new BigInt64Array([0n, 15n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 15n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0370
     * @tc.name testBigInt64ArrayConstructorOne0370
     * @tc.desc Verify `new BigInt64Array([0n, 15n])` produces a result where `arr.$_get(1)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 15n]);
        expect(arr.$_get(1)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0380
     * @tc.name testBigInt64ArrayConstructorOne0380
     * @tc.desc Verify `new BigInt64Array([0n, -15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0390
     * @tc.name testBigInt64ArrayConstructorOne0390
     * @tc.desc Verify `new BigInt64Array([0n, -15n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -15n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0400
     * @tc.name testBigInt64ArrayConstructorOne0400
     * @tc.desc Verify `new BigInt64Array([0n, -15n])` produces a result where `arr.$_get(1)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -15n]);
        expect(arr.$_get(1)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0410
     * @tc.name testBigInt64ArrayConstructorOne0410
     * @tc.desc Verify `new BigInt64Array([0n, 100n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 100n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0420
     * @tc.name testBigInt64ArrayConstructorOne0420
     * @tc.desc Verify `new BigInt64Array([0n, 100n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 100n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0430
     * @tc.name testBigInt64ArrayConstructorOne0430
     * @tc.desc Verify `new BigInt64Array([0n, 100n])` produces a result where `arr.$_get(1)` equals `100n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 100n]);
        expect(arr.$_get(1)).assertEqual(100n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0440
     * @tc.name testBigInt64ArrayConstructorOne0440
     * @tc.desc Verify `new BigInt64Array([0n, -100n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -100n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0450
     * @tc.name testBigInt64ArrayConstructorOne0450
     * @tc.desc Verify `new BigInt64Array([0n, -100n])` produces a result where `arr.$_get(0)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -100n]);
        expect(arr.$_get(0)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0460
     * @tc.name testBigInt64ArrayConstructorOne0460
     * @tc.desc Verify `new BigInt64Array([0n, -100n])` produces a result where `arr.$_get(1)` equals `-100n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, -100n]);
        expect(arr.$_get(1)).assertEqual(-100n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0470
     * @tc.name testBigInt64ArrayConstructorOne0470
     * @tc.desc Verify `new BigInt64Array([1n, 0n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 0n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0480
     * @tc.name testBigInt64ArrayConstructorOne0480
     * @tc.desc Verify `new BigInt64Array([1n, 0n])` produces a result where `arr.$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 0n]);
        expect(arr.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0490
     * @tc.name testBigInt64ArrayConstructorOne0490
     * @tc.desc Verify `new BigInt64Array([1n, 0n])` produces a result where `arr.$_get(1)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 0n]);
        expect(arr.$_get(1)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0500
     * @tc.name testBigInt64ArrayConstructorOne0500
     * @tc.desc Verify `new BigInt64Array([1n, 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0510
     * @tc.name testBigInt64ArrayConstructorOne0510
     * @tc.desc Verify `new BigInt64Array([1n, 1n])` produces a result where `arr.$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 1n]);
        expect(arr.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0520
     * @tc.name testBigInt64ArrayConstructorOne0520
     * @tc.desc Verify `new BigInt64Array([1n, 1n])` produces a result where `arr.$_get(1)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 1n]);
        expect(arr.$_get(1)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0530
     * @tc.name testBigInt64ArrayConstructorOne0530
     * @tc.desc Verify `new BigInt64Array([1n, -1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0540
     * @tc.name testBigInt64ArrayConstructorOne0540
     * @tc.desc Verify `new BigInt64Array([1n, -1n])` produces a result where `arr.$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -1n]);
        expect(arr.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0550
     * @tc.name testBigInt64ArrayConstructorOne0550
     * @tc.desc Verify `new BigInt64Array([1n, -1n])` produces a result where `arr.$_get(1)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -1n]);
        expect(arr.$_get(1)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0560
     * @tc.name testBigInt64ArrayConstructorOne0560
     * @tc.desc Verify `new BigInt64Array([1n, 9223372036854775807n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 9223372036854775807n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0570
     * @tc.name testBigInt64ArrayConstructorOne0570
     * @tc.desc Verify `new BigInt64Array([1n, 9223372036854775807n])` produces a result where `arr.$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 9223372036854775807n]);
        expect(arr.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0580
     * @tc.name testBigInt64ArrayConstructorOne0580
     * @tc.desc Verify `new BigInt64Array([1n, 9223372036854775807n])` produces a result where `arr.$_get(1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 9223372036854775807n]);
        expect(arr.$_get(1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0590
     * @tc.name testBigInt64ArrayConstructorOne0590
     * @tc.desc Verify `new BigInt64Array([1n, -9223372036854775807n - 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -9223372036854775807n - 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0600
     * @tc.name testBigInt64ArrayConstructorOne0600
     * @tc.desc Verify `new BigInt64Array([1n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -9223372036854775807n - 1n]);
        expect(arr.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0610
     * @tc.name testBigInt64ArrayConstructorOne0610
     * @tc.desc Verify `new BigInt64Array([1n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(1)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -9223372036854775807n - 1n]);
        expect(arr.$_get(1)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0620
     * @tc.name testBigInt64ArrayConstructorOne0620
     * @tc.desc Verify `new BigInt64Array([1n, 15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0630
     * @tc.name testBigInt64ArrayConstructorOne0630
     * @tc.desc Verify `new BigInt64Array([1n, 15n])` produces a result where `arr.$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 15n]);
        expect(arr.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0640
     * @tc.name testBigInt64ArrayConstructorOne0640
     * @tc.desc Verify `new BigInt64Array([1n, 15n])` produces a result where `arr.$_get(1)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 15n]);
        expect(arr.$_get(1)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0650
     * @tc.name testBigInt64ArrayConstructorOne0650
     * @tc.desc Verify `new BigInt64Array([1n, -15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0660
     * @tc.name testBigInt64ArrayConstructorOne0660
     * @tc.desc Verify `new BigInt64Array([1n, -15n])` produces a result where `arr.$_get(0)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -15n]);
        expect(arr.$_get(0)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0670
     * @tc.name testBigInt64ArrayConstructorOne0670
     * @tc.desc Verify `new BigInt64Array([1n, -15n])` produces a result where `arr.$_get(1)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, -15n]);
        expect(arr.$_get(1)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0680
     * @tc.name testBigInt64ArrayConstructorOne0680
     * @tc.desc Verify `new BigInt64Array([-1n, 0n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 0n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0690
     * @tc.name testBigInt64ArrayConstructorOne0690
     * @tc.desc Verify `new BigInt64Array([-1n, 0n])` produces a result where `arr.$_get(0)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 0n]);
        expect(arr.$_get(0)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0700
     * @tc.name testBigInt64ArrayConstructorOne0700
     * @tc.desc Verify `new BigInt64Array([-1n, 0n])` produces a result where `arr.$_get(1)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 0n]);
        expect(arr.$_get(1)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0710
     * @tc.name testBigInt64ArrayConstructorOne0710
     * @tc.desc Verify `new BigInt64Array([-1n, 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0720
     * @tc.name testBigInt64ArrayConstructorOne0720
     * @tc.desc Verify `new BigInt64Array([-1n, 1n])` produces a result where `arr.$_get(0)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 1n]);
        expect(arr.$_get(0)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0730
     * @tc.name testBigInt64ArrayConstructorOne0730
     * @tc.desc Verify `new BigInt64Array([-1n, 1n])` produces a result where `arr.$_get(1)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 1n]);
        expect(arr.$_get(1)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0740
     * @tc.name testBigInt64ArrayConstructorOne0740
     * @tc.desc Verify `new BigInt64Array([-1n, -1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0750
     * @tc.name testBigInt64ArrayConstructorOne0750
     * @tc.desc Verify `new BigInt64Array([-1n, -1n])` produces a result where `arr.$_get(0)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -1n]);
        expect(arr.$_get(0)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0760
     * @tc.name testBigInt64ArrayConstructorOne0760
     * @tc.desc Verify `new BigInt64Array([-1n, -1n])` produces a result where `arr.$_get(1)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -1n]);
        expect(arr.$_get(1)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0770
     * @tc.name testBigInt64ArrayConstructorOne0770
     * @tc.desc Verify `new BigInt64Array([-1n, 9223372036854775807n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 9223372036854775807n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0780
     * @tc.name testBigInt64ArrayConstructorOne0780
     * @tc.desc Verify `new BigInt64Array([-1n, 9223372036854775807n])` produces a result where `arr.$_get(0)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 9223372036854775807n]);
        expect(arr.$_get(0)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0790
     * @tc.name testBigInt64ArrayConstructorOne0790
     * @tc.desc Verify `new BigInt64Array([-1n, 9223372036854775807n])` produces a result where `arr.$_get(1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 9223372036854775807n]);
        expect(arr.$_get(1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0800
     * @tc.name testBigInt64ArrayConstructorOne0800
     * @tc.desc Verify `new BigInt64Array([-1n, -9223372036854775807n - 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -9223372036854775807n - 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0810
     * @tc.name testBigInt64ArrayConstructorOne0810
     * @tc.desc Verify `new BigInt64Array([-1n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(0)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -9223372036854775807n - 1n]);
        expect(arr.$_get(0)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0820
     * @tc.name testBigInt64ArrayConstructorOne0820
     * @tc.desc Verify `new BigInt64Array([-1n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(1)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -9223372036854775807n - 1n]);
        expect(arr.$_get(1)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0830
     * @tc.name testBigInt64ArrayConstructorOne0830
     * @tc.desc Verify `new BigInt64Array([-1n, 15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0840
     * @tc.name testBigInt64ArrayConstructorOne0840
     * @tc.desc Verify `new BigInt64Array([-1n, 15n])` produces a result where `arr.$_get(0)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 15n]);
        expect(arr.$_get(0)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0850
     * @tc.name testBigInt64ArrayConstructorOne0850
     * @tc.desc Verify `new BigInt64Array([-1n, 15n])` produces a result where `arr.$_get(1)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, 15n]);
        expect(arr.$_get(1)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0860
     * @tc.name testBigInt64ArrayConstructorOne0860
     * @tc.desc Verify `new BigInt64Array([-1n, -15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0870
     * @tc.name testBigInt64ArrayConstructorOne0870
     * @tc.desc Verify `new BigInt64Array([-1n, -15n])` produces a result where `arr.$_get(0)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -15n]);
        expect(arr.$_get(0)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0880
     * @tc.name testBigInt64ArrayConstructorOne0880
     * @tc.desc Verify `new BigInt64Array([-1n, -15n])` produces a result where `arr.$_get(1)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-1n, -15n]);
        expect(arr.$_get(1)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0890
     * @tc.name testBigInt64ArrayConstructorOne0890
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 0n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 0n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0900
     * @tc.name testBigInt64ArrayConstructorOne0900
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 0n])` produces a result where `arr.$_get(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 0n]);
        expect(arr.$_get(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0910
     * @tc.name testBigInt64ArrayConstructorOne0910
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 0n])` produces a result where `arr.$_get(1)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 0n]);
        expect(arr.$_get(1)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0920
     * @tc.name testBigInt64ArrayConstructorOne0920
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0930
     * @tc.name testBigInt64ArrayConstructorOne0930
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 1n])` produces a result where `arr.$_get(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 1n]);
        expect(arr.$_get(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0940
     * @tc.name testBigInt64ArrayConstructorOne0940
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 1n])` produces a result where `arr.$_get(1)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 1n]);
        expect(arr.$_get(1)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0950
     * @tc.name testBigInt64ArrayConstructorOne0950
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0960
     * @tc.name testBigInt64ArrayConstructorOne0960
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -1n])` produces a result where `arr.$_get(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -1n]);
        expect(arr.$_get(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0970
     * @tc.name testBigInt64ArrayConstructorOne0970
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -1n])` produces a result where `arr.$_get(1)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -1n]);
        expect(arr.$_get(1)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0980
     * @tc.name testBigInt64ArrayConstructorOne0980
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 92233720368, ...])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_0990
     * @tc.name testBigInt64ArrayConstructorOne0990
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 92233720368, ...])` produces a result where `arr.$_get(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
        expect(arr.$_get(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1000
     * @tc.name testBigInt64ArrayConstructorOne1000
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 92233720368, ...])` produces a result where `arr.$_get(1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
        expect(arr.$_get(1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1010
     * @tc.name testBigInt64ArrayConstructorOne1010
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -9223372036, ...])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1020
     * @tc.name testBigInt64ArrayConstructorOne1020
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -9223372036, ...])` produces a result where `arr.$_get(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        expect(arr.$_get(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1030
     * @tc.name testBigInt64ArrayConstructorOne1030
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -9223372036, ...])` produces a result where `arr.$_get(1)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
        expect(arr.$_get(1)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1040
     * @tc.name testBigInt64ArrayConstructorOne1040
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1050
     * @tc.name testBigInt64ArrayConstructorOne1050
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 15n])` produces a result where `arr.$_get(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 15n]);
        expect(arr.$_get(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1060
     * @tc.name testBigInt64ArrayConstructorOne1060
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, 15n])` produces a result where `arr.$_get(1)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, 15n]);
        expect(arr.$_get(1)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1070
     * @tc.name testBigInt64ArrayConstructorOne1070
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1080
     * @tc.name testBigInt64ArrayConstructorOne1080
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -15n])` produces a result where `arr.$_get(0)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -15n]);
        expect(arr.$_get(0)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1090
     * @tc.name testBigInt64ArrayConstructorOne1090
     * @tc.desc Verify `new BigInt64Array([9223372036854775807n, -15n])` produces a result where `arr.$_get(1)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([9223372036854775807n, -15n]);
        expect(arr.$_get(1)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1100
     * @tc.name testBigInt64ArrayConstructorOne1100
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 0n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 0n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1110
     * @tc.name testBigInt64ArrayConstructorOne1110
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 0n])` produces a result where `arr.$_get(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 0n]);
        expect(arr.$_get(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1120
     * @tc.name testBigInt64ArrayConstructorOne1120
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 0n])` produces a result where `arr.$_get(1)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 0n]);
        expect(arr.$_get(1)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1130
     * @tc.name testBigInt64ArrayConstructorOne1130
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1140
     * @tc.name testBigInt64ArrayConstructorOne1140
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 1n])` produces a result where `arr.$_get(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 1n]);
        expect(arr.$_get(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1150
     * @tc.name testBigInt64ArrayConstructorOne1150
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 1n])` produces a result where `arr.$_get(1)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 1n]);
        expect(arr.$_get(1)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1160
     * @tc.name testBigInt64ArrayConstructorOne1160
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1170
     * @tc.name testBigInt64ArrayConstructorOne1170
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -1n])` produces a result where `arr.$_get(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -1n]);
        expect(arr.$_get(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1180
     * @tc.name testBigInt64ArrayConstructorOne1180
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -1n])` produces a result where `arr.$_get(1)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -1n]);
        expect(arr.$_get(1)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1190
     * @tc.name testBigInt64ArrayConstructorOne1190
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 92233, ...])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 9223372036854775807n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1200
     * @tc.name testBigInt64ArrayConstructorOne1200
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 92233, ...])` produces a result where `arr.$_get(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 9223372036854775807n]);
        expect(arr.$_get(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1210
     * @tc.name testBigInt64ArrayConstructorOne1210
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 92233, ...])` produces a result where `arr.$_get(1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 9223372036854775807n]);
        expect(arr.$_get(1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1220
     * @tc.name testBigInt64ArrayConstructorOne1220
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -9223, ...])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -9223372036854775807n - 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1230
     * @tc.name testBigInt64ArrayConstructorOne1230
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -9223, ...])` produces a result where `arr.$_get(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -9223372036854775807n - 1n]);
        expect(arr.$_get(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1240
     * @tc.name testBigInt64ArrayConstructorOne1240
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -9223, ...])` produces a result where `arr.$_get(1)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -9223372036854775807n - 1n]);
        expect(arr.$_get(1)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1250
     * @tc.name testBigInt64ArrayConstructorOne1250
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1260
     * @tc.name testBigInt64ArrayConstructorOne1260
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 15n])` produces a result where `arr.$_get(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 15n]);
        expect(arr.$_get(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1270
     * @tc.name testBigInt64ArrayConstructorOne1270
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, 15n])` produces a result where `arr.$_get(1)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, 15n]);
        expect(arr.$_get(1)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1280
     * @tc.name testBigInt64ArrayConstructorOne1280
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1290
     * @tc.name testBigInt64ArrayConstructorOne1290
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -15n])` produces a result where `arr.$_get(0)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -15n]);
        expect(arr.$_get(0)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1300
     * @tc.name testBigInt64ArrayConstructorOne1300
     * @tc.desc Verify `new BigInt64Array([-9223372036854775807n - 1n, -15n])` produces a result where `arr.$_get(1)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-9223372036854775807n - 1n, -15n]);
        expect(arr.$_get(1)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1310
     * @tc.name testBigInt64ArrayConstructorOne1310
     * @tc.desc Verify `new BigInt64Array([15n, 0n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 0n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1320
     * @tc.name testBigInt64ArrayConstructorOne1320
     * @tc.desc Verify `new BigInt64Array([15n, 0n])` produces a result where `arr.$_get(0)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 0n]);
        expect(arr.$_get(0)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1330
     * @tc.name testBigInt64ArrayConstructorOne1330
     * @tc.desc Verify `new BigInt64Array([15n, 0n])` produces a result where `arr.$_get(1)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 0n]);
        expect(arr.$_get(1)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1340
     * @tc.name testBigInt64ArrayConstructorOne1340
     * @tc.desc Verify `new BigInt64Array([15n, 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1350
     * @tc.name testBigInt64ArrayConstructorOne1350
     * @tc.desc Verify `new BigInt64Array([15n, 1n])` produces a result where `arr.$_get(0)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 1n]);
        expect(arr.$_get(0)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1360
     * @tc.name testBigInt64ArrayConstructorOne1360
     * @tc.desc Verify `new BigInt64Array([15n, 1n])` produces a result where `arr.$_get(1)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 1n]);
        expect(arr.$_get(1)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1370
     * @tc.name testBigInt64ArrayConstructorOne1370
     * @tc.desc Verify `new BigInt64Array([15n, -1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1380
     * @tc.name testBigInt64ArrayConstructorOne1380
     * @tc.desc Verify `new BigInt64Array([15n, -1n])` produces a result where `arr.$_get(0)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -1n]);
        expect(arr.$_get(0)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1390
     * @tc.name testBigInt64ArrayConstructorOne1390
     * @tc.desc Verify `new BigInt64Array([15n, -1n])` produces a result where `arr.$_get(1)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -1n]);
        expect(arr.$_get(1)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1400
     * @tc.name testBigInt64ArrayConstructorOne1400
     * @tc.desc Verify `new BigInt64Array([15n, 9223372036854775807n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 9223372036854775807n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1410
     * @tc.name testBigInt64ArrayConstructorOne1410
     * @tc.desc Verify `new BigInt64Array([15n, 9223372036854775807n])` produces a result where `arr.$_get(0)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 9223372036854775807n]);
        expect(arr.$_get(0)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1420
     * @tc.name testBigInt64ArrayConstructorOne1420
     * @tc.desc Verify `new BigInt64Array([15n, 9223372036854775807n])` produces a result where `arr.$_get(1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 9223372036854775807n]);
        expect(arr.$_get(1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1430
     * @tc.name testBigInt64ArrayConstructorOne1430
     * @tc.desc Verify `new BigInt64Array([15n, -9223372036854775807n - 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -9223372036854775807n - 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1440
     * @tc.name testBigInt64ArrayConstructorOne1440
     * @tc.desc Verify `new BigInt64Array([15n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(0)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -9223372036854775807n - 1n]);
        expect(arr.$_get(0)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1450
     * @tc.name testBigInt64ArrayConstructorOne1450
     * @tc.desc Verify `new BigInt64Array([15n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(1)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -9223372036854775807n - 1n]);
        expect(arr.$_get(1)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1460
     * @tc.name testBigInt64ArrayConstructorOne1460
     * @tc.desc Verify `new BigInt64Array([15n, 15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1470
     * @tc.name testBigInt64ArrayConstructorOne1470
     * @tc.desc Verify `new BigInt64Array([15n, 15n])` produces a result where `arr.$_get(0)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 15n]);
        expect(arr.$_get(0)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1480
     * @tc.name testBigInt64ArrayConstructorOne1480
     * @tc.desc Verify `new BigInt64Array([15n, 15n])` produces a result where `arr.$_get(1)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, 15n]);
        expect(arr.$_get(1)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1490
     * @tc.name testBigInt64ArrayConstructorOne1490
     * @tc.desc Verify `new BigInt64Array([15n, -15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1500
     * @tc.name testBigInt64ArrayConstructorOne1500
     * @tc.desc Verify `new BigInt64Array([15n, -15n])` produces a result where `arr.$_get(0)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -15n]);
        expect(arr.$_get(0)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1510
     * @tc.name testBigInt64ArrayConstructorOne1510
     * @tc.desc Verify `new BigInt64Array([15n, -15n])` produces a result where `arr.$_get(1)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([15n, -15n]);
        expect(arr.$_get(1)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1520
     * @tc.name testBigInt64ArrayConstructorOne1520
     * @tc.desc Verify `new BigInt64Array([-15n, 0n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 0n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1530
     * @tc.name testBigInt64ArrayConstructorOne1530
     * @tc.desc Verify `new BigInt64Array([-15n, 0n])` produces a result where `arr.$_get(0)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 0n]);
        expect(arr.$_get(0)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_ONE_1540
     * @tc.name testBigInt64ArrayConstructorOne1540
     * @tc.desc Verify `new BigInt64Array([-15n, 0n])` produces a result where `arr.$_get(1)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorOne1540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 0n]);
        expect(arr.$_get(1)).assertEqual(0n);
      });

  });
}
