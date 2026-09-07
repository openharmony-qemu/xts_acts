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

export default function int32ArraySetPart03Test(): void {
  describe('Int32ArraySetPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0100
     * @tc.name int32ArraySetPart03Test001
     * @tc.desc Verify set(FixedArray<int>) copies all elements from position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<int> = [10, 20, 30];
      values.set(src);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(1)).assertEqual(20);
      expect(values.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0200
     * @tc.name int32ArraySetPart03Test002
     * @tc.desc Verify set(FixedArray<int>) completes normally without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<int> = [1, 2];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0300
     * @tc.name int32ArraySetPart03Test003
     * @tc.desc Verify empty FixedArray on non-empty target does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(7, 8, 9);
      let src: FixedArray<number> = [];
      values.set(src);
      expect(values.$_get(0)).assertEqual(7);
      expect(values.$_get(1)).assertEqual(8);
      expect(values.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0400
     * @tc.name int32ArraySetPart03Test004
     * @tc.desc Verify empty FixedArray on length-0 target does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(0);
      let src: FixedArray<number> = [];
      values.set(src);
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0500
     * @tc.name int32ArraySetPart03Test005
     * @tc.desc Verify empty FixedArray preserves target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [];
      values.set(src);
      expect(values.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0600
     * @tc.name int32ArraySetPart03Test006
     * @tc.desc Verify empty FixedArray on length-1 target preserves sole element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      values.$_set(0, 77);
      let src: FixedArray<number> = [];
      values.set(src);
      expect(values.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0700
     * @tc.name int32ArraySetPart03Test007
     * @tc.desc Verify empty FixedArray on zero-init long target keeps all positions zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [];
      values.set(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(0);
      expect(values.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0800
     * @tc.name int32ArraySetPart03Test008
     * @tc.desc Verify single-element source [0] writes 0 to position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [0];
      values.set(src);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_0900
     * @tc.name int32ArraySetPart03Test009
     * @tc.desc Verify single-element source [1] writes 1 to position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [1];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1000
     * @tc.name int32ArraySetPart03Test010
     * @tc.desc Verify single-element source [-1] writes -1 to position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [-1];
      values.set(src);
      expect(values.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1100
     * @tc.name int32ArraySetPart03Test011
     * @tc.desc Verify single-element source [INT_MAX] preserves value exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [2147483647];
      values.set(src);
      expect(values.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1200
     * @tc.name int32ArraySetPart03Test012
     * @tc.desc Verify single-element source [INT_MIN] preserves value exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-2147483648];
      values.set(src);
      expect(values.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1300
     * @tc.name int32ArraySetPart03Test013
     * @tc.desc Verify single-element source covers position 0, subsequent positions remain 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [99];
      values.set(src);
      expect(values.$_get(0)).assertEqual(99);
      expect(values.$_get(1)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(0);
      expect(values.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1400
     * @tc.name int32ArraySetPart03Test014
     * @tc.desc Verify single-element source overwrites existing non-zero value on length-1 target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      values.$_set(0, 55);
      let src: FixedArray<number> = [77];
      values.set(src);
      expect(values.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1500
     * @tc.name int32ArraySetPart03Test015
     * @tc.desc Verify three-element source [1,2,3] writes in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1600
     * @tc.name int32ArraySetPart03Test016
     * @tc.desc Verify five-element source writes to length-5 target, full coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [10, 20, 30, 40, 50];
      values.set(src);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1700
     * @tc.name int32ArraySetPart03Test017
     * @tc.desc Verify all-zero source overwrites non-zero target to all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(7, 8, 9);
      let src: FixedArray<number> = [0, 0, 0];
      values.set(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1800
     * @tc.name int32ArraySetPart03Test018
     * @tc.desc Verify all-same non-zero source writes same value to all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [5, 5, 5];
      values.set(src);
      expect(values.$_get(0)).assertEqual(5);
      expect(values.$_get(1)).assertEqual(5);
      expect(values.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_1900
     * @tc.name int32ArraySetPart03Test019
     * @tc.desc Verify all-negative source writes with correct sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [-1, -2, -3];
      values.set(src);
      expect(values.$_get(0)).assertEqual(-1);
      expect(values.$_get(1)).assertEqual(-2);
      expect(values.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2000
     * @tc.name int32ArraySetPart03Test020
     * @tc.desc Verify mixed positive/negative source preserves each value independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1, -1, 2, -2];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(-1);
      expect(values.$_get(2)).assertEqual(2);
      expect(values.$_get(3)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2100
     * @tc.name int32ArraySetPart03Test021
     * @tc.desc Verify ascending sequence source writes in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1, 2, 3, 4];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
      expect(values.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2200
     * @tc.name int32ArraySetPart03Test022
     * @tc.desc Verify descending sequence source writes in source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [4, 3, 2, 1];
      values.set(src);
      expect(values.$_get(0)).assertEqual(4);
      expect(values.$_get(1)).assertEqual(3);
      expect(values.$_get(2)).assertEqual(2);
      expect(values.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2300
     * @tc.name int32ArraySetPart03Test023
     * @tc.desc Verify boundary mix [0,-1,INT_MAX,INT_MIN] writes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [0, -1, 2147483647, -2147483648];
      values.set(src);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(-1);
      expect(values.$_get(2)).assertEqual(2147483647);
      expect(values.$_get(3)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2400
     * @tc.name int32ArraySetPart03Test024
     * @tc.desc Verify alternating sign source [1,-1,1,-1] each position independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1, -1, 1, -1];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(-1);
      expect(values.$_get(2)).assertEqual(1);
      expect(values.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2500
     * @tc.name int32ArraySetPart03Test025
     * @tc.desc Verify source.length==target.length fully overwrites all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(7, 8, 9);
      let src: FixedArray<number> = [1, 2, 3];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2600
     * @tc.name int32ArraySetPart03Test026
     * @tc.desc Verify source.length==target.length-1 overwrites prefix, tail preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(7, 8, 9);
      let src: FixedArray<number> = [1, 2];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2700
     * @tc.name int32ArraySetPart03Test027
     * @tc.desc Verify source length 1 on multi-element target only covers position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(7, 8, 9, 10);
      let src: FixedArray<number> = [99];
      values.set(src);
      expect(values.$_get(0)).assertEqual(99);
      expect(values.$_get(1)).assertEqual(8);
      expect(values.$_get(2)).assertEqual(9);
      expect(values.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2800
     * @tc.name int32ArraySetPart03Test028
     * @tc.desc Verify source length 2 far less than target length 5 covers only first 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [11, 22];
      values.set(src);
      expect(values.$_get(0)).assertEqual(11);
      expect(values.$_get(1)).assertEqual(22);
      expect(values.$_get(2)).assertEqual(0);
      expect(values.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_2900
     * @tc.name int32ArraySetPart03Test029
     * @tc.desc Verify zero-init target after set has correct prefix, rest zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(5);
      let src: FixedArray<number> = [3, 4];
      values.set(src);
      expect(values.$_get(0)).assertEqual(3);
      expect(values.$_get(1)).assertEqual(4);
      expect(values.$_get(2)).assertEqual(0);
      expect(values.$_get(3)).assertEqual(0);
      expect(values.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3000
     * @tc.name int32ArraySetPart03Test030
     * @tc.desc Verify of-constructed target set overwrites prefix preserves suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let src: FixedArray<number> = [1, 2];
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(30);
      expect(values.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3100
     * @tc.name int32ArraySetPart03Test031
     * @tc.desc Verify ArrayBuffer-constructed target set writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let values: Int32Array = new Int32Array(buf, 0, 3);
      let src: FixedArray<number> = [11, 22, 33];
      values.set(src);
      expect(values.$_get(0)).assertEqual(11);
      expect(values.$_get(1)).assertEqual(22);
      expect(values.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3200
     * @tc.name int32ArraySetPart03Test032
     * @tc.desc Verify pre-filled target set single element preserves suffix fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(100, 200, 300);
      let src: FixedArray<number> = [1];
      values.set(src);
      expect(values.$_get(1)).assertEqual(200);
      expect(values.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3300
     * @tc.name int32ArraySetPart03Test033
     * @tc.desc Verify non-zero target set with same-length source completely overwrites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(111, 222, 333);
      let src: FixedArray<number> = [444, 555, 666];
      values.set(src);
      expect(values.$_get(0)).assertEqual(444);
      expect(values.$_get(1)).assertEqual(555);
      expect(values.$_get(2)).assertEqual(666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3400
     * @tc.name int32ArraySetPart03Test034
     * @tc.desc Verify two consecutive sets with same source are idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3];
      values.set(src);
      values.set(src);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3500
     * @tc.name int32ArraySetPart03Test035
     * @tc.desc Verify second set with different source overwrites first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src1: FixedArray<number> = [1, 2, 3];
      let src2: FixedArray<number> = [4, 5, 6];
      values.set(src1);
      values.set(src2);
      expect(values.$_get(0)).assertEqual(4);
      expect(values.$_get(1)).assertEqual(5);
      expect(values.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3600
     * @tc.name int32ArraySetPart03Test036
     * @tc.desc Verify source FixedArray length unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [10, 20];
      let beforeLen: number = src.length;
      values.set(src);
      expect(src.length).assertEqual(beforeLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3700
     * @tc.name int32ArraySetPart03Test037
     * @tc.desc Verify set full then set empty preserves full values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(5, 6, 7);
      let srcFull: FixedArray<number> = [1, 2, 3];
      let srcEmpty: FixedArray<number> = [];
      values.set(srcFull);
      values.set(srcEmpty);
      expect(values.$_get(0)).assertEqual(1);
      expect(values.$_get(1)).assertEqual(2);
      expect(values.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3800
     * @tc.name int32ArraySetPart03Test038
     * @tc.desc Verify set single then set longer overwrites prefix and first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let s1: FixedArray<number> = [99];
      let s2: FixedArray<number> = [11, 22, 33];
      values.set(s1);
      values.set(s2);
      expect(values.$_get(0)).assertEqual(11);
      expect(values.$_get(1)).assertEqual(22);
      expect(values.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_3900
     * @tc.name int32ArraySetPart03Test039
     * @tc.desc Verify target length unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [1, 2];
      values.set(src);
      expect(values.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4000
     * @tc.name int32ArraySetPart03Test040
     * @tc.desc Verify target byteLength unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let before: number = values.byteLength;
      let src: FixedArray<number> = [1, 2, 3];
      values.set(src);
      expect(values.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4100
     * @tc.name int32ArraySetPart03Test041
     * @tc.desc Verify default-constructed target byteOffset remains 0 after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3];
      values.set(src);
      expect(values.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4200
     * @tc.name int32ArraySetPart03Test042
     * @tc.desc Verify set does not change underlying buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let bufBefore: ArrayBuffer = values.buffer;
      let src: FixedArray<number> = [1, 2];
      values.set(src);
      expect(values.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4300
     * @tc.name int32ArraySetPart03Test043
     * @tc.desc Verify join string output reflects new values after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [11, 22, 33];
      values.set(src);
      expect(values.join(',')).assertEqual('11,22,33');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4400
     * @tc.name int32ArraySetPart03Test044
     * @tc.desc Verify toString output reflects new values after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [4, 5];
      values.set(src);
      expect(values.toString()).assertEqual('4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4500
     * @tc.name int32ArraySetPart03Test045
     * @tc.desc Verify for-of iteration after set yields correct sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [10, 20, 30];
      values.set(src);
      let sum: number = 0;
      let count: number = 0;
      for (let i = 0; i < values.length; i++) {
        let v = values.$_get(i);
        sum = sum + v;
        count = count + 1;
      }
      expect(count).assertEqual(3);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4600
     * @tc.name int32ArraySetPart03Test046
     * @tc.desc Verify at() reads back correctly after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3];
      values.set(src);
      expect(values.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4700
     * @tc.name int32ArraySetPart03Test047
     * @tc.desc Verify source.length==target.length+1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [1, 2, 3];
      try {
        values.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4800
     * @tc.name int32ArraySetPart03Test048
     * @tc.desc Verify source length far exceeds target length throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [1, 2, 3, 4, 5];
      try {
        values.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_4900
     * @tc.name int32ArraySetPart03Test049
     * @tc.desc Verify length-0 target with non-empty source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(0);
      let src: FixedArray<number> = [1];
      try {
        values.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5000
     * @tc.name int32ArraySetPart03Test050
     * @tc.desc Verify length-1 target with 2-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [1, 2];
      try {
        values.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5100
     * @tc.name int32ArraySetPart03Test051
     * @tc.desc Verify RangeError thrown, target preserves original values (atomic)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(9, 9);
      let src: FixedArray<number> = [1, 2, 3];
      try {
        values.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(values.$_get(0)).assertEqual(9);
      expect(values.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5200
     * @tc.name int32ArraySetPart03Test052
     * @tc.desc Verify length-3 target with 4-element source OOB, target keeps zero-init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [1, 2, 3, 4];
      try {
        values.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5300
     * @tc.name int32ArraySetPart03Test053
     * @tc.desc Verify empty target with single-element source throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(0);
      let src: FixedArray<number> = [0];
      try {
        values.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5400
     * @tc.name int32ArraySetPart03Test054
     * @tc.desc Verify write 0 reads back strictly 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [0];
      values.set(src);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5500
     * @tc.name int32ArraySetPart03Test055
     * @tc.desc Verify write -1 reads back strictly -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-1];
      values.set(src);
      expect(values.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5600
     * @tc.name int32ArraySetPart03Test056
     * @tc.desc Verify mixed boundary values each preserve independently without cross-contamination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(4);
      let src: FixedArray<number> = [2147483647, -2147483648, 0, -1];
      values.set(src);
      expect(values.$_get(0)).assertEqual(2147483647);
      expect(values.$_get(1)).assertEqual(-2147483648);
      expect(values.$_get(2)).assertEqual(0);
      expect(values.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5700
     * @tc.name int32ArraySetPart03Test057
     * @tc.desc Verify write does not affect first element outside write range (no byte bleed)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = Int32Array.of(0, 0, 999, 0);
      let src: FixedArray<number> = [11, 22];
      values.set(src);
      expect(values.$_get(2)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5800
     * @tc.name int32ArraySetPart03Test058
     * @tc.desc Verify all INT_MAX source writes INT_MAX to all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [2147483647, 2147483647, 2147483647];
      values.set(src);
      expect(values.$_get(0)).assertEqual(2147483647);
      expect(values.$_get(1)).assertEqual(2147483647);
      expect(values.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_5900
     * @tc.name int32ArraySetPart03Test059
     * @tc.desc Verify all INT_MIN source writes INT_MIN to all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let src: FixedArray<number> = [-2147483648, -2147483648, -2147483648];
      values.set(src);
      expect(values.$_get(0)).assertEqual(-2147483648);
      expect(values.$_get(1)).assertEqual(-2147483648);
      expect(values.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6000
     * @tc.name int32ArraySetPart03Test060
     * @tc.desc Verify first element INT_MAX is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [2147483647, 0];
      values.set(src);
      expect(values.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6100
     * @tc.name int32ArraySetPart03Test061
     * @tc.desc Verify last element INT_MIN is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(2);
      let src: FixedArray<number> = [0, -2147483648];
      values.set(src);
      expect(values.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6200
     * @tc.name int32ArraySetPart03Test062
     * @tc.desc Verify small positive value 42 writes and reads back exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [42];
      values.set(src);
      expect(values.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6300
     * @tc.name int32ArraySetPart03Test063
     * @tc.desc Verify small negative value -42 writes and reads back exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(1);
      let src: FixedArray<number> = [-42];
      values.set(src);
      expect(values.$_get(0)).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6400
     * @tc.name int32ArraySetPart03Test064
     * @tc.desc Verify sibling Int32Array view sees writes after set on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 0, 3);
      let src: FixedArray<number> = [11, 22, 33];
      a.set(src);
      expect(b.$_get(0)).assertEqual(11);
      expect(b.$_get(1)).assertEqual(22);
      expect(b.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6500
     * @tc.name int32ArraySetPart03Test065
     * @tc.desc Verify subarray view set visible in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(4);
      let child: Int32Array = parent.subarray(1, 3);
      let src: FixedArray<number> = [77, 88];
      child.set(src);
      expect(parent.$_get(1)).assertEqual(77);
      expect(parent.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6600
     * @tc.name int32ArraySetPart03Test066
     * @tc.desc Verify parent set overwrites, subarray reads new values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(4);
      let child: Int32Array = parent.subarray(0, 3);
      let src: FixedArray<number> = [1, 2, 3, 4];
      parent.set(src);
      expect(child.$_get(0)).assertEqual(1);
      expect(child.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6700
     * @tc.name int32ArraySetPart03Test067
     * @tc.desc Verify non-zero byteOffset view set writes to correct buffer position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let values: Int32Array = new Int32Array(buf, 4, 3);
      let src: FixedArray<number> = [5, 6, 7];
      values.set(src);
      expect(values.$_get(0)).assertEqual(5);
      expect(values.$_get(1)).assertEqual(6);
      expect(values.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6800
     * @tc.name int32ArraySetPart03Test068
     * @tc.desc Verify non-zero byteOffset view set does not affect prefix bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let prefix: Int32Array = new Int32Array(buf, 0, 1);
      prefix.$_set(0, 999);
      let values: Int32Array = new Int32Array(buf, 4, 2);
      let src: FixedArray<number> = [11, 22];
      values.set(src);
      expect(prefix.$_get(0)).assertEqual(999);
      expect(values.$_get(0)).assertEqual(11);
      expect(values.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_6900
     * @tc.name int32ArraySetPart03Test069
     * @tc.desc Verify underlying ArrayBuffer readable through fresh view after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let values: Int32Array = new Int32Array(buf, 0, 2);
      let src: FixedArray<number> = [123, 456];
      values.set(src);
      let verify: Int32Array = new Int32Array(buf, 0, 2);
      expect(verify.$_get(0)).assertEqual(123);
      expect(verify.$_get(1)).assertEqual(456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_7000
     * @tc.name int32ArraySetPart03Test070
     * @tc.desc Verify overlapping views on same buffer observe correct segments after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 4, 2);
      let src: FixedArray<number> = [10, 20, 30];
      a.set(src);
      expect(b.$_get(0)).assertEqual(20);
      expect(b.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_7100
     * @tc.name int32ArraySetPart03Test071
     * @tc.desc Verify subarray(0) full-length view set equivalent to set on original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: Int32Array = new Int32Array(3);
      let view: Int32Array = values.subarray(0);
      let src: FixedArray<number> = [4, 5, 6];
      view.set(src);
      expect(values.$_get(0)).assertEqual(4);
      expect(values.$_get(1)).assertEqual(5);
      expect(values.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_7200
     * @tc.name int32ArraySetPart03Test072
     * @tc.desc Verify non-zero byteOffset view with exact source length covers view fully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let values: Int32Array = new Int32Array(buf, 8, 3);
      let src: FixedArray<number> = [100, 200, 300];
      values.set(src);
      expect(values.$_get(0)).assertEqual(100);
      expect(values.$_get(1)).assertEqual(200);
      expect(values.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_7300
     * @tc.name int32ArraySetPart03Test073
     * @tc.desc Verify zero-init buffer after short set has unwritten region bytes zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let values: Int32Array = new Int32Array(buf, 0, 5);
      let src: FixedArray<number> = [1, 2];
      values.set(src);
      let tail: Int32Array = new Int32Array(buf, 8, 3);
      expect(tail.$_get(0)).assertEqual(0);
      expect(tail.$_get(1)).assertEqual(0);
      expect(tail.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SET_PART03_7400
     * @tc.name int32ArraySetPart03Test074
     * @tc.desc Verify set does not break unwritten tail view sharing with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySetPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let tail: Int32Array = a.subarray(2, 4);
      tail.$_set(0, 88);
      tail.$_set(1, 99);
      let src: FixedArray<number> = [11, 22];
      a.set(src);
      expect(a.$_get(2)).assertEqual(88);
      expect(a.$_get(3)).assertEqual(99);
    });
  });
}
