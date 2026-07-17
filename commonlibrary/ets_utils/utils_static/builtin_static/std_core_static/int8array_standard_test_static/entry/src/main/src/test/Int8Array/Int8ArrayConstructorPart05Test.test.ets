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

export default function int8ArrayConstructorPart05TestTest(): void {
  describe('Int8ArrayConstructorPart05TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0100
     * @tc.name int8ArrayConstructorPart05Test001
     * @tc.desc Verify FixedArray<number> , arity=1 , length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20];
      const arr = new Int8Array(fa);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0200
     * @tc.name int8ArrayConstructorPart05Test002
     * @tc.desc Verify FixedArray<number> , arity=1 , length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [7];
      const arr = new Int8Array(fa);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0300
     * @tc.name int8ArrayConstructorPart05Test003
     * @tc.desc Verify [42] , length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [42];
      const arr = new Int8Array(fa);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0400
     * @tc.name int8ArrayConstructorPart05Test004
     * @tc.desc Verify [10, 20, 30] , length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0500
     * @tc.name int8ArrayConstructorPart05Test005
     * @tc.desc Verify 12 , length=12 / /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [INT8_MAX, -128, 0, 64, -64, 100, -100, 32, -32, 1, -1, 50];
      const arr = new Int8Array(fa);
      expect(arr.length).assertEqual(12);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(6)).assertEqual(-100);
      expect(arr.$_get(11)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0600
     * @tc.name int8ArrayConstructorPart05Test006
     * @tc.desc Verify 0 [0, 0, 0] , 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [0, 0, 0];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0700
     * @tc.name int8ArrayConstructorPart05Test007
     * @tc.desc Verify [127, 127, 127] , 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [INT8_MAX, INT8_MAX, INT8_MAX];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0800
     * @tc.name int8ArrayConstructorPart05Test008
     * @tc.desc Verify [-128, -128] , -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [-128, -128];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_0900
     * @tc.name int8ArrayConstructorPart05Test009
     * @tc.desc Verify [127, -128, 0] ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [INT8_MAX, -128, 0];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(-128);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1000
     * @tc.name int8ArrayConstructorPart05Test010
     * @tc.desc Verify [10, 10, 20, 20] ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 10, 20, 20];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1100
     * @tc.name int8ArrayConstructorPart05Test011
     * @tc.desc Verify 127, 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [INT8_MAX, 30, 50];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1200
     * @tc.name int8ArrayConstructorPart05Test012
     * @tc.desc Verify 50, -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [50, 30, -128];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1300
     * @tc.name int8ArrayConstructorPart05Test013
     * @tc.desc Verify [127, -128, 127, -128] ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [INT8_MAX, -128, INT8_MAX, -128];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(-128);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
      expect(arr.$_get(3)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1400
     * @tc.name int8ArrayConstructorPart05Test014
     * @tc.desc Verify 0 0 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [0];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1500
     * @tc.name int8ArrayConstructorPart05Test015
     * @tc.desc Verify 1 1 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [1];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1600
     * @tc.name int8ArrayConstructorPart05Test016
     * @tc.desc Verify 127 127 (int8 , )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [INT8_MAX];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1700
     * @tc.name int8ArrayConstructorPart05Test017
     * @tc.desc Verify -1 -1 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [-1];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1800
     * @tc.name int8ArrayConstructorPart05Test018
     * @tc.desc Verify -128 -128 (int8 , )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [-128];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_1900
     * @tc.name int8ArrayConstructorPart05Test019
     * @tc.desc Verify 128 -128 ( +1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2000
     * @tc.name int8ArrayConstructorPart05Test020
     * @tc.desc Verify -129 127 ( -1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [-129];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2100
     * @tc.name int8ArrayConstructorPart05Test021
     * @tc.desc Verify 255 -1 ( 1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [255];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2200
     * @tc.name int8ArrayConstructorPart05Test022
     * @tc.desc Verify 256 0 ( 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [256];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2300
     * @tc.name int8ArrayConstructorPart05Test023
     * @tc.desc Verify -256 0 ( 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [-256];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2400
     * @tc.name int8ArrayConstructorPart05Test024
     * @tc.desc Verify 2147483647 (int ) -1 ( 8 0xFF )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [2147483647];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2500
     * @tc.name int8ArrayConstructorPart05Test025
     * @tc.desc Verify -2147483648 (int ) 0 ( 8 0x00 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [-2147483648];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2600
     * @tc.name int8ArrayConstructorPart05Test026
     * @tc.desc Verify [127, 128, -128, -129] [127, -128, -128, 127] ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [INT8_MAX, 128, -128, -129];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(-128);
      expect(arr.$_get(2)).assertEqual(-128);
      expect(arr.$_get(3)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2700
     * @tc.name int8ArrayConstructorPart05Test027
     * @tc.desc Verify [255, 256, 0, 1] [-1, 0, 0, 1] ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [255, 256, 0, 1];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2800
     * @tc.name int8ArrayConstructorPart05Test028
     * @tc.desc Verify [2147483647, -2147483648, 128] [-1, 0, -128] (int )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [2147483647, -2147483648, 128];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_2900
     * @tc.name int8ArrayConstructorPart05Test029
     * @tc.desc Verify [128, 128, 128] [-128, -128, -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128, 128, 128];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(-128);
      expect(arr.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3000
     * @tc.name int8ArrayConstructorPart05Test030
     * @tc.desc Verify [-129, -129, -129] [127, 127, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [-129, -129, -129];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3100
     * @tc.name int8ArrayConstructorPart05Test031
     * @tc.desc Verify [256, 256, 256] [0, 0, 0] ( 0, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [256, 256, 256];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3200
     * @tc.name int8ArrayConstructorPart05Test032
     * @tc.desc Verify [128, -129] [-128, 127] ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128, -129];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3300
     * @tc.name int8ArrayConstructorPart05Test033
     * @tc.desc Verify instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.length).assertEqual(fa.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3400
     * @tc.name int8ArrayConstructorPart05Test034
     * @tc.desc Verify length FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3500
     * @tc.name int8ArrayConstructorPart05Test035
     * @tc.desc Verify byteLength (1 / )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30, 40];
      const arr = new Int8Array(fa);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3600
     * @tc.name int8ArrayConstructorPart05Test036
     * @tc.desc Verify byteOffset == 0 ( buffer )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3700
     * @tc.name int8ArrayConstructorPart05Test037
     * @tc.desc Verify buffer.length ( buffer )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3800
     * @tc.name int8ArrayConstructorPart05Test038
     * @tc.desc Verify $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_3900
     * @tc.name int8ArrayConstructorPart05Test039
     * @tc.desc Verify $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.$_get(arr.length - 1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4000
     * @tc.name int8ArrayConstructorPart05Test040
     * @tc.desc Verify at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4100
     * @tc.name int8ArrayConstructorPart05Test041
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4200
     * @tc.name int8ArrayConstructorPart05Test042
     * @tc.desc Verify join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4300
     * @tc.name int8ArrayConstructorPart05Test043
     * @tc.desc Verify toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4400
     * @tc.name int8ArrayConstructorPart05Test044
     * @tc.desc Verify FixedArray :
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(fa[0]).assertEqual(10);
      expect(fa[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4500
     * @tc.name int8ArrayConstructorPart05Test045
     * @tc.desc Verify FixedArray (copy , )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      arr.$_set(0, 99);
      expect(fa[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4600
     * @tc.name int8ArrayConstructorPart05Test046
     * @tc.desc Verify FixedArray Int8Array (copy , )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      fa[0] = 999;
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4700
     * @tc.name int8ArrayConstructorPart05Test047
     * @tc.desc Verify length ( 3 , )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128, -129, 255];
      const arr = new Int8Array(fa);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4800
     * @tc.name int8ArrayConstructorPart05Test048
     * @tc.desc Verify : Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128, 255];
      const a1 = new Int8Array(fa);
      const a2 = new Int8Array(fa);
      expect(a2.$_get(0)).assertEqual(a1.$_get(0));
      expect(a2.$_get(1)).assertEqual(a1.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_4900
     * @tc.name int8ArrayConstructorPart05Test049
     * @tc.desc Verify :
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128, 0, -129, 255];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5000
     * @tc.name int8ArrayConstructorPart05Test050
     * @tc.desc Verify :
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128, -129, 255, 256];
      const arr = new Int8Array(fa);
      let sum: number = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr.$_get(i);
      }
      expect(sum).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5100
     * @tc.name int8ArrayConstructorPart05Test051
     * @tc.desc Verify byteLength length ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128, 128];
      const arr = new Int8Array(fa);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5200
     * @tc.name int8ArrayConstructorPart05Test052
     * @tc.desc Verify FixedArray:
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128];
      const arr = new Int8Array(fa);
      expect(fa[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5300
     * @tc.name int8ArrayConstructorPart05Test053
     * @tc.desc Verify :
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [128, 0, -129];
      const arr = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-128);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5400
     * @tc.name int8ArrayConstructorPart05Test054
     * @tc.desc Verify buffer, buffer (4 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [INT8_MAX, -128, 0, 64];
      const arr = new Int8Array(fa);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5500
     * @tc.name int8ArrayConstructorPart05Test055
     * @tc.desc Verify subarray(0) buffer:
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const view = arr.subarray(0);
      view.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5600
     * @tc.name int8ArrayConstructorPart05Test056
     * @tc.desc Verify subarray(0) buffer:
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const view = arr.subarray(0);
      arr.$_set(1, 88);
      expect(view.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5700
     * @tc.name int8ArrayConstructorPart05Test057
     * @tc.desc Verify subarray buffer: A B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const a = arr.subarray(0);
      const b = arr.subarray(0);
      a.$_set(0, 77);
      expect(b.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5800
     * @tc.name int8ArrayConstructorPart05Test058
     * @tc.desc Verify subarray(1) byteOffset == 1 (1 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const view = arr.subarray(1);
      expect(view.byteOffset).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_5900
     * @tc.name int8ArrayConstructorPart05Test059
     * @tc.desc Verify subarray(0, 2) length == 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const view = arr.subarray(0, 2);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6000
     * @tc.name int8ArrayConstructorPart05Test060
     * @tc.desc Verify slice(0) buffer:
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const copy = arr.slice(0);
      copy.$_set(0, 99);
      expect(arr.$_get(0)).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6100
     * @tc.name int8ArrayConstructorPart05Test061
     * @tc.desc Verify subarray(-1) buffer:
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const view = arr.subarray(-1);
      view.$_set(0, 55);
      expect(arr.$_get(2)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6200
     * @tc.name int8ArrayConstructorPart05Test062
     * @tc.desc Verify subarray(0, length) length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const view = arr.subarray(0, arr.length);
      expect(view.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6300
     * @tc.name int8ArrayConstructorPart05Test063
     * @tc.desc Verify subarray : subarray(subarray()) buffer,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const sub1 = arr.subarray(0);
      const sub2 = sub1.subarray(0);
      sub2.$_set(0, 33);
      expect(arr.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6400
     * @tc.name int8ArrayConstructorPart05Test064
     * @tc.desc Verify : arr1 arr2 ( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const a1 = new Int8Array(fa);
      const a2 = new Int8Array(fa);
      a1.$_set(0, 99);
      expect(a2.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6500
     * @tc.name int8ArrayConstructorPart05Test065
     * @tc.desc Verify length ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      const view = arr.subarray(0);
      view.$_set(0, 99);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6600
     * @tc.name int8ArrayConstructorPart05Test066
     * @tc.desc Verify slice(1, 3) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30, 40];
      const arr = new Int8Array(fa);
      const copy = arr.slice(1, 3);
      expect(copy.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6700
     * @tc.name int8ArrayConstructorPart05Test067
     * @tc.desc Verify FixedArray byteOffset == 0 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: FixedArray<number> = [];
      const arr = new Int8Array(empty);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6800
       * @tc.name int8ArrayConstructorPart05Test068
       * @tc.desc Verify FixedArray $_get(0) undefined ( )
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const empty: FixedArray<number> = [];
        const arr = new Int8Array(empty);
                try {
          arr.$_get(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_6900
     * @tc.name int8ArrayConstructorPart05Test069
     * @tc.desc Verify FixedArray at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: FixedArray<number> = [];
      const arr = new Int8Array(empty);
      expect(arr.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7000
     * @tc.name int8ArrayConstructorPart05Test070
     * @tc.desc Verify FixedArray join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: FixedArray<number> = [];
      const arr = new Int8Array(empty);
      expect(arr.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7100
     * @tc.name int8ArrayConstructorPart05Test071
     * @tc.desc Verify FixedArray length=0 byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: FixedArray<number> = [];
      const arr = new Int8Array(empty);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7200
     * @tc.name int8ArrayConstructorPart05Test072
     * @tc.desc Verify FixedArray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: FixedArray<number> = [];
      const arr = new Int8Array(empty);
      let count: number = 0;
      arr.forEach((v: number): void => { count += 1; });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7300
     * @tc.name int8ArrayConstructorPart05Test073
     * @tc.desc Verify at(-1) ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [42];
      const arr = new Int8Array(fa);
      expect(arr.at(-1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7400
     * @tc.name int8ArrayConstructorPart05Test074
     * @tc.desc Verify at(1) undefined ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [42];
      const arr = new Int8Array(fa);
      expect(arr.at(1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7500
     * @tc.name int8ArrayConstructorPart05Test075
     * @tc.desc Verify for-of ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [7, 15, 25];
      const arr = new Int8Array(fa);
      let sum: number = 0;
      for (const v of arr) {
        sum += v;
      }
      expect(sum).assertEqual(47);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7600
     * @tc.name int8ArrayConstructorPart05Test076
     * @tc.desc Verify keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [7, 15, 25];
      const arr = new Int8Array(fa);
      let count: number = 0;
      for (const k of arr.keys()) {
        count += 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7700
     * @tc.name int8ArrayConstructorPart05Test077
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [7, 15, 25];
      const arr = new Int8Array(fa);
      expect(arr.indexOf(15)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7800
     * @tc.name int8ArrayConstructorPart05Test078
     * @tc.desc Verify indexOf -1 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [7, 15, 25];
      const arr = new Int8Array(fa);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_7900
     * @tc.name int8ArrayConstructorPart05Test079
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [7, 15, 25];
      const arr = new Int8Array(fa);
      expect(arr.includes(25)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_8000
     * @tc.name int8ArrayConstructorPart05Test080
     * @tc.desc Verify includes false ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [7, 15, 25];
      const arr = new Int8Array(fa);
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_8100
     * @tc.name int8ArrayConstructorPart05Test081
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [7, 15, 25];
      const arr = new Int8Array(fa);
      const r = arr.find((v: number): boolean => v > 10);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART05_TEST_8200
     * @tc.name int8ArrayConstructorPart05Test082
     * @tc.desc Verify byteLength == length * BYTES_PER_ELEMENT ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart05Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10, 20, 30];
      const arr = new Int8Array(fa);
      expect(arr.byteLength).assertEqual(arr.length * (new Int8Array(1)).BYTES_PER_ELEMENT);
    });

  });
}
