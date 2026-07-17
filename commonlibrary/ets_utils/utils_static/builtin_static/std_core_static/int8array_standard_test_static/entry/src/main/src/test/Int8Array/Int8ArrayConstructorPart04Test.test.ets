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

export default function int8ArrayConstructorPart04TestTest(): void {
  describe('Int8ArrayConstructorPart04TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0100
     * @tc.name int8ArrayConstructorPart04Test001
     * @tc.desc Verify arity=1 Int8Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0200
     * @tc.name int8ArrayConstructorPart04Test002
     * @tc.desc Verify arity=1 Int8Array length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(0);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0300
     * @tc.name int8ArrayConstructorPart04Test003
     * @tc.desc Verify arity=1 Int8Array length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([64]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0400
     * @tc.name int8ArrayConstructorPart04Test004
     * @tc.desc Verify other.length=1 length=1 byteLength=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0500
     * @tc.name int8ArrayConstructorPart04Test005
     * @tc.desc Verify other.length= ( ) length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0600
     * @tc.name int8ArrayConstructorPart04Test006
     * @tc.desc Verify other.length=1000 length=1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1000);
      src.$_set(0, 42);
      src.$_set(999, -42);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0700
     * @tc.name int8ArrayConstructorPart04Test007
     * @tc.desc Verify other -128 int8 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-128]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0800
     * @tc.name int8ArrayConstructorPart04Test008
     * @tc.desc Verify other 127 int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([INT8_MAX]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_0900
     * @tc.name int8ArrayConstructorPart04Test009
     * @tc.desc Verify other 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([0]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1000
     * @tc.name int8ArrayConstructorPart04Test010
     * @tc.desc Verify other -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-1]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1100
     * @tc.name int8ArrayConstructorPart04Test011
     * @tc.desc Verify other 128 -128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, 128);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1200
     * @tc.name int8ArrayConstructorPart04Test012
     * @tc.desc Verify other -129 127 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, -129);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1300
     * @tc.name int8ArrayConstructorPart04Test013
     * @tc.desc Verify other 255 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, 255);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1400
     * @tc.name int8ArrayConstructorPart04Test014
     * @tc.desc Verify other 256 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, 256);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1500
     * @tc.name int8ArrayConstructorPart04Test015
     * @tc.desc Verify other Number.NaN 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, Number.NaN);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1600
     * @tc.name int8ArrayConstructorPart04Test016
     * @tc.desc Verify other 1.9 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, 1.9);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1700
     * @tc.name int8ArrayConstructorPart04Test017
     * @tc.desc Verify other -1.9 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, -1.9);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1800
     * @tc.name int8ArrayConstructorPart04Test018
     * @tc.desc Verify other -0.0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, -0.0);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_1900
     * @tc.name int8ArrayConstructorPart04Test019
     * @tc.desc Verify other 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([0, 0, 0, 0]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2000
     * @tc.name int8ArrayConstructorPart04Test020
     * @tc.desc Verify other 127 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(1)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2100
     * @tc.name int8ArrayConstructorPart04Test021
     * @tc.desc Verify other -128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-128, -128, -128]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2200
     * @tc.name int8ArrayConstructorPart04Test022
     * @tc.desc Verify other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, -1, 2, -2, 3, -3]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(3)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2300
     * @tc.name int8ArrayConstructorPart04Test023
     * @tc.desc Verify other subarray length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const src: Int8Array = base.subarray(1, 4);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2400
     * @tc.name int8ArrayConstructorPart04Test024
     * @tc.desc Verify other subarray(0, 0) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([10, 20, 30]);
      const src: Int8Array = base.subarray(0, 0);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2500
     * @tc.name int8ArrayConstructorPart04Test025
     * @tc.desc Verify other subarray(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([10, 20, 30, 40]);
      const src: Int8Array = base.subarray(1);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2600
     * @tc.name int8ArrayConstructorPart04Test026
     * @tc.desc Verify other byteOffset ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 4, 2);
      view.$_set(0, 77);
      const copied: Int8Array = new Int8Array(view);
      expect(copied.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2700
     * @tc.name int8ArrayConstructorPart04Test027
     * @tc.desc Verify other byteOffset+length ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const view: Int8Array = new Int8Array(buf, 2, 3);
      view.$_set(0, 11);
      view.$_set(1, 22);
      view.$_set(2, 33);
      const copied: Int8Array = new Int8Array(view);
      expect(copied.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2800
     * @tc.name int8ArrayConstructorPart04Test028
     * @tc.desc Verify other slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([5, 6, 7, 8]);
      const src: Int8Array = base.slice(1, 3);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_2900
     * @tc.name int8ArrayConstructorPart04Test029
     * @tc.desc Verify other constructor(other)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Int8Array = new Int8Array([100, -100]);
      const mid: Int8Array = new Int8Array(original);
      const copied: Int8Array = new Int8Array(mid);
      expect(copied.$_get(1)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3000
     * @tc.name int8ArrayConstructorPart04Test030
     * @tc.desc Verify other reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      src.reverse();
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3100
     * @tc.name int8ArrayConstructorPart04Test031
     * @tc.desc Verify other sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([3, 1, 2]);
      src.sort();
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3200
     * @tc.name int8ArrayConstructorPart04Test032
     * @tc.desc Verify other fill()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(4);
      src.fill(55);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(3)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3300
     * @tc.name int8ArrayConstructorPart04Test033
     * @tc.desc Verify other copyWithin() copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      src.copyWithin(0, 3, 5);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3400
     * @tc.name int8ArrayConstructorPart04Test034
     * @tc.desc Verify instanceof Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3500
     * @tc.name int8ArrayConstructorPart04Test035
     * @tc.desc Verify length === other.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([9, 8, 7, 6]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3600
     * @tc.name int8ArrayConstructorPart04Test036
     * @tc.desc Verify byteLength === other.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([9, 8, 7, 6]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.byteLength).assertEqual(src.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3700
     * @tc.name int8ArrayConstructorPart04Test037
     * @tc.desc Verify byteOffset === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3800
     * @tc.name int8ArrayConstructorPart04Test038
     * @tc.desc Verify buffer other.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_3900
     * @tc.name int8ArrayConstructorPart04Test039
     * @tc.desc Verify buffer instanceof ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.buffer.byteLength).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4000
     * @tc.name int8ArrayConstructorPart04Test040
     * @tc.desc Verify other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30, 40, 50]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(4)).assertEqual(src.$_get(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4100
     * @tc.name int8ArrayConstructorPart04Test041
     * @tc.desc Verify toString() === other.toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.toString()).assertEqual(src.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4200
     * @tc.name int8ArrayConstructorPart04Test042
     * @tc.desc Verify join(',') === other.join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.join(',')).assertEqual(src.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4300
     * @tc.name int8ArrayConstructorPart04Test043
     * @tc.desc Verify join('') === other.join('')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.join('')).assertEqual(src.join(''));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4400
     * @tc.name int8ArrayConstructorPart04Test044
     * @tc.desc Verify indexOf( ) === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([42, 20, 30]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.indexOf(42)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4500
     * @tc.name int8ArrayConstructorPart04Test045
     * @tc.desc Verify lastIndexOf( ) === length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 99]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.lastIndexOf(99)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4600
     * @tc.name int8ArrayConstructorPart04Test046
     * @tc.desc Verify includes( ) === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([42, 20, 30]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.includes(42)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4700
     * @tc.name int8ArrayConstructorPart04Test047
     * @tc.desc Verify at(0) === other.at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7, 8, 9]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.at(0)).assertEqual(src.at(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4800
     * @tc.name int8ArrayConstructorPart04Test048
     * @tc.desc Verify at(-1) === other.at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([7, 8, 9]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.at(-1)).assertEqual(src.at(-1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_4900
     * @tc.name int8ArrayConstructorPart04Test049
     * @tc.desc Verify BYTES_PER_ELEMENT === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5000
     * @tc.name int8ArrayConstructorPart04Test050
     * @tc.desc Verify buffer other buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3, 4]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5100
     * @tc.name int8ArrayConstructorPart04Test051
     * @tc.desc Verify $_set(0, X) other.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30]);
      const copied: Int8Array = new Int8Array(src);
      copied.$_set(0, 99);
      expect(src.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5200
     * @tc.name int8ArrayConstructorPart04Test052
     * @tc.desc Verify other $_set(0, Y) .$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([10, 20, 30]);
      const copied: Int8Array = new Int8Array(src);
      src.$_set(0, 88);
      expect(copied.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5300
     * @tc.name int8ArrayConstructorPart04Test053
     * @tc.desc Verify other.fill(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([11, 22, 33]);
      const copied: Int8Array = new Int8Array(src);
      src.fill(0);
      expect(copied.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5400
     * @tc.name int8ArrayConstructorPart04Test054
     * @tc.desc Verify fill(127) other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([11, 22, 33]);
      const copied: Int8Array = new Int8Array(src);
      copied.fill(INT8_MAX);
      expect(src.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5500
     * @tc.name int8ArrayConstructorPart04Test055
     * @tc.desc Verify other.reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3, 4]);
      const copied: Int8Array = new Int8Array(src);
      src.reverse();
      expect(copied.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5600
     * @tc.name int8ArrayConstructorPart04Test056
     * @tc.desc Verify reverse() other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3, 4]);
      const copied: Int8Array = new Int8Array(src);
      copied.reverse();
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5700
     * @tc.name int8ArrayConstructorPart04Test057
     * @tc.desc Verify other.sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([5, 3, 1, 4, 2]);
      const copied: Int8Array = new Int8Array(src);
      src.sort();
      expect(copied.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5800
     * @tc.name int8ArrayConstructorPart04Test058
     * @tc.desc Verify copyWithin() other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const copied: Int8Array = new Int8Array(src);
      copied.copyWithin(0, 3, 5);
      expect(src.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_5900
     * @tc.name int8ArrayConstructorPart04Test059
     * @tc.desc Verify A B C C A B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Int8Array = new Int8Array([1, 2, 3]);
      const b: Int8Array = new Int8Array(a);
      const c: Int8Array = new Int8Array(b);
      c.$_set(0, 77);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6000
     * @tc.name int8ArrayConstructorPart04Test060
     * @tc.desc Verify A B C A B C
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Int8Array = new Int8Array([1, 2, 3]);
      const b: Int8Array = new Int8Array(a);
      const c: Int8Array = new Int8Array(b);
      a.$_set(0, 88);
      expect(c.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6100
     * @tc.name int8ArrayConstructorPart04Test061
     * @tc.desc Verify A B C B A C
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Int8Array = new Int8Array([1, 2, 3]);
      const b: Int8Array = new Int8Array(a);
      const c: Int8Array = new Int8Array(b);
      b.$_set(0, 66);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6200
     * @tc.name int8ArrayConstructorPart04Test062
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([10, 20, 30, 40]);
      const src: Int8Array = base.subarray(1, 3);
      const copied: Int8Array = new Int8Array(src);
      copied.$_set(0, 99);
      expect(base.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6300
     * @tc.name int8ArrayConstructorPart04Test063
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([10, 20, 30, 40]);
      const src: Int8Array = base.subarray(1, 3);
      const copied: Int8Array = new Int8Array(src);
      base.$_set(1, 55);
      expect(copied.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6400
     * @tc.name int8ArrayConstructorPart04Test064
     * @tc.desc Verify byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const src: Int8Array = new Int8Array(buf, 4, 3);
      src.$_set(0, 33);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6500
     * @tc.name int8ArrayConstructorPart04Test065
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const src: Int8Array = new Int8Array(buf, 4, 3);
      src.$_set(0, 33);
      const copied: Int8Array = new Int8Array(src);
      copied.$_set(0, 99);
      expect(src.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6600
     * @tc.name int8ArrayConstructorPart04Test066
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const src: Int8Array = new Int8Array(buf, 4, 3);
      src.$_set(0, 33);
      const copied: Int8Array = new Int8Array(src);
      src.$_set(0, 77);
      expect(copied.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6700
     * @tc.name int8ArrayConstructorPart04Test067
     * @tc.desc Verify subarray() other subarray() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3, 4]);
      const copied: Int8Array = new Int8Array(src);
      const subSrc: Int8Array = src.subarray(0, 2);
      const subCopied: Int8Array = copied.subarray(0, 2);
      subCopied.$_set(0, 99);
      expect(subSrc.$_get(0)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6800
     * @tc.name int8ArrayConstructorPart04Test068
     * @tc.desc Verify buffer.byteLength === other.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.buffer.byteLength).assertEqual(src.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_6900
     * @tc.name int8ArrayConstructorPart04Test069
     * @tc.desc Verify other fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const copied: Int8Array = new Int8Array(src);
      src.fill(10);
      copied.fill(20);
      expect(src.$_get(0) + copied.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7000
     * @tc.name int8ArrayConstructorPart04Test070
     * @tc.desc Verify Int8Array other buffer.byteLength === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(0);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7100
     * @tc.name int8ArrayConstructorPart04Test071
     * @tc.desc Verify Int8Array other byteOffset === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(0);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7200
     * @tc.name int8ArrayConstructorPart04Test072
     * @tc.desc Verify Int8Array other toString() === ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(0);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7300
     * @tc.name int8ArrayConstructorPart04Test073
     * @tc.desc Verify Int8Array other length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([42]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7400
     * @tc.name int8ArrayConstructorPart04Test074
     * @tc.desc Verify (1000 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1000);
      src.$_set(999, -55);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(999)).assertEqual(-55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7500
     * @tc.name int8ArrayConstructorPart04Test075
     * @tc.desc Verify (1000 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1000);
      src.$_set(0, 55);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7600
     * @tc.name int8ArrayConstructorPart04Test076
     * @tc.desc Verify Int8Array other forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(0);
      const copied: Int8Array = new Int8Array(src);
      let count: int = 0;
      copied.forEach((v: number): void => { count = count + 1; });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7700
     * @tc.name int8ArrayConstructorPart04Test077
     * @tc.desc Verify Int8Array other at(0) === undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(0);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7800
     * @tc.name int8ArrayConstructorPart04Test078
     * @tc.desc Verify other (-128, 127)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([-128, INT8_MAX, -128, INT8_MAX]);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.$_get(0)).assertEqual(-128);
      expect(copied.$_get(1)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_7900
     * @tc.name int8ArrayConstructorPart04Test079
     * @tc.desc Verify other subarray(0) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const src: Int8Array = base.subarray(0);
      const copied: Int8Array = new Int8Array(src);
      expect(copied.length).assertEqual(base.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_8000
     * @tc.name int8ArrayConstructorPart04Test080
     * @tc.desc Verify other toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const reversed: Int8Array = src.toReversed();
      const copied: Int8Array = new Int8Array(reversed);
      expect(copied.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_8100
     * @tc.name int8ArrayConstructorPart04Test081
     * @tc.desc Verify other with() with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const modified: Int8Array = src.with(1, 99);
      const copied: Int8Array = new Int8Array(modified);
      expect(copied.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART04_TEST_8200
     * @tc.name int8ArrayConstructorPart04Test082
     * @tc.desc Verify buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array([1, 2, 3]);
      const first: Int8Array = new Int8Array(src);
      const second: Int8Array = new Int8Array(first);
      second.$_set(0, 50);
      expect(first.$_get(0)).assertEqual(1);
    });

  });
}
