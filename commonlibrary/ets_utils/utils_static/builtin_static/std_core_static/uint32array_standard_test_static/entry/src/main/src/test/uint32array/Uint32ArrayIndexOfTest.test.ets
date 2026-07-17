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

export default function uint32ArrayIndexOfTest(): void {
  describe('Uint32ArrayIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0100
     * @tc.name testUint32ArrayIndexOfPartOne001
     * @tc.desc Verify arity=1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.indexOf(7)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0200
     * @tc.name testUint32ArrayIndexOfPartOne002
     * @tc.desc Verify arity=1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.indexOf(100)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0300
     * @tc.name testUint32ArrayIndexOfPartOne003
     * @tc.desc Verify arity=2 fromIndex=0 arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.indexOf(8, 0)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0400
     * @tc.name testUint32ArrayIndexOfPartOne004
     * @tc.desc Verify arity=2 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.indexOf(9, 2)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0500
     * @tc.name testUint32ArrayIndexOfPartOne005
     * @tc.desc Verify arity=2 fromIndex=length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.indexOf(7, 3)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0600
     * @tc.name testUint32ArrayIndexOfPartOne006
     * @tc.desc Verify searchElement=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      expect(arr.indexOf(0)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0700
     * @tc.name testUint32ArrayIndexOfPartOne007
     * @tc.desc Verify searchElement=4294967295 uint32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 4294967295);
      expect(arr.indexOf(4294967295)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0800
     * @tc.name testUint32ArrayIndexOfPartOne008
     * @tc.desc Verify searchElement=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.indexOf(1)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_0900
     * @tc.name testUint32ArrayIndexOfPartOne009
     * @tc.desc Verify searchElement=2147483647 int32.MAX int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      expect(arr.indexOf(2147483647)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1000
     * @tc.name testUint32ArrayIndexOfPartOne010
     * @tc.desc Verify searchElement=2147483648 int32.MAX+1 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483648);
      expect(arr.indexOf(2147483648)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1100
     * @tc.name testUint32ArrayIndexOfPartOne011
     * @tc.desc Verify searchElement=-1 not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      expect(arr.indexOf(-1)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1200
     * @tc.name testUint32ArrayIndexOfPartOne012
     * @tc.desc Verify searchElement=4294967296 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.indexOf(4294967296)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1300
     * @tc.name testUint32ArrayIndexOfPartOne013
     * @tc.desc Verify searchElement=Number.NaN uint32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7);
      expect(arr.indexOf(Number.NaN)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1400
     * @tc.name testUint32ArrayIndexOfPartOne014
     * @tc.desc Verify searchElement=Number.POSITIVE_INFINITY uint32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7);
      expect(arr.indexOf(Number.POSITIVE_INFINITY)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1500
     * @tc.name testUint32ArrayIndexOfPartOne015
     * @tc.desc Verify searchElement=Number.NEGATIVE_INFINITY uint32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7);
      expect(arr.indexOf(Number.NEGATIVE_INFINITY)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1600
     * @tc.name testUint32ArrayIndexOfPartOne016
     * @tc.desc Verify searchElement=3.14 3 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7);
      expect(arr.indexOf(3.14)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1700
     * @tc.name testUint32ArrayIndexOfPartOne017
     * @tc.desc Verify searchElement=3.0 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3);
      expect(arr.indexOf(3.0)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1800
     * @tc.name testUint32ArrayIndexOfPartOne018
     * @tc.desc Verify searchElement=-0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.indexOf(-0)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_1900
     * @tc.name testUint32ArrayIndexOfPartOne019
     * @tc.desc Verify 9007199254740991 4294967295 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9007199254740991);
      expect(arr.indexOf(4294967295)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2000
     * @tc.name testUint32ArrayIndexOfPartOne020
     * @tc.desc Verify 9007199254740991 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9007199254740991);
      expect(arr.indexOf(9007199254740991)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2100
     * @tc.name testUint32ArrayIndexOfPartOne021
     * @tc.desc Verify 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.indexOf(0)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2200
     * @tc.name testUint32ArrayIndexOfPartOne022
     * @tc.desc Verify 4294967295 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      expect(arr.indexOf(4294967295)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2300
     * @tc.name testUint32ArrayIndexOfPartOne023
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 10, 15);
      expect(arr.indexOf(5)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2400
     * @tc.name testUint32ArrayIndexOfPartOne024
     * @tc.desc Verify uint32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200, 4294967295);
      expect(arr.indexOf(4294967295)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2500
     * @tc.name testUint32ArrayIndexOfPartOne025
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2600
     * @tc.name testUint32ArrayIndexOfPartOne026
     * @tc.desc Verify MAX 4294967294 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      expect(arr.indexOf(4294967294)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2700
     * @tc.name testUint32ArrayIndexOfPartOne027
     * @tc.desc Verify 0 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.indexOf(1)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2800
     * @tc.name testUint32ArrayIndexOfPartOne028
     * @tc.desc Verify int32.MAX 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483646, 2147483647);
      expect(arr.indexOf(2147483647)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_2900
     * @tc.name testUint32ArrayIndexOfPartOne029
     * @tc.desc Verify 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 0, 3);
      expect(arr.indexOf(0)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3000
     * @tc.name testUint32ArrayIndexOfPartOne030
     * @tc.desc Verify [2,2,2] 2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 2, 2);
      expect(arr.indexOf(2)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3100
     * @tc.name testUint32ArrayIndexOfPartOne031
     * @tc.desc Verify searchElement=0o2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2);
      expect(arr.indexOf(0o2)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3200
     * @tc.name testUint32ArrayIndexOfPartOne032
     * @tc.desc Verify searchElement=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(255);
      expect(arr.indexOf(255)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3300
     * @tc.name testUint32ArrayIndexOfPartOne033
     * @tc.desc Verify 256 [255,256] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(255, 256);
      expect(arr.indexOf(256)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3400
     * @tc.name testUint32ArrayIndexOfPartOne034
     * @tc.desc Verify searchElement=65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(65535);
      expect(arr.indexOf(65535)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3500
     * @tc.name testUint32ArrayIndexOfPartOne035
     * @tc.desc Verify searchElement=65536 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(65536);
      expect(arr.indexOf(65536)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3600
     * @tc.name testUint32ArrayIndexOfPartOne036
     * @tc.desc Verify searchElement=16777215
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(16777215);
      expect(arr.indexOf(16777215)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3700
     * @tc.name testUint32ArrayIndexOfPartOne037
     * @tc.desc Verify searchElement=16777216 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(16777216);
      expect(arr.indexOf(16777216)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3800
     * @tc.name testUint32ArrayIndexOfPartOne038
     * @tc.desc Verify fromIndex=0 20 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, 0)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_3900
     * @tc.name testUint32ArrayIndexOfPartOne039
     * @tc.desc Verify fromIndex=1 20 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, 1)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4000
     * @tc.name testUint32ArrayIndexOfPartOne040
     * @tc.desc Verify fromIndex=2 20 20 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, 2)).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4100
     * @tc.name testUint32ArrayIndexOfPartOne041
     * @tc.desc Verify fromIndex=3 20 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, 3)).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4200
     * @tc.name testUint32ArrayIndexOfPartOne042
     * @tc.desc Verify fromIndex=4 20 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, 4)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4300
     * @tc.name testUint32ArrayIndexOfPartOne043
     * @tc.desc Verify fromIndex=length(5) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, 5)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4400
     * @tc.name testUint32ArrayIndexOfPartOne044
     * @tc.desc Verify fromIndex=-1 4 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(50, -1)).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4500
     * @tc.name testUint32ArrayIndexOfPartOne045
     * @tc.desc Verify fromIndex=-1 20 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, -1)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4600
     * @tc.name testUint32ArrayIndexOfPartOne046
     * @tc.desc Verify fromIndex=-2 3 20 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, -2)).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4700
     * @tc.name testUint32ArrayIndexOfPartOne047
     * @tc.desc Verify fromIndex=-4 1 20 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, -4)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4800
     * @tc.name testUint32ArrayIndexOfPartOne048
     * @tc.desc Verify fromIndex=-length(-5) 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(10, -5)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_4900
     * @tc.name testUint32ArrayIndexOfPartOne049
     * @tc.desc Verify fromIndex=-3 2 30 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(30, -3)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5000
     * @tc.name testUint32ArrayIndexOfPartOne050
     * @tc.desc Verify fromIndex=2 10 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(10, 2)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5100
     * @tc.name testUint32ArrayIndexOfPartOne051
     * @tc.desc Verify fromIndex=4 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(50, 4)).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5200
     * @tc.name testUint32ArrayIndexOfPartOne052
     * @tc.desc Verify fromIndex=2147483647 int32.MAX -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(20, 2147483647)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5300
     * @tc.name testUint32ArrayIndexOfPartOne053
     * @tc.desc Verify fromIndex=-2147483648 int32.MIN 0 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(10, -2147483648)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5400
     * @tc.name testUint32ArrayIndexOfPartOne054
     * @tc.desc Verify fromIndex=3 30 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(30, 3)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5500
     * @tc.name testUint32ArrayIndexOfPartOne055
     * @tc.desc Verify fromIndex=0 60 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(60, 0)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5600
     * @tc.name testUint32ArrayIndexOfPartOne056
     * @tc.desc Verify fromIndex=-2 3 10 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 20, 50);
      expect(arr.indexOf(10, -2)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5700
     * @tc.name testUint32ArrayIndexOfPartOne057
     * @tc.desc Verify fromIndex=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.indexOf(5, 0)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5800
     * @tc.name testUint32ArrayIndexOfPartOne058
     * @tc.desc Verify fromIndex=1(=length) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.indexOf(5, 1)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_5900
     * @tc.name testUint32ArrayIndexOfPartOne059
     * @tc.desc Verify fromIndex=-1 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.indexOf(5, -1)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_6000
     * @tc.name testUint32ArrayIndexOfPartOne060
     * @tc.desc Verify fromIndex=-2(<-length) 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.indexOf(5, -2)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_6100
     * @tc.name testUint32ArrayIndexOfPartOne061
     * @tc.desc Verify fromIndex=0 8 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      expect(arr.indexOf(8, 0)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_6200
     * @tc.name testUint32ArrayIndexOfPartOne062
     * @tc.desc Verify fromIndex=1 8 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      expect(arr.indexOf(8, 1)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_6300
     * @tc.name testUint32ArrayIndexOfPartOne063
     * @tc.desc Verify fromIndex=2(=length) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      expect(arr.indexOf(8, 2)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_6400
     * @tc.name testUint32ArrayIndexOfPartOne064
     * @tc.desc Verify fromIndex=-1 1 8 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      expect(arr.indexOf(8, -1)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_6500
     * @tc.name testUint32ArrayIndexOfPartOne065
     * @tc.desc Verify fromIndex=-1 1 7 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      expect(arr.indexOf(7, -1)).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_INDEXOF_PARTONE_6600
     * @tc.name testUint32ArrayIndexOfPartOne066
     * @tc.desc Verify fromIndex=-2 0 7 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayIndexOfPartOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8);
      expect(arr.indexOf(7, -2)).assertEqual(0);
    });

  });
}
