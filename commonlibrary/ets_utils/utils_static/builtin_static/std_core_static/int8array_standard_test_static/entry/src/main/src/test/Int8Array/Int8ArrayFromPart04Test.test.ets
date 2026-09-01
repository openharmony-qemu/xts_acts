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
import Utils from './../Util.test';

export default function int8ArrayFromPart04Test(): void {
  describe('Int8ArrayFromPart04Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0100
     * @tc.name int8ArrayFromPart04Test001
     * @tc.desc Verify Int8Array.from(src) Array<number> arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Int8Array = Int8Array.from(src);
      expect(result.length).assertEqual(3);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = result.buffer.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: int = result.BYTES_PER_ELEMENT;
      let e3: int = 1;
      expect(r3).assertEqual(e3);
      let r4: string = result.join(',');
      let e4: string = '1,2,3';
      expect(r4).assertEqual(e4);
      let r5: string = result.toString();
      let e5: string = '1,2,3';
      expect(r5).assertEqual(e5);
      let r6: boolean = result.includes(100);
      expect(r6).assertFalse();
      let r7: number = src[0];
      let e7: int = 1;
      expect(r7).assertEqual(e7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0200
     * @tc.name int8ArrayFromPart04Test002
     * @tc.desc Verify Int8Array.from(src) [] length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([]);
      expect(result.length).assertEqual(0);
      let r1: int = result.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: string = result.toString();
      let e2: string = '';
      expect(r2).assertEqual(e2);
      let r3: int = result.buffer.byteLength;
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0300
     * @tc.name int8ArrayFromPart04Test003
     * @tc.desc Verify Int8Array.from(src) [0] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([0]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0400
     * @tc.name int8ArrayFromPart04Test004
     * @tc.desc Verify Int8Array.from(src) [127] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([INT8_MAX]);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0500
     * @tc.name int8ArrayFromPart04Test005
     * @tc.desc Verify Int8Array.from(src) [-128] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([INT8_MIN]);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0600
     * @tc.name int8ArrayFromPart04Test006
     * @tc.desc Verify Int8Array.from(src) [1] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([1]);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0700
     * @tc.name int8ArrayFromPart04Test007
     * @tc.desc Verify Int8Array.from(src) [-1] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-1]);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0800
     * @tc.name int8ArrayFromPart04Test008
     * @tc.desc Verify Int8Array.from(src) [64] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([64]);
      let r1: number = result.$_get(0);
      let e1: int = 64;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_0900
     * @tc.name int8ArrayFromPart04Test009
     * @tc.desc Verify Int8Array.from(src) [128] max+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([128]);
      expect(result.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1000
     * @tc.name int8ArrayFromPart04Test010
     * @tc.desc Verify Int8Array.from(src) [129] max+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([129]);
      expect(result.$_get(0)).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1100
     * @tc.name int8ArrayFromPart04Test011
     * @tc.desc Verify Int8Array.from(src) [255] 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([255]);
      expect(result.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1200
     * @tc.name int8ArrayFromPart04Test012
     * @tc.desc Verify Int8Array.from(src) [256] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([256]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1300
     * @tc.name int8ArrayFromPart04Test013
     * @tc.desc Verify Int8Array.from(src) [257] +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([257]);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1400
     * @tc.name int8ArrayFromPart04Test014
     * @tc.desc Verify Int8Array.from(src) [-129] min-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-129]);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1500
     * @tc.name int8ArrayFromPart04Test015
     * @tc.desc Verify Int8Array.from(src) [-130] min-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-130]);
      let r1: number = result.$_get(0);
      let e1: int = 126;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1600
     * @tc.name int8ArrayFromPart04Test016
     * @tc.desc Verify Int8Array.from(src) [-255] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-255]);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1700
     * @tc.name int8ArrayFromPart04Test017
     * @tc.desc Verify Int8Array.from(src) [-256] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-256]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1800
     * @tc.name int8ArrayFromPart04Test018
     * @tc.desc Verify Int8Array.from(src) [-257] +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-257]);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_1900
     * @tc.name int8ArrayFromPart04Test019
     * @tc.desc Verify Int8Array.from(src) [Number.NaN] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.NaN]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2000
     * @tc.name int8ArrayFromPart04Test020
     * @tc.desc Verify Int8Array.from(src) [1.9] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([1.9]);
      expect(result.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2100
     * @tc.name int8ArrayFromPart04Test021
     * @tc.desc Verify Int8Array.from(src) [-1.9] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-1.9]);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2200
     * @tc.name int8ArrayFromPart04Test022
     * @tc.desc Verify Int8Array.from(src) [0.5] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([0.5]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2300
     * @tc.name int8ArrayFromPart04Test023
     * @tc.desc Verify Int8Array.from(src) [-0.5] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-0.5]);
      expect(result.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2400
     * @tc.name int8ArrayFromPart04Test024
     * @tc.desc Verify Int8Array.from(src) [127.999] max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([127.999]);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2500
     * @tc.name int8ArrayFromPart04Test025
     * @tc.desc Verify Int8Array.from(src) [-128.999] min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-128.999]);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2600
     * @tc.name int8ArrayFromPart04Test026
     * @tc.desc Verify Int8Array.from(src) [Number.MAX_SAFE_INTEGER] 2^53-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.MAX_SAFE_INTEGER]);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2700
     * @tc.name int8ArrayFromPart04Test027
     * @tc.desc Verify Int8Array.from(src) [Number.MIN_SAFE_INTEGER] -(2^53-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.MIN_SAFE_INTEGER]);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2800
     * @tc.name int8ArrayFromPart04Test028
     * @tc.desc Verify Int8Array.from(src) [Number.MIN_VALUE] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.MIN_VALUE]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_2900
     * @tc.name int8ArrayFromPart04Test029
     * @tc.desc Verify Int8Array.from(src) [1, 2, 3] $_get(1) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([1, 2, 3]);
      let r1: number = result.$_get(1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let floatSrc: Array<number> = [1.5, 2.5, 3.5];
      let floatResult: Int8Array = Int8Array.from(floatSrc);
      let r2: number = floatResult.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3000
     * @tc.name int8ArrayFromPart04Test030
     * @tc.desc Verify Int8Array.from(src) [127, -128, 0] $_get(0) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([INT8_MAX, INT8_MIN, 0]);
      let r1: number = result.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3100
     * @tc.name int8ArrayFromPart04Test031
     * @tc.desc Verify Int8Array.from(src) [128, -129, 255] $_get(1) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([128, -129, 255]);
      let r1: number = result.$_get(1);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3200
     * @tc.name int8ArrayFromPart04Test032
     * @tc.desc Verify Int8Array.from(src) [-1, -2, -3] $_get(2) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([-1, -2, -3]);
      let r1: number = result.$_get(2);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3300
     * @tc.name int8ArrayFromPart04Test033
     * @tc.desc Verify Int8Array.from(src) [5, 5, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([5, 5, 5]);
      let r1: number = result.$_get(1);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3400
     * @tc.name int8ArrayFromPart04Test034
     * @tc.desc Verify Int8Array.from(src) with 100-element Array returns length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      for (let i = 0; i < 100; i++) {
        src.push(i);
      }
      let result: Int8Array = Int8Array.from(src);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3500
     * @tc.name int8ArrayFromPart04Test035
     * @tc.desc Verify Int8Array.from(src) -128 behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      let i: int = 0;
      while (i < 100) {
        src.push(128);
        i = i + 1;
      }
      let result: Int8Array = Int8Array.from(src);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3600
     * @tc.name int8ArrayFromPart04Test036
     * @tc.desc Verify Int8Array.from(src) with 5-element Array returns length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([10, 20, 30, 40, 50]);
      let r1: int = result.length;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: int = result.byteLength;
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3700
     * @tc.name int8ArrayFromPart04Test037
     * @tc.desc Verify Int8Array.from(src) at(0) behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([10, 20, 30]);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(-1)).assertEqual(30);
      expect(result.at(3)).assertUndefined();
      let r3: int = result.indexOf(10);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: boolean = result.includes(30);
      expect(r4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3800
     * @tc.name int8ArrayFromPart04Test038
     * @tc.desc Verify Int8Array.from creates independent copy (modifying src does not affect result)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Int8Array = Int8Array.from(src);
      src[0] = 100;
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_3900
     * @tc.name int8ArrayFromPart04Test039
     * @tc.desc Verify Int8Array.from creates independent copy (modifying result does not affect src)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Int8Array = Int8Array.from(src);
      result.$_set(0, 100);
      let r2: number = src[0];
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4000
     * @tc.name int8ArrayFromPart04Test040
     * @tc.desc Verify Int8Array.from produces independent buffers across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let fromResultA: Int8Array = Int8Array.from(src);
      let fromResultB: Int8Array = Int8Array.from(src);
      fromResultA.$_set(0, 100);
      let r1: number = fromResultB.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4100
     * @tc.name int8ArrayFromPart04Test041
     * @tc.desc Verify Int8Array.from(src) wraps 128 to -128 consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [128, -129, 255];
      let fromResultA: Int8Array = Int8Array.from(src);
      let fromResultB: Int8Array = Int8Array.from(src);
      let r1: number = fromResultA.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
      let r2: number = fromResultB.$_get(0);
      let e2: int = -128;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4200
     * @tc.name int8ArrayFromPart04Test042
     * @tc.desc Verify Int8Array.from(src) result unaffected by later source mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [1, 2, 3];
      let result: Int8Array = Int8Array.from(src);
      src.push(4);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4300
     * @tc.name int8ArrayFromPart04Test043
     * @tc.desc Verify Int8Array.from(src) [100, 200, -100, -200] overflow wrap behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([100, 200, -100, -200]);
      let r1: number = result.$_get(1);
      let e1: int = -56;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4400
     * @tc.name int8ArrayFromPart04Test044
     * @tc.desc Verify Int8Array.from(src) [127, 127, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([INT8_MAX, INT8_MAX, INT8_MAX]);
      let r1: number = result.$_get(2);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4500
     * @tc.name int8ArrayFromPart04Test045
     * @tc.desc Verify Int8Array.from(src) [-128, -128, -128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([INT8_MIN, INT8_MIN, INT8_MIN]);
      let r1: number = result.$_get(2);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4600
     * @tc.name int8ArrayFromPart04Test046
     * @tc.desc Verify Int8Array.from(src) [128, 256, -129, -256] overflow wrap behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([128, 256, -129, -256]);
      let r1: number = result.$_get(2);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4700
     * @tc.name int8ArrayFromPart04Test047
     * @tc.desc Verify Int8Array.from(src) [255, 255, 255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([255, 255, 255]);
      let r1: number = result.$_get(1);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4800
     * @tc.name int8ArrayFromPart04Test048
     * @tc.desc Verify Int8Array.from(src) [127, 128, -128, -129] overflow wrap behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([INT8_MAX, 128, INT8_MIN, -129]);
      let r1: number = result.$_get(1);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_4900
     * @tc.name int8ArrayFromPart04Test049
     * @tc.desc Verify Int8Array.from(src) [Number.MAX_VALUE, Number.MAX_SAFE_INTEGER]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.MAX_VALUE, Number.MAX_SAFE_INTEGER]);
      let r1: number = result.$_get(1);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5000
     * @tc.name int8ArrayFromPart04Test050
     * @tc.desc Verify Int8Array.from(src) subarray buffer sharing (modify subarray affects original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([1, 2, 3, 4, 5]);
      let sub: Int8Array = result.subarray(1, 3);
      sub.$_set(0, 100);
      let r1: number = result.$_get(1);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5100
     * @tc.name int8ArrayFromPart04Test051
     * @tc.desc Verify Int8Array.from(src) slice behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([1, 2, 3, 4, 5]);
      let sliced: Int8Array = result.slice(1, 3);
      sliced.$_set(0, 100);
      let r1: number = result.$_get(1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5200
     * @tc.name int8ArrayFromPart04Test052
     * @tc.desc Verify Int8Array.from(src) lastIndexOf behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([1, 2, 1, 3, 1]);
      let r1: int = result.lastIndexOf(1);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5300
     * @tc.name int8ArrayFromPart04Test053
     * @tc.desc Verify Int8Array.from(src) fill behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([1, 2, 3]);
      result.fill(0);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5400
     * @tc.name int8ArrayFromPart04Test054
     * @tc.desc Verify Int8Array.from(src) [Number.POSITIVE_INFINITY] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.POSITIVE_INFINITY]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5500
     * @tc.name int8ArrayFromPart04Test055
     * @tc.desc Verify Int8Array.from(src) [Number.NEGATIVE_INFINITY] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.NEGATIVE_INFINITY]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5600
     * @tc.name int8ArrayFromPart04Test056
     * @tc.desc Verify Int8Array.from(src) [Number.MAX_VALUE] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.MAX_VALUE]);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5700
     * @tc.name int8ArrayFromPart04Test057
     * @tc.desc Verify Int8Array.from(src) [0, Number.NaN, Number.POSITIVE_INFINITY] behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [0.0, Number.NaN, Number.POSITIVE_INFINITY];
      let result: Int8Array = Int8Array.from(src);
      let r1: number = result.$_get(2);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5800
     * @tc.name int8ArrayFromPart04Test058
     * @tc.desc Verify Int8Array.from(src) converts NaN and Infinity elements to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [];
      src.push(Number.NaN);
      for (let i = 1; i < 99; i++) {
        src.push(i);
      }
      src.push(Number.POSITIVE_INFINITY);
      let result: Int8Array = Int8Array.from(src);
      expect(result.$_get(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART04_5900
     * @tc.name int8ArrayFromPart04Test059
     * @tc.desc Verify Int8Array.from(src) [Number.MAX_VALUE, Number.POSITIVE_INFINITY]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int8Array = Int8Array.from([Number.MAX_VALUE, Number.POSITIVE_INFINITY]);
      expect(result.$_get(1)).assertEqual(0);
    });
  });
}
