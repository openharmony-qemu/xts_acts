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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayConstructor02Test(): void {
  describe('Uint16ArrayConstructor02Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0100
     * @tc.name testUint16ArrayConstructorTwo001
     * @tc.desc Verify ArrayLike<Number> 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [65535.9];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0200
     * @tc.name testUint16ArrayConstructorTwo002
     * @tc.desc Verify ArrayLike<Number> 1e5 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [1e5];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0300
     * @tc.name testUint16ArrayConstructorTwo003
     * @tc.desc Verify ArrayLike<Number> 1e-5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [1e-5];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0400
     * @tc.name testUint16ArrayConstructorTwo004
     * @tc.desc Verify ArrayLike<Number> [65535,65535]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [65535, 65535];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0500
     * @tc.name testUint16ArrayConstructorTwo005
     * @tc.desc Verify ArrayLike<Number> [0x10,0x20,0x30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0x10, 0x20, 0x30];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(16);
      expect(arr.at(1)).assertEqual(32);
      expect(arr.at(2)).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0600
     * @tc.name testUint16ArrayConstructorTwo006
     * @tc.desc Verify ArrayLike<Number> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0700
     * @tc.name testUint16ArrayConstructorTwo007
     * @tc.desc Verify ArrayLike<Number> 0xABCD 43981
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0xABCD];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(43981);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0800
     * @tc.name testUint16ArrayConstructorTwo008
     * @tc.desc Verify ArrayLike<Number> empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_0900
     * @tc.name testUint16ArrayConstructorTwo009
     * @tc.desc Verify ArrayLike<Number> [Number.NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [Number.NaN];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_1000
     * @tc.name testUint16ArrayConstructorTwo010
     * @tc.desc Verify ArrayLike<Number> [Number.POSITIVE_INFINITY]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [Number.POSITIVE_INFINITY];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_1100
     * @tc.name testUint16ArrayConstructorTwo011
     * @tc.desc Verify ArrayLike<Number> [Number.NEGATIVE_INFINITY]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [Number.NEGATIVE_INFINITY];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_TWO_1200
     * @tc.name testUint16ArrayConstructorTwo012
     * @tc.desc Verify ArrayLike<Number> boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0, 1, 32767, 32768, 65534, 65535];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(3)).assertEqual(32768);
      expect(arr.at(4)).assertEqual(65534);
      expect(arr.at(5)).assertEqual(65535);
    });

  });
}
