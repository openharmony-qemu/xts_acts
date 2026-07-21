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

export default function uint32ArrayLastIndexOfTest(): void {
  describe('Uint32ArrayLastIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0010
     * @tc.name testUint32ArrayLastIndexOfPartOne001
     * @tc.desc Verify arity=1 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4, 5, 6, 5);
      expect(arr.lastIndexOf(5)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0020
     * @tc.name testUint32ArrayLastIndexOfPartOne002
     * @tc.desc Verify arity=2 fromIndex=length-1 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4, 5, 6, 5);
      expect(arr.lastIndexOf(5, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0030
     * @tc.name testUint32ArrayLastIndexOfPartOne003
     * @tc.desc Verify arity=2 fromIndex fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6, 5, 7);
      expect(arr.lastIndexOf(5, 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0040
     * @tc.name testUint32ArrayLastIndexOfPartOne004
     * @tc.desc Verify arity=1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      expect(arr.lastIndexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0050
     * @tc.name testUint32ArrayLastIndexOfPartOne005
     * @tc.desc Verify arity=2 fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      expect(arr.lastIndexOf(1, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0060
     * @tc.name testUint32ArrayLastIndexOfPartOne006
     * @tc.desc Verify arity=1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.lastIndexOf(42)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0070
     * @tc.name testUint32ArrayLastIndexOfPartOne007
     * @tc.desc Verify arity=1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.lastIndexOf(7)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0080
     * @tc.name testUint32ArrayLastIndexOfPartOne008
     * @tc.desc Verify arity=2 fromIndex=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      expect(arr.lastIndexOf(42, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0090
     * @tc.name testUint32ArrayLastIndexOfPartOne009
     * @tc.desc Verify arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(8, 8, 8, 8);
      expect(arr.lastIndexOf(8)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0100
     * @tc.name testUint32ArrayLastIndexOfPartOne010
     * @tc.desc Verify arity=2 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 3, 3);
      expect(arr.lastIndexOf(3, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0110
     * @tc.name testUint32ArrayLastIndexOfPartOne011
     * @tc.desc Verify searchElement=0 uint32 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      expect(arr.lastIndexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0120
     * @tc.name testUint32ArrayLastIndexOfPartOne012
     * @tc.desc Verify searchElement=4294967295 uint32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295);
      expect(arr.lastIndexOf(4294967295)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0130
     * @tc.name testUint32ArrayLastIndexOfPartOne013
     * @tc.desc Verify searchElement=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(255);
      expect(arr.lastIndexOf(255)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0140
     * @tc.name testUint32ArrayLastIndexOfPartOne014
     * @tc.desc Verify searchElement=0o377 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(255);
      expect(arr.lastIndexOf(0o377)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0150
     * @tc.name testUint32ArrayLastIndexOfPartOne015
     * @tc.desc Verify searchElement=0b11111111 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(255);
      expect(arr.lastIndexOf(0b11111111)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0160
     * @tc.name testUint32ArrayLastIndexOfPartOne016
     * @tc.desc Verify searchElement=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100);
      expect(arr.lastIndexOf(100)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0170
     * @tc.name testUint32ArrayLastIndexOfPartOne017
     * @tc.desc Verify searchElement=1e2 100 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100);
      expect(arr.lastIndexOf(1e2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0180
     * @tc.name testUint32ArrayLastIndexOfPartOne018
     * @tc.desc Verify searchElement=2147483647 int32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483647);
      expect(arr.lastIndexOf(2147483647)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0190
     * @tc.name testUint32ArrayLastIndexOfPartOne019
     * @tc.desc Verify searchElement=2147483648 int32 MAX+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483648);
      expect(arr.lastIndexOf(2147483648)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0200
     * @tc.name testUint32ArrayLastIndexOfPartOne020
     * @tc.desc Verify searchElement=5.0 5 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.lastIndexOf(5.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0210
     * @tc.name testUint32ArrayLastIndexOfPartOne021
     * @tc.desc Verify searchElement=-0 0 0 === -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(-0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0220
     * @tc.name testUint32ArrayLastIndexOfPartOne022
     * @tc.desc Verify searchElement=0o0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(0o0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0230
     * @tc.name testUint32ArrayLastIndexOfPartOne023
     * @tc.desc Verify searchElement=0b1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      expect(arr.lastIndexOf(0b1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0240
     * @tc.name testUint32ArrayLastIndexOfPartOne024
     * @tc.desc Verify searchElement=0o1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1);
      expect(arr.lastIndexOf(0o1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0250
     * @tc.name testUint32ArrayLastIndexOfPartOne025
     * @tc.desc Verify searchElement=0o10 8 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(8);
      expect(arr.lastIndexOf(0o10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0260
     * @tc.name testUint32ArrayLastIndexOfPartOne026
     * @tc.desc Verify searchElement=0b10 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2);
      expect(arr.lastIndexOf(0b10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0270
     * @tc.name testUint32ArrayLastIndexOfPartOne027
     * @tc.desc Verify searchElement=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 1, 3, 2, 4);
      expect(arr.lastIndexOf(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0280
     * @tc.name testUint32ArrayLastIndexOfPartOne028
     * @tc.desc Verify searchElement=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 1, 3);
      expect(arr.lastIndexOf(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0290
     * @tc.name testUint32ArrayLastIndexOfPartOne029
     * @tc.desc Verify searchElement number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 6, 7);
      const target: number = 6;
      expect(arr.lastIndexOf(target)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0300
     * @tc.name testUint32ArrayLastIndexOfPartOne030
     * @tc.desc Verify searchElement E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9, 8, 7);
      const src = Uint32Array.of(9);
      expect(arr.lastIndexOf(src.$_get(0))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0310
     * @tc.name testUint32ArrayLastIndexOfPartOne031
     * @tc.desc Verify searchElement=0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(0.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0320
     * @tc.name testUint32ArrayLastIndexOfPartOne032
     * @tc.desc Verify searchElement=2.0 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 3, 4);
      expect(arr.lastIndexOf(2.0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0330
     * @tc.name testUint32ArrayLastIndexOfPartOne033
     * @tc.desc Verify searchElement=4294967294 MAX-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967294);
      expect(arr.lastIndexOf(4294967294)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0340
     * @tc.name testUint32ArrayLastIndexOfPartOne034
     * @tc.desc Verify searchElement=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2, 3, 4);
      expect(arr.lastIndexOf(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0350
     * @tc.name testUint32ArrayLastIndexOfPartOne035
     * @tc.desc Verify searchElement=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 0, 2);
      expect(arr.lastIndexOf(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0360
     * @tc.name testUint32ArrayLastIndexOfPartOne036
     * @tc.desc Verify searchElement=4294967295 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 1, 4294967295);
      expect(arr.lastIndexOf(4294967295)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0370
     * @tc.name testUint32ArrayLastIndexOfPartOne037
     * @tc.desc Verify searchElement=NaN -1 NaN !== NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      expect(arr.lastIndexOf(Number.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0380
     * @tc.name testUint32ArrayLastIndexOfPartOne038
     * @tc.desc Verify searchElement=Infinity -1 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      expect(arr.lastIndexOf(Number.POSITIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0390
     * @tc.name testUint32ArrayLastIndexOfPartOne039
     * @tc.desc Verify searchElement=-Infinity -1 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      expect(arr.lastIndexOf(-Number.POSITIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0400
     * @tc.name testUint32ArrayLastIndexOfPartOne040
     * @tc.desc Verify searchElement=-1 not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -1);
      expect(arr.lastIndexOf(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0410
     * @tc.name testUint32ArrayLastIndexOfPartOne041
     * @tc.desc Verify searchElement=-1 4294967295 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2);
      expect(arr.lastIndexOf(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0420
     * @tc.name testUint32ArrayLastIndexOfPartOne042
     * @tc.desc Verify searchElement=3.14 -1 3.14 !== 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3);
      expect(arr.lastIndexOf(3.14)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0430
     * @tc.name testUint32ArrayLastIndexOfPartOne043
     * @tc.desc Verify searchElement=5.5 -1 5.5 !== 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.lastIndexOf(5.5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0440
     * @tc.name testUint32ArrayLastIndexOfPartOne044
     * @tc.desc Verify searchElement=5.999 -1 5.999 !== 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.lastIndexOf(5.999)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0450
     * @tc.name testUint32ArrayLastIndexOfPartOne045
     * @tc.desc Verify searchElement=0.5 -1 0.5 !== 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(0.5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0460
     * @tc.name testUint32ArrayLastIndexOfPartOne046
     * @tc.desc Verify searchElement=-0.5 -1 -0.5 !== 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(-0.5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0470
     * @tc.name testUint32ArrayLastIndexOfPartOne047
     * @tc.desc Verify searchElement=4294967296 0x100000000 -1 4294967296 !== 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(4294967296)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0480
     * @tc.name testUint32ArrayLastIndexOfPartOne048
     * @tc.desc Verify searchElement=0x100000000 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(0x100000000)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0490
     * @tc.name testUint32ArrayLastIndexOfPartOne049
     * @tc.desc Verify searchElement=9007199254740991 2^53-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(9007199254740991)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0500
     * @tc.name testUint32ArrayLastIndexOfPartOne050
     * @tc.desc Verify searchElement=-2147483648 int32 MIN -1 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0);
      expect(arr.lastIndexOf(-2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0510
     * @tc.name testUint32ArrayLastIndexOfPartOne051
     * @tc.desc Verify searchElement=-2147483648 not found with strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, -2147483648);
      expect(arr.lastIndexOf(-2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0520
     * @tc.name testUint32ArrayLastIndexOfPartOne052
     * @tc.desc Verify searchElement=4294967296 0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr.$_set(0, 4294967296);
      expect(arr.lastIndexOf(4294967296)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0530
     * @tc.name testUint32ArrayLastIndexOfPartOne053
     * @tc.desc Verify searchElement=6 5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      expect(arr.lastIndexOf(6)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0540
     * @tc.name testUint32ArrayLastIndexOfPartOne054
     * @tc.desc Verify fromIndex=0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(7, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0550
     * @tc.name testUint32ArrayLastIndexOfPartOne055
     * @tc.desc Verify fromIndex=1 1 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(8, 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0560
     * @tc.name testUint32ArrayLastIndexOfPartOne056
     * @tc.desc Verify fromIndex=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(9, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0570
     * @tc.name testUint32ArrayLastIndexOfPartOne057
     * @tc.desc Verify fromIndex=length+1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(9, 4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0580
     * @tc.name testUint32ArrayLastIndexOfPartOne058
     * @tc.desc Verify fromIndex=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 2, 4);
      expect(arr.lastIndexOf(2, 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0590
     * @tc.name testUint32ArrayLastIndexOfPartOne059
     * @tc.desc Verify fromIndex=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(9, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0600
     * @tc.name testUint32ArrayLastIndexOfPartOne060
     * @tc.desc Verify fromIndex=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(8, -2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0610
     * @tc.name testUint32ArrayLastIndexOfPartOne061
     * @tc.desc Verify fromIndex=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(7, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0620
     * @tc.name testUint32ArrayLastIndexOfPartOne062
     * @tc.desc Verify fromIndex=-length+1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9, 10);
      expect(arr.lastIndexOf(8, -3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0630
     * @tc.name testUint32ArrayLastIndexOfPartOne063
     * @tc.desc Verify fromIndex=-length-1 k=-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(7, -4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0640
     * @tc.name testUint32ArrayLastIndexOfPartOne064
     * @tc.desc Verify fromIndex=-length-2 k=-2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(7, -5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0650
     * @tc.name testUint32ArrayLastIndexOfPartOne065
     * @tc.desc Verify fromIndex=-2147483648 int32 MIN k -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(7, -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0660
     * @tc.name testUint32ArrayLastIndexOfPartOne066
     * @tc.desc Verify fromIndex=2147483647 int32 MAX length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(9, 2147483647)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0670
     * @tc.name testUint32ArrayLastIndexOfPartOne067
     * @tc.desc Verify fromIndex=65536 length length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      expect(arr.lastIndexOf(9, 65536)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0680
     * @tc.name testUint32ArrayLastIndexOfPartOne068
     * @tc.desc Verify fromIndex=0 [5,5,5] 5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      expect(arr.lastIndexOf(5, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0690
     * @tc.name testUint32ArrayLastIndexOfPartOne069
     * @tc.desc Verify fromIndex=2 [5,5,5] 5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      expect(arr.lastIndexOf(5, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0700
     * @tc.name testUint32ArrayLastIndexOfPartOne070
     * @tc.desc Verify fromIndex=3 =length [5,5,5] 5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      expect(arr.lastIndexOf(5, 3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0710
     * @tc.name testUint32ArrayLastIndexOfPartOne071
     * @tc.desc Verify fromIndex=-1 [5,5,5] 5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      expect(arr.lastIndexOf(5, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0720
     * @tc.name testUint32ArrayLastIndexOfPartOne072
     * @tc.desc Verify fromIndex=-2 [5,5,5] 5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      expect(arr.lastIndexOf(5, -2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0730
     * @tc.name testUint32ArrayLastIndexOfPartOne073
     * @tc.desc Verify fromIndex=-3 =-length [5,5,5] 5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      expect(arr.lastIndexOf(5, -3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0740
     * @tc.name testUint32ArrayLastIndexOfPartOne074
     * @tc.desc Verify fromIndex=-4 =-length-1 [5,5,5] 5 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      expect(arr.lastIndexOf(5, -4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0750
     * @tc.name testUint32ArrayLastIndexOfPartOne075
     * @tc.desc Verify fromIndex=0 2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.lastIndexOf(3, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0760
     * @tc.name testUint32ArrayLastIndexOfPartOne076
     * @tc.desc Verify fromIndex=length-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.lastIndexOf(3, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0770
     * @tc.name testUint32ArrayLastIndexOfPartOne077
     * @tc.desc Verify fromIndex=4 [1,2,3,4,2] 2 4 4 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 2);
      expect(arr.lastIndexOf(2, 4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0780
     * @tc.name testUint32ArrayLastIndexOfPartOne078
     * @tc.desc Verify fromIndex=3 [1,2,3,4,2] 2 1 3 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 2);
      expect(arr.lastIndexOf(2, 3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0790
     * @tc.name testUint32ArrayLastIndexOfPartOne079
     * @tc.desc Verify fromIndex=5 =length [1,2,3,4,2] 2 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 2);
      expect(arr.lastIndexOf(2, 5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0800
     * @tc.name testUint32ArrayLastIndexOfPartOne080
     * @tc.desc Verify fromIndex=-1 [1,2,3,4,2] 2 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 2);
      expect(arr.lastIndexOf(2, -1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0810
     * @tc.name testUint32ArrayLastIndexOfPartOne081
     * @tc.desc Verify fromIndex=-5 =-length [1,2,3,4,2] 2 -1 k=0 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 2);
      expect(arr.lastIndexOf(2, -5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0820
     * @tc.name testUint32ArrayLastIndexOfPartOne082
     * @tc.desc Verify fromIndex=-6 =-length-1 [1,2,3,4,2] 2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 2);
      expect(arr.lastIndexOf(2, -6)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0830
     * @tc.name testUint32ArrayLastIndexOfPartOne083
     * @tc.desc Verify fromIndex=3 [1,2,3,2] 2 3 3 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 2);
      expect(arr.lastIndexOf(2, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0840
     * @tc.name testUint32ArrayLastIndexOfPartOne084
     * @tc.desc Verify fromIndex=4 =length [1,2,3,2] 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 2);
      expect(arr.lastIndexOf(2, 4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0850
     * @tc.name testUint32ArrayLastIndexOfPartOne085
     * @tc.desc Verify fromIndex=-1 [1,2,3,2] 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 2);
      expect(arr.lastIndexOf(2, -1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0860
     * @tc.name testUint32ArrayLastIndexOfPartOne086
     * @tc.desc Verify fromIndex=-4 =-length [2,3,4,5] 2 0 k=0 0 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2, 3, 4, 5);
      expect(arr.lastIndexOf(2, -4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0870
     * @tc.name testUint32ArrayLastIndexOfPartOne087
     * @tc.desc Verify fromIndex=2147483647 [1,2,3] 3 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      expect(arr.lastIndexOf(3, 2147483647)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0880
     * @tc.name testUint32ArrayLastIndexOfPartOne088
     * @tc.desc Verify fromIndex=-1 [5] 5 0 k=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.lastIndexOf(5, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0890
     * @tc.name testUint32ArrayLastIndexOfPartOne089
     * @tc.desc Verify fromIndex=-2 [5] 5 -1 k=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5);
      expect(arr.lastIndexOf(5, -2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0900
     * @tc.name testUint32ArrayLastIndexOfPartOne090
     * @tc.desc Verify fromIndex=0 [9,8,7] 7 -1 7 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9, 8, 7);
      expect(arr.lastIndexOf(7, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0910
     * @tc.name testUint32ArrayLastIndexOfPartOne091
     * @tc.desc Verify fromIndex=2 [9,8,7] 7 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9, 8, 7);
      expect(arr.lastIndexOf(7, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0920
     * @tc.name testUint32ArrayLastIndexOfPartOne092
     * @tc.desc Verify fromIndex=1 [9,8,7] 7 -1 1,0 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9, 8, 7);
      expect(arr.lastIndexOf(7, 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0930
     * @tc.name testUint32ArrayLastIndexOfPartOne093
     * @tc.desc Verify fromIndex=-1 [9,8,7] 9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9, 8, 7);
      expect(arr.lastIndexOf(9, -1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0940
     * @tc.name testUint32ArrayLastIndexOfPartOne094
     * @tc.desc Verify fromIndex=2 [9,8,7] 9 0 2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9, 8, 7);
      expect(arr.lastIndexOf(9, 2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_LASTINDEXOF_PARTONE_0950
     * @tc.name testUint32ArrayLastIndexOfPartOne095
     * @tc.desc Verify fromIndex=3 =length [9,8,7] 9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayLastIndexOfPartOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(9, 8, 7);
      expect(arr.lastIndexOf(9, 3)).assertEqual(0);
    });
  });
}
