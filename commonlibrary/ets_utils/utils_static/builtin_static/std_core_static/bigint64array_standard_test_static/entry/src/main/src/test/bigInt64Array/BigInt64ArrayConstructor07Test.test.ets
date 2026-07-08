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

export default function BigInt64ArrayConstructor07Test(): void {
  describe('BigInt64ArrayConstructor07Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0100
     * @tc.name testBigInt64ArrayConstructorSeven0100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 48)` produces a result where `arr.length` equals `48`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 48);
        expect(arr.length).assertEqual(48);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0200
     * @tc.name testBigInt64ArrayConstructorSeven0200
     * @tc.desc Verify `new BigInt64Array(buf, 0, 48)` produces a result where `arr.byteLength` equals `384`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 48);
        expect(arr.byteLength).assertEqual(384);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0300
     * @tc.name testBigInt64ArrayConstructorSeven0300
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 48);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0400
     * @tc.name testBigInt64ArrayConstructorSeven0400
     * @tc.desc Verify `new BigInt64Array(buf, 0, 64)` produces a result where `arr.length` equals `64`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 64);
        expect(arr.length).assertEqual(64);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0500
     * @tc.name testBigInt64ArrayConstructorSeven0500
     * @tc.desc Verify `new BigInt64Array(buf, 0, 64)` produces a result where `arr.byteLength` equals `512`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 64);
        expect(arr.byteLength).assertEqual(512);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0600
     * @tc.name testBigInt64ArrayConstructorSeven0600
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 64);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0700
     * @tc.name testBigInt64ArrayConstructorSeven0700
     * @tc.desc Verify `new BigInt64Array(buf, 0, 96)` produces a result where `arr.length` equals `96`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 96);
        expect(arr.length).assertEqual(96);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0800
     * @tc.name testBigInt64ArrayConstructorSeven0800
     * @tc.desc Verify `new BigInt64Array(buf, 0, 96)` produces a result where `arr.byteLength` equals `768`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 96);
        expect(arr.byteLength).assertEqual(768);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_0900
     * @tc.name testBigInt64ArrayConstructorSeven0900
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 96);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_1000
     * @tc.name testBigInt64ArrayConstructorSeven1000
     * @tc.desc Verify `new BigInt64Array(buf, 0, 100)` produces a result where `arr.length` equals `100`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 100);
        expect(arr.length).assertEqual(100);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_1100
     * @tc.name testBigInt64ArrayConstructorSeven1100
     * @tc.desc Verify `new BigInt64Array(buf, 0, 100)` produces a result where `arr.byteLength` equals `800`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 100);
        expect(arr.byteLength).assertEqual(800);
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_CONSTRUCTOR_SEVEN_1200
     * @tc.name testBigInt64ArrayConstructorSeven1200
     * @tc.desc Verify `arr.$_set(0, 5n)` produces a result where `new BigInt64Array(buf, 0, 1).$_get(0)` equals `5n`.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayConstructorSeven1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf = new ArrayBuffer(1024);
        let arr = new BigInt64Array(buf, 0, 100);
        arr.$_set(0, 5n);
        let view = new BigInt64Array(buf, 0, 1);
        expect(view.$_get(0)).assertEqual(5n);
      });


  });
}
