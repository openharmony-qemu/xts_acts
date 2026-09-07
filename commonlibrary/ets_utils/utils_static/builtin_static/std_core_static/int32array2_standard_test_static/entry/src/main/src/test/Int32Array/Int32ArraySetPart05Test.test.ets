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

export default function int32ArraySetPart05Test(): void {
  describe('Int32ArraySetPart05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0100
     * @tc.name int32ArraySetPart05Test001
     * @tc.desc Verify single FixedArray<number> arg writes correctly without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [10.0, 20.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(10);
      expect(target.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0200
     * @tc.name int32ArraySetPart05Test002
     * @tc.desc Verify empty FixedArray<number> to non-empty target, all elements preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      target.$_set(0, 11);
      target.$_set(1, 22);
      target.$_set(2, 33);
      let src: FixedArray<number> = [];
      target.set(src);
      expect(target.$_get(0)).assertEqual(11);
      expect(target.$_get(1)).assertEqual(22);
      expect(target.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0300
     * @tc.name int32ArraySetPart05Test003
     * @tc.desc Verify single-element source [1] to single-element target, writes 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [1.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0400
     * @tc.name int32ArraySetPart05Test004
     * @tc.desc Verify three-element source to three-element target, all positions correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [-5.0, 0.0, 5.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(-5);
      expect(target.$_get(1)).assertEqual(0);
      expect(target.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0500
     * @tc.name int32ArraySetPart05Test005
     * @tc.desc Verify source length == target length fully overwrites pre-filled data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      target.$_set(0, 99);
      target.$_set(1, 88);
      target.$_set(2, 77);
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
      expect(target.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0600
     * @tc.name int32ArraySetPart05Test006
     * @tc.desc Verify source shorter than target writes from offset=0, suffix preserves origin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(4);
      target.$_set(0, 100);
      target.$_set(1, 200);
      target.$_set(2, 300);
      target.$_set(3, 400);
      let src: FixedArray<number> = [11.0, 22.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(11);
      expect(target.$_get(1)).assertEqual(22);
      expect(target.$_get(2)).assertEqual(300);
      expect(target.$_get(3)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0700
     * @tc.name int32ArraySetPart05Test007
     * @tc.desc Verify source length == target+1 over by 1, throws RangeError, target preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(2);
      target.$_set(0, 77);
      target.$_set(1, 88);
      let src: FixedArray<number> = [1.0, 2.0, 3.0];
      try {
        target.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(target.$_get(0)).assertEqual(77);
      expect(target.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0800
     * @tc.name int32ArraySetPart05Test008
     * @tc.desc Verify source far longer than target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
      try {
        target.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_0900
     * @tc.name int32ArraySetPart05Test009
     * @tc.desc Verify all-zero source batch writes all positions to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(4);
      target.$_set(0, 5);
      target.$_set(1, 6);
      target.$_set(2, 7);
      target.$_set(3, 8);
      let src: FixedArray<number> = [0.0, 0.0, 0.0, 0.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(1)).assertEqual(0);
      expect(target.$_get(2)).assertEqual(0);
      expect(target.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1000
     * @tc.name int32ArraySetPart05Test010
     * @tc.desc Verify all-same non-zero source batch writes same value to all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [42.0, 42.0, 42.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(42);
      expect(target.$_get(1)).assertEqual(42);
      expect(target.$_get(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1100
     * @tc.name int32ArraySetPart05Test011
     * @tc.desc Verify Number.NaN source converts to 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      target.$_set(0, 555);
      let src: FixedArray<number> = [Number.NaN];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1200
     * @tc.name int32ArraySetPart05Test012
     * @tc.desc Verify 0.5 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [0.5];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1300
     * @tc.name int32ArraySetPart05Test013
     * @tc.desc Verify -0.5 truncates toward zero to 0, not -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-0.5];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1400
     * @tc.name int32ArraySetPart05Test014
     * @tc.desc Verify 0.9 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [0.9];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1500
     * @tc.name int32ArraySetPart05Test015
     * @tc.desc Verify -0.9 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-0.9];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1600
     * @tc.name int32ArraySetPart05Test016
     * @tc.desc Verify 1.5 truncates toward zero to 1, not 2 or rounded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [1.5];
      target.set(src);
      expect(target.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1700
     * @tc.name int32ArraySetPart05Test017
     * @tc.desc Verify -1.5 truncates toward zero to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-1.5];
      target.set(src);
      expect(target.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1800
     * @tc.name int32ArraySetPart05Test018
     * @tc.desc Verify 0.1 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [0.1];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_1900
     * @tc.name int32ArraySetPart05Test019
     * @tc.desc Verify -0.1 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-0.1];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2000
     * @tc.name int32ArraySetPart05Test020
     * @tc.desc Verify 2147483647.9 truncates to INT_MAX without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [2147483647.9];
      target.set(src);
      expect(target.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2100
     * @tc.name int32ArraySetPart05Test021
     * @tc.desc Verify -2147483647.9 truncates to -2147483647, not INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-2147483647.9];
      target.set(src);
      expect(target.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2200
     * @tc.name int32ArraySetPart05Test022
     * @tc.desc Verify mixed small fraction batch [0.5,1.5,-0.5,-1.5] truncates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [0.5, 1.5, -0.5, -1.5];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(1)).assertEqual(1);
      expect(target.$_get(2)).assertEqual(0);
      expect(target.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2300
     * @tc.name int32ArraySetPart05Test023
     * @tc.desc Verify 100.999 truncates to 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [100.999];
      target.set(src);
      expect(target.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2400
     * @tc.name int32ArraySetPart05Test024
     * @tc.desc Verify 4294967296 (2^32) wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [4294967296.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2500
     * @tc.name int32ArraySetPart05Test025
     * @tc.desc Verify 4294967297 (2^32+1) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [4294967297.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2600
     * @tc.name int32ArraySetPart05Test026
     * @tc.desc Verify mixed boundary wrap [INT_MAX, INT_MAX+1, INT_MIN-1] each independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [2147483647.0, 2147483648.0, -2147483649.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(2147483647);
      expect(target.$_get(1)).assertEqual(-2147483648);
      expect(target.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2700
     * @tc.name int32ArraySetPart05Test027
     * @tc.desc Verify zero-init target after set, only source covered region changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [9.0, 8.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(9);
      expect(target.$_get(1)).assertEqual(8);
      expect(target.$_get(2)).assertEqual(0);
      expect(target.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2800
     * @tc.name int32ArraySetPart05Test028
     * @tc.desc Verify pre-filled target short source preserves tail sentinel values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(5);
      target.$_set(0, 111);
      target.$_set(1, 222);
      target.$_set(2, 333);
      target.$_set(3, 444);
      target.$_set(4, 555);
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(10);
      expect(target.$_get(1)).assertEqual(20);
      expect(target.$_get(2)).assertEqual(30);
      expect(target.$_get(3)).assertEqual(444);
      expect(target.$_get(4)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_2900
     * @tc.name int32ArraySetPart05Test029
     * @tc.desc Verify single-element target with single source, length remains 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [77.0];
      target.set(src);
      expect(target.length).assertEqual(1);
      expect(target.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3000
     * @tc.name int32ArraySetPart05Test030
     * @tc.desc Verify source elements written left-to-right to positions 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [10.0, 20.0, 30.0, 40.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(10);
      expect(target.$_get(1)).assertEqual(20);
      expect(target.$_get(2)).assertEqual(30);
      expect(target.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3100
     * @tc.name int32ArraySetPart05Test031
     * @tc.desc Verify two consecutive sets, second from offset 0 overwrites first prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      let first: FixedArray<number> = [1.0, 2.0, 3.0];
      let second: FixedArray<number> = [9.0, 8.0];
      target.set(first);
      target.set(second);
      expect(target.$_get(0)).assertEqual(9);
      expect(target.$_get(1)).assertEqual(8);
      expect(target.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3200
     * @tc.name int32ArraySetPart05Test032
     * @tc.desc Verify medium-length 8-element source batch write, each position correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(8);
      let src: FixedArray<number> = [0.0, 1.0, -1.0, 2.0, -2.0, 3.0, -3.0, 4.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(1)).assertEqual(1);
      expect(target.$_get(2)).assertEqual(-1);
      expect(target.$_get(3)).assertEqual(2);
      expect(target.$_get(4)).assertEqual(-2);
      expect(target.$_get(5)).assertEqual(3);
      expect(target.$_get(6)).assertEqual(-3);
      expect(target.$_get(7)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3300
     * @tc.name int32ArraySetPart05Test033
     * @tc.desc Verify for-of iteration after set yields correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [4.0, 5.0, 6.0];
      target.set(src);
      let collected: Array<number> = [];
      for (let i = 0; i < target.length; i++) {
        let v = target.$_get(i);
        collected.push(v);
      }
      expect(collected[0]).assertEqual(4);
      expect(collected[1]).assertEqual(5);
      expect(collected[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3400
     * @tc.name int32ArraySetPart05Test034
     * @tc.desc Verify at() with positive index reads back correctly after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [7.0, 8.0, 9.0];
      target.set(src);
      expect(target.at(0)).assertEqual(7);
      expect(target.at(1)).assertEqual(8);
      expect(target.at(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3500
     * @tc.name int32ArraySetPart05Test035
     * @tc.desc Verify at() with negative index reads back correctly after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [7.0, 8.0, 9.0];
      target.set(src);
      expect(target.at(-1)).assertEqual(9);
      expect(target.at(-2)).assertEqual(8);
      expect(target.at(-3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3600
     * @tc.name int32ArraySetPart05Test036
     * @tc.desc Verify 32767.5 truncates to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [32767.5];
      target.set(src);
      expect(target.$_get(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3700
     * @tc.name int32ArraySetPart05Test037
     * @tc.desc Verify -32768.5 truncates to -32768 (int16 MIN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-32768.5];
      target.set(src);
      expect(target.$_get(0)).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3800
     * @tc.name int32ArraySetPart05Test038
     * @tc.desc Verify -0.0 through ToInt32 becomes 0 (negative zero = positive zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let negZero: number = -0.0;
      let src: FixedArray<number> = [negZero];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_3900
     * @tc.name int32ArraySetPart05Test039
     * @tc.desc Verify 65535.9 truncates to 65535 (uint16 max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [65535.9];
      target.set(src);
      expect(target.$_get(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4000
     * @tc.name int32ArraySetPart05Test040
     * @tc.desc Verify -65536.1 truncates to -65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-65536.1];
      target.set(src);
      expect(target.$_get(0)).assertEqual(-65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4100
     * @tc.name int32ArraySetPart05Test041
     * @tc.desc Verify 1073741823.0 (2^30-1) preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [1073741823.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(1073741823);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4200
     * @tc.name int32ArraySetPart05Test042
     * @tc.desc Verify 1073741824.0 (2^30) preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [1073741824.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4300
     * @tc.name int32ArraySetPart05Test043
     * @tc.desc Verify -1073741824.0 (-2^30) preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-1073741824.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(-1073741824);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4400
     * @tc.name int32ArraySetPart05Test044
     * @tc.desc Verify -2147483647.0 (INT_MIN+1) preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-2147483647.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4500
     * @tc.name int32ArraySetPart05Test045
     * @tc.desc Verify 2147483647.1 truncates to INT_MAX, fraction discarded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [2147483647.1];
      target.set(src);
      expect(target.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4600
     * @tc.name int32ArraySetPart05Test046
     * @tc.desc Verify tiny positive 2.22e-16 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [2.220446049250313e-16];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4700
     * @tc.name int32ArraySetPart05Test047
     * @tc.desc Verify tiny negative truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-2.220446049250313e-16];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4800
     * @tc.name int32ArraySetPart05Test048
     * @tc.desc Verify all-negative source writes each value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [-10.0, -20.0, -30.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(-10);
      expect(target.$_get(1)).assertEqual(-20);
      expect(target.$_get(2)).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_4900
     * @tc.name int32ArraySetPart05Test049
     * @tc.desc Verify ArrayBuffer-constructed target set, sibling Int32Array view sees writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let target: Int32Array = new Int32Array(buf, 0, 4);
      let sibling: Int32Array = new Int32Array(buf, 0, 4);
      let src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0];
      target.set(src);
      expect(sibling.$_get(0)).assertEqual(1);
      expect(sibling.$_get(1)).assertEqual(2);
      expect(sibling.$_get(2)).assertEqual(3);
      expect(sibling.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5000
     * @tc.name int32ArraySetPart05Test050
     * @tc.desc Verify byteOffset=4 view set writes to correct buffer bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let prefix: Int32Array = new Int32Array(buf, 0, 1);
      prefix.$_set(0, 999);
      let target: Int32Array = new Int32Array(buf, 4, 3);
      let src: FixedArray<number> = [11.0, 22.0, 33.0];
      target.set(src);
      expect(prefix.$_get(0)).assertEqual(999);
      expect(target.$_get(0)).assertEqual(11);
      expect(target.$_get(1)).assertEqual(22);
      expect(target.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5100
     * @tc.name int32ArraySetPart05Test051
     * @tc.desc Verify target length unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [7.0, 8.0];
      target.set(src);
      expect(target.length).assertEqual(4);
      {
        let target: Int32Array = new Int32Array(4);
        let src: FixedArray<number> = [1.0, 2.0];
        target.set(src);
        expect(target.byteLength).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5200
     * @tc.name int32ArraySetPart05Test052
     * @tc.desc Verify target byteOffset unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let target: Int32Array = new Int32Array(buf, 8, 2);
      let src: FixedArray<number> = [5.0, 6.0];
      target.set(src);
      expect(target.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5300
     * @tc.name int32ArraySetPart05Test053
     * @tc.desc Verify target buffer reference unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let target: Int32Array = new Int32Array(buf, 0, 2);
      let src: FixedArray<number> = [3.0, 4.0];
      target.set(src);
      expect(target.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5400
     * @tc.name int32ArraySetPart05Test054
     * @tc.desc Verify large buffer small view set doesn't overflow into adjacent slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let target: Int32Array = new Int32Array(buf, 0, 2);
      let guard: Int32Array = new Int32Array(buf, 8, 2);
      guard.$_set(0, 777);
      guard.$_set(1, 888);
      let src: FixedArray<number> = [1.0, 2.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
      expect(guard.$_get(0)).assertEqual(777);
      expect(guard.$_get(1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5500
     * @tc.name int32ArraySetPart05Test055
     * @tc.desc Verify subarray view set reflected in original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array(5);
      base.$_set(0, 0);
      base.$_set(1, 0);
      base.$_set(2, 0);
      base.$_set(3, 0);
      base.$_set(4, 0);
      let sub: Int32Array = base.subarray(1, 4);
      let src: FixedArray<number> = [10.0, 20.0, 30.0];
      sub.set(src);
      expect(base.$_get(0)).assertEqual(0);
      expect(base.$_get(1)).assertEqual(10);
      expect(base.$_get(2)).assertEqual(20);
      expect(base.$_get(3)).assertEqual(30);
      expect(base.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5600
     * @tc.name int32ArraySetPart05Test056
     * @tc.desc Verify single-element INT_MIN source, byteLength still 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-2147483648.0];
      target.set(src);
      expect(target.byteLength).assertEqual(4);
      expect(target.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5700
     * @tc.name int32ArraySetPart05Test057
     * @tc.desc Verify set does not modify FixedArray source content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [55.0, 66.0];
      target.set(src);
      expect(src[0]).assertEqual(55.0);
      expect(src[1]).assertEqual(66.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART05_5800
     * @tc.name int32ArraySetPart05Test058
     * @tc.desc Verify mixed zero/positive/negative/Number.NaN source, each position independently converted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [0.0, 42.0, -42.0, Number.NaN, -1.0];
      target.set(src);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(1)).assertEqual(42);
      expect(target.$_get(2)).assertEqual(-42);
      expect(target.$_get(3)).assertEqual(0);
      expect(target.$_get(4)).assertEqual(-1);
    });
  });
}
