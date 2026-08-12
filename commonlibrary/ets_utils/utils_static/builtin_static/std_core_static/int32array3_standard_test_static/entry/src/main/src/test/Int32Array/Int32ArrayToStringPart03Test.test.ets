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

export default function int32ArrayToStringPart03Test(): void {
  describe('int32ArrayToStringPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayToStringPart03Test001
     * @tc.desc Verify $_set at index -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        arr.$_set(-1, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayToStringPart03Test002
     * @tc.desc Verify $_set at array length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([10, 20]);
        arr.$_set(2, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayToStringPart03Test003
     * @tc.desc Verify $_set beyond array length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([5, 6]);
        arr.$_set(3, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayToStringPart03Test004
     * @tc.desc Verify $_set below negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([7, 8, 9]);
        arr.$_set(-4, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayToStringPart03Test005
     * @tc.desc Verify $_set at a very large positive index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([1, 2]);
        arr.$_set(1000000, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayToStringPart03Test006
     * @tc.desc Verify $_set at a very large negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([3, 4]);
        arr.$_set(-1000000, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayToStringPart03Test007
     * @tc.desc Verify $_set at index 0 on an empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array(0);
        arr.$_set(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayToStringPart03Test008
     * @tc.desc Verify $_get(length) throws RangeError and toString preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      try {
        arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.toString()).assertEqual('11,22,33');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayToStringPart03Test009
     * @tc.desc Verify fill(5, -1) start clamp length-1, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(5, -1);
      expect(arr.toString()).assertEqual('1,2,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayToStringPart03Test010
     * @tc.desc Verify fill(5, length+1) start , ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(5, 4);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayToStringPart03Test011
     * @tc.desc Verify fill(5, 0, -1) end=-1 length-1, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(5, 0, -1);
      expect(arr.toString()).assertEqual('5,5,5,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayToStringPart03Test012
     * @tc.desc Verify fill(5, 2, 1) start>=end ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(5, 2, 1);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayToStringPart03Test013
     * @tc.desc Verify fill(5, start, end) start>length ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      arr.fill(5, 1000, 2000);
      expect(arr.toString()).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayToStringPart03Test014
     * @tc.desc Verify fill(5, -length-1, length+1) + clamp, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(5, -10, 10);
      expect(arr.toString()).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayToStringPart03Test015
     * @tc.desc Verify fill(MAX_INT32, 0, length) MAX toString MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483647, 0, 3);
      expect(arr.toString()).assertEqual('2147483647,2147483647,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayToStringPart03Test016
     * @tc.desc Verify fill(MIN_INT32, 0, length) MIN toString MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(-2147483648, 0, 2);
      expect(arr.toString()).assertEqual('-2147483648,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayToStringPart03Test017
     * @tc.desc Verify copyWithin(length, 0, 1) target , ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.copyWithin(3, 0, 1);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayToStringPart03Test018
     * @tc.desc Verify copyWithin(-length-1, 0, 2) target clamp 0, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.copyWithin(-10, 0, 2);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayToStringPart03Test019
     * @tc.desc Verify copyWithin(0, length, length+1) start ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.copyWithin(0, 3, 4);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayToStringPart03Test020
     * @tc.desc Verify copyWithin(1, -1, length) start=-1 1,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.copyWithin(1, -1, 3);
      expect(arr.toString()).assertEqual('1,3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayToStringPart03Test021
     * @tc.desc Verify copyWithin(0, 1, -1) end=-1 , toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.copyWithin(0, 1, -1);
      expect(arr.toString()).assertEqual('20,30,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayToStringPart03Test022
     * @tc.desc Verify set(source, offset) (source.length + offset > length) RangeError, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let src: Int32Array = new Int32Array([7, 8]);
      try {
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayToStringPart03Test023
     * @tc.desc Verify set(source, -1) offset RangeError, toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let src: Int32Array = new Int32Array([9]);
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayToStringPart03Test024
     * @tc.desc Verify set( Int32Array, 0) ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let empty: Int32Array = new Int32Array(0);
      arr.set(empty, 0);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayToStringPart03Test025
     * @tc.desc Verify set(source, length) offset=length source ; source RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let src: Int32Array = new Int32Array([5]);
      try {
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayToStringPart03Test026
     * @tc.desc Verify set(source, 0) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([4, 5, 6]);
      arr.set(src, 0);
      expect(arr.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayToStringPart03Test027
     * @tc.desc Verify slice(-1) ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = arr.slice(-1);
      expect(s.toString()).assertEqual('30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayToStringPart03Test028
     * @tc.desc Verify slice(-length) ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = arr.slice(-3);
      expect(s.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayToStringPart03Test029
     * @tc.desc Verify slice(-length-1) clamp 0,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6]);
      let s: Int32Array = arr.slice(-4);
      expect(s.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayToStringPart03Test030
     * @tc.desc Verify slice(length) ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let s: Int32Array = arr.slice(2);
      expect(s.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayToStringPart03Test031
     * @tc.desc Verify slice(length+1) clamp,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8]);
      let s: Int32Array = arr.slice(3);
      expect(s.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayToStringPart03Test032
     * @tc.desc Verify slice(1, -1) ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let s: Int32Array = arr.slice(1, -1);
      expect(s.toString()).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayToStringPart03Test033
     * @tc.desc Verify slice(start>=end) ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = arr.slice(2, 1);
      expect(s.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayToStringPart03Test034
     * @tc.desc Verify subarray( )clamp length,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(1000000);
      expect(sub.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayToStringPart03Test035
     * @tc.desc Verify subarray( )clamp 0,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22]);
      let sub: Int32Array = arr.subarray(-1000000);
      expect(sub.toString()).assertEqual('11,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayToStringPart03Test036
     * @tc.desc Verify subarray(0, -1) end=-1 ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(0, -1);
      expect(sub.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayToStringPart03Test037
     * @tc.desc Verify subarray(start>=end) ,toString buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(2, 1);
      expect(sub.toString()).assertEqual('');
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub.length).assertEqual(0);
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayToStringPart03Test038
     * @tc.desc Verify Number.NaN( 0) ,toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 1);
      arr.$_set(1, Number.NaN);
      arr.$_set(2, 3);
      expect(arr.toString()).assertEqual('1,0,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayToStringPart03Test039
     * @tc.desc Verify repeated toString returns the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: string = '';
      for (let i: int = 0; i < 10; i++) {
        result = arr.toString();
      }
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayToStringPart03Test040
     * @tc.desc Verify empty subarray toString returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let sub: Int32Array = arr.subarray(5, 10);
      expect(sub.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayToStringPart03Test041
     * @tc.desc Verify slice(0,0) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let empty: Int32Array = arr.slice(0, 0);
      expect(empty.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayToStringPart03Test042
     * @tc.desc Verify filter toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let filtered: Int32Array = arr.filter((_v: number, _i: int) => false);
      expect(filtered.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayToStringPart03Test043
     * @tc.desc Verify map 0 toString ( filter map )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let filtered: Int32Array = arr.filter((_v: number) => false);
      let mapped: Int32Array = filtered.map((v: number) => v * 2);
      expect(mapped.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayToStringPart03Test044
     * @tc.desc Verify 100 fill(100) 1 toString "100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.fill(100);
      expect(arr.toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayToStringPart03Test045
     * @tc.desc Verify -100 $_set toString "-100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -100);
      expect(arr.toString()).assertEqual('-100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayToStringPart03Test046
     * @tc.desc Verify subarray(-1) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
      let single: Int32Array = arr.subarray(-1);
      expect(single.toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayToStringPart03Test047
     * @tc.desc Verify slice() toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([999]);
      let cp: Int32Array = arr.slice();
      expect(cp.toString()).assertEqual('999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayToStringPart03Test048
     * @tc.desc Verify filter toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let single: Int32Array = arr.filter((_v: number, i: int) => i === 0);
      expect(single.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayToStringPart03Test049
     * @tc.desc Verify 42 toString "42,42,42"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 42, 42]);
      expect(arr.toString()).assertEqual('42,42,42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayToStringPart03Test050
     * @tc.desc Verify -7 toString "-7,-7,-7,-7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-7, -7, -7, -7]);
      expect(arr.toString()).assertEqual('-7,-7,-7,-7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayToStringPart03Test051
     * @tc.desc Verify fill(MAX_INT32) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483647);
      expect(arr.toString()).assertEqual('2147483647,2147483647,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayToStringPart03Test052
     * @tc.desc Verify fill(MIN_INT32) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(-2147483648);
      expect(arr.toString()).assertEqual('-2147483648,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayToStringPart03Test053
     * @tc.desc Verify 100 split(",") Number() 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 100, 100, 100]);
      let parts: string[] = arr.toString().split(',');
      expect(parts.length).assertEqual(4);
      for (let i: int = 0; i < parts.length; i++) {
        expect(Number(parts[i])).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayToStringPart03Test054
     * @tc.desc Verify 0 toString "0,0,0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      expect(arr.toString()).assertEqual('0,0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayToStringPart03Test055
     * @tc.desc Verify fill(0) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(0);
      expect(arr.toString()).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayToStringPart03Test056
     * @tc.desc Verify fill(9, 1, 3) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(9, 1, 3);
      expect(arr.toString()).assertEqual('1,9,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayToStringPart03Test057
     * @tc.desc Verify sort toString ( compareFn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([30, 1, 100, 20, 2]);
      arr.sort();
      expect(arr.toString()).assertEqual('1,2,20,30,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayToStringPart03Test058
     * @tc.desc Verify sort toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, 10, -20, 0, 5]);
      arr.sort();
      expect(arr.toString()).assertEqual('-20,-3,0,5,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayToStringPart03Test059
     * @tc.desc Verify copyWithin(2, 0, 2) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.copyWithin(2, 0, 2);
      expect(arr.toString()).assertEqual('1,2,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayToStringPart03Test060
     * @tc.desc Verify set TypedArray toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let src: Int32Array = new Int32Array([7, 8]);
      arr.set(src, 1);
      expect(arr.toString()).assertEqual('0,7,8,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayToStringPart03Test061
     * @tc.desc Verify $_set toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(0);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      arr.reverse();
      arr.sort();
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayToStringPart03Test062
     * @tc.desc Verify toString toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let s1: string = arr.toString();
      arr.$_set(0, -1);
      let s2: string = arr.toString();
      expect(s1).assertEqual('1,2');
      expect(s2).assertEqual('-1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayToStringPart03Test063
     * @tc.desc Verify ArrayBuffer Int32Array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 11);
      a.$_set(1, 22);
      b.$_set(0, 33);
      b.$_set(1, 44);
      expect(a.toString()).assertEqual('11,22');
      expect(b.toString()).assertEqual('33,44');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayToStringPart03Test064
     * @tc.desc Verify $_set toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      child.$_set(0, 222);
      child.$_set(1, 333);
      expect(parent.toString()).assertEqual('1,222,333,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayToStringPart03Test065
     * @tc.desc Verify slice , toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array([1, 2, 3]);
      let cp: Int32Array = orig.slice();
      cp.$_set(0, 999);
      expect(orig.toString()).assertEqual('1,2,3');
      expect(cp.toString()).assertEqual('999,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayToStringPart03Test066
     * @tc.desc Verify fill toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 0, 3);
      a.fill(7);
      expect(b.toString()).assertEqual('7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayToStringPart03Test067
     * @tc.desc Verify toString , buffer toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 11);
      a.$_set(1, 22);
      let s1: string = a.toString();
      b.$_set(0, 999);
      let s2: string = a.toString();
      expect(s1).assertEqual('11,22');
      expect(s2).assertEqual('999,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayToStringPart03Test068
     * @tc.desc Verify fill toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(5);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayToStringPart03Test069
     * @tc.desc Verify reverse toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayToStringPart03Test070
     * @tc.desc Verify subarray toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = arr.subarray(1, 3);
      expect(sub.toString()).assertEqual(sub.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayToStringPart03Test071
     * @tc.desc Verify subarray toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let sub: Int32Array = arr.subarray(5);
      expect(sub.toString()).assertEqual(sub.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayToStringPart03Test072
     * @tc.desc Verify ToInt32 (Number.NaN 0) toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, Number.NaN);
      arr.$_set(1, 1);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayToStringPart03Test073
     * @tc.desc Verify MIN_INT32 toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0]);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayToStringPart03Test074
     * @tc.desc Verify sort toString join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, -3, 8, 0, -1]);
      arr.sort();
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayToStringPart03Test075
     * @tc.desc Verify N toString length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let s: string = arr.toString();
      let commaCount: number = 0;
      for (let i: int = 0; i < s.length; i++) {
        if (s.substring(i, i + 1) === ',') {
          commaCount++;
        }
      }
      expect(commaCount).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayToStringPart03Test076
     * @tc.desc Verify toString length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let s: string = arr.toString();
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayToStringPart03Test077
     * @tc.desc Verify MIN_INT32 length 11 '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let s: string = arr.toString();
      expect(s.length).assertEqual(11);
      expect(s.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArrayToStringPart03Test078
     * @tc.desc Verify MAX_INT32 length 10 '2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let s: string = arr.toString();
      expect(s.length).assertEqual(10);
      expect(s.charAt(0).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArrayToStringPart03Test079
     * @tc.desc Verify toString split(",") Number()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100, 0, 200, -2147483648, 2147483647]);
      let parts: string[] = arr.toString().split(',');
      expect(parts.length).assertEqual(arr.length);
      expect(Number(parts[0])).assertEqual(-100);
      expect(Number(parts[1])).assertEqual(0);
      expect(Number(parts[2])).assertEqual(200);
      expect(Number(parts[3])).assertEqual(-2147483648);
      expect(Number(parts[4])).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArrayToStringPart03Test080
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-7, 8]);
      let s: string = arr.toString();
      expect(s.charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_8100
     * @tc.name int32ArrayToStringPart03Test081
     * @tc.desc Verify toString buffer.byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.toString();
      expect(arr.buffer.byteLength).assertEqual(12);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_8200
     * @tc.name int32ArrayToStringPart03Test082
     * @tc.desc Verify toString length/byteOffset/BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.toString();
      expect(arr.length).assertEqual(2);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_8300
     * @tc.name int32ArrayToStringPart03Test083
     * @tc.desc Verify MIN_INT32 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let s1: string = arr.toString();
      let s2: string = arr.toString();
      expect(s1).assertEqual(s2);
      expect(s1).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART03_TEST_MINDMAP_8400
     * @tc.name int32ArrayToStringPart03Test084
     * @tc.desc Verify MAX_INT32 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let s1: string = arr.toString();
      let s2: string = arr.toString();
      expect(s1).assertEqual(s2);
      expect(s1).assertEqual('2147483647');
    });
  });
}
