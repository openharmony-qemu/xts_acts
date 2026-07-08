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

export default function BigInt64ArrayConstructor03Test(): void {
  describe('BigInt64ArrayConstructor03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0010
     * @tc.name testBigInt64ArrayConstructorThree0010
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0020
     * @tc.name testBigInt64ArrayConstructorThree0020
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0030
     * @tc.name testBigInt64ArrayConstructorThree0030
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0040
     * @tc.name testBigInt64ArrayConstructorThree0040
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0050
     * @tc.name testBigInt64ArrayConstructorThree0050
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0060
     * @tc.name testBigInt64ArrayConstructorThree0060
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0070
     * @tc.name testBigInt64ArrayConstructorThree0070
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0080
     * @tc.name testBigInt64ArrayConstructorThree0080
     * @tc.desc Verify `new BigInt64Array(buf, 8, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0090
     * @tc.name testBigInt64ArrayConstructorThree0090
     * @tc.desc Verify `new BigInt64Array(buf, 8, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0100
     * @tc.name testBigInt64ArrayConstructorThree0100
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 8, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0110
     * @tc.name testBigInt64ArrayConstructorThree0110
     * @tc.desc Verify `new BigInt64Array(buf, 16, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0120
     * @tc.name testBigInt64ArrayConstructorThree0120
     * @tc.desc Verify `new BigInt64Array(buf, 16, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0130
     * @tc.name testBigInt64ArrayConstructorThree0130
     * @tc.desc Verify `new BigInt64Array(buf, 16, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0140
     * @tc.name testBigInt64ArrayConstructorThree0140
     * @tc.desc Verify `new BigInt64Array(buf, 16, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0150
     * @tc.name testBigInt64ArrayConstructorThree0150
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0160
     * @tc.name testBigInt64ArrayConstructorThree0160
     * @tc.desc Verify `new BigInt64Array(buf, 16, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0170
     * @tc.name testBigInt64ArrayConstructorThree0170
     * @tc.desc Verify `new BigInt64Array(buf, 16, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0180
     * @tc.name testBigInt64ArrayConstructorThree0180
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 16, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0190
     * @tc.name testBigInt64ArrayConstructorThree0190
     * @tc.desc Verify `new BigInt64Array(buf, 24, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 24, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0200
     * @tc.name testBigInt64ArrayConstructorThree0200
     * @tc.desc Verify `new BigInt64Array(buf, 24, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 24, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0210
     * @tc.name testBigInt64ArrayConstructorThree0210
     * @tc.desc Verify `new BigInt64Array(buf, 24, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 24, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0220
     * @tc.name testBigInt64ArrayConstructorThree0220
     * @tc.desc Verify `new BigInt64Array(buf, 24, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 24, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0230
     * @tc.name testBigInt64ArrayConstructorThree0230
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(32);
        let arr = new BigInt64Array(buf, 24, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0240
     * @tc.name testBigInt64ArrayConstructorThree0240
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0250
     * @tc.name testBigInt64ArrayConstructorThree0250
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0260
     * @tc.name testBigInt64ArrayConstructorThree0260
     * @tc.desc Verify `new BigInt64Array(buf, 0, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0270
     * @tc.name testBigInt64ArrayConstructorThree0270
     * @tc.desc Verify `new BigInt64Array(buf, 0, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0280
     * @tc.name testBigInt64ArrayConstructorThree0280
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0290
     * @tc.name testBigInt64ArrayConstructorThree0290
     * @tc.desc Verify `new BigInt64Array(buf, 0, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0300
     * @tc.name testBigInt64ArrayConstructorThree0300
     * @tc.desc Verify `new BigInt64Array(buf, 0, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0310
     * @tc.name testBigInt64ArrayConstructorThree0310
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0320
     * @tc.name testBigInt64ArrayConstructorThree0320
     * @tc.desc Verify `new BigInt64Array(buf, 0, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0330
     * @tc.name testBigInt64ArrayConstructorThree0330
     * @tc.desc Verify `new BigInt64Array(buf, 0, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0340
     * @tc.name testBigInt64ArrayConstructorThree0340
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0350
     * @tc.name testBigInt64ArrayConstructorThree0350
     * @tc.desc Verify `new BigInt64Array(buf, 0, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0360
     * @tc.name testBigInt64ArrayConstructorThree0360
     * @tc.desc Verify `new BigInt64Array(buf, 0, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0370
     * @tc.name testBigInt64ArrayConstructorThree0370
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0380
     * @tc.name testBigInt64ArrayConstructorThree0380
     * @tc.desc Verify `new BigInt64Array(buf, 0, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0390
     * @tc.name testBigInt64ArrayConstructorThree0390
     * @tc.desc Verify `new BigInt64Array(buf, 0, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0400
     * @tc.name testBigInt64ArrayConstructorThree0400
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 0, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0410
     * @tc.name testBigInt64ArrayConstructorThree0410
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0420
     * @tc.name testBigInt64ArrayConstructorThree0420
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0430
     * @tc.name testBigInt64ArrayConstructorThree0430
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0440
     * @tc.name testBigInt64ArrayConstructorThree0440
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0450
     * @tc.name testBigInt64ArrayConstructorThree0450
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0460
     * @tc.name testBigInt64ArrayConstructorThree0460
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0470
     * @tc.name testBigInt64ArrayConstructorThree0470
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0480
     * @tc.name testBigInt64ArrayConstructorThree0480
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0490
     * @tc.name testBigInt64ArrayConstructorThree0490
     * @tc.desc Verify `new BigInt64Array(buf, 8, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0500
     * @tc.name testBigInt64ArrayConstructorThree0500
     * @tc.desc Verify `new BigInt64Array(buf, 8, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0510
     * @tc.name testBigInt64ArrayConstructorThree0510
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0520
     * @tc.name testBigInt64ArrayConstructorThree0520
     * @tc.desc Verify `new BigInt64Array(buf, 8, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0530
     * @tc.name testBigInt64ArrayConstructorThree0530
     * @tc.desc Verify `new BigInt64Array(buf, 8, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0540
     * @tc.name testBigInt64ArrayConstructorThree0540
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0550
     * @tc.name testBigInt64ArrayConstructorThree0550
     * @tc.desc Verify `new BigInt64Array(buf, 8, 7)` produces a result where `arr.length` equals `7`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 7);
        expect(arr.length).assertEqual(7);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0560
     * @tc.name testBigInt64ArrayConstructorThree0560
     * @tc.desc Verify `new BigInt64Array(buf, 8, 7)` produces a result where `arr.byteLength` equals `56`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 7);
        expect(arr.byteLength).assertEqual(56);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0570
     * @tc.name testBigInt64ArrayConstructorThree0570
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 8, 7);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0580
     * @tc.name testBigInt64ArrayConstructorThree0580
     * @tc.desc Verify `new BigInt64Array(buf, 16, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0590
     * @tc.name testBigInt64ArrayConstructorThree0590
     * @tc.desc Verify `new BigInt64Array(buf, 16, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0600
     * @tc.name testBigInt64ArrayConstructorThree0600
     * @tc.desc Verify `new BigInt64Array(buf, 16, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0610
     * @tc.name testBigInt64ArrayConstructorThree0610
     * @tc.desc Verify `new BigInt64Array(buf, 16, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0620
     * @tc.name testBigInt64ArrayConstructorThree0620
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0630
     * @tc.name testBigInt64ArrayConstructorThree0630
     * @tc.desc Verify `new BigInt64Array(buf, 16, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0640
     * @tc.name testBigInt64ArrayConstructorThree0640
     * @tc.desc Verify `new BigInt64Array(buf, 16, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0650
     * @tc.name testBigInt64ArrayConstructorThree0650
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0660
     * @tc.name testBigInt64ArrayConstructorThree0660
     * @tc.desc Verify `new BigInt64Array(buf, 16, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0670
     * @tc.name testBigInt64ArrayConstructorThree0670
     * @tc.desc Verify `new BigInt64Array(buf, 16, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0680
     * @tc.name testBigInt64ArrayConstructorThree0680
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0690
     * @tc.name testBigInt64ArrayConstructorThree0690
     * @tc.desc Verify `new BigInt64Array(buf, 16, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0700
     * @tc.name testBigInt64ArrayConstructorThree0700
     * @tc.desc Verify `new BigInt64Array(buf, 16, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0710
     * @tc.name testBigInt64ArrayConstructorThree0710
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0720
     * @tc.name testBigInt64ArrayConstructorThree0720
     * @tc.desc Verify `new BigInt64Array(buf, 16, 6)` produces a result where `arr.length` equals `6`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 6);
        expect(arr.length).assertEqual(6);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0730
     * @tc.name testBigInt64ArrayConstructorThree0730
     * @tc.desc Verify `new BigInt64Array(buf, 16, 6)` produces a result where `arr.byteLength` equals `48`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 6);
        expect(arr.byteLength).assertEqual(48);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0740
     * @tc.name testBigInt64ArrayConstructorThree0740
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 16, 6);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0750
     * @tc.name testBigInt64ArrayConstructorThree0750
     * @tc.desc Verify `new BigInt64Array(buf, 24, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0760
     * @tc.name testBigInt64ArrayConstructorThree0760
     * @tc.desc Verify `new BigInt64Array(buf, 24, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0770
     * @tc.name testBigInt64ArrayConstructorThree0770
     * @tc.desc Verify `new BigInt64Array(buf, 24, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0780
     * @tc.name testBigInt64ArrayConstructorThree0780
     * @tc.desc Verify `new BigInt64Array(buf, 24, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0790
     * @tc.name testBigInt64ArrayConstructorThree0790
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0800
     * @tc.name testBigInt64ArrayConstructorThree0800
     * @tc.desc Verify `new BigInt64Array(buf, 24, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0810
     * @tc.name testBigInt64ArrayConstructorThree0810
     * @tc.desc Verify `new BigInt64Array(buf, 24, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0820
     * @tc.name testBigInt64ArrayConstructorThree0820
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0830
     * @tc.name testBigInt64ArrayConstructorThree0830
     * @tc.desc Verify `new BigInt64Array(buf, 24, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0840
     * @tc.name testBigInt64ArrayConstructorThree0840
     * @tc.desc Verify `new BigInt64Array(buf, 24, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0850
     * @tc.name testBigInt64ArrayConstructorThree0850
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0860
     * @tc.name testBigInt64ArrayConstructorThree0860
     * @tc.desc Verify `new BigInt64Array(buf, 24, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0870
     * @tc.name testBigInt64ArrayConstructorThree0870
     * @tc.desc Verify `new BigInt64Array(buf, 24, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0880
     * @tc.name testBigInt64ArrayConstructorThree0880
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0890
     * @tc.name testBigInt64ArrayConstructorThree0890
     * @tc.desc Verify `new BigInt64Array(buf, 24, 5)` produces a result where `arr.length` equals `5`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 5);
        expect(arr.length).assertEqual(5);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0900
     * @tc.name testBigInt64ArrayConstructorThree0900
     * @tc.desc Verify `new BigInt64Array(buf, 24, 5)` produces a result where `arr.byteLength` equals `40`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 5);
        expect(arr.byteLength).assertEqual(40);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0910
     * @tc.name testBigInt64ArrayConstructorThree0910
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(64);
        let arr = new BigInt64Array(buf, 24, 5);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0920
     * @tc.name testBigInt64ArrayConstructorThree0920
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0930
     * @tc.name testBigInt64ArrayConstructorThree0930
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0940
     * @tc.name testBigInt64ArrayConstructorThree0940
     * @tc.desc Verify `new BigInt64Array(buf, 0, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0950
     * @tc.name testBigInt64ArrayConstructorThree0950
     * @tc.desc Verify `new BigInt64Array(buf, 0, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0960
     * @tc.name testBigInt64ArrayConstructorThree0960
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0970
     * @tc.name testBigInt64ArrayConstructorThree0970
     * @tc.desc Verify `new BigInt64Array(buf, 0, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0980
     * @tc.name testBigInt64ArrayConstructorThree0980
     * @tc.desc Verify `new BigInt64Array(buf, 0, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_0990
     * @tc.name testBigInt64ArrayConstructorThree0990
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1000
     * @tc.name testBigInt64ArrayConstructorThree1000
     * @tc.desc Verify `new BigInt64Array(buf, 0, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1010
     * @tc.name testBigInt64ArrayConstructorThree1010
     * @tc.desc Verify `new BigInt64Array(buf, 0, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1020
     * @tc.name testBigInt64ArrayConstructorThree1020
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1030
     * @tc.name testBigInt64ArrayConstructorThree1030
     * @tc.desc Verify `new BigInt64Array(buf, 0, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1040
     * @tc.name testBigInt64ArrayConstructorThree1040
     * @tc.desc Verify `new BigInt64Array(buf, 0, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1050
     * @tc.name testBigInt64ArrayConstructorThree1050
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1060
     * @tc.name testBigInt64ArrayConstructorThree1060
     * @tc.desc Verify `new BigInt64Array(buf, 0, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1070
     * @tc.name testBigInt64ArrayConstructorThree1070
     * @tc.desc Verify `new BigInt64Array(buf, 0, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1080
     * @tc.name testBigInt64ArrayConstructorThree1080
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1090
     * @tc.name testBigInt64ArrayConstructorThree1090
     * @tc.desc Verify `new BigInt64Array(buf, 0, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1100
     * @tc.name testBigInt64ArrayConstructorThree1100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1110
     * @tc.name testBigInt64ArrayConstructorThree1110
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1120
     * @tc.name testBigInt64ArrayConstructorThree1120
     * @tc.desc Verify `new BigInt64Array(buf, 0, 16)` produces a result where `arr.length` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 16);
        expect(arr.length).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1130
     * @tc.name testBigInt64ArrayConstructorThree1130
     * @tc.desc Verify `new BigInt64Array(buf, 0, 16)` produces a result where `arr.byteLength` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 16);
        expect(arr.byteLength).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1140
     * @tc.name testBigInt64ArrayConstructorThree1140
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 0, 16);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1150
     * @tc.name testBigInt64ArrayConstructorThree1150
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1160
     * @tc.name testBigInt64ArrayConstructorThree1160
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1170
     * @tc.name testBigInt64ArrayConstructorThree1170
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1180
     * @tc.name testBigInt64ArrayConstructorThree1180
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1190
     * @tc.name testBigInt64ArrayConstructorThree1190
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_THREE_1200
     * @tc.name testBigInt64ArrayConstructorThree1200
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.length).assertEqual(2);
      });



  });
}
