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

export default function BigInt64ArrayConstructor06Test(): void {
  describe('BigInt64ArrayConstructor06Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0100
     * @tc.name testBigInt64ArrayConstructorSix0100
     * @tc.desc Verify `new BigInt64Array(buf, 24, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0200
     * @tc.name testBigInt64ArrayConstructorSix0200
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0300
     * @tc.name testBigInt64ArrayConstructorSix0300
     * @tc.desc Verify `new BigInt64Array(buf, 24, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0400
     * @tc.name testBigInt64ArrayConstructorSix0400
     * @tc.desc Verify `new BigInt64Array(buf, 24, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0500
     * @tc.name testBigInt64ArrayConstructorSix0500
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0600
     * @tc.name testBigInt64ArrayConstructorSix0600
     * @tc.desc Verify `new BigInt64Array(buf, 24, 16)` produces a result where `arr.length` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 16);
        expect(arr.length).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0700
     * @tc.name testBigInt64ArrayConstructorSix0700
     * @tc.desc Verify `new BigInt64Array(buf, 24, 16)` produces a result where `arr.byteLength` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 16);
        expect(arr.byteLength).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0800
     * @tc.name testBigInt64ArrayConstructorSix0800
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 16);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_0900
     * @tc.name testBigInt64ArrayConstructorSix0900
     * @tc.desc Verify `new BigInt64Array(buf, 24, 24)` produces a result where `arr.length` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 24);
        expect(arr.length).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1000
     * @tc.name testBigInt64ArrayConstructorSix1000
     * @tc.desc Verify `new BigInt64Array(buf, 24, 24)` produces a result where `arr.byteLength` equals `192`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 24);
        expect(arr.byteLength).assertEqual(192);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1100
     * @tc.name testBigInt64ArrayConstructorSix1100
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 24);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1200
     * @tc.name testBigInt64ArrayConstructorSix1200
     * @tc.desc Verify `new BigInt64Array(buf, 24, 29)` produces a result where `arr.length` equals `29`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 29);
        expect(arr.length).assertEqual(29);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1300
     * @tc.name testBigInt64ArrayConstructorSix1300
     * @tc.desc Verify `new BigInt64Array(buf, 24, 29)` produces a result where `arr.byteLength` equals `232`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 29);
        expect(arr.byteLength).assertEqual(232);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1400
     * @tc.name testBigInt64ArrayConstructorSix1400
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 24, 29);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1500
     * @tc.name testBigInt64ArrayConstructorSix1500
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1600
     * @tc.name testBigInt64ArrayConstructorSix1600
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1700
     * @tc.name testBigInt64ArrayConstructorSix1700
     * @tc.desc Verify `new BigInt64Array(buf, 0, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1800
     * @tc.name testBigInt64ArrayConstructorSix1800
     * @tc.desc Verify `new BigInt64Array(buf, 0, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_1900
     * @tc.name testBigInt64ArrayConstructorSix1900
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2000
     * @tc.name testBigInt64ArrayConstructorSix2000
     * @tc.desc Verify `new BigInt64Array(buf, 0, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2100
     * @tc.name testBigInt64ArrayConstructorSix2100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2200
     * @tc.name testBigInt64ArrayConstructorSix2200
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2300
     * @tc.name testBigInt64ArrayConstructorSix2300
     * @tc.desc Verify `new BigInt64Array(buf, 0, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2400
     * @tc.name testBigInt64ArrayConstructorSix2400
     * @tc.desc Verify `new BigInt64Array(buf, 0, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2500
     * @tc.name testBigInt64ArrayConstructorSix2500
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2600
     * @tc.name testBigInt64ArrayConstructorSix2600
     * @tc.desc Verify `new BigInt64Array(buf, 0, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2700
     * @tc.name testBigInt64ArrayConstructorSix2700
     * @tc.desc Verify `new BigInt64Array(buf, 0, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2800
     * @tc.name testBigInt64ArrayConstructorSix2800
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_2900
     * @tc.name testBigInt64ArrayConstructorSix2900
     * @tc.desc Verify `new BigInt64Array(buf, 0, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3000
     * @tc.name testBigInt64ArrayConstructorSix3000
     * @tc.desc Verify `new BigInt64Array(buf, 0, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3100
     * @tc.name testBigInt64ArrayConstructorSix3100
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3200
     * @tc.name testBigInt64ArrayConstructorSix3200
     * @tc.desc Verify `new BigInt64Array(buf, 0, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3300
     * @tc.name testBigInt64ArrayConstructorSix3300
     * @tc.desc Verify `new BigInt64Array(buf, 0, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3400
     * @tc.name testBigInt64ArrayConstructorSix3400
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3500
     * @tc.name testBigInt64ArrayConstructorSix3500
     * @tc.desc Verify `new BigInt64Array(buf, 0, 16)` produces a result where `arr.length` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 16);
        expect(arr.length).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3600
     * @tc.name testBigInt64ArrayConstructorSix3600
     * @tc.desc Verify `new BigInt64Array(buf, 0, 16)` produces a result where `arr.byteLength` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 16);
        expect(arr.byteLength).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3700
     * @tc.name testBigInt64ArrayConstructorSix3700
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 16);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3800
     * @tc.name testBigInt64ArrayConstructorSix3800
     * @tc.desc Verify `new BigInt64Array(buf, 0, 24)` produces a result where `arr.length` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 24);
        expect(arr.length).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_3900
     * @tc.name testBigInt64ArrayConstructorSix3900
     * @tc.desc Verify `new BigInt64Array(buf, 0, 24)` produces a result where `arr.byteLength` equals `192`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 24);
        expect(arr.byteLength).assertEqual(192);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_4000
     * @tc.name testBigInt64ArrayConstructorSix4000
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 24);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_4100
     * @tc.name testBigInt64ArrayConstructorSix4100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 32)` produces a result where `arr.length` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 32);
        expect(arr.length).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_4200
     * @tc.name testBigInt64ArrayConstructorSix4200
     * @tc.desc Verify `new BigInt64Array(buf, 0, 32)` produces a result where `arr.byteLength` equals `256`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 32);
        expect(arr.byteLength).assertEqual(256);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SIX_4300
     * @tc.name testBigInt64ArrayConstructorSix4300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSix4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 32);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });


  });
}
