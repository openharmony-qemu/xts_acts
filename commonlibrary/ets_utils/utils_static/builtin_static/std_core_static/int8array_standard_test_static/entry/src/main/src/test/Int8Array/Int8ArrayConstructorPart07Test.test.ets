'use static';

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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int8ArrayConstructorPart07Test(): void {
  describe('Int8ArrayConstructorPart07Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {
      Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0100
     * @tc.name int8ArrayConstructorPart07Test001
     * @tc.desc Verify length expects 0 on new Int8Array(src)
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
     * @tc.desc Verify length expects 1 on new Int8Array(src)
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
     * @tc.desc Verify length expects 3 on new Int8Array(src)
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
     * @tc.desc Verify new Int8Array(big) constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart07Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: Array<int> = [];
      let i: int = 0;
      while (i < 1000) {
        big.push(INT8_MAX);
        i = i + 1;
      }
      let r1: int = big.length;
      let e1: int = 1000;
      expect(r1).assertEqual(e1);
      let r: Int8Array = new Int8Array(big);
      expect(r.length).assertEqual(1000);
      expect(r.$_get(999)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART07_TEST_0500
     * @tc.name int8ArrayConstructorPart07Test005
     * @tc.desc Verify $_get expects INT8_MAX, on new Int8Array([INT8_MAX])
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
     * @tc.desc Verify $_get expects -128, on new Int8Array([128])
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
     * @tc.desc Verify $_get expects -1, on new Int8Array([255])
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
     * @tc.desc Verify $_get expects 0, on new Int8Array([256])
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
     * @tc.desc Verify $_get expects -128, on new Int8Array([-128])
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
     * @tc.desc Verify $_get expects INT8_MAX, on new Int8Array([-129])
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
     * @tc.desc Verify $_get expects 1, on new Int8Array([-255])
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
     * @tc.desc Verify $_get expects 0, on new Int8Array([-256])
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
     * @tc.desc Verify $_get expects -1, on new Int8Array([-257])
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
     * @tc.desc Verify $_get expects 0, on new Int8Array([0])
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
     * @tc.desc Verify $_get expects -1, on new Int8Array([-1])
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
     * @tc.desc Verify $_get expects -INT8_MAX, on new Int8Array([129])
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
     * @tc.desc Verify $_get expects -2 on new Int8Array(src)
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
     * @tc.desc Verify $_get expects -INT8_MAX, on new Int8Array([-INT8_MAX])
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
     * @tc.desc Verify $_get expects -1, on new Int8Array([2147483647])
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
     * @tc.desc Verify $_get expects 0, on new Int8Array([-2147483648])
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
     * @tc.desc Verify $_get expects 1, on new Int8Array([1])
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
     * @tc.desc Verify $_get expects 126 on new Int8Array(src)
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
     * @tc.desc Verify length expects 3, with $_get(0) expects 0, on new Int8Array(src)
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
     * @tc.desc Verify length expects 3, with $_get(0) expects INT8_MAX, on new Int8Array(src)
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
     * @tc.desc Verify length expects 3, with $_get(0) expects -128, on new Int8Array(src)
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
     * @tc.desc Verify length expects 2, with $_get(0) expects -1, on new Int8Array(src)
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
     * @tc.desc Verify $_get expects 50 on new Int8Array(src)
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
     * @tc.desc Verify $_get expects -128, on new Int8Array([128, -129, 255])
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
     * @tc.desc Verify $_get expects -1, on new Int8Array([2147483647, -2147483648])
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
     * @tc.desc Verify length expects 3, with $_get(0) expects -128 (overflow truncation), on new Int8Array(src)
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
     * @tc.desc Verify $_get expects 0, on new Int8Array([0, INT8_MAX, -128, 128, -129])
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
     * @tc.desc Verify $_get expects -1, on new Int8Array([2147483647, -2147483648, 128, -129])
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
     * @tc.desc Verify $_get expects INT8_MAX, on new Int8Array([INT8_MAX, 128, 255, 256, -128, -129])
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
     * @tc.desc Verify $_get expects 0, on new Int8Array([256, 255, 128, INT8_MAX])
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
     * @tc.desc Verify $_get expects INT8_MAX, on new Int8Array([INT8_MAX, 128])
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
     * @tc.desc Verify $_get expects -128, on new Int8Array([-128, -129])
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
     * @tc.desc Verify $_get expects -1, on new Int8Array([255, 256])
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
     * @tc.desc Verify $_get expects -128, on new Int8Array([128, 0])
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
     * @tc.desc Verify $_get expects -1, on new Int8Array([-1, 255])
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
     * @tc.desc Verify $_get expects 3, with $_get(0), on new Int8Array(src)
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
     * @tc.desc Verify $_get expects INT8_MAX, on new Int8Array([INT8_MAX, 0, -128])
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
     * @tc.desc Verify $_get expects 1, on new Int8Array([1, -1, 1, -1])
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
     * @tc.desc Verify byteLength returns 2, with $_get(0) expects 100, on new Int8Array(src)
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
     * @tc.desc Verify $_get expects -56 on new Int8Array(src)
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
     * @tc.desc Verify length expects src.length on new Int8Array(src)
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
     * @tc.desc Verify byteLength of new Int8Array(src) returns 3
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
     * @tc.desc Verify byteOffset of new Int8Array(src) returns 0
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
     * @tc.desc Verify buffer.byteLength of new Int8Array(src) returns src.length
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
     * @tc.desc Verify buffer.byteLength of new Int8Array(src) returns 3
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
     * @tc.desc Verify equals 1 for Int8Array BYTES_PER_ELEMENT on new Int8Array(src)
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
     * @tc.desc Verify $_get expects 10, on new Int8Array(src)
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
     * @tc.desc Verify $_get expects 20 on new Int8Array(src)
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
     * @tc.desc Verify $_get expects 30 on new Int8Array(src)
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
     * @tc.desc Verify at expects 10 on new Int8Array(src)
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
     * @tc.desc Verify at expects 30 on new Int8Array(src)
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
     * @tc.desc Verify toString of new Int8Array(src) returns '10,20,30'
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
     * @tc.desc Verify indexOf expects 1 on new Int8Array(src)
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
     * @tc.desc Verify indexOf expects -1 on new Int8Array(src)
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
     * @tc.desc Verify includes(30) of new Int8Array(src) returns true
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
     * @tc.desc Verify includes(99) of new Int8Array(src) returns false
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
     * @tc.desc Verify join expects 10|20|30 on new Int8Array(src)
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
     * @tc.desc Verify byteLength of new Int8Array(src) returns 0
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
     * @tc.desc Verify toString of new Int8Array(src) returns ''
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
     * @tc.desc Verify buffer.byteLength of new Int8Array(src) returns 0
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
     * @tc.desc Verify at(0) of new Int8Array([]) returns undefined
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
     * @tc.desc Verify join of new Int8Array(src) returns ''
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
     * @tc.desc Verify $_get expects 42 on new Int8Array(src)
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
     * @tc.desc Verify at expects 42 on new Int8Array(src)
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
     * @tc.desc Verify toString expects 42 on new Int8Array(src)
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
     * @tc.desc Verify Int8Array independence: src.push(99) does not affect Int8Array length or elements on new Int8Array(src)
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
     * @tc.desc Verify Int8Array independence: src[0]=99 does not affect Int8Array element on new Int8Array(src)
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
     * @tc.desc Verify Int8Array independence: $_set does not affect source Array on new Int8Array(src)
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
     * @tc.desc Verify $_set(0,128) truncation to -128 and source Array independence on new Int8Array(src)
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
     * @tc.desc Verify two Int8Array instances from same source are independent on new Int8Array(src)
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
     * @tc.desc Verify copyWithin does not affect source Array on new Int8Array(src)
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
     * @tc.desc Verify subarray shares buffer, modification is bidirectional expects 99 on new Int8Array(src)
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
     * @tc.desc Verify subarray shares buffer, modification is bidirectional expects 77 on new Int8Array(src)
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
     * @tc.desc Verify Int8Array snapshots source values at creation time, unaffected by later mutation on new Int8Array(src)
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
     * @tc.desc Verify reverse does not affect source Array on new Int8Array(src)
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
     * @tc.desc Verify fill does not affect source Array on new Int8Array(src)
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
     * @tc.desc Verify Int8Array independence: src.pop() does not affect Int8Array on new Int8Array(src)
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
     * @tc.desc Verify sort does not affect source Array on new Int8Array(src)
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
     * @tc.desc Verify length expects 7, with $_get(0)/$_get(3)/$_get(5)/$_get(6) truncation, on new Int8Array(src)
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
