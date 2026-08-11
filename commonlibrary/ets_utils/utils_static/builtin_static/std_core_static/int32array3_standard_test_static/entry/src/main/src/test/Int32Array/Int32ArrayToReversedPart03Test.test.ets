'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

export default function int32ArrayToReversedPart03Test(): void {
  describe('Int32ArrayToReversedPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayToReversedPart03Test001
     * @tc.desc Verify toReversed() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.toReversed();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayToReversedPart03Test002
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r1: Int32Array = arr.toReversed();
      let r2: Int32Array = arr.toReversed();
      expect(r1.length).assertEqual(0);
      expect(r2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayToReversedPart03Test003
     * @tc.desc Verify toReversed() $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array(0);
        let r: Int32Array = arr.toReversed();
        r.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayToReversedPart03Test004
     * @tc.desc Verify toReversed() for-of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      let count: int = 0;
      for (let i = 0; i < r.length; i++) {
        r.$_get(i);
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayToReversedPart03Test005
     * @tc.desc Verify toReversed() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayToReversedPart03Test006
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayToReversedPart03Test007
     * @tc.desc Verify 0 toReversed() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayToReversedPart03Test008
     * @tc.desc Verify Number.NaN ToInt32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      arr.$_set(0, 0);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayToReversedPart03Test009
     * @tc.desc Verify toReversed() $_get(1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = Int32Array.of(7);
        let r: Int32Array = arr.toReversed();
        r.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayToReversedPart03Test010
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayToReversedPart03Test011
     * @tc.desc Verify 0 toReversed() [0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayToReversedPart03Test012
     * @tc.desc Verify 7 toReversed() 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7, 7]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(7);
      expect(r.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayToReversedPart03Test013
     * @tc.desc Verify -1 toReversed() join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1]);
      let r: Int32Array = arr.toReversed();
      expect(r.join(',')).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayToReversedPart03Test014
     * @tc.desc Verify INT_MAX toReversed() length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647, 2147483647]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayToReversedPart03Test015
     * @tc.desc Verify toReversed() every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5, 5, 5]);
      let r: Int32Array = arr.toReversed();
      let allEq: boolean = true;
      for (let i: int = 0; i < r.length; i++) {
        if (r.$_get(i) !== arr.$_get(i)) {
          allEq = false;
          break;
        }
      }
      expect(allEq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayToReversedPart03Test016
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      r.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayToReversedPart03Test017
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      r.$_set(r.length - 1, -100);
      expect(arr.$_get(arr.length - 1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayToReversedPart03Test018
     * @tc.desc Verify toReversed() fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.toReversed();
      r.fill(0);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayToReversedPart03Test019
     * @tc.desc Verify toReversed() set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: Int32Array = arr.toReversed();
      let src: Int32Array = new Int32Array([77, 88]);
      r.set(src, 1);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayToReversedPart03Test020
     * @tc.desc Verify reverse() toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayToReversedPart03Test021
     * @tc.desc Verify toReversed() reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      r.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayToReversedPart03Test022
     * @tc.desc Verify toReversed() sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4, 2]);
      let r: Int32Array = arr.toReversed();
      r.sort();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayToReversedPart03Test023
     * @tc.desc Verify toReversed() copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let r: Int32Array = arr.toReversed();
      r.copyWithin(0, 3, 5);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayToReversedPart03Test024
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r2: Int32Array = arr.toReversed().toReversed();
      expect(r2.$_get(0)).assertEqual(11);

      {
      let arr: Int32Array = new Int32Array([11, 22, 33, 44]);
      let r2: Int32Array = arr.toReversed().toReversed();
      expect(r2.$_get(3)).assertEqual(44);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayToReversedPart03Test025
     * @tc.desc Verify toReversed() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let r2: Int32Array = arr.toReversed().toReversed();
      expect(r2.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayToReversedPart03Test026
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r2: Int32Array = arr.toReversed().toReversed();
      r2.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayToReversedPart03Test027
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-7);
      let r2: Int32Array = arr.toReversed().toReversed();
      expect(r2.$_get(0)).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayToReversedPart03Test028
     * @tc.desc Verify toReversed() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r2: Int32Array = arr.toReversed().toReversed();
      expect(r2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayToReversedPart03Test029
     * @tc.desc Verify INT_MAX/INT_MIN toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0]);
      let r2: Int32Array = arr.toReversed().toReversed();
      expect(r2.$_get(0)).assertEqual(2147483647);
      expect(r2.$_get(1)).assertEqual(-2147483648);
      expect(r2.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayToReversedPart03Test030
     * @tc.desc Verify toReversed() copy reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toReversed();
      let cp: Int32Array = new Int32Array(arr);
      cp.reverse();
      expect(r.$_get(0)).assertEqual(cp.$_get(0));
      expect(r.$_get(1)).assertEqual(cp.$_get(1));
      expect(r.$_get(2)).assertEqual(cp.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayToReversedPart03Test031
     * @tc.desc Verify toReversed() reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array([1, 2, 3]);
      let a2: Int32Array = new Int32Array([1, 2, 3]);
      a1.toReversed();
      a2.reverse();
      expect(a1.$_get(0)).assertEqual(1);
      expect(a2.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayToReversedPart03Test032
     * @tc.desc Verify toReversed() reverse() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      let rv: Int32Array = arr.reverse();
      expect(r).not().assertEqual(arr);
      expect(rv).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayToReversedPart03Test033
     * @tc.desc Verify toReversed() toReversed reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6]);
      let r: Int32Array = arr.toReversed().toReversed();
      expect(r.$_get(0)).assertEqual(arr.$_get(0));
      expect(r.$_get(1)).assertEqual(arr.$_get(1));
      expect(r.$_get(2)).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayToReversedPart03Test034
     * @tc.desc Verify ArrayBuffer toReversed() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let r: Int32Array = view.toReversed();
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayToReversedPart03Test035
     * @tc.desc Verify ArrayBuffer toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 8, 4);
      view.$_set(0, 10);
      view.$_set(1, 20);
      view.$_set(2, 30);
      view.$_set(3, 40);
      let r: Int32Array = view.toReversed();
      expect(r.$_get(0)).assertEqual(40);
      expect(r.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayToReversedPart03Test036
     * @tc.desc Verify toReversed() ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      view.$_set(0, 11);
      view.$_set(1, 22);
      view.$_set(2, 33);
      let r: Int32Array = view.toReversed();
      r.$_set(0, 999);
      expect(view.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayToReversedPart03Test037
     * @tc.desc Verify subarray toReversed() length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5]);
      let sub: Int32Array = arr.subarray(2, 5);
      let r: Int32Array = sub.toReversed();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayToReversedPart03Test038
     * @tc.desc Verify subarray toReversed() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5]);
      let sub: Int32Array = arr.subarray(1, 4);
      let r: Int32Array = sub.toReversed();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayToReversedPart03Test039
     * @tc.desc Verify subarray toReversed() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4]);
      let sub: Int32Array = arr.subarray(1, 4);
      let r: Int32Array = sub.toReversed();
      r.$_set(0, 888);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayToReversedPart03Test040
     * @tc.desc Verify Number.NaN ToInt32 0 toReversed() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 1);
      arr.$_set(1, 0);
      arr.$_set(2, 3);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayToReversedPart03Test041
     * @tc.desc Verify -0 toReversed() +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, 5);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayToReversedPart03Test042
     * @tc.desc Verify INT_MAX toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayToReversedPart03Test043
     * @tc.desc Verify [-1, 1, -1, 1] toReversed() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 1, -1, 1]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayToReversedPart03Test044
     * @tc.desc Verify 2147483648 -2147483648 toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -2147483648);
      arr.$_set(1, 1);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayToReversedPart03Test045
     * @tc.desc Verify toReversed() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.toReversed();
      let first: number = 0;
      for (let i = 0; i < r.length; i++) {
        let v = r.$_get(i);
        first = v;
        break;
      }
      expect(first).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayToReversedPart03Test046
     * @tc.desc Verify toReversed() forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      let seenIdx0: number = 0;
      r.forEach((value: number, index: int, array: Int32Array): void => {
        if (index === 0) {
          seenIdx0 = value;
        }
      });
      expect(seenIdx0).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayToReversedPart03Test047
     * @tc.desc Verify toReversed() forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: Int32Array = arr.toReversed();
      let cnt: int = 0;
      r.forEach((value: number, index: int, array: Int32Array): void => {
        cnt = cnt + 1;
      });
      expect(cnt).assertEqual(r.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayToReversedPart03Test048
     * @tc.desc Verify toReversed() keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.toReversed();
      let sum: int = 0;
      for (let k = 0; k < r.length; k++) {
        sum = sum + k;
      }
      expect(sum).assertEqual(0 + 1 + 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayToReversedPart03Test049
     * @tc.desc Verify toReversed() values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let r: Int32Array = arr.toReversed();
      let it = r.values();
      let first = it.next();
      expect(first.value).assertEqual(9);
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayToReversedPart03Test050
     * @tc.desc Verify toReversed() entries() (0, lastValue)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let r: Int32Array = arr.toReversed();
      let firstKey: int = -1;
      let firstVal: number = 0;
      for (let i = 0; i < r.length; i++) {
        let e: [int, number] = [i, r.$_get(i)];
        firstKey = e[0];
        firstVal = e[1];
        break;
      }
      expect(firstKey).assertEqual(0);
      expect(firstVal).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayToReversedPart03Test051
     * @tc.desc Verify toReversed() toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let rs: Int32Array = arr.toReversed().toSorted();
      expect(rs.$_get(0)).assertEqual(1);
      expect(rs.$_get(1)).assertEqual(2);
      expect(rs.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayToReversedPart03Test052
     * @tc.desc Verify toReversed() slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let s: Int32Array = arr.toReversed().slice(1, 3);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(4);
      expect(s.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayToReversedPart03Test053
     * @tc.desc Verify toReversed() join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let s: string = arr.toReversed().join(',');
      expect(s).assertEqual('30,20,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayToReversedPart03Test054
     * @tc.desc Verify toReversed() toString join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let r: Int32Array = arr.toReversed();
      expect(r.toString()).assertEqual(r.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayToReversedPart03Test055
     * @tc.desc Verify toReversed() indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let r: Int32Array = arr.toReversed();
      expect(r.indexOf(100)).assertEqual(2);
      expect(r.indexOf(300)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayToReversedPart03Test056
     * @tc.desc Verify toReversed() includes(0) 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let r: Int32Array = arr.toReversed();
      expect(r.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayToReversedPart03Test057
     * @tc.desc Verify toReversed() every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      let allInt: boolean = r.every((v: number, idx: int, a: Int32Array): boolean => v >= 1 && v <= 3);
      expect(allInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayToReversedPart03Test058
     * @tc.desc Verify toReversed() some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 10, 15]);
      let r: Int32Array = arr.toReversed();
      let hasTen: boolean = r.some((v: number, idx: int, a: Int32Array): boolean => v === 10);
      expect(hasTen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayToReversedPart03Test059
     * @tc.desc Verify toReversed() map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let mapped: Int32Array = arr.toReversed().map((v: number, idx: int, a: Int32Array): number => v * 2);
      expect(mapped.$_get(0)).assertEqual(6);
      expect(mapped.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayToReversedPart03Test060
     * @tc.desc Verify toReversed() filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let odds: Int32Array = arr.toReversed().filter((v: number, idx: int, a: Int32Array): boolean => v % 2 !== 0);
      expect(odds.length).assertEqual(2);
      expect(odds.$_get(0)).assertEqual(3);
      expect(odds.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayToReversedPart03Test061
     * @tc.desc Verify toReversed() reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sum: number = arr.toReversed().reduce((acc: number, v: number, idx: int, a: Int32Array): number => acc + v);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayToReversedPart03Test062
     * @tc.desc Verify toReversed() reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let last: number = arr.toReversed().reduceRight((acc: number, v: number, idx: int, a: Int32Array): number => v);
      expect(last).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayToReversedPart03Test063
     * @tc.desc Verify toReversed() find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 3, 4, 5, 8]);
      let first: int =
      Double.toInt(arr.toReversed().find((v: number, idx: int, a: Int32Array): boolean => v % 2 === 0)!);
      expect(first).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayToReversedPart03Test064
     * @tc.desc Verify toReversed() findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let idx: int = arr.toReversed().findIndex((v: number, i: int, a: Int32Array): boolean => v === 20);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayToReversedPart03Test065
     * @tc.desc Verify toReversed() some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      let any: boolean = r.some((v: number, i: int, a: Int32Array): boolean => true);
      expect(any).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayToReversedPart03Test066
     * @tc.desc Verify toReversed() every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      let all: boolean = r.every((v: number, i: int, a: Int32Array): boolean => false);
      expect(all).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayToReversedPart03Test067
     * @tc.desc Verify toReversed() forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      let cnt: int = 0;
      r.forEach((v: number, i: int, a: Int32Array): void => {
        cnt = cnt + 1;
      });
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayToReversedPart03Test068
     * @tc.desc Verify toReversed() BYTES_PER_ELEMENT 4; Also verify verify toReversed() buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = arr.toReversed();
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);

      {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = arr.toReversed();
      expect(r.buffer.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayToReversedPart03Test069
     * @tc.desc Verify source and result have equal byteLength; Also verify verify result length and reversed elements; Also verify verify toReversed() byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(1);

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.byteLength).assertEqual(arr.byteLength);
      }

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayToReversedPart03Test070
     * @tc.desc Verify 8 toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5, 6, 7]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(4);
      expect(r.$_get(4)).assertEqual(3);
      expect(r.$_get(7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayToReversedPart03Test071
     * @tc.desc Verify 7 toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 999, 50, 60, 70]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(3)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayToReversedPart03Test072
     * @tc.desc Verify 2 toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(22);
      expect(r.$_get(1)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayToReversedPart03Test073
     * @tc.desc Verify ArrayBuffer 1 toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int32Array = new Int32Array(buf);
      view.$_set(0, -2147483648);
      let r: Int32Array = view.toReversed();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayToReversedPart03Test074
     * @tc.desc Verify Int32Array.of() toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300, 400);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(400);
      expect(r.$_get(3)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayToReversedPart03Test075
     * @tc.desc Verify Int32Array.from( ) toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([7, 8, 9]);
      let arr: Int32Array = Int32Array.from(src);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayToReversedPart03Test076
     * @tc.desc Verify new Int32Array(length) toReversed() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(0);
    });
  });
}
