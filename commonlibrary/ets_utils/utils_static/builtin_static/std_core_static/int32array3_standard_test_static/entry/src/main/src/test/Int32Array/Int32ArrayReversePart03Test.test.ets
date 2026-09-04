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

export default function int32ArrayReversePart03Test(): void {
  describe('Int32ArrayReversePart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayReversePart03Test001
     * @tc.desc Verify reverse === this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let ret: Int32Array = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayReversePart03Test002
     * @tc.desc Verify reverse === this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let ret: Int32Array = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayReversePart03Test003
     * @tc.desc Verify reverse length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.reverse();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayReversePart03Test004
     * @tc.desc Verify reverse length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.reverse();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayReversePart03Test005
     * @tc.desc Verify reverse byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let before: int = arr.byteLength;
      arr.reverse();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayReversePart03Test006
     * @tc.desc Verify reverse byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      let before: int = arr.byteOffset;
      arr.reverse();
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayReversePart03Test007
     * @tc.desc Verify reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let buf: ArrayBuffer = arr.buffer;
      arr.reverse();
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayReversePart03Test008
     * @tc.desc Verify reverse BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.reverse();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayReversePart03Test009
     * @tc.desc Verify reverse join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let s: string = arr.reverse().join(',');
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayReversePart03Test010
     * @tc.desc Verify ArrayBuffer(0) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      arr.reverse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayReversePart03Test011
     * @tc.desc Verify reverse for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let count: int = 0;
      arr.reverse();
      for (let x of arr) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayReversePart03Test012
     * @tc.desc Verify reverse at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let v: number | undefined = arr.reverse().at(0);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayReversePart03Test013
     * @tc.desc Verify 42 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayReversePart03Test014
     * @tc.desc Verify 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayReversePart03Test015
     * @tc.desc Verify -1 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayReversePart03Test016
     * @tc.desc Verify INT_MAX reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayReversePart03Test017
     * @tc.desc Verify INT_MIN reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayReversePart03Test018
     * @tc.desc Verify reverse no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayReversePart03Test019
     * @tc.desc Verify 0 reverse [0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayReversePart03Test020
     * @tc.desc Verify 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0, 0, 0);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayReversePart03Test021
     * @tc.desc Verify 7 reverse 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 7, 7);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayReversePart03Test022
     * @tc.desc Verify -1 reverse -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -1, -1, -1);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-1);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayReversePart03Test023
     * @tc.desc Verify NaN ToInt32=0 reverse NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([1, Number.NaN] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayReversePart03Test024
     * @tc.desc Verify +Infinity ToInt32=0 reverse Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([Number.POSITIVE_INFINITY, 2] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayReversePart03Test025
     * @tc.desc Verify -Infinity ToInt32=0 reverse -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([3, Number.NEGATIVE_INFINITY] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayReversePart03Test026
     * @tc.desc Verify 0.5 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([0.5, 4] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayReversePart03Test027
     * @tc.desc Verify -0.9 0 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([-0.9, 10, -0.9] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayReversePart03Test028
     * @tc.desc Verify 2147483647.9 INT_MAX reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([2147483647.9, 5] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayReversePart03Test029
     * @tc.desc Verify 2147483648 INT_MIN reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([2147483648.0, 1] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayReversePart03Test030
     * @tc.desc Verify 2147483649 -2147483647 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([2, 2147483649.0] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483647);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayReversePart03Test031
     * @tc.desc Verify -2147483649 INT_MAX reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([-2147483649.0, 3] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayReversePart03Test032
     * @tc.desc Verify 4294967296 2^32 0 reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([4294967296.0, 4] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayReversePart03Test033
     * @tc.desc Verify 4294967297 1 reverse 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([5, 4294967297.0] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayReversePart03Test034
     * @tc.desc Verify INT_MAX INT_MIN reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, -2147483648);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayReversePart03Test035
     * @tc.desc Verify [INT_MAX,0,INT_MIN] reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0, -2147483648);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayReversePart03Test036
     * @tc.desc Verify NaN/Infinity/-Infinity reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array =
        Int32Array.from([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayReversePart03Test037
     * @tc.desc Verify reverse $_get(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.reverse();
      try {
        arr.$_get(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayReversePart03Test038
     * @tc.desc Verify reverse $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayReversePart03Test039
     * @tc.desc Verify reverse $_get(length+1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      arr.reverse();
      try {
        arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayReversePart03Test040
     * @tc.desc Verify reverse at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      arr.reverse();
      let v: number | undefined = arr.at(2);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayReversePart03Test041
     * @tc.desc Verify reverse at(length+1) +1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.reverse();
      let v: number | undefined = arr.at(3);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayReversePart03Test042
     * @tc.desc Verify reverse at(-length-1) undefined -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.reverse();
      let v: number | undefined = arr.at(-4);
      expect(v).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayReversePart03Test043
     * @tc.desc Verify reverse at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      let v: number | undefined = arr.at(-1);
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayReversePart03Test044
     * @tc.desc Verify reverse at(-length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      let v: number | undefined = arr.at(-3);
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayReversePart03Test045
     * @tc.desc Verify reverse $_set(length, 99) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.reverse();
      try {
        arr.$_set(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayReversePart03Test046
     * @tc.desc Verify reverse $_set(-1, 88) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      try {
        arr.$_set(-1, 88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayReversePart03Test047
     * @tc.desc Verify reverse $_set(length+1, 77) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      try {
        arr.$_set(5, 77);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayReversePart03Test048
     * @tc.desc Verify new Int32Array(buf, 1, 2) byteOffset=1 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      try {
        new Int32Array(buf, 1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayReversePart03Test049
     * @tc.desc Verify new Int32Array(buf, 3, 2) byteOffset=3 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 3, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayReversePart03Test050
     * @tc.desc Verify new Int32Array(buf, 0, 3) length 8 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        new Int32Array(buf, 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayReversePart03Test051
     * @tc.desc Verify new Int32Array(buf, -4, 2) byteOffset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, -4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayReversePart03Test052
     * @tc.desc Verify new Int32Array(buf, 0, -1) length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        new Int32Array(buf, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayReversePart03Test053
     * @tc.desc Verify subarray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3, 4);
      let child: Int32Array = parent.subarray(0, 4);
      child.reverse();
      expect(parent.$_get(0)).assertEqual(4);
      expect(parent.$_get(1)).assertEqual(3);
      expect(parent.$_get(2)).assertEqual(2);
      expect(parent.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayReversePart03Test054
     * @tc.desc Verify subarray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let child: Int32Array = parent.subarray(1, 4);
      child.reverse();
      expect(parent.$_get(0)).assertEqual(10);
      expect(parent.$_get(1)).assertEqual(40);
      expect(parent.$_get(2)).assertEqual(30);
      expect(parent.$_get(3)).assertEqual(20);
      expect(parent.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayReversePart03Test055
     * @tc.desc Verify ArrayBuffer Int32Array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      let b: Int32Array = new Int32Array(buf);
      a.reverse();
      expect(b.$_get(0)).assertEqual(4);
      expect(b.$_get(1)).assertEqual(3);
      expect(b.$_get(2)).assertEqual(2);
      expect(b.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayReversePart03Test056
     * @tc.desc Verify byteOffset reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 4, 4);
      a.$_set(0, 7);
      a.$_set(1, 8);
      a.$_set(2, 9);
      a.$_set(3, 10);
      a.reverse();
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(8);
      expect(a.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayReversePart03Test057
     * @tc.desc Verify subarray reverse no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(100, 200, 300);
      let child: Int32Array = parent.subarray(1, 2);
      child.reverse();
      expect(parent.$_get(0)).assertEqual(100);
      expect(parent.$_get(1)).assertEqual(200);
      expect(parent.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayReversePart03Test058
     * @tc.desc Verify subarray(begin>=end) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3);
      let child: Int32Array = parent.subarray(2, 1);
      child.reverse();
      expect(child.length).assertEqual(0);
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(2);
      expect(parent.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayReversePart03Test059
     * @tc.desc Verify reverse buffer int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 12345);
      a.$_set(1, -67890);
      a.reverse();
      let b: Int32Array = new Int32Array(buf);
      expect(b.$_get(0)).assertEqual(-67890);
      expect(b.$_get(1)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayReversePart03Test060
     * @tc.desc Verify ArrayBuffer.slice reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      let b: Int32Array = new Int32Array(buf.slice(0));
      a.reverse();
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(2);
      expect(b.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayReversePart03Test061
     * @tc.desc Verify reverse().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse().reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayReversePart03Test062
     * @tc.desc Verify reverse().join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let s: string = arr.reverse().join(',');
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayReversePart03Test063
     * @tc.desc Verify reverse().at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let v: number | undefined = arr.reverse().at(0);
      expect(v).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayReversePart03Test064
     * @tc.desc Verify reverse().indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let idx: int = arr.reverse().indexOf(8);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayReversePart03Test065
     * @tc.desc Verify reverse().includes(NaN) false NaN ToInt32=0 NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([Number.NaN, 1] as number[]);
      let found: boolean = arr.reverse().includes(Number.NaN);
      expect(found).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayReversePart03Test066
     * @tc.desc Verify reverse().includes(0) NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([1, Number.NaN] as number[]);
      let found: boolean = arr.reverse().includes(0);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayReversePart03Test067
     * @tc.desc Verify reverse().toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4, 5, 6);
      let s: string = arr.reverse().toString();
      expect(s).assertEqual('6,5,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayReversePart03Test068
     * @tc.desc Verify reverse().fill(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse().fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayReversePart03Test069
     * @tc.desc Verify reverse().set(src) offset+src.length>length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let src: Int32Array = Int32Array.of(9, 9, 9, 9);
      arr.reverse();
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayReversePart03Test070
     * @tc.desc Verify reverse().set(src,-1) offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let src: Int32Array = Int32Array.of(5, 6);
      arr.reverse();
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayReversePart03Test071
     * @tc.desc Verify reverse().with(length, val) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.reverse();
      try {
        arr.with(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayReversePart03Test072
     * @tc.desc Verify reverse().with(-length-1, val) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.reverse();
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayReversePart03Test073
     * @tc.desc Verify reverse().subarray(0,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let sub: Int32Array = arr.reverse().subarray(0, 2);
      expect(sub.$_get(0)).assertEqual(33);
      expect(sub.$_get(1)).assertEqual(22);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayReversePart03Test074
     * @tc.desc Verify reverse reduce initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      try {
        arr.reduce((acc: number, v: number): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayReversePart03Test075
     * @tc.desc Verify reverse reduceRight initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      try {
        arr.reduceRight((acc: number, v: number): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayReversePart03Test076
     * @tc.desc Verify reverse some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      let r: boolean = arr.some((v: number): boolean => v > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayReversePart03Test077
     * @tc.desc Verify reverse every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      let r: boolean = arr.every((v: number): boolean => v > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArrayReversePart03Test078
     * @tc.desc Verify reverse forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      let cnt: int = 0;
      arr.forEach((_v: number): void => {
        cnt = cnt + 1;
      });
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArrayReversePart03Test079
     * @tc.desc Verify Int32Array.from(int[]) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([10, 20, 30, 40] as number[]);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(40);
      expect(arr.$_get(1)).assertEqual(30);
      expect(arr.$_get(2)).assertEqual(20);
      expect(arr.$_get(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArrayReversePart03Test080
     * @tc.desc Verify Int32Array.of reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6, 7);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8100
     * @tc.name int32ArrayReversePart03Test081
     * @tc.desc Verify new Int32Array(4) reverse 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8200
     * @tc.name int32ArrayReversePart03Test082
     * @tc.desc Verify ArrayBuffer+byteOffset+length reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      arr.$_set(0, 111);
      arr.$_set(1, 222);
      arr.$_set(2, 333);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(333);
      expect(arr.$_get(1)).assertEqual(222);
      expect(arr.$_get(2)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8300
     * @tc.name int32ArrayReversePart03Test083
     * @tc.desc Verify TypedArray reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let dst: Int32Array = new Int32Array(src);
      dst.reverse();
      expect(src.$_get(0)).assertEqual(1);
      expect(src.$_get(1)).assertEqual(2);
      expect(src.$_get(2)).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(3);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8400
     * @tc.name int32ArrayReversePart03Test084
     * @tc.desc Verify reverse for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.reverse();
      let result: number[] = [];
      for (let x of arr) {
        result.push(x);
      }
      expect(result.$_get(0)).assertEqual(4);
      expect(result.$_get(1)).assertEqual(3);
      expect(result.$_get(2)).assertEqual(2);
      expect(result.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8500
     * @tc.name int32ArrayReversePart03Test085
     * @tc.desc Verify reverse for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      arr.reverse();
      let sum: number = 0;
      for (let x of arr) {
        if (x === 3) {
          break;
        }
        sum = sum + x;
      }
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8600
     * @tc.name int32ArrayReversePart03Test086
     * @tc.desc Verify reverse for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.reverse();
      let entered: boolean = false;
      for (let x of arr) {
        entered = true;
      }
      expect(entered).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8700
     * @tc.name int32ArrayReversePart03Test087
     * @tc.desc Verify reverse keys() 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.reverse();
      let idxList: number[] = [];
      for (let i of arr.keys()) {
        idxList.push(i);
      }
      expect(idxList[0]).assertEqual(0);
      expect(idxList[1]).assertEqual(1);
      expect(idxList[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8800
     * @tc.name int32ArrayReversePart03Test088
     * @tc.desc Verify reverse values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8);
      arr.reverse();
      let vals: number[] = [];
      for (let v of arr.values()) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(8);
      expect(vals[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_8900
     * @tc.name int32ArrayReversePart03Test089
     * @tc.desc Verify 2 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(200);
      expect(arr.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_9000
     * @tc.name int32ArrayReversePart03Test090
     * @tc.desc Verify 3 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(30);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_9100
     * @tc.name int32ArrayReversePart03Test091
     * @tc.desc Verify 6 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(2);
      expect(arr.$_get(5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_9200
     * @tc.name int32ArrayReversePart03Test092
     * @tc.desc Verify 7 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7);
      arr.reverse();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(4);
      expect(arr.$_get(4)).assertEqual(3);
      expect(arr.$_get(5)).assertEqual(2);
      expect(arr.$_get(6)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_9300
     * @tc.name int32ArrayReversePart03Test093
     * @tc.desc Verify reverse every value/index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let seen: string = '';
      arr.reverse().every((value: number, index: int): boolean => {
        seen = seen + value.toString() + '@' + index.toString() + ';';
        return true;
      });
      expect(seen).assertEqual('3@0;2@1;1@2;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_REVERSE_PART03_TEST_MINDMAP_9400
     * @tc.name int32ArrayReversePart03Test094
     * @tc.desc Verify sort(comparator) reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayReversePart03Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 2);
      arr.reverse();
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });
  });
}
