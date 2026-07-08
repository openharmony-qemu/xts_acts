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

export default function BigInt64ArrayConstructor04Test(): void {
  describe('BigInt64ArrayConstructor04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0100
     * @tc.name testBigInt64ArrayConstructorFour0100
     * @tc.desc Verify `new BigInt64Array(buf, 8, 15)` produces a result where `arr.length` equals `15`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 15);
        expect(arr.length).assertEqual(15);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0200
     * @tc.name testBigInt64ArrayConstructorFour0200
     * @tc.desc Verify `new BigInt64Array(buf, 8, 15)` produces a result where `arr.byteLength` equals `120`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 15);
        expect(arr.byteLength).assertEqual(120);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0300
     * @tc.name testBigInt64ArrayConstructorFour0300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 8, 15);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0400
     * @tc.name testBigInt64ArrayConstructorFour0400
     * @tc.desc Verify `new BigInt64Array(buf, 16, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0500
     * @tc.name testBigInt64ArrayConstructorFour0500
     * @tc.desc Verify `new BigInt64Array(buf, 16, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0600
     * @tc.name testBigInt64ArrayConstructorFour0600
     * @tc.desc Verify `new BigInt64Array(buf, 16, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0700
     * @tc.name testBigInt64ArrayConstructorFour0700
     * @tc.desc Verify `new BigInt64Array(buf, 16, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0800
     * @tc.name testBigInt64ArrayConstructorFour0800
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_0900
     * @tc.name testBigInt64ArrayConstructorFour0900
     * @tc.desc Verify `new BigInt64Array(buf, 16, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1000
     * @tc.name testBigInt64ArrayConstructorFour1000
     * @tc.desc Verify `new BigInt64Array(buf, 16, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1100
     * @tc.name testBigInt64ArrayConstructorFour1100
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1200
     * @tc.name testBigInt64ArrayConstructorFour1200
     * @tc.desc Verify `new BigInt64Array(buf, 16, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1300
     * @tc.name testBigInt64ArrayConstructorFour1300
     * @tc.desc Verify `new BigInt64Array(buf, 16, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1400
     * @tc.name testBigInt64ArrayConstructorFour1400
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1500
     * @tc.name testBigInt64ArrayConstructorFour1500
     * @tc.desc Verify `new BigInt64Array(buf, 16, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1600
     * @tc.name testBigInt64ArrayConstructorFour1600
     * @tc.desc Verify `new BigInt64Array(buf, 16, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1700
     * @tc.name testBigInt64ArrayConstructorFour1700
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1800
     * @tc.name testBigInt64ArrayConstructorFour1800
     * @tc.desc Verify `new BigInt64Array(buf, 16, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_1900
     * @tc.name testBigInt64ArrayConstructorFour1900
     * @tc.desc Verify `new BigInt64Array(buf, 16, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2000
     * @tc.name testBigInt64ArrayConstructorFour2000
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2100
     * @tc.name testBigInt64ArrayConstructorFour2100
     * @tc.desc Verify `new BigInt64Array(buf, 16, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2200
     * @tc.name testBigInt64ArrayConstructorFour2200
     * @tc.desc Verify `new BigInt64Array(buf, 16, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2300
     * @tc.name testBigInt64ArrayConstructorFour2300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2400
     * @tc.name testBigInt64ArrayConstructorFour2400
     * @tc.desc Verify `new BigInt64Array(buf, 16, 14)` produces a result where `arr.length` equals `14`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 14);
        expect(arr.length).assertEqual(14);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2500
     * @tc.name testBigInt64ArrayConstructorFour2500
     * @tc.desc Verify `new BigInt64Array(buf, 16, 14)` produces a result where `arr.byteLength` equals `112`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 14);
        expect(arr.byteLength).assertEqual(112);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2600
     * @tc.name testBigInt64ArrayConstructorFour2600
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 16, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 16, 14);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 16, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2700
     * @tc.name testBigInt64ArrayConstructorFour2700
     * @tc.desc Verify `new BigInt64Array(buf, 24, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2800
     * @tc.name testBigInt64ArrayConstructorFour2800
     * @tc.desc Verify `new BigInt64Array(buf, 24, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_2900
     * @tc.name testBigInt64ArrayConstructorFour2900
     * @tc.desc Verify `new BigInt64Array(buf, 24, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3000
     * @tc.name testBigInt64ArrayConstructorFour3000
     * @tc.desc Verify `new BigInt64Array(buf, 24, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3100
     * @tc.name testBigInt64ArrayConstructorFour3100
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3200
     * @tc.name testBigInt64ArrayConstructorFour3200
     * @tc.desc Verify `new BigInt64Array(buf, 24, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3300
     * @tc.name testBigInt64ArrayConstructorFour3300
     * @tc.desc Verify `new BigInt64Array(buf, 24, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3400
     * @tc.name testBigInt64ArrayConstructorFour3400
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3500
     * @tc.name testBigInt64ArrayConstructorFour3500
     * @tc.desc Verify `new BigInt64Array(buf, 24, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3600
     * @tc.name testBigInt64ArrayConstructorFour3600
     * @tc.desc Verify `new BigInt64Array(buf, 24, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3700
     * @tc.name testBigInt64ArrayConstructorFour3700
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3800
     * @tc.name testBigInt64ArrayConstructorFour3800
     * @tc.desc Verify `new BigInt64Array(buf, 24, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_3900
     * @tc.name testBigInt64ArrayConstructorFour3900
     * @tc.desc Verify `new BigInt64Array(buf, 24, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4000
     * @tc.name testBigInt64ArrayConstructorFour4000
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4100
     * @tc.name testBigInt64ArrayConstructorFour4100
     * @tc.desc Verify `new BigInt64Array(buf, 24, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4200
     * @tc.name testBigInt64ArrayConstructorFour4200
     * @tc.desc Verify `new BigInt64Array(buf, 24, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4300
     * @tc.name testBigInt64ArrayConstructorFour4300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4400
     * @tc.name testBigInt64ArrayConstructorFour4400
     * @tc.desc Verify `new BigInt64Array(buf, 24, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4500
     * @tc.name testBigInt64ArrayConstructorFour4500
     * @tc.desc Verify `new BigInt64Array(buf, 24, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4600
     * @tc.name testBigInt64ArrayConstructorFour4600
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4700
     * @tc.name testBigInt64ArrayConstructorFour4700
     * @tc.desc Verify `new BigInt64Array(buf, 24, 13)` produces a result where `arr.length` equals `13`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 13);
        expect(arr.length).assertEqual(13);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4800
     * @tc.name testBigInt64ArrayConstructorFour4800
     * @tc.desc Verify `new BigInt64Array(buf, 24, 13)` produces a result where `arr.byteLength` equals `104`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 13);
        expect(arr.byteLength).assertEqual(104);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_4900
     * @tc.name testBigInt64ArrayConstructorFour4900
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 24, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(128);
        let arr = new BigInt64Array(buf, 24, 13);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 24, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5000
     * @tc.name testBigInt64ArrayConstructorFour5000
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5100
     * @tc.name testBigInt64ArrayConstructorFour5100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5200
     * @tc.name testBigInt64ArrayConstructorFour5200
     * @tc.desc Verify `new BigInt64Array(buf, 0, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5300
     * @tc.name testBigInt64ArrayConstructorFour5300
     * @tc.desc Verify `new BigInt64Array(buf, 0, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5400
     * @tc.name testBigInt64ArrayConstructorFour5400
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5500
     * @tc.name testBigInt64ArrayConstructorFour5500
     * @tc.desc Verify `new BigInt64Array(buf, 0, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5600
     * @tc.name testBigInt64ArrayConstructorFour5600
     * @tc.desc Verify `new BigInt64Array(buf, 0, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5700
     * @tc.name testBigInt64ArrayConstructorFour5700
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5800
     * @tc.name testBigInt64ArrayConstructorFour5800
     * @tc.desc Verify `new BigInt64Array(buf, 0, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_5900
     * @tc.name testBigInt64ArrayConstructorFour5900
     * @tc.desc Verify `new BigInt64Array(buf, 0, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6000
     * @tc.name testBigInt64ArrayConstructorFour6000
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6100
     * @tc.name testBigInt64ArrayConstructorFour6100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 4)` produces a result where `arr.length` equals `4`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 4);
        expect(arr.length).assertEqual(4);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6200
     * @tc.name testBigInt64ArrayConstructorFour6200
     * @tc.desc Verify `new BigInt64Array(buf, 0, 4)` produces a result where `arr.byteLength` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 4);
        expect(arr.byteLength).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6300
     * @tc.name testBigInt64ArrayConstructorFour6300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 4);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6400
     * @tc.name testBigInt64ArrayConstructorFour6400
     * @tc.desc Verify `new BigInt64Array(buf, 0, 8)` produces a result where `arr.length` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 8);
        expect(arr.length).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6500
     * @tc.name testBigInt64ArrayConstructorFour6500
     * @tc.desc Verify `new BigInt64Array(buf, 0, 8)` produces a result where `arr.byteLength` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 8);
        expect(arr.byteLength).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6600
     * @tc.name testBigInt64ArrayConstructorFour6600
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 8);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6700
     * @tc.name testBigInt64ArrayConstructorFour6700
     * @tc.desc Verify `new BigInt64Array(buf, 0, 10)` produces a result where `arr.length` equals `10`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 10);
        expect(arr.length).assertEqual(10);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6800
     * @tc.name testBigInt64ArrayConstructorFour6800
     * @tc.desc Verify `new BigInt64Array(buf, 0, 10)` produces a result where `arr.byteLength` equals `80`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 10);
        expect(arr.byteLength).assertEqual(80);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_6900
     * @tc.name testBigInt64ArrayConstructorFour6900
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 10);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7000
     * @tc.name testBigInt64ArrayConstructorFour7000
     * @tc.desc Verify `new BigInt64Array(buf, 0, 16)` produces a result where `arr.length` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 16);
        expect(arr.length).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7100
     * @tc.name testBigInt64ArrayConstructorFour7100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 16)` produces a result where `arr.byteLength` equals `128`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 16);
        expect(arr.byteLength).assertEqual(128);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7200
     * @tc.name testBigInt64ArrayConstructorFour7200
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 16);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7300
     * @tc.name testBigInt64ArrayConstructorFour7300
     * @tc.desc Verify `new BigInt64Array(buf, 0, 24)` produces a result where `arr.length` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 24);
        expect(arr.length).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7400
     * @tc.name testBigInt64ArrayConstructorFour7400
     * @tc.desc Verify `new BigInt64Array(buf, 0, 24)` produces a result where `arr.byteLength` equals `192`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 24);
        expect(arr.byteLength).assertEqual(192);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7500
     * @tc.name testBigInt64ArrayConstructorFour7500
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 24);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7600
     * @tc.name testBigInt64ArrayConstructorFour7600
     * @tc.desc Verify `new BigInt64Array(buf, 0, 32)` produces a result where `arr.length` equals `32`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 32);
        expect(arr.length).assertEqual(32);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7700
     * @tc.name testBigInt64ArrayConstructorFour7700
     * @tc.desc Verify `new BigInt64Array(buf, 0, 32)` produces a result where `arr.byteLength` equals `256`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 32);
        expect(arr.byteLength).assertEqual(256);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7800
     * @tc.name testBigInt64ArrayConstructorFour7800
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 0, 32);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_7900
     * @tc.name testBigInt64ArrayConstructorFour7900
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.length` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.length).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8000
     * @tc.name testBigInt64ArrayConstructorFour8000
     * @tc.desc Verify `new BigInt64Array(buf, 8, 0)` produces a result where `arr.byteLength` equals `0`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 0);
        expect(arr.byteLength).assertEqual(0);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8100
     * @tc.name testBigInt64ArrayConstructorFour8100
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.length` equals `1`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.length).assertEqual(1);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8200
     * @tc.name testBigInt64ArrayConstructorFour8200
     * @tc.desc Verify `new BigInt64Array(buf, 8, 1)` produces a result where `arr.byteLength` equals `8`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 1);
        expect(arr.byteLength).assertEqual(8);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8300
     * @tc.name testBigInt64ArrayConstructorFour8300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 1);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8400
     * @tc.name testBigInt64ArrayConstructorFour8400
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.length` equals `2`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.length).assertEqual(2);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8500
     * @tc.name testBigInt64ArrayConstructorFour8500
     * @tc.desc Verify `new BigInt64Array(buf, 8, 2)` produces a result where `arr.byteLength` equals `16`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.byteLength).assertEqual(16);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8600
     * @tc.name testBigInt64ArrayConstructorFour8600
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 2);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8700
     * @tc.name testBigInt64ArrayConstructorFour8700
     * @tc.desc Verify `new BigInt64Array(buf, 8, 3)` produces a result where `arr.length` equals `3`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 3);
        expect(arr.length).assertEqual(3);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8800
     * @tc.name testBigInt64ArrayConstructorFour8800
     * @tc.desc Verify `new BigInt64Array(buf, 8, 3)` produces a result where `arr.byteLength` equals `24`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 3);
        expect(arr.byteLength).assertEqual(24);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_FOUR_8900
     * @tc.name testBigInt64ArrayConstructorFour8900
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 8, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorFour8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(256);
        let arr = new BigInt64Array(buf, 8, 3);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 8, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

  });
}
