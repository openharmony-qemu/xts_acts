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

export default function int16ArraySubarrayTestThreeTest(): void {
  describe('Int16ArraySubarrayTestThreeTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0100
     * @tc.name testInt16ArraySubarrayTestThree001
     * @tc.desc Verify empty Int16Array subarray() returns empty view sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array();
      let sub: Int16Array = src.subarray();
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
      let actual2: boolean = sub.buffer === src.buffer;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0200
     * @tc.name testInt16ArraySubarrayTestThree002
     * @tc.desc Verify empty Int16Array subarray(0) returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array();
      let sub: Int16Array = src.subarray(0);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
      let actual2: int = sub.byteLength;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0300
     * @tc.name testInt16ArraySubarrayTestThree003
     * @tc.desc Verify single-element Int16Array subarray(0) keeps the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(42);
      let sub: Int16Array = src.subarray(0);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
      let actual2: number = sub.$_get(0 as int);
      expect(actual2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0400
     * @tc.name testInt16ArraySubarrayTestThree004
     * @tc.desc Verify single-element Int16Array subarray(0, 1) keeps the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(42);
      let sub: Int16Array = src.subarray(0, 1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
      let actual2: number = sub.$_get(0 as int);
      expect(actual2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0500
     * @tc.name testInt16ArraySubarrayTestThree005
     * @tc.desc Verify Int16Array subarray(32768) clamps begin to length empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = src.subarray(32768);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0600
     * @tc.name testInt16ArraySubarrayTestThree006
     * @tc.desc Verify Int16Array subarray(-32769) clamps begin to 0 full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = src.subarray(-32769);
      let actual1: int = sub.length;
      let expected1: int = src.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0700
     * @tc.name testInt16ArraySubarrayTestThree007
     * @tc.desc Verify Int16Array subarray(32768) empty view still shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(11, 22, 33, 44);
      let sub: Int16Array = src.subarray(32768);
      let actual1: boolean = sub.buffer === src.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0800
     * @tc.name testInt16ArraySubarrayTestThree008
     * @tc.desc Verify single-element Int16Array subarray(-2147483648) clamps to full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(99);
      let sub: Int16Array = src.subarray(-2147483648);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_0900
     * @tc.name testInt16ArraySubarrayTestThree009
     * @tc.desc Verify single-element Int16Array subarray(-32769) clamps begin to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(88);
      let sub: Int16Array = src.subarray(-32769);
      let actual1: number = sub.$_get(0 as int);
      expect(actual1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1000
     * @tc.name testInt16ArraySubarrayTestThree010
     * @tc.desc Verify Int16Array subarray(0, 32768) clamps end to length full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(12, 24, 36, 48, 60);
      let sub: Int16Array = src.subarray(0, 32768);
      let actual1: int = sub.length;
      let expected1: int = src.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1100
     * @tc.name testInt16ArraySubarrayTestThree011
     * @tc.desc Verify Int16Array subarray(0, -32769) clamps end to 0 empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(12, 24, 36, 48, 60);
      let sub: Int16Array = src.subarray(0, -32769);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1200
     * @tc.name testInt16ArraySubarrayTestThree012
     * @tc.desc Verify single-element Int16Array subarray(0, 2147483647) clamps end to length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(55);
      let sub: Int16Array = src.subarray(0, 2147483647);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1300
     * @tc.name testInt16ArraySubarrayTestThree013
     * @tc.desc Verify single-element Int16Array subarray(0, -2147483648) clamps end to empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(55);
      let sub: Int16Array = src.subarray(0, -2147483648);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1400
     * @tc.name testInt16ArraySubarrayTestThree014
     * @tc.desc Verify Int16Array subarray(-100, -100) clamps both to 0 empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = src.subarray(-100, -100);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1500
     * @tc.name testInt16ArraySubarrayTestThree015
     * @tc.desc Verify Int16Array subarray(100, 100) clamps both to length empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = src.subarray(100, 100);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1600
     * @tc.name testInt16ArraySubarrayTestThree016
     * @tc.desc Verify Int16Array subarray(-100, 100) clamps to full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = src.subarray(-100, 100);
      let actual1: int = sub.length;
      let expected1: int = src.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1700
     * @tc.name testInt16ArraySubarrayTestThree017
     * @tc.desc Verify Int16Array subarray(100, -100) begin after end yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = src.subarray(100, -100);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1800
     * @tc.name testInt16ArraySubarrayTestThree018
     * @tc.desc Verify Int16Array subarray(-2147483648, 2147483647) covers full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(7, 14, 21, 28);
      let sub: Int16Array = src.subarray(-2147483648, 2147483647);
      let actual1: int = sub.length;
      let expected1: int = src.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_1900
     * @tc.name testInt16ArraySubarrayTestThree019
     * @tc.desc Verify Int16Array subarray(2147483647, -2147483648) yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(7, 14, 21, 28);
      let sub: Int16Array = src.subarray(2147483647, -2147483648);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2000
     * @tc.name testInt16ArraySubarrayTestThree020
     * @tc.desc Verify Int16Array subarray(-32769, 32768) covers full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(3, 6, 9, 12);
      let sub: Int16Array = src.subarray(-32769, 32768);
      let actual1: int = sub.length;
      let expected1: int = src.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2100
     * @tc.name testInt16ArraySubarrayTestThree021
     * @tc.desc Verify Int16Array subarray(32768, -32769) yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(3, 6, 9, 12);
      let sub: Int16Array = src.subarray(32768, -32769);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2200
     * @tc.name testInt16ArraySubarrayTestThree022
     * @tc.desc Verify Int16Array subarray(-6, 6) clamps to full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(8, 16, 24, 32, 40);
      let sub: Int16Array = src.subarray(-6, 6);
      let actual1: int = sub.length;
      let expected1: int = src.length;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2300
     * @tc.name testInt16ArraySubarrayTestThree023
     * @tc.desc Verify Int16Array subarray(6, -6) clamps begin after end empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(8, 16, 24, 32, 40);
      let sub: Int16Array = src.subarray(6, -6);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2400
     * @tc.name testInt16ArraySubarrayTestThree024
     * @tc.desc Verify empty Int16Array subarray(1, 5) still shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array();
      let sub: Int16Array = src.subarray(1, 5);
      let actual1: boolean = sub.buffer === src.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2500
     * @tc.name testInt16ArraySubarrayTestThree025
     * @tc.desc Verify single-element Int16Array subarray(-2) clamps begin to full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(77);
      let sub: Int16Array = src.subarray(-2);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2600
     * @tc.name testInt16ArraySubarrayTestThree026
     * @tc.desc Verify single-element Int16Array subarray(-2, -1) keeps the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(33);
      let sub: Int16Array = src.subarray(-2, -1);
      let lenBefore: int = sub.length;
      try {
        sub.$_get(0 as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actual1: int = sub.length;
      let expected1: int = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2700
     * @tc.name testInt16ArraySubarrayTestThree027
     * @tc.desc Verify single-element Int16Array subarray(0, -1) clamps end to full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(65);
      let sub: Int16Array = src.subarray(0, -1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2800
     * @tc.name testInt16ArraySubarrayTestThree028
     * @tc.desc Verify single-element Int16Array subarray(-1, 0) yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(44);
      let sub: Int16Array = src.subarray(-1, 0);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_2900
     * @tc.name testInt16ArraySubarrayTestThree029
     * @tc.desc Verify single-element Int16Array subarray(-1, 1) keeps the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(22);
      let sub: Int16Array = src.subarray(-1, 1);
      let actual1: number = sub.$_get(0 as int);
      expect(actual1).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3000
     * @tc.name testInt16ArraySubarrayTestThree030
     * @tc.desc Verify single-element Int16Array subarray(1, -1) yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(99);
      let sub: Int16Array = src.subarray(1, -1);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3100
     * @tc.name testInt16ArraySubarrayTestThree031
     * @tc.desc Verify single-element Int16Array subarray(-3, -2) clamps to empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(55);
      let sub: Int16Array = src.subarray(-3, -2);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3200
     * @tc.name testInt16ArraySubarrayTestThree032
     * @tc.desc Verify single-element Int16Array subarray(1) empty view still shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(88);
      let sub: Int16Array = src.subarray(1);
      let actual1: boolean = sub.buffer === src.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3300
     * @tc.name testInt16ArraySubarrayTestThree033
     * @tc.desc Verify single-element Int16Array subarray(0, 0) empty view byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(33);
      let sub: Int16Array = src.subarray(0, 0);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
      let actual2: int = sub.byteLength;
      expect(actual2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3400
     * @tc.name testInt16ArraySubarrayTestThree034
     * @tc.desc Verify 32767-filled Int16Array subarray(0, 2) reads shared values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(32767, 32767, 32767, 32767);
      let sub: Int16Array = src.subarray(0, 2);
      let actual1: number = sub.$_get(0 as int);
      expect(actual1).assertEqual(32767);
      let actual2: number = sub.$_get(1 as int);
      expect(actual2).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3500
     * @tc.name testInt16ArraySubarrayTestThree035
     * @tc.desc Verify -32768-filled Int16Array subarray(1, 4) write syncs to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(-32768, -32768, -32768, -32768, -32768);
      let sub: Int16Array = src.subarray(1, 4);
      sub.$_set(1 as int, 0);
      let actual1: number = src.$_get(2 as int);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3600
     * @tc.name testInt16ArraySubarrayTestThree036
     * @tc.desc Verify -1-filled Int16Array subarray(2, 5) reads shared values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(-1, -1, -1, -1, -1, -1);
      let sub: Int16Array = src.subarray(2, 5);
      let actual1: number = sub.$_get(0 as int);
      expect(actual1).assertEqual(-1);
      let actual2: number = sub.$_get(2 as int);
      expect(actual2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3700
     * @tc.name testInt16ArraySubarrayTestThree037
     * @tc.desc Verify -32768-filled Int16Array subarray(-1) returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(-32768, -32768, -32768, -32768);
      let sub: Int16Array = src.subarray(-1);
      let actual1: number = sub.$_get(0 as int);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3800
     * @tc.name testInt16ArraySubarrayTestThree038
     * @tc.desc Verify source fill after Int16Array subarray is visible in view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(-1, -1, -1, -1);
      let sub: Int16Array = src.subarray(1, 3);
      src.fill(0);
      let actual1: number = sub.$_get(0 as int);
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_3900
     * @tc.name testInt16ArraySubarrayTestThree039
     * @tc.desc Verify nested Int16Array subarray write is visible on outer array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6);
      let sub1: Int16Array = src.subarray(0, 5);
      let sub2: Int16Array = sub1.subarray(1, 4);
      let sub3: Int16Array = sub2.subarray(0, 2);
      sub3.$_set(0 as int, 99);
      let actual1: number = src.$_get(1 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4000
     * @tc.name testInt16ArraySubarrayTestThree040
     * @tc.desc Verify nested Int16Array subarray mid-layer write visible to inner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(10, 20, 30, 40, 50, 60);
      let sub1: Int16Array = src.subarray(0, 4);
      let sub2: Int16Array = sub1.subarray(1, 3);
      sub1.$_set(1 as int, 88);
      let actual1: number = sub2.$_get(0 as int);
      expect(actual1).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4100
     * @tc.name testInt16ArraySubarrayTestThree041
     * @tc.desc Verify nested Int16Array subarray outer write visible to innermost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub1: Int16Array = src.subarray(0, 4);
      let sub2: Int16Array = sub1.subarray(0, 3);
      let sub3: Int16Array = sub2.subarray(0, 2);
      src.$_set(1 as int, 77);
      let actual1: number = sub3.$_get(1 as int);
      expect(actual1).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4200
     * @tc.name testInt16ArraySubarrayTestThree042
     * @tc.desc Verify branched Int16Array subarray views share same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(5, 10, 15, 20, 25, 30);
      let branchA: Int16Array = src.subarray(0, 4).subarray(1, 3);
      let branchB: Int16Array = src.subarray(2, 5).subarray(0, 1);
      let actual1: boolean = branchA.buffer === branchB.buffer;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4300
     * @tc.name testInt16ArraySubarrayTestThree043
     * @tc.desc Verify four-level nested Int16Array subarray byteOffset accumulates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      let sub1: Int16Array = src.subarray(1);
      let sub2: Int16Array = sub1.subarray(1);
      let sub3: Int16Array = sub2.subarray(1);
      let sub4: Int16Array = sub3.subarray(1);
      let actual1: int = sub4.byteOffset;
      expect(actual1).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4400
     * @tc.name testInt16ArraySubarrayTestThree044
     * @tc.desc Verify nested Int16Array subarray length after cumulative offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      let sub1: Int16Array = src.subarray(1, 7);
      let sub2: Int16Array = sub1.subarray(2, 5);
      let actual1: int = sub2.length;
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4500
     * @tc.name testInt16ArraySubarrayTestThree045
     * @tc.desc Verify source fill after nested Int16Array subarray is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub1: Int16Array = src.subarray(0, 4);
      let sub2: Int16Array = sub1.subarray(1, 3);
      let sub3: Int16Array = sub2.subarray(0, 1);
      src.fill(99);
      let actual1: number = sub3.$_get(0 as int);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4600
     * @tc.name testInt16ArraySubarrayTestThree046
     * @tc.desc Verify ArrayBuffer-backed Int16Array subarray(1) byteOffset is 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let src: Int16Array = new Int16Array(buf, 4, 6);
      let sub: Int16Array = src.subarray(1);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4700
     * @tc.name testInt16ArraySubarrayTestThree047
     * @tc.desc Verify ArrayBuffer-backed Int16Array subarray(1, 3) byteOffset and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let src: Int16Array = new Int16Array(buf, 4, 4);
      let sub: Int16Array = src.subarray(1, 3);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(6);
      let actual2: int = sub.length;
      expect(actual2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4800
     * @tc.name testInt16ArraySubarrayTestThree048
     * @tc.desc Verify ArrayBuffer-backed Int16Array subarray() keeps byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let src: Int16Array = new Int16Array(buf, 4, 4);
      let sub: Int16Array = src.subarray();
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_4900
     * @tc.name testInt16ArraySubarrayTestThree049
     * @tc.desc Verify ArrayBuffer-backed Int16Array subarray(-1) last element byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let src: Int16Array = new Int16Array(buf, 4, 6);
      let sub: Int16Array = src.subarray(-1);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5000
     * @tc.name testInt16ArraySubarrayTestThree050
     * @tc.desc Verify ArrayBuffer-backed Int16Array subarray(6) clamps to empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let src: Int16Array = new Int16Array(buf, 4, 4);
      let sub: Int16Array = src.subarray(6);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5100
     * @tc.name testInt16ArraySubarrayTestThree051
     * @tc.desc Verify ArrayBuffer-backed Int16Array subarray(0, 3) buffer equals ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let src: Int16Array = new Int16Array(buf, 2, 6);
      let sub: Int16Array = src.subarray(0, 3);
      let actual1: boolean = sub.buffer === buf;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5200
     * @tc.name testInt16ArraySubarrayTestThree052
     * @tc.desc Verify Int16Array subarray write -32769 stores 32767 on source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4);
      let sub: Int16Array = src.subarray(2, 3);
      sub.$_set(0 as int, -32769);
      let actual1: number = src.$_get(2 as int);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5300
     * @tc.name testInt16ArraySubarrayTestThree053
     * @tc.desc Verify Int16Array subarray write 3.7 truncates to 3 on source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4);
      let sub: Int16Array = src.subarray(0, 1);
      sub.$_set(0 as int, 3.7);
      let actual1: number = src.$_get(0 as int);
      expect(actual1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5400
     * @tc.name testInt16ArraySubarrayTestThree054
     * @tc.desc Verify Int16Array subarray write -3.7 truncates to -3 on source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4);
      let sub: Int16Array = src.subarray(1, 2);
      sub.$_set(0 as int, -3.7);
      let actual1: number = src.$_get(1 as int);
      expect(actual1).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5500
     * @tc.name testInt16ArraySubarrayTestThree055
     * @tc.desc Verify Int16Array subarray(10, -10) empty view still shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4);
      let sub: Int16Array = src.subarray(10, -10);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
      let actual2: boolean = sub.buffer === src.buffer;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5600
     * @tc.name testInt16ArraySubarrayTestThree056
     * @tc.desc Verify Int16Array subarray(-100, 100) full view across range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(9, 18, 27, 36);
      let sub: Int16Array = src.subarray(-100, 100);
      let actual1: int = sub.length;
      let expected1: int = src.length;
      expect(actual1).assertEqual(expected1);
      let actual2: number = sub.$_get(0 as int);
      expect(actual2).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5700
     * @tc.name testInt16ArraySubarrayTestThree057
     * @tc.desc Verify Int16Array subarray(5, 15) begin equals length empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = src.subarray(5, 15);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5800
     * @tc.name testInt16ArraySubarrayTestThree058
     * @tc.desc Verify Int16Array subarray(-15, -5) double negative OOB empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = src.subarray(-15, -5);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_5900
     * @tc.name testInt16ArraySubarrayTestThree059
     * @tc.desc Verify Int16Array subarray(10) empty view byteOffset equals length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4);
      let sub: Int16Array = src.subarray(10);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_6000
     * @tc.name testInt16ArraySubarrayTestThree060
     * @tc.desc Verify Int16Array subarray(-10) clamps begin byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4);
      let sub: Int16Array = src.subarray(-10);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_6100
     * @tc.name testInt16ArraySubarrayTestThree061
     * @tc.desc Verify Int16Array subarray(5, 10) empty view byteOffset equals length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = src.subarray(5, 10);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_SUBARRAY_THREE_6200
     * @tc.name testInt16ArraySubarrayTestThree062
     * @tc.desc Verify Int16Array subarray(-10, -10) empty view byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArraySubarrayTestThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(1, 2, 3, 4);
      let sub: Int16Array = src.subarray(-10, -10);
      let actual1: int = sub.byteOffset;
      expect(actual1).assertEqual(0);
    });
  });
}
