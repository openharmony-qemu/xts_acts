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
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';
export default function int32ArrayFillPart03Test(): void {
  describe('Int32ArrayFillPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0100
     * @tc.name int32ArrayFillPart03Test001
     * @tc.desc Verify one-arg fill with value 0 covers all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0200
     * @tc.name int32ArrayFillPart03Test002
     * @tc.desc Verify two-arg fill with start=0 equals omitted start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array([1, 2, 3, 4]);
      let a2: Int32Array = new Int32Array([1, 2, 3, 4]);
      a1.fill(7.0);
      a2.fill(7.0, 0, a2.length);
      expect(a2.$_get(0)).assertEqual(a1.$_get(0));
      expect(a2.$_get(3)).assertEqual(a1.$_get(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0300
     * @tc.name int32ArrayFillPart03Test003
     * @tc.desc Verify three-arg fill with end=length equals omitted end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array([1, 2, 3, 4]);
      let a2: Int32Array = new Int32Array([1, 2, 3, 4]);
      a1.fill(9.0, 1, a1.length);
      a2.fill(9.0, 1, 4);
      expect(a2.$_get(1)).assertEqual(a1.$_get(1));
      expect(a2.$_get(3)).assertEqual(a1.$_get(3));
      expect(a2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0400
     * @tc.name int32ArrayFillPart03Test004
     * @tc.desc Verify one-arg fill with value -1 fills all elements to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(-1);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-1);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0500
     * @tc.name int32ArrayFillPart03Test005
     * @tc.desc Verify end values at length or beyond clamp to length for both partial and full ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partialBase: Int32Array = new Int32Array([1, 2, 3, 4]);
      let partialAtLength: Int32Array = new Int32Array([1, 2, 3, 4]);
      let partialBeyond: Int32Array = new Int32Array([1, 2, 3, 4]);
      partialBase.fill(8.0, 1, partialBase.length);
      partialAtLength.fill(8.0, 1, partialAtLength.length);
      partialBeyond.fill(8.0, 1, 999999);
      expect(partialAtLength.$_get(1)).assertEqual(partialBase.$_get(1));
      expect(partialBeyond.$_get(3)).assertEqual(partialBase.$_get(3));
      let fullAtLength: Int32Array = new Int32Array([10, 20, 30, 40]);
      let fullBeyond: Int32Array = new Int32Array([10, 20, 30, 40]);
      fullAtLength.fill(7.0, 0, fullAtLength.length);
      fullBeyond.fill(7.0, 0, 999999);
      expect(fullAtLength.$_get(0)).assertEqual(7);
      expect(fullAtLength.$_get(3)).assertEqual(7);
      expect(fullBeyond.$_get(0)).assertEqual(7);
      expect(fullBeyond.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0600
     * @tc.name int32ArrayFillPart03Test006
     * @tc.desc Verify start just beyond negative length clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let atLengthPlusOne: Int32Array = new Int32Array([1, 2, 3, 4]);
      let atLengthPlusTwo: Int32Array = new Int32Array([1, 2, 3, 4]);
      atLengthPlusOne.fill(9.0, -(atLengthPlusOne.length + 1), 2);
      atLengthPlusTwo.fill(9.0, -(atLengthPlusTwo.length + 2), 2);
      expect(atLengthPlusOne.$_get(0)).assertEqual(9);
      expect(atLengthPlusOne.$_get(1)).assertEqual(9);
      expect(atLengthPlusTwo.$_get(0)).assertEqual(9);
      expect(atLengthPlusTwo.$_get(1)).assertEqual(9);
      expect(atLengthPlusTwo.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0700
     * @tc.name int32ArrayFillPart03Test007
     * @tc.desc Verify end just beyond negative length clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let endLengthPlusOne: Int32Array = new Int32Array([10, 20, 30]);
      let endLengthPlusTwo: Int32Array = new Int32Array([10, 20, 30]);
      endLengthPlusOne.fill(7.0, 0, -(endLengthPlusOne.length + 1));
      endLengthPlusTwo.fill(7.0, 0, -(endLengthPlusTwo.length + 2));
      expect(endLengthPlusOne.$_get(0)).assertEqual(10);
      expect(endLengthPlusOne.$_get(2)).assertEqual(30);
      expect(endLengthPlusTwo.$_get(0)).assertEqual(10);
      expect(endLengthPlusTwo.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0800
     * @tc.name int32ArrayFillPart03Test008
     * @tc.desc Verify start=-(length+1) negative one-bound (Int) clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.fill(0, -6, 3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_0900
     * @tc.name int32ArrayFillPart03Test009
     * @tc.desc Verify end=-(length+1) negative one-bound clamps to 0 empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.fill(5, 1, -5);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1000
     * @tc.name int32ArrayFillPart03Test010
     * @tc.desc Verify start at or beyond length clamps to length and is a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(7.0, arr.length, arr.length);
      arr.fill(8.0, arr.length + 1, arr.length);
      arr.fill(9.0, arr.length + 2, arr.length);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1100
     * @tc.name int32ArrayFillPart03Test011
     * @tc.desc Verify end=arr.length fills from index 1 to array tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.fill(0, 1, arr.length);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1200
     * @tc.name int32ArrayFillPart03Test012
     * @tc.desc Verify fill(value,0,2) overwrites [0,2) range with value, positions outside range unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(9.0, 0, 2);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1300
     * @tc.name int32ArrayFillPart03Test013
     * @tc.desc Verify end=0 yields empty range no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.fill(5, 0, 0);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1400
     * @tc.name int32ArrayFillPart03Test014
     * @tc.desc Verify fill(value,length) with start==length is a no-op, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, arr.length, arr.length);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1500
     * @tc.name int32ArrayFillPart03Test015
     * @tc.desc Verify end=arr.length fills from index 1 to tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.fill(0, 1, arr.length);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1600
     * @tc.name int32ArrayFillPart03Test016
     * @tc.desc Verify both start and end large positive clamp to empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, 999999, 999999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1700
     * @tc.name int32ArrayFillPart03Test017
     * @tc.desc Verify both start and end large negative clamp to [0,0] empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.fill(5, -999999, -999999);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1800
     * @tc.name int32ArrayFillPart03Test018
     * @tc.desc Verify start large positive end large negative clamp to [length,0] empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, 999999, -999999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_1900
     * @tc.name int32ArrayFillPart03Test019
     * @tc.desc Verify start large negative end large positive fills entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.fill(0, -999999, 999999);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2000
     * @tc.name int32ArrayFillPart03Test020
     * @tc.desc Verify start=arr.length end=0 yields empty range no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.fill(5.0, arr.length, 0);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2100
     * @tc.name int32ArrayFillPart03Test021
     * @tc.desc Verify equal start and end values produce an empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let middle: Int32Array = new Int32Array([1, 2, 3, 4]);
      let tail: Int32Array = new Int32Array([1, 2, 3, 4]);
      middle.fill(7.0, 1, 1);
      tail.fill(7.0, tail.length, tail.length);
      expect(middle.$_get(0)).assertEqual(1);
      expect(middle.$_get(1)).assertEqual(2);
      expect(middle.$_get(3)).assertEqual(4);
      expect(tail.$_get(0)).assertEqual(1);
      expect(tail.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2200
     * @tc.name int32ArrayFillPart03Test022
     * @tc.desc Verify positive reversed ranges produce an empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let middle: Int32Array = new Int32Array([10, 20, 30, 40]);
      let head: Int32Array = new Int32Array([10, 20, 30, 40]);
      middle.fill(5, 2, 1);
      head.fill(5, 1, 0);
      expect(middle.$_get(0)).assertEqual(10);
      expect(middle.$_get(3)).assertEqual(40);
      expect(head.$_get(0)).assertEqual(10);
      expect(head.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2300
     * @tc.name int32ArrayFillPart03Test023
     * @tc.desc Verify start=-2 end=-3 adjacent negative reversed no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.fill(5, -2, -3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2400
     * @tc.name int32ArrayFillPart03Test024
     * @tc.desc Verify start=length-1 end=length-2 tail reversed no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, 3, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2500
     * @tc.name int32ArrayFillPart03Test025
     * @tc.desc Verify start=-1 end=0 reversed across zero no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, -1, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2600
     * @tc.name int32ArrayFillPart03Test026
     * @tc.desc Verify empty array one-arg fill no throw length stays 0 returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.fill(7.0);
      expect(arr.length).assertEqual(0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2700
     * @tc.name int32ArrayFillPart03Test027
     * @tc.desc Verify empty array fill with zero-length ranges does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.fill(5, 0, 0);
      arr.fill(7.0, arr.length, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2800
     * @tc.name int32ArrayFillPart03Test028
     * @tc.desc Verify empty array fill start=-1 end=-1 no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.fill(0, -1, -1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_2900
     * @tc.name int32ArrayFillPart03Test029
     * @tc.desc Verify empty array fill large negative positive clamp no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.fill(0, -999999, 999999);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3000
     * @tc.name int32ArrayFillPart03Test030
     * @tc.desc Verify single-element array one-arg fill overwrites the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.fill(99.0);
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3100
     * @tc.name int32ArrayFillPart03Test031
     * @tc.desc Verify single-element fill start=0 end=1 overwrites element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      arr.fill(8.0, 0, 1);
      expect(arr.$_get(0)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3200
     * @tc.name int32ArrayFillPart03Test032
     * @tc.desc Verify single-element fill start=1 no-op out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.fill(99.0, 1, arr.length);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3300
     * @tc.name int32ArrayFillPart03Test033
     * @tc.desc Verify single-element fill start=0 end=0 empty range no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77]);
      arr.fill(5, 0, 0);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3400
     * @tc.name int32ArrayFillPart03Test034
     * @tc.desc Verify single-element fill start=-1 overwrites element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      arr.fill(0, -1, arr.length);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3500
     * @tc.name int32ArrayFillPart03Test035
     * @tc.desc Verify single-element fill start=-2 clamps to 0 overwrites element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      arr.fill(7.0, -2, arr.length);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3600
     * @tc.name int32ArrayFillPart03Test036
     * @tc.desc Verify single-element fill start=0 end=-1 empty range no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([55]);
      arr.fill(9.0, 0, -1);
      expect(arr.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3700
     * @tc.name int32ArrayFillPart03Test037
     * @tc.desc Verify all-zero array fill(0) remains all zeros idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      arr.fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3800
     * @tc.name int32ArrayFillPart03Test038
     * @tc.desc Verify all-one array fill(1) remains all ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1, 1, 1, 1]);
      arr.fill(1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_3900
     * @tc.name int32ArrayFillPart03Test039
     * @tc.desc Verify all-negative-one array fill(-1) remains all -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1, -1]);
      arr.fill(-1);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4000
     * @tc.name int32ArrayFillPart03Test040
     * @tc.desc Verify all INT32_MAX array fill MAX stays MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      arr.fill(2147483647.0);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4100
     * @tc.name int32ArrayFillPart03Test041
     * @tc.desc Verify all INT32_MIN array fill MIN stays MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      arr.fill(-2147483648.0);
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4200
     * @tc.name int32ArrayFillPart03Test042
     * @tc.desc Verify all-same array fill middle segment changes only middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7, 7]);
      arr.fill(0, 1, 4);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4300
     * @tc.name int32ArrayFillPart03Test043
     * @tc.desc Verify start=0 end=2 fills first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30] as number[]);
      arr.fill(5.0, 0, 2);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4400
     * @tc.name int32ArrayFillPart03Test044
     * @tc.desc Verify start=1.0 integer value works normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30] as number[]);
      arr.fill(7.0, 1, 3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4500
     * @tc.name int32ArrayFillPart03Test045
     * @tc.desc Verify start=2 fills from index 2 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4] as number[]);
      arr.fill(9.0, 2, arr.length);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4600
     * @tc.name int32ArrayFillPart03Test046
     * @tc.desc Verify start=-2 fills last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4] as number[]);
      arr.fill(7.0, -2, arr.length);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4700
     * @tc.name int32ArrayFillPart03Test047
     * @tc.desc Verify end=-1 fills from index 0 to second-to-last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40] as number[]);
      arr.fill(0.0, 0, -1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4800
     * @tc.name int32ArrayFillPart03Test048
     * @tc.desc Verify value=3.5 truncated via ToInt32 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(3.5);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_4900
     * @tc.name int32ArrayFillPart03Test049
     * @tc.desc Verify value=-3.5 truncated via ToInt32 to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(-3.5);
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5000
     * @tc.name int32ArrayFillPart03Test050
     * @tc.desc Verify value=0.1 truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(0.1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5100
     * @tc.name int32ArrayFillPart03Test051
     * @tc.desc Verify fill returns the same reference as this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.fill(7.0, 0, 2);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5200
     * @tc.name int32ArrayFillPart03Test052
     * @tc.desc Verify fill returns the same reference as this (assertEqual arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.fill(0);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5300
     * @tc.name int32ArrayFillPart03Test053
     * @tc.desc Verify length remains unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.fill(9.0, 1, 4);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5400
     * @tc.name int32ArrayFillPart03Test054
     * @tc.desc Verify buffer byteLength unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let before: number = arr.buffer.byteLength;
      arr.fill(0);
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5500
     * @tc.name int32ArrayFillPart03Test055
     * @tc.desc Verify byteOffset remains 0 after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, 1, 3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5600
     * @tc.name int32ArrayFillPart03Test056
     * @tc.desc Verify fill then reverse chain sees filled values reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(0, 0, 2).reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5700
     * @tc.name int32ArrayFillPart03Test057
     * @tc.desc Verify reverse then fill chain fills after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.reverse().fill(9.0, 1, 3);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5800
     * @tc.name int32ArrayFillPart03Test058
     * @tc.desc Verify fill then sort chain sorts filled identical values stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4, 2]);
      arr.fill(5, 0, 2).sort();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_5900
     * @tc.name int32ArrayFillPart03Test059
     * @tc.desc Verify fill then copyWithin chain copies filled segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, 0, 2).copyWithin(2, 0, 2);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6000
     * @tc.name int32ArrayFillPart03Test060
     * @tc.desc Verify copyWithin then fill chain overwrites copied prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.copyWithin(2, 0, 2).fill(0, 0, 2);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6100
     * @tc.name int32ArrayFillPart03Test061
     * @tc.desc Verify two consecutive fill chains second overwrites middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.fill(0).fill(9.0, 1, 4);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6200
     * @tc.name int32ArrayFillPart03Test062
     * @tc.desc Verify fill then fill reversed empty range keeps first result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, 1, 3).fill(5, 2, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6300
     * @tc.name int32ArrayFillPart03Test063
     * @tc.desc Verify fill modifications visible through same-buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(7.0, 1, 3);
      let view: Int32Array = new Int32Array(arr.buffer);
      expect(view.$_get(0)).assertEqual(1);
      expect(view.$_get(1)).assertEqual(7);
      expect(view.$_get(2)).assertEqual(7);
      expect(view.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6400
     * @tc.name int32ArrayFillPart03Test064
     * @tc.desc Verify fill on subarray view affects parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      sub.fill(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(40);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6500
     * @tc.name int32ArrayFillPart03Test065
     * @tc.desc Verify fill entire subarray changes corresponding parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let sub: Int32Array = arr.subarray(2, 5);
      sub.fill(99.0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(99);
      expect(arr.$_get(4)).assertEqual(99);
      expect(arr.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6600
     * @tc.name int32ArrayFillPart03Test066
     * @tc.desc Verify fill on byteOffset view visible through sibling view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let valFirst: Int32Array = new Int32Array(buf, 0, 4);
      valFirst.$_set(0, 1);
      valFirst.$_set(1, 2);
      valFirst.$_set(2, 3);
      valFirst.$_set(3, 4);
      valFirst.fill(0, 1, 3);
      let valSecond: Int32Array = new Int32Array(buf, 0, 4);
      expect(valSecond.$_get(0)).assertEqual(1);
      expect(valSecond.$_get(1)).assertEqual(0);
      expect(valSecond.$_get(2)).assertEqual(0);
      expect(valSecond.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6700
     * @tc.name int32ArrayFillPart03Test067
     * @tc.desc Verify subarray byteOffset and length unchanged after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = arr.subarray(1, 4);
      let off: number = sub.byteOffset;
      let len: number = sub.length;
      sub.fill(0);
      expect(sub.byteOffset).assertEqual(off);
      expect(sub.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6800
     * @tc.name int32ArrayFillPart03Test068
     * @tc.desc Verify fill INT32_MAX visible through shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483647.0, 1, 2);
      let view: Int32Array = new Int32Array(arr.buffer);
      expect(view.$_get(1)).assertEqual(2147483647);
      expect(view.$_get(0)).assertEqual(0);
      expect(view.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_6900
     * @tc.name int32ArrayFillPart03Test069
     * @tc.desc Verify fill INT32_MIN visible through shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-2147483648.0, 0, 2);
      let view: Int32Array = new Int32Array(arr.buffer);
      expect(view.$_get(0)).assertEqual(-2147483648);
      expect(view.$_get(1)).assertEqual(-2147483648);
      expect(view.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART03_7000
     * @tc.name int32ArrayFillPart03Test070
     * @tc.desc Verify fill on offset view updates original buffer via shared memory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7, 8]);
      let valFirst: Int32Array = new Int32Array(arr.buffer, 8, 4);
      valFirst.fill(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
      expect(arr.$_get(5)).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(6)).assertEqual(7);
      expect(arr.$_get(7)).assertEqual(8);
    });
  });
}
