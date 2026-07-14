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

export default function BigInt64ArrayConstructor05Test(): void {
  describe('BigInt64ArrayConstructor05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0100
     * @tc.name testBigInt64ArrayConstructorFive0100
     * @tc.desc Verify `new BigInt64Array(buf, 8, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0200
     * @tc.name testBigInt64ArrayConstructorFive0200
     * @tc.desc Verify `new BigInt64Array(buf, 8, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0300
     * @tc.name testBigInt64ArrayConstructorFive0300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0400
     * @tc.name testBigInt64ArrayConstructorFive0400
     * @tc.desc Verify `new BigInt64Array(buf, 8, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0500
     * @tc.name testBigInt64ArrayConstructorFive0500
     * @tc.desc Verify `new BigInt64Array(buf, 8, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0600
     * @tc.name testBigInt64ArrayConstructorFive0600
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0700
     * @tc.name testBigInt64ArrayConstructorFive0700
     * @tc.desc Verify `new BigInt64Array(buf, 8, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0800
     * @tc.name testBigInt64ArrayConstructorFive0800
     * @tc.desc Verify `new BigInt64Array(buf, 8, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_0900
     * @tc.name testBigInt64ArrayConstructorFive0900
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1000
     * @tc.name testBigInt64ArrayConstructorFive1000
     * @tc.desc Verify `new BigInt64Array(buf, 8, 16)` produces a result where `arr.length` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 16);
        expect(arr.length).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1100
     * @tc.name testBigInt64ArrayConstructorFive1100
     * @tc.desc Verify `new BigInt64Array(buf, 8, 16)` produces a result where `arr.byteLength` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 16);
        expect(arr.byteLength).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1200
     * @tc.name testBigInt64ArrayConstructorFive1200
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 16);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1300
     * @tc.name testBigInt64ArrayConstructorFive1300
     * @tc.desc Verify `new BigInt64Array(buf, 8, 24)` produces a result where `arr.length` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 24);
        expect(arr.length).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1400
     * @tc.name testBigInt64ArrayConstructorFive1400
     * @tc.desc Verify `new BigInt64Array(buf, 8, 24)` produces a result where `arr.byteLength` equals `192`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 24);
        expect(arr.byteLength).assertEqual(192);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1500
     * @tc.name testBigInt64ArrayConstructorFive1500
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 24);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1600
     * @tc.name testBigInt64ArrayConstructorFive1600
     * @tc.desc Verify `new BigInt64Array(buf, 8, 31)` produces a result where `arr.length` equals `31`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 31);
        expect(arr.length).assertEqual(31);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1700
     * @tc.name testBigInt64ArrayConstructorFive1700
     * @tc.desc Verify `new BigInt64Array(buf, 8, 31)` produces a result where `arr.byteLength` equals `248`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 31);
        expect(arr.byteLength).assertEqual(248);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1800
     * @tc.name testBigInt64ArrayConstructorFive1800
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 31);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_1900
     * @tc.name testBigInt64ArrayConstructorFive1900
     * @tc.desc Verify `new BigInt64Array(buf, 16, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2000
     * @tc.name testBigInt64ArrayConstructorFive2000
     * @tc.desc Verify `new BigInt64Array(buf, 16, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2100
     * @tc.name testBigInt64ArrayConstructorFive2100
     * @tc.desc Verify `new BigInt64Array(buf, 16, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2200
     * @tc.name testBigInt64ArrayConstructorFive2200
     * @tc.desc Verify `new BigInt64Array(buf, 16, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2300
     * @tc.name testBigInt64ArrayConstructorFive2300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2400
     * @tc.name testBigInt64ArrayConstructorFive2400
     * @tc.desc Verify `new BigInt64Array(buf, 16, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2500
     * @tc.name testBigInt64ArrayConstructorFive2500
     * @tc.desc Verify `new BigInt64Array(buf, 16, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2600
     * @tc.name testBigInt64ArrayConstructorFive2600
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2700
     * @tc.name testBigInt64ArrayConstructorFive2700
     * @tc.desc Verify `new BigInt64Array(buf, 16, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2800
     * @tc.name testBigInt64ArrayConstructorFive2800
     * @tc.desc Verify `new BigInt64Array(buf, 16, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_2900
     * @tc.name testBigInt64ArrayConstructorFive2900
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3000
     * @tc.name testBigInt64ArrayConstructorFive3000
     * @tc.desc Verify `new BigInt64Array(buf, 16, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3100
     * @tc.name testBigInt64ArrayConstructorFive3100
     * @tc.desc Verify `new BigInt64Array(buf, 16, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3200
     * @tc.name testBigInt64ArrayConstructorFive3200
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3300
     * @tc.name testBigInt64ArrayConstructorFive3300
     * @tc.desc Verify `new BigInt64Array(buf, 16, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3400
     * @tc.name testBigInt64ArrayConstructorFive3400
     * @tc.desc Verify `new BigInt64Array(buf, 16, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3500
     * @tc.name testBigInt64ArrayConstructorFive3500
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3600
     * @tc.name testBigInt64ArrayConstructorFive3600
     * @tc.desc Verify `new BigInt64Array(buf, 16, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3700
     * @tc.name testBigInt64ArrayConstructorFive3700
     * @tc.desc Verify `new BigInt64Array(buf, 16, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3800
     * @tc.name testBigInt64ArrayConstructorFive3800
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_3900
     * @tc.name testBigInt64ArrayConstructorFive3900
     * @tc.desc Verify `new BigInt64Array(buf, 16, 16)` produces a result where `arr.length` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 16);
        expect(arr.length).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4000
     * @tc.name testBigInt64ArrayConstructorFive4000
     * @tc.desc Verify `new BigInt64Array(buf, 16, 16)` produces a result where `arr.byteLength` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 16);
        expect(arr.byteLength).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4100
     * @tc.name testBigInt64ArrayConstructorFive4100
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 16);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4200
     * @tc.name testBigInt64ArrayConstructorFive4200
     * @tc.desc Verify `new BigInt64Array(buf, 16, 24)` produces a result where `arr.length` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 24);
        expect(arr.length).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4300
     * @tc.name testBigInt64ArrayConstructorFive4300
     * @tc.desc Verify `new BigInt64Array(buf, 16, 24)` produces a result where `arr.byteLength` equals `192`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 24);
        expect(arr.byteLength).assertEqual(192);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4400
     * @tc.name testBigInt64ArrayConstructorFive4400
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 24);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4500
     * @tc.name testBigInt64ArrayConstructorFive4500
     * @tc.desc Verify `new BigInt64Array(buf, 16, 30)` produces a result where `arr.length` equals `30`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 30);
        expect(arr.length).assertEqual(30);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4600
     * @tc.name testBigInt64ArrayConstructorFive4600
     * @tc.desc Verify `new BigInt64Array(buf, 16, 30)` produces a result where `arr.byteLength` equals `240`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 30);
        expect(arr.byteLength).assertEqual(240);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4700
     * @tc.name testBigInt64ArrayConstructorFive4700
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 16, 30);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4800
     * @tc.name testBigInt64ArrayConstructorFive4800
     * @tc.desc Verify `new BigInt64Array(buf, 24, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_4900
     * @tc.name testBigInt64ArrayConstructorFive4900
     * @tc.desc Verify `new BigInt64Array(buf, 24, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5000
     * @tc.name testBigInt64ArrayConstructorFive5000
     * @tc.desc Verify `new BigInt64Array(buf, 24, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5100
     * @tc.name testBigInt64ArrayConstructorFive5100
     * @tc.desc Verify `new BigInt64Array(buf, 24, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5200
     * @tc.name testBigInt64ArrayConstructorFive5200
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5300
     * @tc.name testBigInt64ArrayConstructorFive5300
     * @tc.desc Verify `new BigInt64Array(buf, 24, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5400
     * @tc.name testBigInt64ArrayConstructorFive5400
     * @tc.desc Verify `new BigInt64Array(buf, 24, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5500
     * @tc.name testBigInt64ArrayConstructorFive5500
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5600
     * @tc.name testBigInt64ArrayConstructorFive5600
     * @tc.desc Verify `new BigInt64Array(buf, 24, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5700
     * @tc.name testBigInt64ArrayConstructorFive5700
     * @tc.desc Verify `new BigInt64Array(buf, 24, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5800
     * @tc.name testBigInt64ArrayConstructorFive5800
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_5900
     * @tc.name testBigInt64ArrayConstructorFive5900
     * @tc.desc Verify `new BigInt64Array(buf, 24, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_6000
     * @tc.name testBigInt64ArrayConstructorFive6000
     * @tc.desc Verify `new BigInt64Array(buf, 24, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_6100
     * @tc.name testBigInt64ArrayConstructorFive6100
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FIVE_6200
     * @tc.name testBigInt64ArrayConstructorFive6200
     * @tc.desc Verify `new BigInt64Array(buf, 24, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFive6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 8);
        expect(arr.length).assertEqual(8);
      });

  });
}
