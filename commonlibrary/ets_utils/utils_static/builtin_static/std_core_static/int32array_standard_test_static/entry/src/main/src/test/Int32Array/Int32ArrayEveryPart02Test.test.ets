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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayEveryPart02Test(): void {
  describe('Int32ArrayEveryPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0100
     * @tc.name int32ArrayEveryPart02Test001
     * @tc.desc Verify every returns true for an all-positive array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0200
     * @tc.name int32ArrayEveryPart02Test002
     * @tc.desc Verify every returns false when an element fails the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, -5, 6]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0300
     * @tc.name int32ArrayEveryPart02Test003
     * @tc.desc Verify every returns true for an empty Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0400
     * @tc.name int32ArrayEveryPart02Test004
     * @tc.desc Verify every returns the primitive boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0500
     * @tc.name int32ArrayEveryPart02Test005
     * @tc.desc Verify 1 truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0600
     * @tc.name int32ArrayEveryPart02Test006
     * @tc.desc Verify 0 falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 2]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0700
     * @tc.name int32ArrayEveryPart02Test007
     * @tc.desc Verify every returns true for an all-positive array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0800
     * @tc.name int32ArrayEveryPart02Test008
     * @tc.desc Verify predicate true true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === 42);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_0900
     * @tc.name int32ArrayEveryPart02Test009
     * @tc.desc Verify predicate false false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e !== 42);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1000
     * @tc.name int32ArrayEveryPart02Test010
     * @tc.desc Verify predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 4, 6, 8]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1100
     * @tc.name int32ArrayEveryPart02Test011
     * @tc.desc Verify false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, 2, 4]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1200
     * @tc.name int32ArrayEveryPart02Test012
     * @tc.desc Verify true predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      let r: boolean = arr.every((_e: number, _i: int, _a: Int32Array): boolean => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1300
     * @tc.name int32ArrayEveryPart02Test013
     * @tc.desc Verify false predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: boolean = arr.every((_e: number, _i: int, _a: Int32Array): boolean => false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1400
     * @tc.name int32ArrayEveryPart02Test014
     * @tc.desc Verify predicate e<0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, -10, -15]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1500
     * @tc.name int32ArrayEveryPart02Test015
     * @tc.desc Verify predicate e===0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1600
     * @tc.name int32ArrayEveryPart02Test016
     * @tc.desc Verify predicate e!==0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e !== 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1700
     * @tc.name int32ArrayEveryPart02Test017
     * @tc.desc Verify INT32_MAX predicate e<=INT32_MAX true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 2147483647, 4]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e <= 2147483647);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1800
     * @tc.name int32ArrayEveryPart02Test018
     * @tc.desc Verify INT32_MIN predicate e>=INT32_MIN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
    */
    it('int32ArrayEveryPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, -2147483648, 4]);
      let minValue: number = -2147483647 - 1;
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e >= minValue);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_1900
     * @tc.name int32ArrayEveryPart02Test019
     * @tc.desc Verify every predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 6, 9]);
      let r1: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e % 3 === 0);
      let r2: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e % 3 === 0);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2000
     * @tc.name int32ArrayEveryPart02Test020
     * @tc.desc Verify every predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 7, 9]);
      let r1: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e % 3 === 0);
      let r2: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e % 3 === 0);
      expect(r1).assertEqual(r2);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2100
     * @tc.name int32ArrayEveryPart02Test021
     * @tc.desc Verify ToInt32 2147483648 -2147483648 predicate e<0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483648]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2200
     * @tc.name int32ArrayEveryPart02Test022
     * @tc.desc Verify ToInt32 4294967295 -1 predicate e===-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967295);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === -1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2300
     * @tc.name int32ArrayEveryPart02Test023
     * @tc.desc Verify 5.7 ToInt32 5 predicate e===5 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5.7]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === 5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2400
     * @tc.name int32ArrayEveryPart02Test024
     * @tc.desc Verify -5.7 ToInt32 -5 predicate e===-5 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5.7]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === -5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2500
     * @tc.name int32ArrayEveryPart02Test025
     * @tc.desc Verify +Infinity ToInt32 0 predicate e===0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Double.POSITIVE_INFINITY]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2600
     * @tc.name int32ArrayEveryPart02Test026
     * @tc.desc Verify Double.NEGATIVE_INFINITY ToInt32 0 predicate e===0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Double.NEGATIVE_INFINITY]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2700
     * @tc.name int32ArrayEveryPart02Test027
     * @tc.desc Verify i 0..length-1 true true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let r: boolean = arr.every((_e: number, i: int, a: Int32Array): boolean => i >= 0 && i < a.length);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2800
     * @tc.name int32ArrayEveryPart02Test028
     * @tc.desc Verify i>0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: boolean = arr.every((_e: number, i: int, _a: Int32Array): boolean => i > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_2900
     * @tc.name int32ArrayEveryPart02Test029
     * @tc.desc Verify every true if
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 6, 9]);
      let branch: string = 'none';
      if (arr.every((e: number, _i: int, _a: Int32Array): boolean => e % 3 === 0)) {
        branch = 'allTriple';
      } else {
        branch = 'hasOther';
      }
      expect(branch).assertEqual('allTriple');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_3000
     * @tc.name int32ArrayEveryPart02Test030
     * @tc.desc Verify every false if
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 7, 9]);
      let branch: string = 'none';
      if (arr.every((e: number, _i: int, _a: Int32Array): boolean => e % 3 === 0)) {
        branch = 'allTriple';
      } else {
        branch = 'hasOther';
      }
      expect(branch).assertEqual('hasOther');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_3100
     * @tc.name int32ArrayEveryPart02Test031
     * @tc.desc Verify every ! assertTrue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let r: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(!r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_3200
     * @tc.name int32ArrayEveryPart02Test032
     * @tc.desc Verify every length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let before: int = arr.length;
      arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(arr.length).assertEqual(before);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_EVERY_PART02_TEST_3300
     * @tc.name int32ArrayEveryPart02Test033
     * @tc.desc Verify every length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayEveryPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, -6, 7]);
      let before: int = arr.length;
      arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(arr.length).assertEqual(before);
      expect(arr.length).assertEqual(3);
    });
  });
}
