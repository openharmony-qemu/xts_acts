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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayIncludesTest(): void {
  describe('Uint32ArrayIncludesTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0100
     * @tc.name testUint32ArrayIncludesPartOne001
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4, 5, 6);
      expect(arr.includes(4)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0200
     * @tc.name testUint32ArrayIncludesPartOne002
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7);
      expect(arr.includes(7)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0300
     * @tc.name testUint32ArrayIncludesPartOne003
     * @tc.desc Verify fromIndex=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4, 5, 6);
      expect(arr.includes(5, 0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0400
     * @tc.name testUint32ArrayIncludesPartOne004
     * @tc.desc Verify fromIndex=1 1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4, 5, 6);
      expect(arr.includes(5, 1)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0500
     * @tc.name testUint32ArrayIncludesPartOne005
     * @tc.desc Verify searchElement=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      expect(arr.includes(0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0600
     * @tc.name testUint32ArrayIncludesPartOne006
     * @tc.desc Verify searchElement=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 0);
      expect(arr.includes(0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0700
     * @tc.name testUint32ArrayIncludesPartOne007
     * @tc.desc Verify searchElement=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.includes(0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0800
     * @tc.name testUint32ArrayIncludesPartOne008
     * @tc.desc Verify searchElement=0 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.includes(0)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_0900
     * @tc.name testUint32ArrayIncludesPartOne009
     * @tc.desc Verify searchElement=0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      expect(arr.includes(0)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1000
     * @tc.name testUint32ArrayIncludesPartOne010
     * @tc.desc Verify searchElement=4294967295 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 1, 2);
      expect(arr.includes(4294967295)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1100
     * @tc.name testUint32ArrayIncludesPartOne011
     * @tc.desc Verify searchElement=4294967295 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 4294967295);
      expect(arr.includes(4294967295)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1200
     * @tc.name testUint32ArrayIncludesPartOne012
     * @tc.desc Verify searchElement=4294967295 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 1, 4294967295);
      expect(arr.includes(4294967295)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1300
     * @tc.name testUint32ArrayIncludesPartOne013
     * @tc.desc Verify searchElement=4294967295 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.includes(4294967295)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1400
     * @tc.name testUint32ArrayIncludesPartOne014
     * @tc.desc Verify searchElement=0xFFFFFFFF 4294967295 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 1);
      expect(arr.includes(0xFFFFFFFF)).assertTrue();
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1500
     * @tc.name testUint32ArrayIncludesPartOne015
     * @tc.desc Verify searchElement=2147483647 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.includes(2147483647)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1600
     * @tc.name testUint32ArrayIncludesPartOne016
     * @tc.desc Verify searchElement=-1 not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 1);
      expect(arr.includes(-1)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1700
     * @tc.name testUint32ArrayIncludesPartOne017
     * @tc.desc Verify searchElement=-2 not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967294, 1);
      expect(arr.includes(-2)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1800
     * @tc.name testUint32ArrayIncludesPartOne018
     * @tc.desc Verify searchElement=-2147483648 not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483648, 1);
      expect(arr.includes(-2147483648)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_1900
     * @tc.name testUint32ArrayIncludesPartOne019
     * @tc.desc Verify searchElement=3.14 not found false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 1);
      expect(arr.includes(3.14)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2000
     * @tc.name testUint32ArrayIncludesPartOne020
     * @tc.desc Verify searchElement=3.14 3 3 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 4);
      expect(arr.includes(3.14)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2100
     * @tc.name testUint32ArrayIncludesPartOne021
     * @tc.desc Verify searchElement=2.99999 not found false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 1);
      expect(arr.includes(2.99999)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2200
     * @tc.name testUint32ArrayIncludesPartOne022
     * @tc.desc Verify searchElement=Number.NaN not found false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1);
      expect(arr.includes(Number.NaN)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2300
     * @tc.name testUint32ArrayIncludesPartOne023
     * @tc.desc Verify searchElement=Number.NaN 0 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.includes(Number.NaN)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2400
     * @tc.name testUint32ArrayIncludesPartOne024
     * @tc.desc Verify searchElement=Number.POSITIVE_INFINITY not found false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1);
      expect(arr.includes(Number.POSITIVE_INFINITY)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2500
     * @tc.name testUint32ArrayIncludesPartOne025
     * @tc.desc Verify searchElement=Number.NEGATIVE_INFINITY not found false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1);
      expect(arr.includes(Number.NEGATIVE_INFINITY)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2600
     * @tc.name testUint32ArrayIncludesPartOne026
     * @tc.desc Verify searchElement=1e10 not found false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1410065408, 1);
      expect(arr.includes(1e10)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2700
     * @tc.name testUint32ArrayIncludesPartOne027
     * @tc.desc Verify searchElement=1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.includes(1)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2800
     * @tc.name testUint32ArrayIncludesPartOne028
     * @tc.desc Verify searchElement=1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 3, 4);
      expect(arr.includes(1)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_2900
     * @tc.name testUint32ArrayIncludesPartOne029
     * @tc.desc Verify searchElement=0o377 255 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(255, 1);
      expect(arr.includes(0o377)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3000
     * @tc.name testUint32ArrayIncludesPartOne030
     * @tc.desc Verify searchElement=-0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1);
      expect(arr.includes(-0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3100
     * @tc.name testUint32ArrayIncludesPartOne031
     * @tc.desc Verify searchElement number 5 5 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6);
      const target: number = 5;
      expect(arr.includes(target)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3200
     * @tc.name testUint32ArrayIncludesPartOne032
     * @tc.desc Verify searchElement=4294967294 MAX-1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.includes(4294967294)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3300
     * @tc.name testUint32ArrayIncludesPartOne033
     * @tc.desc Verify searchElement true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 1, 5, 2, 5);
      expect(arr.includes(5)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3400
     * @tc.name testUint32ArrayIncludesPartOne034
     * @tc.desc Verify searchElement true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 7, 7, 7);
      expect(arr.includes(7)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3500
     * @tc.name testUint32ArrayIncludesPartOne035
     * @tc.desc Verify fromIndex=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.includes(10, 0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3600
     * @tc.name testUint32ArrayIncludesPartOne036
     * @tc.desc Verify fromIndex=1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.includes(10, 1)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3700
     * @tc.name testUint32ArrayIncludesPartOne037
     * @tc.desc Verify fromIndex=2 2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      expect(arr.includes(30, 2)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3800
     * @tc.name testUint32ArrayIncludesPartOne038
     * @tc.desc Verify fromIndex=3 3 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40, 50);
      expect(arr.includes(40, 3)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_3900
     * @tc.name testUint32ArrayIncludesPartOne039
     * @tc.desc Verify fromIndex=3 4 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      expect(arr.includes(44, 3)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4000
     * @tc.name testUint32ArrayIncludesPartOne040
     * @tc.desc Verify fromIndex=4 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      expect(arr.includes(44, 4)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4100
     * @tc.name testUint32ArrayIncludesPartOne041
     * @tc.desc Verify fromIndex=-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      expect(arr.includes(44, -1)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4200
     * @tc.name testUint32ArrayIncludesPartOne042
     * @tc.desc Verify fromIndex=-2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      expect(arr.includes(33, -2)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4300
     * @tc.name testUint32ArrayIncludesPartOne043
     * @tc.desc Verify fromIndex=-3 5 2 2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40, 50);
      expect(arr.includes(30, -3)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4400
     * @tc.name testUint32ArrayIncludesPartOne044
     * @tc.desc Verify fromIndex=-4 -length true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      expect(arr.includes(11, -4)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4500
     * @tc.name testUint32ArrayIncludesPartOne045
     * @tc.desc Verify fromIndex=-5 -length-1 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      expect(arr.includes(11, -5)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4600
     * @tc.name testUint32ArrayIncludesPartOne046
     * @tc.desc Verify fromIndex=2147483647 int32 MAX false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44);
      expect(arr.includes(11, 2147483647)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4700
     * @tc.name testUint32ArrayIncludesPartOne047
     * @tc.desc Verify fromIndex=1 0 2 1 2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 1, 5, 2);
      expect(arr.includes(5, 1)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4800
     * @tc.name testUint32ArrayIncludesPartOne048
     * @tc.desc Verify fromIndex=3 2 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 1, 5, 2);
      expect(arr.includes(5, 3)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_4900
     * @tc.name testUint32ArrayIncludesPartOne049
     * @tc.desc Verify fromIndex=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.includes(42, 0)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5000
     * @tc.name testUint32ArrayIncludesPartOne050
     * @tc.desc Verify fromIndex=1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.includes(42, 1)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5100
     * @tc.name testUint32ArrayIncludesPartOne051
     * @tc.desc Verify fromIndex=-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.includes(42, -1)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5200
     * @tc.name testUint32ArrayIncludesPartOne052
     * @tc.desc Verify fromIndex=-2 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.includes(42, -2)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5300
     * @tc.name testUint32ArrayIncludesPartOne053
     * @tc.desc Verify fromIndex=0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      expect(arr.includes(1, 0)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5400
     * @tc.name testUint32ArrayIncludesPartOne054
     * @tc.desc Verify fromIndex=-1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      expect(arr.includes(1, -1)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5500
     * @tc.name testUint32ArrayIncludesPartOne055
     * @tc.desc Verify fromIndex=5 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      expect(arr.includes(1, 5)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5600
     * @tc.name testUint32ArrayIncludesPartOne056
     * @tc.desc Verify searchElement=4294967295 fromIndex=1 1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 4294967295, 2);
      expect(arr.includes(4294967295, 1)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5700
     * @tc.name testUint32ArrayIncludesPartOne057
     * @tc.desc Verify searchElement=4294967295 fromIndex=2 1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 4294967295, 2);
      expect(arr.includes(4294967295, 2)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5800
     * @tc.name testUint32ArrayIncludesPartOne058
     * @tc.desc Verify searchElement=0 fromIndex=1 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      expect(arr.includes(0, 1)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INCLUDES_PARTONE_5900
     * @tc.name testUint32ArrayIncludesPartOne059
     * @tc.desc Verify searchElement=0 fromIndex=-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIncludesPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 0);
      expect(arr.includes(0, -1)).assertTrue();
    });

  });
}
