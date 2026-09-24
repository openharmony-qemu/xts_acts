'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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

export default function int32ArraySetPart06Test(): void {
  describe('Int32ArraySetPart06Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0100
     * @tc.name int32ArraySetPart06Test001
     * @tc.desc Verify arr insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let src: number[] = [1, 2, 3];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(40);
      expect(dst.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0200
     * @tc.name int32ArraySetPart06Test002
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(6);
      let src: number[] = [7, 8];
      dst.set(src, 2);
      expect(dst.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0300
     * @tc.name int32ArraySetPart06Test003
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: number[] = [1, 2];
      dst.set(src, 1);
      expect(dst.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0400
     * @tc.name int32ArraySetPart06Test004
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: number[] = [9];
      dst.set(src, 3);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0500
     * @tc.name int32ArraySetPart06Test005
     * @tc.desc Verify FixedArray\<number\> insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let src: number[] = [99];
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(99);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0600
     * @tc.name int32ArraySetPart06Test006
     * @tc.desc Verify FixedArray\<number\> insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let src: number[] = [-5];
      dst.set(src, 2);
      expect(dst.$_get(2)).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0700
     * @tc.name int32ArraySetPart06Test007
     * @tc.desc Verify FixedArray\<number\> insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40]);
      let src: number[] = [11, 22];
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(11);
      expect(dst.$_get(2)).assertEqual(22);
      expect(dst.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0800
     * @tc.name int32ArraySetPart06Test008
     * @tc.desc Verify FixedArray\<number\> insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: number[] = [1, 2, 3, 4];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_0900
     * @tc.name int32ArraySetPart06Test009
     * @tc.desc Verify 0 FixedArray\<number\> no-op insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let src: number[] = [];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1000
     * @tc.name int32ArraySetPart06Test010
     * @tc.desc Verify FixedArray\<number\> insertPos no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let src: number[] = [];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1100
     * @tc.name int32ArraySetPart06Test011
     * @tc.desc Verify FixedArray\<number\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([7, 8, 9, 10]);
      let src: number[] = [0, 0];
      dst.set(src, 1);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1200
     * @tc.name int32ArraySetPart06Test012
     * @tc.desc Verify FixedArray\<number\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: number[] = [7, 7, 7];
      dst.set(src, 1);
      expect(dst.$_get(1)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(7);
      expect(dst.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1300
     * @tc.name int32ArraySetPart06Test013
     * @tc.desc Verify insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let src: number[] = [1, 2];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1400
     * @tc.name int32ArraySetPart06Test014
     * @tc.desc Verify insertPos dst.length-src.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40]);
      let src: number[] = [7, 8];
      dst.set(src, 2);
      expect(dst.$_get(2)).assertEqual(7);
      expect(dst.$_get(3)).assertEqual(8);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1500
     * @tc.name int32ArraySetPart06Test015
     * @tc.desc Verify insertPos dst.length-src.length dst.length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let src: number[] = [99];
      dst.set(src, 2);
      expect(dst.$_get(2)).assertEqual(99);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1600
     * @tc.name int32ArraySetPart06Test016
     * @tc.desc Verify insertPos -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: number[] = [1, 2];
      try {
        dst.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1700
     * @tc.name int32ArraySetPart06Test017
     * @tc.desc Verify insertPos -2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: number[] = [1];
      try {
        dst.set(src, -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1800
     * @tc.name int32ArraySetPart06Test018
     * @tc.desc Verify insertPos insertPos+src.length 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: number[] = [1, 2, 3];
      try {
        dst.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_1900
     * @tc.name int32ArraySetPart06Test019
     * @tc.desc Verify insertPos=dst.length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: number[] = [1];
      try {
        dst.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2000
     * @tc.name int32ArraySetPart06Test020
     * @tc.desc Verify insertPos RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: number[] = [1];
      try {
        dst.set(src, 1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2100
     * @tc.name int32ArraySetPart06Test021
     * @tc.desc Verify insertPos RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: number[] = [1];
      try {
        dst.set(src, -1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2200
     * @tc.name int32ArraySetPart06Test022
     * @tc.desc Verify insertPos=0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [1, 2, 3];
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2300
     * @tc.name int32ArraySetPart06Test023
     * @tc.desc Verify insertPos=dst.length-src.length+1 insertPos 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: number[] = [1, 2];
      try {
        dst.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2400
     * @tc.name int32ArraySetPart06Test024
     * @tc.desc Verify insertPos=dst.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3]);
      let src: number[] = [];
      dst.set(src, 3);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2500
     * @tc.name int32ArraySetPart06Test025
     * @tc.desc Verify int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [2147483647];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2600
     * @tc.name int32ArraySetPart06Test026
     * @tc.desc Verify int32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [-2147483648];
      dst.set(src, 1);
      expect(dst.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2700
     * @tc.name int32ArraySetPart06Test027
     * @tc.desc Verify 4294967295 (0xFFFFFFFF) ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [4294967295];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2800
     * @tc.name int32ArraySetPart06Test028
     * @tc.desc Verify 4294967296 (0x100000000) ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [4294967296];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_2900
     * @tc.name int32ArraySetPart06Test029
     * @tc.desc Verify 3.5 ToInt32 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [3.5];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3000
     * @tc.name int32ArraySetPart06Test030
     * @tc.desc Verify -3.5 ToInt32 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [-3.5];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3100
     * @tc.name int32ArraySetPart06Test031
     * @tc.desc Verify 3.999 ToInt32 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [3.999];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3200
     * @tc.name int32ArraySetPart06Test032
     * @tc.desc Verify Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [Number.NaN];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3300
     * @tc.name int32ArraySetPart06Test033
     * @tc.desc Verify -0 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [-0];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3400
     * @tc.name int32ArraySetPart06Test034
     * @tc.desc Verify -1 (0xFFFFFFFF) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [-1];
      dst.set(src, 1);
      expect(dst.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3500
     * @tc.name int32ArraySetPart06Test035
     * @tc.desc Verify FixedArray\<number\> ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(5);
      let src: number[] = [Number.NaN, 3.7, 2147483648, -3.5, -2147483649];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(3);
      expect(dst.$_get(2)).assertEqual(-2147483648);
      expect(dst.$_get(3)).assertEqual(-3);
      expect(dst.$_get(4)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3600
     * @tc.name int32ArraySetPart06Test036
     * @tc.desc Verify insertPos insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let src: number[] = [7, 8];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3700
     * @tc.name int32ArraySetPart06Test037
     * @tc.desc Verify insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let src: number[] = [7, 8];
      dst.set(src, 1);
      expect(dst.$_get(3)).assertEqual(40);
      expect(dst.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3800
     * @tc.name int32ArraySetPart06Test038
     * @tc.desc Verify insertPos 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([1, 2, 3, 4]);
      let src: number[] = [99];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_3900
     * @tc.name int32ArraySetPart06Test039
     * @tc.desc Verify set undefined void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: number[] = [1];
      let ret: Object = dst.set(src, 0) as Object;
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4000
     * @tc.name int32ArraySetPart06Test040
     * @tc.desc Verify set void undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: number[] = [5];
      let r = dst.set(src, 0);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4100
     * @tc.name int32ArraySetPart06Test041
     * @tc.desc Verify insertPos=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: number[] = [1];
      try {
        dst.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4200
     * @tc.name int32ArraySetPart06Test042
     * @tc.desc Verify insertPos RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: number[] = [1, 2, 3];
      try {
        dst.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4300
     * @tc.name int32ArraySetPart06Test043
     * @tc.desc Verify length=0 set RangeError insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(0);
      let src: number[] = [1];
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4400
     * @tc.name int32ArraySetPart06Test044
     * @tc.desc Verify length=0 set no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(0);
      let src: number[] = [];
      dst.set(src, 0);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4500
     * @tc.name int32ArraySetPart06Test045
     * @tc.desc Verify RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let src: number[] = [1, 2, 3, 4];
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(20);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4600
     * @tc.name int32ArraySetPart06Test046
     * @tc.desc Verify insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let src: number[] = [1, 2];
      try {
        dst.set(src, -5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(20);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4700
     * @tc.name int32ArraySetPart06Test047
     * @tc.desc Verify 0x80000000 ToInt32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [0x80000000];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4800
     * @tc.name int32ArraySetPart06Test048
     * @tc.desc Verify 0o10 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [0o10];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_4900
     * @tc.name int32ArraySetPart06Test049
     * @tc.desc Verify 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [0b1010];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5000
     * @tc.name int32ArraySetPart06Test050
     * @tc.desc Verify 1e3 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [1e3];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5100
     * @tc.name int32ArraySetPart06Test051
     * @tc.desc Verify -0.5 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [-0.5];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5200
     * @tc.name int32ArraySetPart06Test052
     * @tc.desc Verify 0.5 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [0.5];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5300
     * @tc.name int32ArraySetPart06Test053
     * @tc.desc Verify two set calls write source values at offsets 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let src1: number[] = [1, 2];
      let src2: number[] = [3, 4];
      dst.set(src1, 0);
      dst.set(src2, 3);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(3);
      expect(dst.$_get(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5400
     * @tc.name int32ArraySetPart06Test054
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src1: number[] = [10, 20, 30];
      let src2: number[] = [99];
      dst.set(src1, 0);
      dst.set(src2, 1);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(99);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5500
     * @tc.name int32ArraySetPart06Test055
     * @tc.desc Verify FixedArray\<number\> set FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: number[] = [1, 2, 3];
      dst.set(src, 0);
      expect(src[0]).assertEqual(1);
      expect(src[1]).assertEqual(2);
      expect(src[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5600
     * @tc.name int32ArraySetPart06Test056
     * @tc.desc Verify ArrayBuffer Int32Array set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let dst: Int32Array = new Int32Array(buf, 0, 4);
      let other: Int32Array = new Int32Array(buf, 0, 4);
      let src: number[] = [7, 8];
      dst.set(src, 1);
      expect(other.$_get(1)).assertEqual(7);
      expect(other.$_get(2)).assertEqual(8);
      expect(other.$_get(0)).assertEqual(0);
      expect(other.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5700
     * @tc.name int32ArraySetPart06Test057
     * @tc.desc Verify ArrayBuffer set byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let dst: Int32Array = new Int32Array(buf, 4, 4);
      let src: number[] = [11, 22];
      dst.set(src, 1);
      let probe: Int32Array = new Int32Array(buf, 0, 6);
      expect(probe.$_get(0)).assertEqual(0);
      expect(probe.$_get(1)).assertEqual(0);
      expect(probe.$_get(2)).assertEqual(11);
      expect(probe.$_get(3)).assertEqual(22);
      expect(probe.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5800
     * @tc.name int32ArraySetPart06Test058
     * @tc.desc Verify set buffer Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: number[] = [1];
      dst.set(src, 0);
      let u8: Uint8Array = new Uint8Array(dst.buffer);
      expect(u8.$_get(0)).assertEqual(1);
      expect(u8.$_get(1)).assertEqual(0);
      expect(u8.$_get(2)).assertEqual(0);
      expect(u8.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_5900
     * @tc.name int32ArraySetPart06Test059
     * @tc.desc Verify byteOffset set offset+src.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let dst: Int32Array = new Int32Array(buf, 8, 4);
      let src: number[] = [5, 6];
      dst.set(src, 2);
      expect(dst.$_get(2)).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(6);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_6000
     * @tc.name int32ArraySetPart06Test060
     * @tc.desc Verify FixedArray\<number\> int32 MIN -2147483648 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Int32Array = new Int32Array(buf, 0, 2);
      let src: number[] = [-2147483648];
      dst.set(src, 0);
      let view2: Int32Array = new Int32Array(buf, 0, 2);
      expect(view2.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_6100
     * @tc.name int32ArraySetPart06Test061
     * @tc.desc Verify set FixedArray\<number\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 0, 0, 0]);
      let src: number[] = [5, 6];
      dst.set(src, 0);
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(5);
      expect(dst.$_get(1)).assertEqual(6);
      expect(dst.$_get(2)).assertEqual(5);
      expect(dst.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_6200
     * @tc.name int32ArraySetPart06Test062
     * @tc.desc Verify set FixedArray\<number\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(3);
      let src: number[] = [1, 2, 3];
      dst.set(src, 0);
      src[0] = 999;
      expect(dst.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_6300
     * @tc.name int32ArraySetPart06Test063
     * @tc.desc Verify insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let src: number[] = [-1];
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(1)).assertEqual(20);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_6400
     * @tc.name int32ArraySetPart06Test064
     * @tc.desc Verify insertPos=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([10, 20, 30]);
      let src: number[] = [42];
      dst.set(src, 2);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(1)).assertEqual(20);
      expect(dst.$_get(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART06_6500
     * @tc.name int32ArraySetPart06Test065
     * @tc.desc Verify FixedArray\<number\> set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart06Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([5, 5, 5, 5, 5]);
      let src: number[] = [0, 0, 0];
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(5);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(0);
      expect(dst.$_get(3)).assertEqual(0);
      expect(dst.$_get(4)).assertEqual(5);
    });
  });
}
