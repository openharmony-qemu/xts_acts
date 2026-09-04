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

export default function int32ArraySomePart02Test(): void {
  describe('Int32ArraySomePart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0100
     * @tc.name int32ArraySomePart02Test001
     * @tc.desc Verify some() returns true when a negative element exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0200
     * @tc.name int32ArraySomePart02Test002
     * @tc.desc Verify some() returns true when the first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 2, 3, 4, 5]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0300
     * @tc.name int32ArraySomePart02Test003
     * @tc.desc Verify some() returns false when no element is greater than 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e > 10);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0400
     * @tc.name int32ArraySomePart02Test004
     * @tc.desc Verify some() returns false when no element is less than 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0500
     * @tc.name int32ArraySomePart02Test005
     * @tc.desc Verify Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5]);
      let r: boolean = arr.some((_e: number, _i: int, _a: Int32Array): boolean => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0600
     * @tc.name int32ArraySomePart02Test006
     * @tc.desc Verify empty array returns false and predicate is not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let callbackCount: int = 0;
      let r: boolean = arr.some((_e: number, _i: int, _a: Int32Array): boolean => {
        callbackCount++;
        return true;
      });
      expect(r).assertFalse();
      expect(callbackCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0700
     * @tc.name int32ArraySomePart02Test007
     * @tc.desc Verify predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === 5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0800
     * @tc.name int32ArraySomePart02Test008
     * @tc.desc Verify some returns true when -1 is the first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 5);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_0900
     * @tc.name int32ArraySomePart02Test009
     * @tc.desc Verify some returns true when -2 is the second matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 2, 3, 4]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1000
     * @tc.name int32ArraySomePart02Test010
     * @tc.desc Verify some returns true when -4 is the last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3, 4]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1100
     * @tc.name int32ArraySomePart02Test011
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, -4]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1200
     * @tc.name int32ArraySomePart02Test012
     * @tc.desc Verify some() returns false for [1,2,3,4] when predicate e<0 never matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1300
     * @tc.name int32ArraySomePart02Test013
     * @tc.desc Verify predicate e<0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1400
     * @tc.name int32ArraySomePart02Test014
     * @tc.desc Verify predicate e===0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1500
     * @tc.name int32ArraySomePart02Test015
     * @tc.desc Verify predicate e!==0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1600
     * @tc.name int32ArraySomePart02Test016
     * @tc.desc Verify INT32_MAX predicate e===2147483647 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2147483647, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === 2147483647);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1700
     * @tc.name int32ArraySomePart02Test017
     * @tc.desc Verify INT32_MIN predicate e===-2147483648 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2147483648, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === -2147483648);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1800
     * @tc.name int32ArraySomePart02Test018
     * @tc.desc Verify some true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let r1: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      let r2: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r1).assertEqual(r2);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_1900
     * @tc.name int32ArraySomePart02Test019
     * @tc.desc Verify some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r1: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      let r2: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r1).assertEqual(r2);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2000
     * @tc.name int32ArraySomePart02Test020
     * @tc.desc Verify true predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 0, 2147483647, -2147483648]);
      let r: boolean = arr.some((_e: number, _i: int, _a: Int32Array): boolean => true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2100
     * @tc.name int32ArraySomePart02Test021
     * @tc.desc Verify false predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: boolean = arr.some((_e: number, _i: int, _a: Int32Array): boolean => false);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2200
     * @tc.name int32ArraySomePart02Test022
     * @tc.desc Verify ToInt32 4294967295 -1 predicate e===-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 4294967295, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === -1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2300
     * @tc.name int32ArraySomePart02Test023
     * @tc.desc Verify ToInt32 4294967296 0 predicate e!==0&&e!==1&&e!==2 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 4294967296, 2]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 0 && e !== 1 && e !== 2);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2400
     * @tc.name int32ArraySomePart02Test024
     * @tc.desc Verify 3.5 ToInt32 3 predicate e===4 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 3.5, 2]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === 4);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2500
     * @tc.name int32ArraySomePart02Test025
     * @tc.desc Verify -3.5 ToInt32 -3 predicate e===-3 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -3.5, 2]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === -3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2600
     * @tc.name int32ArraySomePart02Test026
     * @tc.desc Verify Number.NaN ToInt32 0 predicate e===0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, Number.NaN, 2]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2700
     * @tc.name int32ArraySomePart02Test027
     * @tc.desc Verify index predicate i===length-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: boolean = arr.some((_e: number, i: int, _a: Int32Array): boolean => i === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2800
     * @tc.name int32ArraySomePart02Test028
     * @tc.desc Verify index predicate i<0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: boolean = arr.some((_e: number, i: int, _a: Int32Array): boolean => i < 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_2900
     * @tc.name int32ArraySomePart02Test029
     * @tc.desc Verify array.length predicate a.length===3 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((_e: number, _i: int, a: Int32Array): boolean => a.length === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3000
     * @tc.name int32ArraySomePart02Test030
     * @tc.desc Verify some true if
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 3, 6]);
      let branch: string = 'none';
      if (arr.some((e: number, _i: int, _a: Int32Array): boolean => e % 2 !== 0)) {
        branch = 'hasOdd';
      } else {
        branch = 'allEven';
      }
      expect(branch).assertEqual('hasOdd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3100
     * @tc.name int32ArraySomePart02Test031
     * @tc.desc Verify some maps an all-even array to the expected allEven result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 4, 6]);
      let branch: string = 'none';
      if (arr.some((e: number, _i: int, _a: Int32Array): boolean => e % 2 !== 0)) {
        branch = 'hasOdd';
      } else {
        branch = 'allEven';
      }
      expect(branch).assertEqual('allEven');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3200
     * @tc.name int32ArraySomePart02Test032
     * @tc.desc Verify some length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let before: int = arr.length;
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.length).assertEqual(before);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3300
     * @tc.name int32ArraySomePart02Test033
     * @tc.desc Verify some length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let before: int = arr.length;
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.length).assertEqual(before);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3400
     * @tc.name int32ArraySomePart02Test034
     * @tc.desc Verify some length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3500
     * @tc.name int32ArraySomePart02Test035
     * @tc.desc Verify some byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3, 4]);
      let before: int = arr.byteLength;
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.byteLength).assertEqual(before);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3600
     * @tc.name int32ArraySomePart02Test036
     * @tc.desc Verify some byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let before: int = arr.byteLength;
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.byteLength).assertEqual(before);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3700
     * @tc.name int32ArraySomePart02Test037
     * @tc.desc Verify some byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let before: int = arr.byteOffset;
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 0);
      expect(arr.byteOffset).assertEqual(before);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3800
     * @tc.name int32ArraySomePart02Test038
     * @tc.desc Verify some byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_3900
     * @tc.name int32ArraySomePart02Test039
     * @tc.desc Verify some BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4000
     * @tc.name int32ArraySomePart02Test040
     * @tc.desc Verify some does not mutate the first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.some((_e: number, _i: int, _a: Int32Array): boolean => true);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4100
     * @tc.name int32ArraySomePart02Test041
     * @tc.desc Verify some does not mutate the remaining elements after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 20, 30]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.$_get(0)).assertEqual(-1);
      {
        let arr: Int32Array = new Int32Array([-1, 20, 30]);
        arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
        expect(arr.$_get(1)).assertEqual(20);
        expect(arr.$_get(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4200
     * @tc.name int32ArraySomePart02Test042
     * @tc.desc Verify some preserves a three-element array with no negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3, 4, 5]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4300
     * @tc.name int32ArraySomePart02Test043
     * @tc.desc Verify some preserves a three-element array with a negative last value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4400
     * @tc.name int32ArraySomePart02Test044
     * @tc.desc Verify some preserves an all-negative array when testing for positives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, -3]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4500
     * @tc.name int32ArraySomePart02Test045
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-2);
      expect(arr.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4600
     * @tc.name int32ArraySomePart02Test046
     * @tc.desc Verify some INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -1]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4700
     * @tc.name int32ArraySomePart02Test047
     * @tc.desc Verify some preserves an all-zero array when no nonzero value exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2147483648]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4800
     * @tc.name int32ArraySomePart02Test048
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_4900
     * @tc.name int32ArraySomePart02Test049
     * @tc.desc Verify some Number.NaN ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Number.NaN, 1]);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5000
     * @tc.name int32ArraySomePart02Test050
     * @tc.desc Verify some $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((e: number, i: int, a: Int32Array): boolean => {
        a.$_set(i, e + 10);
        return i === 2;
      });
      expect(r).assertTrue();
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(12);
      expect(arr.$_get(2)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5100
     * @tc.name int32ArraySomePart02Test051
     * @tc.desc Verify some true fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
      arr.fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5200
     * @tc.name int32ArraySomePart02Test052
     * @tc.desc Verify some false reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertFalse();
      let sum: number = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5300
     * @tc.name int32ArraySomePart02Test053
     * @tc.desc Verify some false sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, -1, 2]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e > 10);
      expect(r).assertFalse();
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5400
     * @tc.name int32ArraySomePart02Test054
     * @tc.desc Verify some every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 2, 3]);
      let hasNeg: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(hasNeg).assertTrue();
      let allPositive: boolean = arr.every((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(allPositive).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5500
     * @tc.name int32ArraySomePart02Test055
     * @tc.desc Verify some true forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
      let sum: int = 0;
      arr.forEach((v: number, _i: int, _a: Int32Array): void => {
        sum += v;
      });
      expect(sum).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5600
     * @tc.name int32ArraySomePart02Test056
     * @tc.desc Verify some buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      let before: ArrayBuffer = arr.buffer;
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 0);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5700
     * @tc.name int32ArraySomePart02Test057
     * @tc.desc Verify some buffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 0);
      let view: Int32Array = new Int32Array(buf);
      expect(view.$_get(0)).assertEqual(0);
      expect(view.$_get(1)).assertEqual(0);
      expect(view.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5800
     * @tc.name int32ArraySomePart02Test058
     * @tc.desc Verify subarray some buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, -2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      child.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(child.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_5900
     * @tc.name int32ArraySomePart02Test059
     * @tc.desc Verify subarray some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      child.some((e: number, _i: int, _a: Int32Array): boolean => e > 2);
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(2);
      expect(parent.$_get(2)).assertEqual(3);
      expect(parent.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6000
     * @tc.name int32ArraySomePart02Test060
     * @tc.desc Verify slice some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Int32Array = new Int32Array([1, 2, -3, 4]);
      let cp: Int32Array = original.slice();
      let r: boolean = cp.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
      expect(original.$_get(0)).assertEqual(1);
      expect(original.$_get(2)).assertEqual(-3);
      expect(cp.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6100
     * @tc.name int32ArraySomePart02Test061
     * @tc.desc Verify slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: Int32Array = new Int32Array([1, 2, 3]);
      let cp: Int32Array = original.slice();
      cp.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      let _d: boolean = cp.buffer !== original.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6200
     * @tc.name int32ArraySomePart02Test062
     * @tc.desc Verify some buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      let before: ArrayBuffer = arr.buffer;
      arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 0);
      expect(arr.buffer).assertEqual(before);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6300
     * @tc.name int32ArraySomePart02Test063
     * @tc.desc Verify some buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr1: Int32Array = new Int32Array(buf);
      arr1.$_set(0, 10);
      arr1.$_set(1, -20);
      arr1.$_set(2, 30);
      let r: boolean = arr1.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
      let arr2: Int32Array = new Int32Array(buf);
      expect(arr2.$_get(0)).assertEqual(10);
      expect(arr2.$_get(1)).assertEqual(-20);
      expect(arr2.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6400
     * @tc.name int32ArraySomePart02Test064
     * @tc.desc Verify of some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, -10, 15);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(-10);
      expect(arr.$_get(2)).assertEqual(15);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6500
     * @tc.name int32ArraySomePart02Test065
     * @tc.desc Verify from some length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let arr: Int32Array = Int32Array.from(src);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertFalse();
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6600
     * @tc.name int32ArraySomePart02Test066
     * @tc.desc Verify some -1 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 3]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === -1);
      expect(r).assertTrue();
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(arr.length - 1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6700
     * @tc.name int32ArraySomePart02Test067
     * @tc.desc Verify some 0x7FFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0x7FFFFFFF]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === 2147483647);
      expect(r).assertTrue();
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6800
     * @tc.name int32ArraySomePart02Test068
     * @tc.desc Verify some -2147483648 predicate e<0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2147483648]);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      expect(r).assertTrue();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_6900
     * @tc.name int32ArraySomePart02Test069
     * @tc.desc Verify some buffer length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let bufBefore: ArrayBuffer = arr.buffer;
      let r1: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      let r2: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e > 0);
      expect(r1).assertFalse();
      expect(r2).assertFalse();
      expect(arr.length).assertEqual(0);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_7000
     * @tc.name int32ArraySomePart02Test070
     * @tc.desc Verify some true predicate false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let r1: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e < 0);
      let r2: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e > 10);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_7100
     * @tc.name int32ArraySomePart02Test071
     * @tc.desc Verify some $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 0);
      a.$_set(1, 0);
      a.$_set(2, 0);
      a.$_set(3, 0);
      a.some((_e: number, i: int, arr: Int32Array): boolean => {
        arr.$_set(i, 99);
        return i === 1;
      });
      expect(b.$_get(0)).assertEqual(99);
      expect(b.$_get(1)).assertEqual(99);
      expect(b.$_get(2)).assertEqual(0);
      expect(b.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_7200
     * @tc.name int32ArraySomePart02Test072
     * @tc.desc Verify of some length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e !== 42);
      expect(r).assertFalse();
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(42);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SOME_PART02_7300
     * @tc.name int32ArraySomePart02Test073
     * @tc.desc Verify some predicate e===-5 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySomePart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, -5, -5]);
      let bufBefore: ArrayBuffer = arr.buffer;
      let r: boolean = arr.some((e: number, _i: int, _a: Int32Array): boolean => e === -5);
      expect(r).assertTrue();
      expect(arr.buffer).assertEqual(bufBefore);
      expect(arr.byteLength).assertEqual(12);
    });
  });
}
