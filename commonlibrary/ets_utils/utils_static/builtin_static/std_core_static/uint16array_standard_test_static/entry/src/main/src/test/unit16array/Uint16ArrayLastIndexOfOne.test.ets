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

export default function uint16ArrayLastIndexOf01Test(): void {
  describe('Uint16ArrayLastIndexOf01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0100
     * @tc.name testUint16ArrayLastIndexOfOne001
     * @tc.desc Verify 1 searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10.0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0200
     * @tc.name testUint16ArrayLastIndexOfOne002
     * @tc.desc Verify 1 searchElement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0300
     * @tc.name testUint16ArrayLastIndexOfOne003
     * @tc.desc Verify 1 searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0400
     * @tc.name testUint16ArrayLastIndexOfOne004
     * @tc.desc Verify 1 searchElement -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([]);
      let result = arr.lastIndexOf(10.0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0500
     * @tc.name testUint16ArrayLastIndexOfOne005
     * @tc.desc Verify 2 searchElement fromIndex fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0600
     * @tc.name testUint16ArrayLastIndexOfOne006
     * @tc.desc Verify 2 searchElement fromIndex fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0700
     * @tc.name testUint16ArrayLastIndexOfOne007
     * @tc.desc Verify 2 searchElement fromIndex=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0800
     * @tc.name testUint16ArrayLastIndexOfOne008
     * @tc.desc Verify 2 searchElement fromIndex=0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, Double.toInt(Number.NaN));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_0900
     * @tc.name testUint16ArrayLastIndexOfOne009
     * @tc.desc Verify 2 searchElement fromIndex=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1000
     * @tc.name testUint16ArrayLastIndexOfOne010
     * @tc.desc Verify 2 searchElement fromIndex=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1100
     * @tc.name testUint16ArrayLastIndexOfOne011
     * @tc.desc Verify 2 searchElement fromIndex=length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1200
     * @tc.name testUint16ArrayLastIndexOfOne012
     * @tc.desc Verify fromIndex 100 is clamped to the last index and returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 100);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1300
     * @tc.name testUint16ArrayLastIndexOfOne013
     * @tc.desc Verify searchElement 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1400
     * @tc.name testUint16ArrayLastIndexOfOne014
     * @tc.desc Verify searchElement 65535 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(65535.9);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1500
     * @tc.name testUint16ArrayLastIndexOfOne015
     * @tc.desc Verify searchElement 32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(32768);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1600
     * @tc.name testUint16ArrayLastIndexOfOne016
     * @tc.desc Verify searchElement 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 1, 65535]);
      let result = arr.lastIndexOf(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1700
     * @tc.name testUint16ArrayLastIndexOfOne017
     * @tc.desc Verify searchElement 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 255, 65535]);
      let result = arr.lastIndexOf(255);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1800
     * @tc.name testUint16ArrayLastIndexOfOne018
     * @tc.desc Verify searchElement 63 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 63, 65535]);
      let result = arr.lastIndexOf(63);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_1900
     * @tc.name testUint16ArrayLastIndexOfOne019
     * @tc.desc Verify searchElement 65534 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 65534, 65535]);
      let result = arr.lastIndexOf(65534);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2000
     * @tc.name testUint16ArrayLastIndexOfOne020
     * @tc.desc Verify searchElement 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 100, 200, 100]);
      let result = arr.lastIndexOf(100);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2100
     * @tc.name testUint16ArrayLastIndexOfOne021
     * @tc.desc Verify searchElement 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([100, 200, 100, 200, 100]);
      let result = arr.lastIndexOf(200);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2200
     * @tc.name testUint16ArrayLastIndexOfOne022
     * @tc.desc Verify searchElement 0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(0xFFFF);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2300
     * @tc.name testUint16ArrayLastIndexOfOne023
     * @tc.desc Verify searchElement 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(0x8000);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2400
     * @tc.name testUint16ArrayLastIndexOfOne024
     * @tc.desc Verify searchElement 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 255, 65535]);
      let result = arr.lastIndexOf(0xFF);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2500
     * @tc.name testUint16ArrayLastIndexOfOne025
     * @tc.desc Verify searchElement 0x0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(0x0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2600
     * @tc.name testUint16ArrayLastIndexOfOne026
     * @tc.desc Verify searchElement 0o1777 1023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 1023, 65535]);
      let result = arr.lastIndexOf(0o1777);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2700
     * @tc.name testUint16ArrayLastIndexOfOne027
     * @tc.desc Verify searchElement 0o77777 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32767, 65535]);
      let result = arr.lastIndexOf(0o77777);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2800
     * @tc.name testUint16ArrayLastIndexOfOne028
     * @tc.desc Verify searchElement 0b11111111 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 255, 65535]);
      let result = arr.lastIndexOf(0b11111111);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_2900
     * @tc.name testUint16ArrayLastIndexOfOne029
     * @tc.desc Verify searchElement 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 10, 65535]);
      let result = arr.lastIndexOf(0b1010);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3000
     * @tc.name testUint16ArrayLastIndexOfOne030
     * @tc.desc Verify searchElement 10.0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30]);
      let result = arr.lastIndexOf(10.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3100
     * @tc.name testUint16ArrayLastIndexOfOne031
     * @tc.desc Verify searchElement 3.14 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([3, 20, 30]);
      let result = arr.lastIndexOf(3.14);
      expect(result).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3200
     * @tc.name testUint16ArrayLastIndexOfOne032
     * @tc.desc Verify searchElement Infinity -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3300
     * @tc.name testUint16ArrayLastIndexOfOne033
     * @tc.desc Verify searchElement -Infinity -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3400
     * @tc.name testUint16ArrayLastIndexOfOne034
     * @tc.desc Verify searchElement 1e5 100000 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(1e5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3500
     * @tc.name testUint16ArrayLastIndexOfOne035
     * @tc.desc Verify searchElement 1e4 10000 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(1e4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3600
     * @tc.name testUint16ArrayLastIndexOfOne036
     * @tc.desc Verify searchElement -0.5 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(-0.5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3700
     * @tc.name testUint16ArrayLastIndexOfOne037
     * @tc.desc Verify searchElement 9007199254740991 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(9007199254740991);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3800
     * @tc.name testUint16ArrayLastIndexOfOne038
     * @tc.desc Verify searchElement -65535 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([0, 32768, 65535]);
      let result = arr.lastIndexOf(-65535);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_3900
     * @tc.name testUint16ArrayLastIndexOfOne039
     * @tc.desc Verify fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4000
     * @tc.name testUint16ArrayLastIndexOfOne040
     * @tc.desc Verify fromIndex -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, -2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4100
     * @tc.name testUint16ArrayLastIndexOfOne041
     * @tc.desc Verify fromIndex -length -5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4200
     * @tc.name testUint16ArrayLastIndexOfOne042
     * @tc.desc Verify fromIndex -length-1 -6 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, -6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4300
     * @tc.name testUint16ArrayLastIndexOfOne043
     * @tc.desc Verify fromIndex -999 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, -999);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4400
     * @tc.name testUint16ArrayLastIndexOfOne044
     * @tc.desc Verify fromIndex -3 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, -3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4500
     * @tc.name testUint16ArrayLastIndexOfOne045
     * @tc.desc Verify fromIndex -4 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, -4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4600
     * @tc.name testUint16ArrayLastIndexOfOne046
     * @tc.desc Verify fromIndex -2 3 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(30, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4700
     * @tc.name testUint16ArrayLastIndexOfOne047
     * @tc.desc Verify fromIndex 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10]);
      let result = arr.lastIndexOf(10, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4800
     * @tc.name testUint16ArrayLastIndexOfOne048
     * @tc.desc Verify fromIndex 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_4900
     * @tc.name testUint16ArrayLastIndexOfOne049
     * @tc.desc Verify fromIndex 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(30, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5000
     * @tc.name testUint16ArrayLastIndexOfOne050
     * @tc.desc Verify fromIndex 3 3 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(30, 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5100
     * @tc.name testUint16ArrayLastIndexOfOne051
     * @tc.desc Verify fromIndex 0.99 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, Double.toInt(0.99));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5200
     * @tc.name testUint16ArrayLastIndexOfOne052
     * @tc.desc Verify fromIndex -0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, Double.toInt(-0.5));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5300
     * @tc.name testUint16ArrayLastIndexOfOne053
     * @tc.desc Verify fromIndex -1.5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, Double.toInt(-1.5));
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5400
     * @tc.name testUint16ArrayLastIndexOfOne054
     * @tc.desc Verify fromIndex -2.9 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, Double.toInt(-2.9));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5500
     * @tc.name testUint16ArrayLastIndexOfOne055
     * @tc.desc Verify fromIndex 0x0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 0x0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5600
     * @tc.name testUint16ArrayLastIndexOfOne056
     * @tc.desc Verify fromIndex 0xA 10 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 0xA);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5700
     * @tc.name testUint16ArrayLastIndexOfOne057
     * @tc.desc Verify fromIndex 0b0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 0b0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5800
     * @tc.name testUint16ArrayLastIndexOfOne058
     * @tc.desc Verify fromIndex 0b101 5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 0b101);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_5900
     * @tc.name testUint16ArrayLastIndexOfOne059
     * @tc.desc Verify fromIndex 0o7 7 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, 0o7);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6000
     * @tc.name testUint16ArrayLastIndexOfOne060
     * @tc.desc Verify fromIndex -0x1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, -0x1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6100
     * @tc.name testUint16ArrayLastIndexOfOne061
     * @tc.desc Verify fromIndex -0o1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, -0o1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6200
     * @tc.name testUint16ArrayLastIndexOfOne062
     * @tc.desc Verify fromIndex -0b1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(30, -0b1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6300
     * @tc.name testUint16ArrayLastIndexOfOne063
     * @tc.desc Verify fromIndex 1e0 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, Double.toInt(1e0));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6400
     * @tc.name testUint16ArrayLastIndexOfOne064
     * @tc.desc Verify fromIndex 2e0 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(30, Double.toInt(2e0));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6500
     * @tc.name testUint16ArrayLastIndexOfOne065
     * @tc.desc Verify fromIndex -2e0 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, Double.toInt(-2e0));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6600
     * @tc.name testUint16ArrayLastIndexOfOne066
     * @tc.desc Verify fromIndex 0 fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([]);
      let result = arr.lastIndexOf(10, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6700
     * @tc.name testUint16ArrayLastIndexOfOne067
     * @tc.desc Verify fromIndex -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([]);
      let result = arr.lastIndexOf(10, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6800
     * @tc.name testUint16ArrayLastIndexOfOne068
     * @tc.desc Verify fromIndex Infinity -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([]);
      let result = arr.lastIndexOf(10, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_6900
     * @tc.name testUint16ArrayLastIndexOfOne069
     * @tc.desc Verify fromIndex arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(10, arr.length);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_7000
     * @tc.name testUint16ArrayLastIndexOfOne070
     * @tc.desc Verify fromIndex arr.byteLength / 2 - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(30, arr.byteLength / 2 - 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_7100
     * @tc.name testUint16ArrayLastIndexOfOne071
     * @tc.desc Verify fromIndex uses Double.toInt(1.5) and returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, Double.toInt(1.5));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_7200
     * @tc.name testUint16ArrayLastIndexOfOne072
     * @tc.desc Verify fromIndex uses Double.toInt(-1.5) and returns index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, Double.toInt(-1.5));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_ONE_7300
     * @tc.name testUint16ArrayLastIndexOfOne073
     * @tc.desc Verify fromIndex 0x3 (hex 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array([10, 20, 30, 20, 10]);
      let result = arr.lastIndexOf(20, 0x3);
      expect(result).assertEqual(3);
    });

  });
}
