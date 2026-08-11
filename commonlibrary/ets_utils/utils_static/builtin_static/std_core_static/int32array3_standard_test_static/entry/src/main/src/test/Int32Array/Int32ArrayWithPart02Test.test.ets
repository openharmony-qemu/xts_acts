'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayWithPart02Test(): void {
  describe('Int32ArrayWithPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0010
     * @tc.name int32ArrayWithPart02Test001
     * @tc.desc Verify number index + number Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 99.0);
      expect(r.length).assertEqual(3);
      expect(r.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0020
     * @tc.name int32ArrayWithPart02Test002
     * @tc.desc Verify value=Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, Number.NaN);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0030
     * @tc.name int32ArrayWithPart02Test003
     * @tc.desc Verify value=-0.0 ToInt32 0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, -0.0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0040
     * @tc.name int32ArrayWithPart02Test004
     * @tc.desc Verify value=Number.EPSILON 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5]);
      let r: Int32Array = arr.with(0, Number.EPSILON);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0050
     * @tc.name int32ArrayWithPart02Test005
     * @tc.desc Verify value=0.5 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 0.5);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0060
     * @tc.name int32ArrayWithPart02Test006
     * @tc.desc Verify value=-0.5 -1 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, -0.5);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0070
     * @tc.name int32ArrayWithPart02Test007
     * @tc.desc Verify value=1.9 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(0, 1.9);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0080
     * @tc.name int32ArrayWithPart02Test008
     * @tc.desc Verify value=-1.9 -1 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(2, -1.9);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0090
     * @tc.name int32ArrayWithPart02Test009
     * @tc.desc Verify value=3.14 .5 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 3.14);
      expect(r.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayWithPart02Test010
     * @tc.desc Verify value=-2.718 .5 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, -2.718);
      expect(r.$_get(1)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0110
     * @tc.name int32ArrayWithPart02Test011
     * @tc.desc Verify value=3.999 4 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, 3.999);
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0120
     * @tc.name int32ArrayWithPart02Test012
     * @tc.desc Verify value=-3.999 -4 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, -3.999);
      expect(r.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0130
     * @tc.name int32ArrayWithPart02Test013
     * @tc.desc Verify value=1.0000001 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, 1.0000001);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0140
     * @tc.name int32ArrayWithPart02Test014
     * @tc.desc Verify value=-1.9999999 -2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, -1.9999999);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0150
     * @tc.name int32ArrayWithPart02Test015
     * @tc.desc Verify value=0.0001 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 0.0001);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0160
     * @tc.name int32ArrayWithPart02Test016
     * @tc.desc Verify value=-0.0001 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, -0.0001);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0170
     * @tc.name int32ArrayWithPart02Test017
     * @tc.desc Verify value=2147483647.9 INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 2147483647.9);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0180
     * @tc.name int32ArrayWithPart02Test018
     * @tc.desc Verify value=-2147483648.9 INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, -2147483648.9);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0190
     * @tc.name int32ArrayWithPart02Test019
     * @tc.desc Verify value=2147483647.5 INT32_MAX 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, 2147483647.5);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayWithPart02Test020
     * @tc.desc Verify value=2147483646.5 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(0, 2147483646.5);
      expect(r.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0210
     * @tc.name int32ArrayWithPart02Test021
     * @tc.desc Verify value=-2147483647.5 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(2, -2147483647.5);
      expect(r.$_get(2)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0220
     * @tc.name int32ArrayWithPart02Test022
     * @tc.desc Verify value=-2147483648.5 INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, -2147483648.5);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0230
     * @tc.name int32ArrayWithPart02Test023
     * @tc.desc Verify with converts 4294967296.0 to 0 modulo 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 4294967296.0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0240
     * @tc.name int32ArrayWithPart02Test024
     * @tc.desc Verify with converts 4294967297.0 to 1 modulo 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 4294967297.0);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0250
     * @tc.name int32ArrayWithPart02Test025
     * @tc.desc Verify with converts -4294967296.0 to 0 modulo 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, -4294967296.0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0260
     * @tc.name int32ArrayWithPart02Test026
     * @tc.desc Verify with converts 4294967295.0 to -1 modulo 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 4294967295.0);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0270
     * @tc.name int32ArrayWithPart02Test027
     * @tc.desc Verify with converts 6442450944.0 to INT32_MIN modulo 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, 6442450944.0);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0280
     * @tc.name int32ArrayWithPart02Test028
     * @tc.desc Verify with saturates -6442450944.0 to INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7]);
      let r: Int32Array = arr.with(0, -6442450944.0);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0290
     * @tc.name int32ArrayWithPart02Test029
     * @tc.desc Verify with converts Number.MAX_SAFE_INTEGER to -1 modulo 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, Number.MAX_SAFE_INTEGER);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayWithPart02Test030
     * @tc.desc Verify with converts Number.MIN_SAFE_INTEGER to 1 modulo 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.with(0, Number.MIN_SAFE_INTEGER);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0310
     * @tc.name int32ArrayWithPart02Test031
     * @tc.desc Verify value=1.0e3 1000 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 1.0e3);
      expect(r.$_get(1)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0320
     * @tc.name int32ArrayWithPart02Test032
     * @tc.desc Verify value=1.0e9 10 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(0, 1.0e9);
      expect(r.$_get(0)).assertEqual(1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0330
     * @tc.name int32ArrayWithPart02Test033
     * @tc.desc Verify value=-1.0e9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(2, -1.0e9);
      expect(r.$_get(2)).assertEqual(-1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0340
     * @tc.name int32ArrayWithPart02Test034
     * @tc.desc Verify with converts 1.0e10 modulo 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 1.0e10);
      expect(r.$_get(1)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0350
     * @tc.name int32ArrayWithPart02Test035
     * @tc.desc Verify value=1073741824.0 2^30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(0, 1073741824.0);
      expect(r.$_get(0)).assertEqual(1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0360
     * @tc.name int32ArrayWithPart02Test036
     * @tc.desc Verify value=-1073741824.0 -2^30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(2, -1073741824.0);
      expect(r.$_get(2)).assertEqual(-1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0370
     * @tc.name int32ArrayWithPart02Test037
     * @tc.desc Verify value=32767.5 INT16_MAX 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 32767.5);
      expect(r.$_get(1)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0380
     * @tc.name int32ArrayWithPart02Test038
     * @tc.desc Verify value=-32768.5 INT16_MIN -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, -32768.5);
      expect(r.$_get(1)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0390
     * @tc.name int32ArrayWithPart02Test039
     * @tc.desc Verify value=100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(1, 100.0);
      expect(r.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayWithPart02Test040
     * @tc.desc Verify value=-50.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(0, -50.0);
      expect(r.$_get(0)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0410
     * @tc.name int32ArrayWithPart02Test041
     * @tc.desc Verify value=0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.with(2, 0.0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0420
     * @tc.name int32ArrayWithPart02Test042
     * @tc.desc Verify value=2147483647.0 MAX number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, 2147483647.0);
      expect(r.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0430
     * @tc.name int32ArrayWithPart02Test043
     * @tc.desc Verify value=-2147483648.0 MIN number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: Int32Array = arr.with(1, -2147483648.0);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0440
     * @tc.name int32ArrayWithPart02Test044
     * @tc.desc Verify value=2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(0, 2.0);
      expect(r.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0450
     * @tc.name int32ArrayWithPart02Test045
     * @tc.desc Verify index=0 + value=Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.with(0, Number.NaN);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(33);
      expect(r.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0460
     * @tc.name int32ArrayWithPart02Test046
     * @tc.desc Verify index=0 + value=1.5 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let r: Int32Array = arr.with(0, 1.5);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0470
     * @tc.name int32ArrayWithPart02Test047
     * @tc.desc Verify index=0 + value=0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let r: Int32Array = arr.with(0, 0.5);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0480
     * @tc.name int32ArrayWithPart02Test048
     * @tc.desc Verify index=length + RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(3, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0490
     * @tc.name int32ArrayWithPart02Test049
     * @tc.desc Verify index=length+1 + Number.POSITIVE_INFINITY RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(4, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayWithPart02Test050
     * @tc.desc Verify index=-length-1 + Number.NaN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(-4, Number.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0510
     * @tc.name int32ArrayWithPart02Test051
     * @tc.desc Verify index= + RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.with(999999, 3.14);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0520
     * @tc.name int32ArrayWithPart02Test052
     * @tc.desc Verify index= + RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.with(-1000000, 2147483648.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0530
     * @tc.name int32ArrayWithPart02Test053
     * @tc.desc Verify index=0 + number RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.with(0, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0540
     * @tc.name int32ArrayWithPart02Test054
     * @tc.desc Verify index=-1 + Number.POSITIVE_INFINITY RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.with(-1, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0550
     * @tc.name int32ArrayWithPart02Test055
     * @tc.desc Verify index=1 + Number.NaN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      try {
        arr.with(1, Number.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0560
     * @tc.name int32ArrayWithPart02Test056
     * @tc.desc Verify index=-2 + RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      try {
        arr.with(-2, 2147483648.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0570
     * @tc.name int32ArrayWithPart02Test057
     * @tc.desc Verify index=INT32_MAX 2147483647 + RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.with(2147483647, 0.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0580
     * @tc.name int32ArrayWithPart02Test058
     * @tc.desc Verify index=2 (=length) + RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8]);
      try {
        arr.with(2, -0.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0590
     * @tc.name int32ArrayWithPart02Test059
     * @tc.desc Verify index=-3 (=-length-1) + MAX+1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8]);
      try {
        arr.with(-3, 2147483648.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayWithPart02Test060
     * @tc.desc Verify with preserves length and replaces the selected element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Object = arr.with(1, 99.0);
      expect((r as Int32Array).length).assertEqual(3);
      expect((r as Int32Array).$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0610
     * @tc.name int32ArrayWithPart02Test061
     * @tc.desc Verify number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(1, 99.0);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0620
     * @tc.name int32ArrayWithPart02Test062
     * @tc.desc Verify with(0, 0.5) converts the replacement value to Int32 and returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = arr.with(0, 0.5);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(r).not().assertEqual(arr);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0630
     * @tc.name int32ArrayWithPart02Test063
     * @tc.desc Verify number length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(1, 3.14);
      expect(r.length).assertEqual(3);
      expect(r.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0640
     * @tc.name int32ArrayWithPart02Test064
     * @tc.desc Verify number byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.with(2, -0.5);
      expect(r.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0650
     * @tc.name int32ArrayWithPart02Test065
     * @tc.desc Verify number byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(0, Number.POSITIVE_INFINITY);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0660
     * @tc.name int32ArrayWithPart02Test066
     * @tc.desc Verify number length=1 byteLength=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let r: Int32Array = arr.with(0, 7.7);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0670
     * @tc.name int32ArrayWithPart02Test067
     * @tc.desc Verify number buffer byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(1, 99.0);
      expect(r.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0680
     * @tc.name int32ArrayWithPart02Test068
     * @tc.desc Verify with truncates 99.9 to 99 and preserves the other elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.with(0, 99.9);
      expect(r.$_get(0)).assertEqual(99);
      expect(r.$_get(1)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(33);
      expect(r.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0690
     * @tc.name int32ArrayWithPart02Test069
     * @tc.desc Verify Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.with(2, Number.NaN);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayWithPart02Test070
     * @tc.desc Verify with converts 2147483648.0 to the minimum Int32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(2, 2147483648.0);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0710
     * @tc.name int32ArrayWithPart02Test071
     * @tc.desc Verify calling with does not mutate the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      arr.with(1, 99.9);
      expect(arr.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0720
     * @tc.name int32ArrayWithPart02Test072
     * @tc.desc Verify Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      arr.with(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0730
     * @tc.name int32ArrayWithPart02Test073
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      arr.with(2, 2147483648.0);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0740
     * @tc.name int32ArrayWithPart02Test074
     * @tc.desc Verify Number.POSITIVE_INFINITY byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      arr.with(1, Number.POSITIVE_INFINITY);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0750
     * @tc.name int32ArrayWithPart02Test075
     * @tc.desc Verify + Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(99, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0760
     * @tc.name int32ArrayWithPart02Test076
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200]);
      arr.with(0, 3.9);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0770
     * @tc.name int32ArrayWithPart02Test077
     * @tc.desc Verify number buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(1, 3.14);
      expect(r.buffer).not().assertEqual(arr.buffer);
      expect(r.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0780
     * @tc.name int32ArrayWithPart02Test078
     * @tc.desc Verify $_set number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(1, Number.NaN);
      r.$_set(0, 777);
      expect(arr.$_get(0)).assertEqual(11);
      expect(r.$_get(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0790
     * @tc.name int32ArrayWithPart02Test079
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(2, 2147483648.0);
      r.$_set(2, 0);
      expect(arr.$_get(2)).assertEqual(33);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayWithPart02Test080
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(1, 99.0);
      arr.$_set(0, 888);
      expect(r.$_get(0)).assertEqual(11);
      expect(r.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0810
     * @tc.name int32ArrayWithPart02Test081
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.with(1, 0.5);
      r.$_set(0, 111);
      r.$_set(2, 222);
      r.$_set(3, 333);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0820
     * @tc.name int32ArrayWithPart02Test082
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r: Int32Array = arr.with(0, 1.5).with(3, -2.5);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(33);
      expect(r.$_get(3)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0830
     * @tc.name int32ArrayWithPart02Test083
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: Int32Array = arr.with(0, 2147483648.0).with(3, -1.9);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0840
     * @tc.name int32ArrayWithPart02Test084
     * @tc.desc Verify with buffer number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r1: Int32Array = arr.with(0, Number.NaN);
      let r2: Int32Array = r1.with(2, Number.POSITIVE_INFINITY);
      expect(r1.buffer).not().assertEqual(r2.buffer);
      expect(arr.buffer).not().assertEqual(r1.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0850
     * @tc.name int32ArrayWithPart02Test085
     * @tc.desc Verify with converts Number.NaN to 0 and 2147483648.0 to INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r1: Int32Array = arr.with(0, Number.NaN);
      let r2: Int32Array = arr.with(2, 2147483648.0);
      expect(r1.$_get(0)).assertEqual(0);
      expect(r1.$_get(2)).assertEqual(33);
      expect(r2.$_get(0)).assertEqual(11);
      expect(r2.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0860
     * @tc.name int32ArrayWithPart02Test086
     * @tc.desc Verify number Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: Int32Array = arr.with(2, Number.NaN);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0870
     * @tc.name int32ArrayWithPart02Test087
     * @tc.desc Verify MAX number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      let r: Int32Array = arr.with(1, 123.456);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(123);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0880
     * @tc.name int32ArrayWithPart02Test088
     * @tc.desc Verify MIN number MIN-1 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let r: Int32Array = arr.with(0, -2147483649.0);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0890
     * @tc.name int32ArrayWithPart02Test089
     * @tc.desc Verify number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-10, -20, -30]);
      let r: Int32Array = arr.with(1, 20.2);
      expect(r.$_get(0)).assertEqual(-10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayWithPart02Test090
     * @tc.desc Verify with truncates -7.7 to -7 and preserves the other elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let r: Int32Array = arr.with(2, -7.7);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(-7);
      expect(r.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0910
     * @tc.name int32ArrayWithPart02Test091
     * @tc.desc Verify Int32Array.of number with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let r: Int32Array = arr.with(1, 99.9);
      expect(r.$_get(1)).assertEqual(99);
      expect(arr.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0920
     * @tc.name int32ArrayWithPart02Test092
     * @tc.desc Verify ArrayBuffer number with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      let r: Int32Array = arr.with(1, Number.NaN);
      expect(r.$_get(1)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(22);
      expect(r.buffer).not().assertEqual(buf);
      expect(r.byteOffset).assertEqual(0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0930
     * @tc.name int32ArrayWithPart02Test093
     * @tc.desc Verify subarray number with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let full: Int32Array = new Int32Array([11, 22, 33, 44, 55]);
      let sub: Int32Array = full.subarray(1, 4);
      let r: Int32Array = sub.with(1, 99.9);
      expect(r.length).assertEqual(3);
      expect(r.$_get(1)).assertEqual(99);
      expect(r.$_get(0)).assertEqual(22);
      expect(r.$_get(2)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0940
     * @tc.name int32ArrayWithPart02Test094
     * @tc.desc Verify subarray Number.NaN with buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let full: Int32Array = new Int32Array([11, 22, 33, 44, 55]);
      let sub: Int32Array = full.subarray(1, 4);
      let r: Int32Array = sub.with(0, Number.NaN);
      expect(r.buffer).not().assertEqual(sub.buffer);
      expect(r.buffer).not().assertEqual(full.buffer);
      r.$_set(0, 888);
      expect(full.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0950
     * @tc.name int32ArrayWithPart02Test095
     * @tc.desc Verify byteOffset subarray number with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let full: Int32Array = new Int32Array([11, 22, 33, 44, 55]);
      let sub: Int32Array = full.subarray(2, 5);
      let r: Int32Array = sub.with(1, 2147483648.0);
      expect(r.byteOffset).assertEqual(0);
      expect(r.$_get(0)).assertEqual(33);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0960
     * @tc.name int32ArrayWithPart02Test096
     * @tc.desc Verify chained with calls truncate decimal replacements and preserve the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let r: Int32Array = arr.with(0, 1.1).with(1, 2.2).with(2, 3.3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0970
     * @tc.name int32ArrayWithPart02Test097
     * @tc.desc Verify MAX/MIN/0/-1 number .0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: Int32Array = arr.with(0, 2147483647.0).with(1, -2147483648.0).with(2, 0.0).with(3, -1.0);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(-2147483648);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0980
     * @tc.name int32ArrayWithPart02Test098
     * @tc.desc Verify Number.NaN/ / number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300, 400, 500]);
      let r: Int32Array = arr.with(0, Number.NaN).with(2, 2147483648.0).with(4, -3.7);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(200);
      expect(r.$_get(2)).assertEqual(-2147483648);
      expect(r.$_get(3)).assertEqual(400);
      expect(r.$_get(4)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_0990
     * @tc.name int32ArrayWithPart02Test099
     * @tc.desc Verify index=length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(3, 0.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayWithPart02Test100
     * @tc.desc Verify -length-1 + RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.with(-4, -3.14);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_1010
     * @tc.name int32ArrayWithPart02Test101
     * @tc.desc Verify index=0 on empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      try {
        arr.with(0, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_1020
     * @tc.name int32ArrayWithPart02Test102
     * @tc.desc Verify index=INT32_MAX + Number.NaN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.with(2147483647, Number.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_WITH_PART02_TEST_MINDMAP_1030
     * @tc.name int32ArrayWithPart02Test103
     * @tc.desc Verify length number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayWithPart02Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.with(5, 999.9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });
  });
}
