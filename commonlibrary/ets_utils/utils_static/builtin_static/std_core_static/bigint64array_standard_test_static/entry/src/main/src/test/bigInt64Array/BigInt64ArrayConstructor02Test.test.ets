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

export default function BigInt64ArrayConstructor02Test(): void {
  describe('BigInt64ArrayConstructor02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0010
     * @tc.name testBigInt64ArrayConstructorTwo0010
     * @tc.desc Verify `new BigInt64Array([-15n, 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0020
     * @tc.name testBigInt64ArrayConstructorTwo0020
     * @tc.desc Verify `new BigInt64Array([-15n, 1n])` produces a result where `arr.$_get(0)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 1n]);
        expect(arr.$_get(0)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0030
     * @tc.name testBigInt64ArrayConstructorTwo0030
     * @tc.desc Verify `new BigInt64Array([-15n, 1n])` produces a result where `arr.$_get(1)` equals `1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 1n]);
        expect(arr.$_get(1)).assertEqual(1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0040
     * @tc.name testBigInt64ArrayConstructorTwo0040
     * @tc.desc Verify `new BigInt64Array([-15n, -1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0050
     * @tc.name testBigInt64ArrayConstructorTwo0050
     * @tc.desc Verify `new BigInt64Array([-15n, -1n])` produces a result where `arr.$_get(0)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -1n]);
        expect(arr.$_get(0)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0060
     * @tc.name testBigInt64ArrayConstructorTwo0060
     * @tc.desc Verify `new BigInt64Array([-15n, -1n])` produces a result where `arr.$_get(1)` equals `-1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -1n]);
        expect(arr.$_get(1)).assertEqual(-1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0070
     * @tc.name testBigInt64ArrayConstructorTwo0070
     * @tc.desc Verify `new BigInt64Array([-15n, 9223372036854775807n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 9223372036854775807n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0080
     * @tc.name testBigInt64ArrayConstructorTwo0080
     * @tc.desc Verify `new BigInt64Array([-15n, 9223372036854775807n])` produces a result where `arr.$_get(0)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 9223372036854775807n]);
        expect(arr.$_get(0)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0090
     * @tc.name testBigInt64ArrayConstructorTwo0090
     * @tc.desc Verify `new BigInt64Array([-15n, 9223372036854775807n])` produces a result where `arr.$_get(1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 9223372036854775807n]);
        expect(arr.$_get(1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0100
     * @tc.name testBigInt64ArrayConstructorTwo0100
     * @tc.desc Verify `new BigInt64Array([-15n, -9223372036854775807n - 1n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -9223372036854775807n - 1n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0110
     * @tc.name testBigInt64ArrayConstructorTwo0110
     * @tc.desc Verify `new BigInt64Array([-15n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(0)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -9223372036854775807n - 1n]);
        expect(arr.$_get(0)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0120
     * @tc.name testBigInt64ArrayConstructorTwo0120
     * @tc.desc Verify `new BigInt64Array([-15n, -9223372036854775807n - 1n])` produces a result where `arr.$_get(1)` equals `-9223372036854775807n - 1n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -9223372036854775807n - 1n]);
        expect(arr.$_get(1)).assertEqual(-9223372036854775807n - 1n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0130
     * @tc.name testBigInt64ArrayConstructorTwo0130
     * @tc.desc Verify `new BigInt64Array([-15n, 15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0140
     * @tc.name testBigInt64ArrayConstructorTwo0140
     * @tc.desc Verify `new BigInt64Array([-15n, 15n])` produces a result where `arr.$_get(0)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 15n]);
        expect(arr.$_get(0)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0150
     * @tc.name testBigInt64ArrayConstructorTwo0150
     * @tc.desc Verify `new BigInt64Array([-15n, 15n])` produces a result where `arr.$_get(1)` equals `15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, 15n]);
        expect(arr.$_get(1)).assertEqual(15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0160
     * @tc.name testBigInt64ArrayConstructorTwo0160
     * @tc.desc Verify `new BigInt64Array([-15n, -15n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -15n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0170
     * @tc.name testBigInt64ArrayConstructorTwo0170
     * @tc.desc Verify `new BigInt64Array([-15n, -15n])` produces a result where `arr.$_get(0)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -15n]);
        expect(arr.$_get(0)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0180
     * @tc.name testBigInt64ArrayConstructorTwo0180
     * @tc.desc Verify `new BigInt64Array([-15n, -15n])` produces a result where `arr.$_get(1)` equals `-15n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-15n, -15n]);
        expect(arr.$_get(1)).assertEqual(-15n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0190
     * @tc.name testBigInt64ArrayConstructorTwo0190
     * @tc.desc Verify `new BigInt64Array([100n, 0n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 0n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0200
     * @tc.name testBigInt64ArrayConstructorTwo0200
     * @tc.desc Verify `new BigInt64Array([100n, 0n])` produces a result where `arr.$_get(0)` equals `100n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 0n]);
        expect(arr.$_get(0)).assertEqual(100n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0210
     * @tc.name testBigInt64ArrayConstructorTwo0210
     * @tc.desc Verify `new BigInt64Array([100n, 0n])` produces a result where `arr.$_get(1)` equals `0n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 0n]);
        expect(arr.$_get(1)).assertEqual(0n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0220
     * @tc.name testBigInt64ArrayConstructorTwo0220
     * @tc.desc Verify `new BigInt64Array([100n, 9223372036854775807n])` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 9223372036854775807n]);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0230
     * @tc.name testBigInt64ArrayConstructorTwo0230
     * @tc.desc Verify `new BigInt64Array([100n, 9223372036854775807n])` produces a result where `arr.$_get(0)` equals `100n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 9223372036854775807n]);
        expect(arr.$_get(0)).assertEqual(100n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0240
     * @tc.name testBigInt64ArrayConstructorTwo0240
     * @tc.desc Verify `new BigInt64Array([100n, 9223372036854775807n])` produces a result where `arr.$_get(1)` equals `9223372036854775807n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([100n, 9223372036854775807n]);
        expect(arr.$_get(1)).assertEqual(9223372036854775807n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0250
     * @tc.name testBigInt64ArrayConstructorTwo0250
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(0);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0260
     * @tc.name testBigInt64ArrayConstructorTwo0260
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0270
     * @tc.name testBigInt64ArrayConstructorTwo0270
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0280
     * @tc.name testBigInt64ArrayConstructorTwo0280
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0290
     * @tc.name testBigInt64ArrayConstructorTwo0290
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0300
     * @tc.name testBigInt64ArrayConstructorTwo0300
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0310
     * @tc.name testBigInt64ArrayConstructorTwo0310
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0320
     * @tc.name testBigInt64ArrayConstructorTwo0320
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0330
     * @tc.name testBigInt64ArrayConstructorTwo0330
     * @tc.desc Verify `new BigInt64Array(buf)` produces a result where `arr.length` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf);
        expect(arr.length).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0340
     * @tc.name testBigInt64ArrayConstructorTwo0340
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(0 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(0);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((0 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0350
     * @tc.name testBigInt64ArrayConstructorTwo0350
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(0);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0360
     * @tc.name testBigInt64ArrayConstructorTwo0360
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(0);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0370
     * @tc.name testBigInt64ArrayConstructorTwo0370
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(8 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((8 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0380
     * @tc.name testBigInt64ArrayConstructorTwo0380
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0390
     * @tc.name testBigInt64ArrayConstructorTwo0390
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0400
     * @tc.name testBigInt64ArrayConstructorTwo0400
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.length` equals `(8 - 8) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.length).assertEqual((8 - 8) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0410
     * @tc.name testBigInt64ArrayConstructorTwo0410
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.byteOffset` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.byteOffset).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0420
     * @tc.name testBigInt64ArrayConstructorTwo0420
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0430
     * @tc.name testBigInt64ArrayConstructorTwo0430
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(16 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((16 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0440
     * @tc.name testBigInt64ArrayConstructorTwo0440
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0450
     * @tc.name testBigInt64ArrayConstructorTwo0450
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0460
     * @tc.name testBigInt64ArrayConstructorTwo0460
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.length` equals `(16 - 8) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.length).assertEqual((16 - 8) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0470
     * @tc.name testBigInt64ArrayConstructorTwo0470
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.byteOffset` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.byteOffset).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0480
     * @tc.name testBigInt64ArrayConstructorTwo0480
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0490
     * @tc.name testBigInt64ArrayConstructorTwo0490
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.length` equals `(16 - 16) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.length).assertEqual((16 - 16) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0500
     * @tc.name testBigInt64ArrayConstructorTwo0500
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.byteOffset` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.byteOffset).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0510
     * @tc.name testBigInt64ArrayConstructorTwo0510
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(16);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0520
     * @tc.name testBigInt64ArrayConstructorTwo0520
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(24 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((24 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0530
     * @tc.name testBigInt64ArrayConstructorTwo0530
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0540
     * @tc.name testBigInt64ArrayConstructorTwo0540
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0550
     * @tc.name testBigInt64ArrayConstructorTwo0550
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.length` equals `(24 - 8) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.length).assertEqual((24 - 8) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0560
     * @tc.name testBigInt64ArrayConstructorTwo0560
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.byteOffset` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.byteOffset).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0570
     * @tc.name testBigInt64ArrayConstructorTwo0570
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0580
     * @tc.name testBigInt64ArrayConstructorTwo0580
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.length` equals `(24 - 16) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.length).assertEqual((24 - 16) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0590
     * @tc.name testBigInt64ArrayConstructorTwo0590
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.byteOffset` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.byteOffset).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0600
     * @tc.name testBigInt64ArrayConstructorTwo0600
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0610
     * @tc.name testBigInt64ArrayConstructorTwo0610
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.length` equals `(24 - 24) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.length).assertEqual((24 - 24) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0620
     * @tc.name testBigInt64ArrayConstructorTwo0620
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.byteOffset` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.byteOffset).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0630
     * @tc.name testBigInt64ArrayConstructorTwo0630
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(24);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0640
     * @tc.name testBigInt64ArrayConstructorTwo0640
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(32 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((32 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0650
     * @tc.name testBigInt64ArrayConstructorTwo0650
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0660
     * @tc.name testBigInt64ArrayConstructorTwo0660
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0670
     * @tc.name testBigInt64ArrayConstructorTwo0670
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.length` equals `(32 - 8) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.length).assertEqual((32 - 8) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0680
     * @tc.name testBigInt64ArrayConstructorTwo0680
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.byteOffset` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.byteOffset).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0690
     * @tc.name testBigInt64ArrayConstructorTwo0690
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0700
     * @tc.name testBigInt64ArrayConstructorTwo0700
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.length` equals `(32 - 16) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.length).assertEqual((32 - 16) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0710
     * @tc.name testBigInt64ArrayConstructorTwo0710
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.byteOffset` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.byteOffset).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0720
     * @tc.name testBigInt64ArrayConstructorTwo0720
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0730
     * @tc.name testBigInt64ArrayConstructorTwo0730
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.length` equals `(32 - 24) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.length).assertEqual((32 - 24) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0740
     * @tc.name testBigInt64ArrayConstructorTwo0740
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.byteOffset` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.byteOffset).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0750
     * @tc.name testBigInt64ArrayConstructorTwo0750
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0760
     * @tc.name testBigInt64ArrayConstructorTwo0760
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(64 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((64 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0770
     * @tc.name testBigInt64ArrayConstructorTwo0770
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0780
     * @tc.name testBigInt64ArrayConstructorTwo0780
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0790
     * @tc.name testBigInt64ArrayConstructorTwo0790
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.length` equals `(64 - 8) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.length).assertEqual((64 - 8) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0800
     * @tc.name testBigInt64ArrayConstructorTwo0800
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.byteOffset` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.byteOffset).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0810
     * @tc.name testBigInt64ArrayConstructorTwo0810
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0820
     * @tc.name testBigInt64ArrayConstructorTwo0820
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.length` equals `(64 - 16) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.length).assertEqual((64 - 16) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0830
     * @tc.name testBigInt64ArrayConstructorTwo0830
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.byteOffset` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.byteOffset).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0840
     * @tc.name testBigInt64ArrayConstructorTwo0840
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0850
     * @tc.name testBigInt64ArrayConstructorTwo0850
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.length` equals `(64 - 24) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.length).assertEqual((64 - 24) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0860
     * @tc.name testBigInt64ArrayConstructorTwo0860
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.byteOffset` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.byteOffset).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0870
     * @tc.name testBigInt64ArrayConstructorTwo0870
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0880
     * @tc.name testBigInt64ArrayConstructorTwo0880
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(128 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((128 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0890
     * @tc.name testBigInt64ArrayConstructorTwo0890
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0900
     * @tc.name testBigInt64ArrayConstructorTwo0900
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0910
     * @tc.name testBigInt64ArrayConstructorTwo0910
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.length` equals `(128 - 8) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.length).assertEqual((128 - 8) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0920
     * @tc.name testBigInt64ArrayConstructorTwo0920
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.byteOffset` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.byteOffset).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0930
     * @tc.name testBigInt64ArrayConstructorTwo0930
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0940
     * @tc.name testBigInt64ArrayConstructorTwo0940
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.length` equals `(128 - 16) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.length).assertEqual((128 - 16) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0950
     * @tc.name testBigInt64ArrayConstructorTwo0950
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.byteOffset` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.byteOffset).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0960
     * @tc.name testBigInt64ArrayConstructorTwo0960
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0970
     * @tc.name testBigInt64ArrayConstructorTwo0970
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.length` equals `(128 - 24) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.length).assertEqual((128 - 24) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0980
     * @tc.name testBigInt64ArrayConstructorTwo0980
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.byteOffset` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.byteOffset).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_0990
     * @tc.name testBigInt64ArrayConstructorTwo0990
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1000
     * @tc.name testBigInt64ArrayConstructorTwo1000
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(256 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((256 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1010
     * @tc.name testBigInt64ArrayConstructorTwo1010
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1020
     * @tc.name testBigInt64ArrayConstructorTwo1020
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1030
     * @tc.name testBigInt64ArrayConstructorTwo1030
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.length` equals `(256 - 8) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.length).assertEqual((256 - 8) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1040
     * @tc.name testBigInt64ArrayConstructorTwo1040
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.byteOffset` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.byteOffset).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1050
     * @tc.name testBigInt64ArrayConstructorTwo1050
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1060
     * @tc.name testBigInt64ArrayConstructorTwo1060
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.length` equals `(256 - 16) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.length).assertEqual((256 - 16) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1070
     * @tc.name testBigInt64ArrayConstructorTwo1070
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.byteOffset` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.byteOffset).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1080
     * @tc.name testBigInt64ArrayConstructorTwo1080
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1090
     * @tc.name testBigInt64ArrayConstructorTwo1090
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.length` equals `(256 - 24) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.length).assertEqual((256 - 24) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1100
     * @tc.name testBigInt64ArrayConstructorTwo1100
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.byteOffset` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.byteOffset).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1110
     * @tc.name testBigInt64ArrayConstructorTwo1110
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1120
     * @tc.name testBigInt64ArrayConstructorTwo1120
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.length` equals `(1024 - 0) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.length).assertEqual((1024 - 0) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1130
     * @tc.name testBigInt64ArrayConstructorTwo1130
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.byteOffset` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.byteOffset).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1140
     * @tc.name testBigInt64ArrayConstructorTwo1140
     * @tc.desc Verify `new BigInt64Array(buf, 0)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1150
     * @tc.name testBigInt64ArrayConstructorTwo1150
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.length` equals `(1024 - 8) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.length).assertEqual((1024 - 8) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1160
     * @tc.name testBigInt64ArrayConstructorTwo1160
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.byteOffset` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.byteOffset).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1170
     * @tc.name testBigInt64ArrayConstructorTwo1170
     * @tc.desc Verify `new BigInt64Array(buf, 8)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1180
     * @tc.name testBigInt64ArrayConstructorTwo1180
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.length` equals `(1024 - 16) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.length).assertEqual((1024 - 16) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1190
     * @tc.name testBigInt64ArrayConstructorTwo1190
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.byteOffset` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.byteOffset).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1200
     * @tc.name testBigInt64ArrayConstructorTwo1200
     * @tc.desc Verify `new BigInt64Array(buf, 16)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 16);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1210
     * @tc.name testBigInt64ArrayConstructorTwo1210
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.length` equals `(1024 - 24) / 8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.length).assertEqual((1024 - 24) / 8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1220
     * @tc.name testBigInt64ArrayConstructorTwo1220
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.byteOffset` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.byteOffset).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1230
     * @tc.name testBigInt64ArrayConstructorTwo1230
     * @tc.desc Verify `new BigInt64Array(buf, 24)` produces a result where `arr.buffer` equals `buf`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 24);
        expect(arr.buffer).assertEqual(buf);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1240
     * @tc.name testBigInt64ArrayConstructorTwo1240
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(0);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1250
     * @tc.name testBigInt64ArrayConstructorTwo1250
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(0);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1260
     * @tc.name testBigInt64ArrayConstructorTwo1260
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_TWO_1270
     * @tc.name testBigInt64ArrayConstructorTwo1270
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorTwo1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(8);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.byteLength).assertEqual(0);
      });


  });
}
