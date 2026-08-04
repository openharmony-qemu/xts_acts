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

export default function uint16ArrayIndexOf01Test(): void {
  describe('Uint16ArrayIndexOf01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0001
     * @tc.name testUint16ArrayIndexOfOne001
     * @tc.desc Verify searchElement fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0002
     * @tc.name testUint16ArrayIndexOfOne002
     * @tc.desc Verify searchElement fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0003
     * @tc.name testUint16ArrayIndexOfOne003
     * @tc.desc Verify searchElement 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0004
     * @tc.name testUint16ArrayIndexOfOne004
     * @tc.desc Verify searchElement 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0005
     * @tc.name testUint16ArrayIndexOfOne005
     * @tc.desc Verify searchElement 101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(101);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0006
     * @tc.name testUint16ArrayIndexOfOne006
     * @tc.desc Verify searchElement NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0007
     * @tc.name testUint16ArrayIndexOfOne007
     * @tc.desc Verify searchElement Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0008
     * @tc.name testUint16ArrayIndexOfOne008
     * @tc.desc Verify searchElement -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0009
     * @tc.name testUint16ArrayIndexOfOne009
     * @tc.desc Verify searchElement 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(3.14);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0010
     * @tc.name testUint16ArrayIndexOfOne010
     * @tc.desc Verify searchElement 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(65535.9);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0011
     * @tc.name testUint16ArrayIndexOfOne011
     * @tc.desc Verify searchElement -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(-0.5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0012
     * @tc.name testUint16ArrayIndexOfOne012
     * @tc.desc Verify searchElement -0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(-0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0013
     * @tc.name testUint16ArrayIndexOfOne013
     * @tc.desc Verify searchElement 1e0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(1e0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0014
     * @tc.name testUint16ArrayIndexOfOne014
     * @tc.desc Verify searchElement 0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0xFFFF);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0015
     * @tc.name testUint16ArrayIndexOfOne015
     * @tc.desc Verify searchElement 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0x8000);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0016
     * @tc.name testUint16ArrayIndexOfOne016
     * @tc.desc Verify searchElement 0o177777 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0o177777);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0017
     * @tc.name testUint16ArrayIndexOfOne017
     * @tc.desc Verify searchElement 0b1111111111111111 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0b1111111111111111);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0018
     * @tc.name testUint16ArrayIndexOfOne018
     * @tc.desc Verify searchElement 0x0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0x0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0019
     * @tc.name testUint16ArrayIndexOfOne019
     * @tc.desc Verify searchElement 0x1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(0x1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0020
     * @tc.name testUint16ArrayIndexOfOne020
     * @tc.desc Verify searchElement 6.5535e4 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(6.5535e4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0021
     * @tc.name testUint16ArrayIndexOfOne021
     * @tc.desc Verify searchElement 1e5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 65535, 32768, 100, 0, 65535, 20000, 50000);
      const result = arr.indexOf(1e5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0022
     * @tc.name testUint16ArrayIndexOfOne022
     * @tc.desc Verify 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.indexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0023
     * @tc.name testUint16ArrayIndexOfOne023
     * @tc.desc Verify 65535 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.indexOf(65535);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0024
     * @tc.name testUint16ArrayIndexOfOne024
     * @tc.desc Verify NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0025
     * @tc.name testUint16ArrayIndexOfOne025
     * @tc.desc Verify -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.indexOf(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0026
     * @tc.name testUint16ArrayIndexOfOne026
     * @tc.desc Verify [5] 5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result = arr.indexOf(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0027
     * @tc.name testUint16ArrayIndexOfOne027
     * @tc.desc Verify [5] 6 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result = arr.indexOf(6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0028
     * @tc.name testUint16ArrayIndexOfOne028
     * @tc.desc Verify [5] 5.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result = arr.indexOf(5.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0029
     * @tc.name testUint16ArrayIndexOfOne029
     * @tc.desc Verify [0] 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0);
      const result = arr.indexOf(0);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0030
     * @tc.name testUint16ArrayIndexOfOne030
     * @tc.desc Verify [10, 20, 10, 30, 10] 10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0031
     * @tc.name testUint16ArrayIndexOfOne031
     * @tc.desc Verify [10, 20, 10, 30, 10] 20 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0032
     * @tc.name testUint16ArrayIndexOfOne032
     * @tc.desc Verify [10, 20, 10, 30, 10] 30 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(30);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0033
     * @tc.name testUint16ArrayIndexOfOne033
     * @tc.desc Verify [10, 20, 10, 30, 10] 40 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(40);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0034
     * @tc.name testUint16ArrayIndexOfOne034
     * @tc.desc Verify [7, 7, 7, 7, 7] 7 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7, 7, 7);
      const result = arr.indexOf(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0035
     * @tc.name testUint16ArrayIndexOfOne035
     * @tc.desc Verify [7, 7, 7, 7, 7] 8 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7, 7, 7);
      const result = arr.indexOf(8);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0036
     * @tc.name testUint16ArrayIndexOfOne036
     * @tc.desc Verify [0, 65535, 0, 65535] 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 0, 65535);
      const result = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0037
     * @tc.name testUint16ArrayIndexOfOne037
     * @tc.desc Verify [0, 65535, 0, 65535] 65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 0, 65535);
      const result = arr.indexOf(65535);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0038
     * @tc.name testUint16ArrayIndexOfOne038
     * @tc.desc Verify fromIndex = 0 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0039
     * @tc.name testUint16ArrayIndexOfOne039
     * @tc.desc Verify fromIndex = 2 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0040
     * @tc.name testUint16ArrayIndexOfOne040
     * @tc.desc Verify fromIndex = 3 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0041
     * @tc.name testUint16ArrayIndexOfOne041
     * @tc.desc Verify fromIndex = -1 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0042
     * @tc.name testUint16ArrayIndexOfOne042
     * @tc.desc Verify fromIndex = -4 2 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, -4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0043
     * @tc.name testUint16ArrayIndexOfOne043
     * @tc.desc Verify [10, 20, 10, 30, 10] fromIndex = 1 10 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0044
     * @tc.name testUint16ArrayIndexOfOne044
     * @tc.desc Verify [10, 20, 10, 30, 10] fromIndex = 3 10 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10, 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0045
     * @tc.name testUint16ArrayIndexOfOne045
     * @tc.desc Verify [10, 20, 10, 30, 10] fromIndex = -1 10 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0046
     * @tc.name testUint16ArrayIndexOfOne046
     * @tc.desc Verify [10, 20, 10, 30, 10] fromIndex = -3 10 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 10, 30, 10);
      const result = arr.indexOf(10, -3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0047
     * @tc.name testUint16ArrayIndexOfOne047
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = 4 50 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0048
     * @tc.name testUint16ArrayIndexOfOne048
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = -1 50 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0049
     * @tc.name testUint16ArrayIndexOfOne049
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = 5 50 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0050
     * @tc.name testUint16ArrayIndexOfOne050
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = -2 50 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, -2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0051
     * @tc.name testUint16ArrayIndexOfOne051
     * @tc.desc Verify [10, 20, 30, 40, 50] fromIndex = 0 50 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0052
     * @tc.name testUint16ArrayIndexOfOne052
     * @tc.desc Verify [1, 2, 3] fromIndex = 0 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.indexOf(1, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0053
     * @tc.name testUint16ArrayIndexOfOne053
     * @tc.desc Verify [1, 2, 3] fromIndex = -100 0 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.indexOf(1, -100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0054
     * @tc.name testUint16ArrayIndexOfOne054
     * @tc.desc Verify [1, 2, 3] fromIndex = 1 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.indexOf(1, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0055
     * @tc.name testUint16ArrayIndexOfOne055
     * @tc.desc Verify fromIndex 2147483647 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, 2147483647);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0056
     * @tc.name testUint16ArrayIndexOfOne056
     * @tc.desc Verify fromIndex -2147483648 0 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(30, -2147483648);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0057
     * @tc.name testUint16ArrayIndexOfOne057
     * @tc.desc Verify 99 fromIndex = 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(99, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0058
     * @tc.name testUint16ArrayIndexOfOne058
     * @tc.desc Verify 99 fromIndex = -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(99, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0059
     * @tc.name testUint16ArrayIndexOfOne059
     * @tc.desc Verify 99 fromIndex = 100 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50, 60);
      const result = arr.indexOf(99, 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0060
     * @tc.name testUint16ArrayIndexOfOne060
     * @tc.desc Verify fromIndex 1.5 treated as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(30, Double.toInt(1.5));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0061
     * @tc.name testUint16ArrayIndexOfOne061
     * @tc.desc Verify fromIndex NaN treated as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(10, Double.toInt(Number.NaN));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0062
     * @tc.name testUint16ArrayIndexOfOne062
     * @tc.desc Verify fromIndex Infinity treated as length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0063
     * @tc.name testUint16ArrayIndexOfOne063
     * @tc.desc Verify fromIndex using arr.length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(50, arr.length - 1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0064
     * @tc.name testUint16ArrayIndexOfOne064
     * @tc.desc Verify fromIndex 0o1 (octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(20, 0o1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_ONE_0065
     * @tc.name testUint16ArrayIndexOfOne065
     * @tc.desc Verify fromIndex 0b10 (binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.indexOf(30, 0b10);
      expect(result).assertEqual(2);
    });
  });
}
