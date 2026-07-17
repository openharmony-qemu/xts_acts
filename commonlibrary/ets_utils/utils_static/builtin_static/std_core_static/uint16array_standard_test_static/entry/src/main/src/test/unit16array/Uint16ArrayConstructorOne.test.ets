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

export default function uint16ArrayConstructor01Test(): void {
  describe('Uint16ArrayConstructor01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0001
     * @tc.name testUint16ArrayConstructorOne001
     * @tc.desc Verify buffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0002
     * @tc.name testUint16ArrayConstructorOne002
     * @tc.desc Verify BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0003
     * @tc.name testUint16ArrayConstructorOne003
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.toString()).assertEqual("");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0004
     * @tc.name testUint16ArrayConstructorOne004
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.join()).assertEqual("");
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0005
     * @tc.name testUint16ArrayConstructorOne005
     * @tc.desc Verify values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      let count: number = 0;
      for (let v of arr.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0006
     * @tc.name testUint16ArrayConstructorOne006
     * @tc.desc Verify FixedArray<int> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0007
     * @tc.name testUint16ArrayConstructorOne007
     * @tc.desc Verify FixedArray<int> 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [65535];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0008
     * @tc.name testUint16ArrayConstructorOne008
     * @tc.desc Verify FixedArray<int> 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(32768);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0009
     * @tc.name testUint16ArrayConstructorOne009
     * @tc.desc Verify FixedArray<int> [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [1, 2, 3, 4, 5];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(2)).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0010
     * @tc.name testUint16ArrayConstructorOne010
     * @tc.desc Verify FixedArray<int> [0,65535,32768]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0, 65535, 32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(32768);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0011
     * @tc.name testUint16ArrayConstructorOne011
     * @tc.desc Verify FixedArray<int> 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [65536];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0012
     * @tc.name testUint16ArrayConstructorOne012
     * @tc.desc Verify FixedArray<int> -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [-1];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0013
     * @tc.name testUint16ArrayConstructorOne013
     * @tc.desc Verify FixedArray<int> -65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [-65536];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0014
     * @tc.name testUint16ArrayConstructorOne014
     * @tc.desc Verify FixedArray<int> 65536*2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [65536 * 2];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0015
     * @tc.name testUint16ArrayConstructorOne015
     * @tc.desc Verify FixedArray<int> -32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [-32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(32768);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0016
     * @tc.name testUint16ArrayConstructorOne016
     * @tc.desc Verify FixedArray<int> 0xABCD 43981
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0xABCD];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(43981);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0017
     * @tc.name testUint16ArrayConstructorOne017
     * @tc.desc Verify FixedArray<int> 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0b1010];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(10);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0018
     * @tc.name testUint16ArrayConstructorOne018
     * @tc.desc Verify FixedArray<number> 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0019
     * @tc.name testUint16ArrayConstructorOne019
     * @tc.desc Verify FixedArray<number> 65535.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [65535.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0020
     * @tc.name testUint16ArrayConstructorOne020
     * @tc.desc Verify FixedArray<number> 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [3.14];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0021
     * @tc.name testUint16ArrayConstructorOne021
     * @tc.desc Verify FixedArray<number> 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [65535.9];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0022
     * @tc.name testUint16ArrayConstructorOne022
     * @tc.desc Verify FixedArray<number> -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [-0.5];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0023
     * @tc.name testUint16ArrayConstructorOne023
     * @tc.desc Verify FixedArray<number> [1.5,2.7,3.9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.5, 2.7, 3.9];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0024
     * @tc.name testUint16ArrayConstructorOne024
     * @tc.desc Verify FixedArray<number> 1e-10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1e-10];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0025
     * @tc.name testUint16ArrayConstructorOne025
     * @tc.desc Verify FixedArray<number> 0o7777 4095
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0o7777];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(4095);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0026
     * @tc.name testUint16ArrayConstructorOne026
     * @tc.desc Verify FixedArray<number> 1e4 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1e4];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(10000);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0027
     * @tc.name testUint16ArrayConstructorOne027
     * @tc.desc Verify FixedArray<int> 65536*3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [65536 * 3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0028
     * @tc.name testUint16ArrayConstructorOne028
     * @tc.desc Verify FixedArray<number>NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [Number.NaN];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0029
     * @tc.name testUint16ArrayConstructorOne029
     * @tc.desc Verify FixedArray<number> Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [Number.POSITIVE_INFINITY];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0030
     * @tc.name testUint16ArrayConstructorOne030
     * @tc.desc Verify FixedArray<number> -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [-Number.POSITIVE_INFINITY];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0031
     * @tc.name testUint16ArrayConstructorOne031
     * @tc.desc Verify FixedArray<int> [0,-1,65536,32768]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0, -1, 65536, 32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(32768);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0032
     * @tc.name testUint16ArrayConstructorOne032
     * @tc.desc Verify FixedArray<int>[1,2,3] length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [1, 2, 3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0033
     * @tc.name testUint16ArrayConstructorOne033
     * @tc.desc Verify FixedArray<int>[1,2,3] byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [1, 2, 3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(6);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0034
     * @tc.name testUint16ArrayConstructorOne034
     * @tc.desc Verify FixedArray<int>[1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [10, 20, 30];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0035
     * @tc.name testUint16ArrayConstructorOne035
     * @tc.desc Verify FixedArray<number>[1.0,2.0] length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.0, 2.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0036
     * @tc.name testUint16ArrayConstructorOne036
     * @tc.desc Verify FixedArray<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(100);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0037
     * @tc.name testUint16ArrayConstructorOne037
     * @tc.desc Verify FixedArray<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [42, 42, 42, 42, 42];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0038
     * @tc.name testUint16ArrayConstructorOne038
     * @tc.desc Verify FixedArray<int> at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [100, 200, 300];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(1)).assertEqual(200);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0039
     * @tc.name testUint16ArrayConstructorOne039
     * @tc.desc Verify ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0040
     * @tc.name testUint16ArrayConstructorOne040
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(3);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0041
     * @tc.name testUint16ArrayConstructorOne041
     * @tc.desc Verify byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.length).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0042
     * @tc.name testUint16ArrayConstructorOne042
     * @tc.desc Verify byteOffset 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.length).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0043
     * @tc.name testUint16ArrayConstructorOne043
     * @tc.desc Verify byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.length).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0044
     * @tc.name testUint16ArrayConstructorOne044
     * @tc.desc Verify byteOffset 4 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.length).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0045
     * @tc.name testUint16ArrayConstructorOne045
     * @tc.desc Verify byteOffset 6 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf, 6);
      expect(arr.length).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0046
     * @tc.name testUint16ArrayConstructorOne046
     * @tc.desc Verify byteOffset 0 buffer 2 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(1);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0047
     * @tc.name testUint16ArrayConstructorOne047
     * @tc.desc Verify byteOffset 0 buffer12 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(6);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0048
     * @tc.name testUint16ArrayConstructorOne048
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.length).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0049
     * @tc.name testUint16ArrayConstructorOne049
     * @tc.desc Verify byteOffset 0 byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.byteLength).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0050
     * @tc.name testUint16ArrayConstructorOne050
     * @tc.desc Verify byteOffset 2 byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteLength).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0051
     * @tc.name testUint16ArrayConstructorOne051
     * @tc.desc Verify byteOffset 2 byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0052
     * @tc.name testUint16ArrayConstructorOne052
     * @tc.desc Verify byteOffset 0 byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.byteLength).assertEqual(6);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0053
     * @tc.name testUint16ArrayConstructorOne053
     * @tc.desc Verify byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0054
     * @tc.name testUint16ArrayConstructorOne054
     * @tc.desc Verify byteOffset 0 buffer.byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0055
     * @tc.name testUint16ArrayConstructorOne055
     * @tc.desc Verify byteOffset 2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.buffer).assertEqual(buf);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0056
     * @tc.name testUint16ArrayConstructorOne056
     * @tc.desc Verify byteOffset 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0057
     * @tc.name testUint16ArrayConstructorOne057
     * @tc.desc Verify byteOffset 5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0058
     * @tc.name testUint16ArrayConstructorOne058
     * @tc.desc Verify buffer byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0059
     * @tc.name testUint16ArrayConstructorOne059
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr1: Uint16Array = new Uint16Array(buf, 0);
      let arr2: Uint16Array = new Uint16Array(buf, 0);
      arr1[0] = 12345;
      expect(arr2.at(0)).assertEqual(12345);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0060
     * @tc.name testUint16ArrayConstructorOne060
     * @tc.desc Verify byteOffset 2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr1: Uint16Array = new Uint16Array(buf, 0);
      let arr2: Uint16Array = new Uint16Array(buf, 2);
      arr1[1] = 50000;
      expect(arr2.at(0)).assertEqual(50000);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0061
     * @tc.name testUint16ArrayConstructorOne061
     * @tc.desc Verify ArrayBuffer(4) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.length).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0062
     * @tc.name testUint16ArrayConstructorOne062
     * @tc.desc Verify ArrayBuffer(4) byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.byteLength).assertEqual(4);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0063
     * @tc.name testUint16ArrayConstructorOne063
     * @tc.desc Verify ArrayBuffer(6) byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.byteLength).assertEqual(6);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0064
     * @tc.name testUint16ArrayConstructorOne064
     * @tc.desc Verify ArrayBuffer(4) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0065
     * @tc.name testUint16ArrayConstructorOne065
     * @tc.desc Verify ArrayBuffer(4) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0066
     * @tc.name testUint16ArrayConstructorOne066
     * @tc.desc Verify ArrayLike<Number> length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0067
     * @tc.name testUint16ArrayConstructorOne067
     * @tc.desc Verify ArrayLike<Number> 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(32768);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0068
     * @tc.name testUint16ArrayConstructorOne068
     * @tc.desc Verify ArrayLike<Number> [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [1, 2, 3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(1)).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0069
     * @tc.name testUint16ArrayConstructorOne069
     * @tc.desc Verify ArrayLike<Number> 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [65536];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0070
     * @tc.name testUint16ArrayConstructorOne070
     * @tc.desc Verify ArrayLike<Number> -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [-1];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0071
     * @tc.name testUint16ArrayConstructorOne071
     * @tc.desc Verify ArrayLike<Number> [0b1010101010101010]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0b1010101010101010];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(43690);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0072
     * @tc.name testUint16ArrayConstructorOne072
     * @tc.desc Verify ArrayLike<Number> [0o177777]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0o177777];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0073
     * @tc.name testUint16ArrayConstructorOne073
     * @tc.desc Verify ArrayLike<Number> [0.1, 0.9, 1.5, 2.499]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0.1, 0.9, 1.5, 2.499];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(2);
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_ONE_0074
     * @tc.name testUint16ArrayConstructorOne074
     * @tc.desc Verify new Uint16Array() with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr instanceof Uint16Array).assertTrue();
    });

  });
}
