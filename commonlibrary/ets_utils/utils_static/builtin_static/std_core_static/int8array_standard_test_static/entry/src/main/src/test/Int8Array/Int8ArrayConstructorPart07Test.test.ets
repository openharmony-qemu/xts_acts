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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayConstructorPart07TestTest(): void {
  describe('Int8ArrayConstructorPart07TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0100
     * @tc.name int8ArrayConstructorPart07Test001
     * @tc.desc Verify Array<int> 0 Int8Array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0200
     * @tc.name int8ArrayConstructorPart07Test002
     * @tc.desc Verify Array<int> length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0300
     * @tc.name int8ArrayConstructorPart07Test003
     * @tc.desc Verify Array<int> length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0400
     * @tc.name int8ArrayConstructorPart07Test004
     * @tc.desc Verify Array<int> 1000 127 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: Array<int> = [];
      for (let i = 0; i < 1000; i++) {
        big.push(INT8_MAX);
      }
      let r: Int8Array = new Int8Array(big);
      expect(r.length).assertEqual(1000);
      expect(r.$_get(999)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0500
     * @tc.name int8ArrayConstructorPart07Test005
     * @tc.desc Verify [127] 127 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [INT8_MAX];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0600
     * @tc.name int8ArrayConstructorPart07Test006
     * @tc.desc Verify [128] -128 max+1 min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [128];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0700
     * @tc.name int8ArrayConstructorPart07Test007
     * @tc.desc Verify [255] -1 0xFF -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [255];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0800
     * @tc.name int8ArrayConstructorPart07Test008
     * @tc.desc Verify [256] 0 +1 0x00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [256];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0900
     * @tc.name int8ArrayConstructorPart07Test009
     * @tc.desc Verify [-128] -128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-128];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1000
     * @tc.name int8ArrayConstructorPart07Test010
     * @tc.desc Verify [-129] 127 min-1 max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-129];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1100
     * @tc.name int8ArrayConstructorPart07Test011
     * @tc.desc Verify [-255] 1 0x01 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-255];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1200
     * @tc.name int8ArrayConstructorPart07Test012
     * @tc.desc Verify [-256] 0 0x00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-256];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1300
     * @tc.name int8ArrayConstructorPart07Test013
     * @tc.desc Verify [-257] -1 0xFF -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-257];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1400
     * @tc.name int8ArrayConstructorPart07Test014
     * @tc.desc Verify [0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1500
     * @tc.name int8ArrayConstructorPart07Test015
     * @tc.desc Verify [-1] -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1600
     * @tc.name int8ArrayConstructorPart07Test016
     * @tc.desc Verify [129] -127 max+2 min+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [129];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1700
     * @tc.name int8ArrayConstructorPart07Test017
     * @tc.desc Verify [254] -2 -1 0xFE -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [254];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1800
     * @tc.name int8ArrayConstructorPart07Test018
     * @tc.desc Verify [-127] -127 min+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-INT8_MAX];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_1900
     * @tc.name int8ArrayConstructorPart07Test019
     * @tc.desc Verify [2147483647] -1 int32 0xFF -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2000
     * @tc.name int8ArrayConstructorPart07Test020
     * @tc.desc Verify [-2147483648] 0 int32 0x00 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-2147483648];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2100
     * @tc.name int8ArrayConstructorPart07Test021
     * @tc.desc Verify [1] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2200
     * @tc.name int8ArrayConstructorPart07Test022
     * @tc.desc Verify [-130] 126 0x7E 126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-130];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2300
     * @tc.name int8ArrayConstructorPart07Test023
     * @tc.desc Verify [0,0,0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, 0, 0];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2400
     * @tc.name int8ArrayConstructorPart07Test024
     * @tc.desc Verify [127,127,127] 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [INT8_MAX, INT8_MAX, INT8_MAX];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2500
     * @tc.name int8ArrayConstructorPart07Test025
     * @tc.desc Verify [-128,-128,-128] -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-128, -128, -128];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2600
     * @tc.name int8ArrayConstructorPart07Test026
     * @tc.desc Verify -1 [-1,-1] -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1, -1];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2700
     * @tc.name int8ArrayConstructorPart07Test027
     * @tc.desc Verify [50,-50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [50, -50];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(50);
      expect(r.$_get(1)).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2800
     * @tc.name int8ArrayConstructorPart07Test028
     * @tc.desc Verify [128,-129,255] [-128,127,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [128, -129, 255];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-128);
      expect(r.$_get(1)).assertEqual(INT8_MAX);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_2900
     * @tc.name int8ArrayConstructorPart07Test029
     * @tc.desc Verify int32 [2147483647,-2147483648] [-1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647, -2147483648];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3000
     * @tc.name int8ArrayConstructorPart07Test030
     * @tc.desc Verify [128,128,128] [-128,-128,-128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [128, 128, 128];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(-128);
      expect(r.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3100
     * @tc.name int8ArrayConstructorPart07Test031
     * @tc.desc Verify 5 [0,127,-128,128,-129] [0,127,-128,-128,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, INT8_MAX, -128, 128, -129];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(INT8_MAX);
      expect(r.$_get(2)).assertEqual(-128);
      expect(r.$_get(3)).assertEqual(-128);
      expect(r.$_get(4)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3200
     * @tc.name int8ArrayConstructorPart07Test032
     * @tc.desc Verify int32 [2147483647,-2147483648,128,-129] [-1,0,-128,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [2147483647, -2147483648, 128, -129];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(-128);
      expect(r.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3300
     * @tc.name int8ArrayConstructorPart07Test033
     * @tc.desc Verify 6 [127,128,255,256,-128,-129] [127,-128,-1,0,-128,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [INT8_MAX, 128, 255, 256, -128, -129];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
      expect(r.$_get(1)).assertEqual(-128);
      expect(r.$_get(2)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(-128);
      expect(r.$_get(5)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3400
     * @tc.name int8ArrayConstructorPart07Test034
     * @tc.desc Verify [256,255,128,127] [0,-1,-128,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [256, 255, 128, INT8_MAX];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(-128);
      expect(r.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3500
     * @tc.name int8ArrayConstructorPart07Test035
     * @tc.desc Verify [127,128] [127,-128] max max+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [INT8_MAX, 128];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
      expect(r.$_get(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3600
     * @tc.name int8ArrayConstructorPart07Test036
     * @tc.desc Verify [-128,-129] [-128,127] min min-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-128, -129];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-128);
      expect(r.$_get(1)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3700
     * @tc.name int8ArrayConstructorPart07Test037
     * @tc.desc Verify [255,256] [-1,0] max max+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [255, 256];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3800
     * @tc.name int8ArrayConstructorPart07Test038
     * @tc.desc Verify [128,0] [-128,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [128, 0];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-128);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_3900
     * @tc.name int8ArrayConstructorPart07Test039
     * @tc.desc Verify [-1,255] [-1,-1] max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [-1, 255];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4000
     * @tc.name int8ArrayConstructorPart07Test040
     * @tc.desc Verify [3,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [3, 1, 2];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4100
     * @tc.name int8ArrayConstructorPart07Test041
     * @tc.desc Verify [127,0,-128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [INT8_MAX, 0, -128];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(INT8_MAX);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4200
     * @tc.name int8ArrayConstructorPart07Test042
     * @tc.desc Verify [1,-1,1,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [1, -1, 1, -1];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4300
     * @tc.name int8ArrayConstructorPart07Test043
     * @tc.desc Verify Array<int> [100,-100] Int8Array 1 byteLength===2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [100, -100];
      let r: Int8Array = new Int8Array(src);
      expect(r.byteLength).assertEqual(2);
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4400
     * @tc.name int8ArrayConstructorPart07Test044
     * @tc.desc Verify Array<int> [200,300] int8 [-56,44]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [200, 300];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(-56);
      expect(r.$_get(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4500
     * @tc.name int8ArrayConstructorPart07Test045
     * @tc.desc Verify Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4600
     * @tc.name int8ArrayConstructorPart07Test046
     * @tc.desc Verify byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4700
     * @tc.name int8ArrayConstructorPart07Test047
     * @tc.desc Verify byteOffset 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4800
     * @tc.name int8ArrayConstructorPart07Test048
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.buffer.byteLength).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_4900
     * @tc.name int8ArrayConstructorPart07Test049
     * @tc.desc Verify buffer.byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5000
     * @tc.name int8ArrayConstructorPart07Test050
     * @tc.desc Verify BYTES_PER_ELEMENT 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5100
     * @tc.name int8ArrayConstructorPart07Test051
     * @tc.desc Verify $_get(0) 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5200
     * @tc.name int8ArrayConstructorPart07Test052
     * @tc.desc Verify $_get(1) 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5300
     * @tc.name int8ArrayConstructorPart07Test053
     * @tc.desc Verify $_get(2) 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5400
     * @tc.name int8ArrayConstructorPart07Test054
     * @tc.desc Verify at(0) 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5500
     * @tc.name int8ArrayConstructorPart07Test055
     * @tc.desc Verify at(-1) 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5600
     * @tc.name int8ArrayConstructorPart07Test056
     * @tc.desc Verify toString() '10,20,30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5700
     * @tc.name int8ArrayConstructorPart07Test057
     * @tc.desc Verify indexOf(20) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.indexOf(20)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5800
     * @tc.name int8ArrayConstructorPart07Test058
     * @tc.desc Verify indexOf(99) -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_5900
     * @tc.name int8ArrayConstructorPart07Test059
     * @tc.desc Verify includes(30) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.includes(30)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6000
     * @tc.name int8ArrayConstructorPart07Test060
     * @tc.desc Verify includes(99) false false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6100
     * @tc.name int8ArrayConstructorPart07Test061
     * @tc.desc Verify join('|') '10|20|30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      expect(r.join('|')).assertEqual('10|20|30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6200
     * @tc.name int8ArrayConstructorPart07Test062
     * @tc.desc Verify byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let r: Int8Array = new Int8Array(src);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6300
     * @tc.name int8ArrayConstructorPart07Test063
     * @tc.desc Verify toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let r: Int8Array = new Int8Array(src);
      expect(r.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6400
     * @tc.name int8ArrayConstructorPart07Test064
     * @tc.desc Verify buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let r: Int8Array = new Int8Array(src);
      expect(r.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6500
     * @tc.name int8ArrayConstructorPart07Test065
     * @tc.desc Verify at(0) undefined undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let r: Int8Array = new Int8Array(src);
      expect(r.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6600
     * @tc.name int8ArrayConstructorPart07Test066
     * @tc.desc Verify join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [];
      let r: Int8Array = new Int8Array(src);
      expect(r.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6700
     * @tc.name int8ArrayConstructorPart07Test067
     * @tc.desc Verify $_get(0) 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let r: Int8Array = new Int8Array(src);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6800
     * @tc.name int8ArrayConstructorPart07Test068
     * @tc.desc Verify at(-1) 42 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let r: Int8Array = new Int8Array(src);
      expect(r.at(-1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_6900
     * @tc.name int8ArrayConstructorPart07Test069
     * @tc.desc Verify toString() '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [42];
      let r: Int8Array = new Int8Array(src);
      expect(r.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7000
     * @tc.name int8ArrayConstructorPart07Test070
     * @tc.desc Verify src.push(99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      src.push(99);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7100
     * @tc.name int8ArrayConstructorPart07Test071
     * @tc.desc Verify src[0]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      src[0] = 99;
      expect(r.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7200
     * @tc.name int8ArrayConstructorPart07Test072
     * @tc.desc Verify result.$_set(0,50) src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      r.$_set(0, 50);
      expect(src[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7300
     * @tc.name int8ArrayConstructorPart07Test073
     * @tc.desc Verify result.$_set(0,128) -128 src +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      r.$_set(0, 128);
      expect(r.$_get(0)).assertEqual(-128);
      expect(src[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7400
     * @tc.name int8ArrayConstructorPart07Test074
     * @tc.desc Verify src r1 r2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r1: Int8Array = new Int8Array(src);
      let r2: Int8Array = new Int8Array(src);
      r1.$_set(0, 99);
      expect(r2.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7500
     * @tc.name int8ArrayConstructorPart07Test075
     * @tc.desc Verify result.copyWithin(0,1,2) src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      r.copyWithin(0, 1, 2);
      expect(src[0]).assertEqual(10);
      expect(src[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7600
     * @tc.name int8ArrayConstructorPart07Test076
     * @tc.desc Verify subarray(0,2) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      let v: Int8Array = r.subarray(0, 2);
      v.$_set(0, 99);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7700
     * @tc.name int8ArrayConstructorPart07Test077
     * @tc.desc Verify subarray(1,3) buffer index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      let v: Int8Array = r.subarray(1, 3);
      v.$_set(0, 77);
      expect(r.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7800
     * @tc.name int8ArrayConstructorPart07Test078
     * @tc.desc Verify src src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r1: Int8Array = new Int8Array(src);
      src[0] = 99;
      let r2: Int8Array = new Int8Array(src);
      expect(r1.$_get(0)).assertEqual(10);
      expect(r2.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_7900
     * @tc.name int8ArrayConstructorPart07Test079
     * @tc.desc Verify result.reverse() src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      r.reverse();
      expect(src[0]).assertEqual(10);
      expect(src[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_8000
     * @tc.name int8ArrayConstructorPart07Test080
     * @tc.desc Verify result.fill(7) src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      r.fill(7);
      expect(src[0]).assertEqual(10);
      expect(src[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_8100
     * @tc.name int8ArrayConstructorPart07Test081
     * @tc.desc Verify src.pop()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [10, 20, 30];
      let r: Int8Array = new Int8Array(src);
      src.pop();
      expect(r.length).assertEqual(3);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_8200
     * @tc.name int8ArrayConstructorPart07Test082
     * @tc.desc Verify result.sort() src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [30, 10, 20];
      let r: Int8Array = new Int8Array(src);
      r.sort();
      expect(src[0]).assertEqual(30);
      expect(src[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_8300
     * @tc.name int8ArrayConstructorPart07Test083
     * @tc.desc Verify 7 [0,127,-128,128,-129,255,256] [0,127,-128,-128,127,-1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<int> = [0, INT8_MAX, -128, 128, -129, 255, 256];
      let r: Int8Array = new Int8Array(src);
      expect(r.length).assertEqual(7);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(-128);
      expect(r.$_get(5)).assertEqual(-1);
      expect(r.$_get(6)).assertEqual(0);
    });

  });
}
