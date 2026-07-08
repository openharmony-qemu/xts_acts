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

export default function BigInt64ArrayConstructor08Test(): void {
  describe('BigInt64ArrayConstructor08Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0100
     * @tc.name testBigInt64ArrayConstructorEight0100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 128)` produces a result where `arr.length` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 128);
        expect(arr.length).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0200
     * @tc.name testBigInt64ArrayConstructorEight0200
     * @tc.desc Verify `new BigInt64Array(buf, 0, 128)` produces a result where `arr.byteLength` equals `1024`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 128);
        expect(arr.byteLength).assertEqual(1024);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0300
     * @tc.name testBigInt64ArrayConstructorEight0300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 128);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0400
     * @tc.name testBigInt64ArrayConstructorEight0400
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0500
     * @tc.name testBigInt64ArrayConstructorEight0500
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0600
     * @tc.name testBigInt64ArrayConstructorEight0600
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0700
     * @tc.name testBigInt64ArrayConstructorEight0700
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0800
     * @tc.name testBigInt64ArrayConstructorEight0800
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_0900
     * @tc.name testBigInt64ArrayConstructorEight0900
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1000
     * @tc.name testBigInt64ArrayConstructorEight1000
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1100
     * @tc.name testBigInt64ArrayConstructorEight1100
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1200
     * @tc.name testBigInt64ArrayConstructorEight1200
     * @tc.desc Verify `new BigInt64Array(buf, 8, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1300
     * @tc.name testBigInt64ArrayConstructorEight1300
     * @tc.desc Verify `new BigInt64Array(buf, 8, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1400
     * @tc.name testBigInt64ArrayConstructorEight1400
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1500
     * @tc.name testBigInt64ArrayConstructorEight1500
     * @tc.desc Verify `new BigInt64Array(buf, 8, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1600
     * @tc.name testBigInt64ArrayConstructorEight1600
     * @tc.desc Verify `new BigInt64Array(buf, 8, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1700
     * @tc.name testBigInt64ArrayConstructorEight1700
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1800
     * @tc.name testBigInt64ArrayConstructorEight1800
     * @tc.desc Verify `new BigInt64Array(buf, 8, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_1900
     * @tc.name testBigInt64ArrayConstructorEight1900
     * @tc.desc Verify `new BigInt64Array(buf, 8, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2000
     * @tc.name testBigInt64ArrayConstructorEight2000
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2100
     * @tc.name testBigInt64ArrayConstructorEight2100
     * @tc.desc Verify `new BigInt64Array(buf, 8, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2200
     * @tc.name testBigInt64ArrayConstructorEight2200
     * @tc.desc Verify `new BigInt64Array(buf, 8, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2300
     * @tc.name testBigInt64ArrayConstructorEight2300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2400
     * @tc.name testBigInt64ArrayConstructorEight2400
     * @tc.desc Verify `new BigInt64Array(buf, 8, 16)` produces a result where `arr.length` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 16);
        expect(arr.length).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2500
     * @tc.name testBigInt64ArrayConstructorEight2500
     * @tc.desc Verify `new BigInt64Array(buf, 8, 16)` produces a result where `arr.byteLength` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 16);
        expect(arr.byteLength).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2600
     * @tc.name testBigInt64ArrayConstructorEight2600
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 16);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2700
     * @tc.name testBigInt64ArrayConstructorEight2700
     * @tc.desc Verify `new BigInt64Array(buf, 8, 24)` produces a result where `arr.length` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 24);
        expect(arr.length).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2800
     * @tc.name testBigInt64ArrayConstructorEight2800
     * @tc.desc Verify `new BigInt64Array(buf, 8, 24)` produces a result where `arr.byteLength` equals `192`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 24);
        expect(arr.byteLength).assertEqual(192);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_2900
     * @tc.name testBigInt64ArrayConstructorEight2900
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 24);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_3000
     * @tc.name testBigInt64ArrayConstructorEight3000
     * @tc.desc Verify `new BigInt64Array(buf, 8, 32)` produces a result where `arr.length` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 32);
        expect(arr.length).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_3100
     * @tc.name testBigInt64ArrayConstructorEight3100
     * @tc.desc Verify `new BigInt64Array(buf, 8, 32)` produces a result where `arr.byteLength` equals `256`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 32);
        expect(arr.byteLength).assertEqual(256);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_3200
     * @tc.name testBigInt64ArrayConstructorEight3200
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 32);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_3300
     * @tc.name testBigInt64ArrayConstructorEight3300
     * @tc.desc Verify `new BigInt64Array(buf, 8, 48)` produces a result where `arr.length` equals `48`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 48);
        expect(arr.length).assertEqual(48);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_3400
     * @tc.name testBigInt64ArrayConstructorEight3400
     * @tc.desc Verify `new BigInt64Array(buf, 8, 48)` produces a result where `arr.byteLength` equals `384`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 48);
        expect(arr.byteLength).assertEqual(384);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_EIGHT_3500
     * @tc.name testBigInt64ArrayConstructorEight3500
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorEight3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 8, 48);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });


  });
}
