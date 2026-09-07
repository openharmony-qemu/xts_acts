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

class Dummy {
  v: int = 0;
}

export default function int32ArraySortPart03Test(): void {
  describe('Int32ArraySortPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArraySortPart03Test001
     * @tc.desc Verify 0 sort this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 7]);
      let r: Int32Array = arr.sort();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArraySortPart03Test002
     * @tc.desc Verify 0 sort length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.sort();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArraySortPart03Test003
     * @tc.desc Verify 1 compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 4, 6]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(a - b);
      });
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArraySortPart03Test004
     * @tc.desc Verify undefined compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8, 1, 5]);
      arr.sort(undefined);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArraySortPart03Test005
     * @tc.desc Verify undefined this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1]);
      let r: Int32Array = arr.sort(undefined);
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArraySortPart03Test006
     * @tc.desc Verify a null compareFn cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      try {
        arr.sort(null as Object as (a: number, b: number) => int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArraySortPart03Test007
     * @tc.desc Verify a numeric compareFn cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let bad: Object = 42 as Object;
      try {
        arr.sort(bad as (a: number, b: number) => int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArraySortPart03Test008
     * @tc.desc Verify a string compareFn cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let bad: Object = 'not a fn' as Object;
      try {
        arr.sort(bad as (a: number, b: number) => int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArraySortPart03Test009
     * @tc.desc Verify a boolean compareFn cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let bad: Object = true as Object;
      try {
        arr.sort(bad as (a: number, b: number) => int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArraySortPart03Test010
     * @tc.desc Verify an object compareFn cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let bad: Dummy = new Dummy();
      try {
        arr.sort(bad as Object as (a: number, b: number) => int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArraySortPart03Test011
     * @tc.desc Verify an ArrayBuffer compareFn cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let bad: ArrayBuffer = new ArrayBuffer(8);
      try {
        arr.sort(bad as Object as (a: number, b: number) => int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArraySortPart03Test012
     * @tc.desc Verify compareFn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      try {
        arr.sort(123 as Object as (a: number, b: number) => int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArraySortPart03Test013
     * @tc.desc Verify compareFn buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 5);
      arr.$_set(1, 1);
      arr.$_set(2, 3);
      try {
        arr.sort('oops' as Object as (a: number, b: number) => int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(arr.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArraySortPart03Test014
     * @tc.desc Verify length=0 undefined compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.sort(undefined);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArraySortPart03Test015
     * @tc.desc Verify length=0 compareFn compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let calls: int = 0;
      arr.sort((a: number, b: number): int => {
        calls = calls + 1;
        return Double.toInt(a - b);
      });
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArraySortPart03Test016
     * @tc.desc Verify length=1 sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-17]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArraySortPart03Test017
     * @tc.desc Verify length=1 compareFn sort compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let calls: int = 0;
      arr.sort((a: number, b: number): int => {
        calls = calls + 1;
        return Double.toInt(a - b);
      });
      expect(calls).assertEqual(0);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArraySortPart03Test018
     * @tc.desc Verify length=1 INT32_MIN MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483648);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArraySortPart03Test019
     * @tc.desc Verify length=1 INT32_MAX MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483647);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArraySortPart03Test020
     * @tc.desc Verify length=1 sort this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      let r: Int32Array = arr.sort();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArraySortPart03Test021
     * @tc.desc Verify [6,6] sort 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([6, 6]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(6);
      expect(arr.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArraySortPart03Test022
     * @tc.desc Verify [-8,-8,-8] sort -8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-8, -8, -8]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-8);
      expect(arr.$_get(1)).assertEqual(-8);
      expect(arr.$_get(2)).assertEqual(-8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArraySortPart03Test023
     * @tc.desc Verify 0 sort 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArraySortPart03Test024
     * @tc.desc Verify INT32_MAX compareFn(a-b) sort MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 2147483647);
      arr.$_set(1, 2147483647);
      arr.$_set(2, 2147483647);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(a - b);
      });
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArraySortPart03Test025
     * @tc.desc Verify INT32_MIN compareFn(b-a) sort MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      for (let i: int = 0; i < 5; i++) {
        arr.$_set(i, -2147483648);
      }
      arr.sort((a: number, b: number): int => {
        return Double.toInt(b - a);
      });
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(4)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArraySortPart03Test026
     * @tc.desc Verify compareFn returning zero preserves values and invokes the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5]);
      let calls: int = 0;
      arr.sort((a: number, b: number): int => {
        calls = calls + 1;
        return 0;
      });
      expect(calls > 0).assertTrue();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArraySortPart03Test027
     * @tc.desc Verify default sort returns the same Int32Array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2, 9]);
      let r: Int32Array = arr.sort();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArraySortPart03Test028
     * @tc.desc Verify compareFn sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2, 9]);
      let r: Int32Array = arr.sort((a: number, b: number): int => {
        return Double.toInt(a - b);
      });
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArraySortPart03Test029
     * @tc.desc Verify sort().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4, 2]);
      arr.sort().reverse();
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArraySortPart03Test030
     * @tc.desc Verify sort sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1]);
      arr.sort();
      let first0: number = arr.$_get(0);
      let first3: number = arr.$_get(3);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(first0);
      expect(arr.$_get(3)).assertEqual(first3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArraySortPart03Test031
     * @tc.desc Verify sort length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 4, 2, 7, 1]);
      let lenBefore: int = arr.length;
      arr.sort();
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArraySortPart03Test032
     * @tc.desc Verify sort BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1]);
      arr.sort();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArraySortPart03Test033
     * @tc.desc Verify sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.sort();
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArraySortPart03Test034
     * @tc.desc Verify sort byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 8, 3);
      let offBefore: number = arr.byteOffset;
      arr.sort();
      expect(arr.byteOffset).assertEqual(offBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArraySortPart03Test035
     * @tc.desc Verify sort byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1]);
      let blBefore: number = arr.byteLength;
      arr.sort();
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArraySortPart03Test036
     * @tc.desc Verify an error thrown on the second compareFn call propagates with its message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 1, 3]);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('boom03');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom03');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArraySortPart03Test037
     * @tc.desc Verify compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 1, 3]);
      let cnt: int = 0;
      let cmp = (a: number, b: number): int => {
        cnt = cnt + 1;
        if (cnt >= 2) {
          throw new Error('late03');
        }
        return Double.toInt(a - b);
      };
      try {
        arr.sort(cmp);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('late03');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArraySortPart03Test038
     * @tc.desc Verify compareFn sorts INT32_MIN, 0, INT32_MAX without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 2147483647);
      arr.$_set(1, 0);
      arr.$_set(2, -2147483648);
      let cmp = (a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      };
      arr.sort(cmp);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArraySortPart03Test039
     * @tc.desc Verify compareFn length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 1, 3]);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
      {
        let arr: Int32Array = new Int32Array([4, 1, 3]);
        try {
          arr.sort((a: number, b: number): int => {
            throw new Error('x');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      }
      {
        let arr: Int32Array = new Int32Array([4, 1, 3]);
        let bufBefore: ArrayBuffer = arr.buffer;
        try {
          arr.sort((a: number, b: number): int => {
            throw new Error('x');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
        }
        expect(arr.buffer).assertEqual(bufBefore);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArraySortPart03Test040
     * @tc.desc Verify compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArraySortPart03Test041
     * @tc.desc Verify compareFn buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      try {
        a.sort((x: number, y: number): int => {
          throw new Error('stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArraySortPart03Test042
     * @tc.desc Verify a mid-sort compareFn error is caught after at least one callback call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('string-like');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArraySortPart03Test043
     * @tc.desc Verify compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 1, 3]);
      let touched: int = 0;
      let cmp = (a: number, b: number): int => {
        touched = touched + 1;
        if (touched >= 2) {
          throw new Error('mid');
        }
        return Double.toInt(a - b);
      };
      try {
        arr.sort(cmp);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(touched >= 1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArraySortPart03Test044
     * @tc.desc Verify compareFn -100 a<b [1,2] [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return -100;
      });
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArraySortPart03Test045
     * @tc.desc Verify compareFn 100 a>b [1,2] [2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return 100;
      });
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArraySortPart03Test046
     * @tc.desc Verify compareFn 0 [5,3,8]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 3, 8]);
      arr.sort((a: number, b: number): int => {
        return 0;
      });
      let sum: number = 0;
      for (let i: int = 0; i < arr.length; i++) {
        sum = sum + arr.$_get(i);
      }
      expect(sum).assertEqual(16);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArraySortPart03Test047
     * @tc.desc Verify compareFn 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 2]);
      arr.sort((a: number, b: number): int => {
        return 0;
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArraySortPart03Test048
     * @tc.desc Verify compareFn 2.Double.toInt(7) 2 [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 2.7;
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(v);
      });
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArraySortPart03Test049
     * @tc.desc Verify compareFn -2.Double.toInt(7) -2 [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -2.7;
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(v);
      });
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArraySortPart03Test050
     * @tc.desc Verify compareFn 0.Double.toInt(49999) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0.49999;
      let arr: Int32Array = new Int32Array([11, 22]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(v);
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArraySortPart03Test051
     * @tc.desc Verify compareFn -0.Double.toInt(49999) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -0.49999;
      let arr: Int32Array = new Int32Array([13, 24]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(v);
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArraySortPart03Test052
     * @tc.desc Verify compareFn Number.Double.toInt(NaN) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NaN;
      let arr: Int32Array = new Int32Array([5, 1, 9]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(v);
      });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArraySortPart03Test053
     * @tc.desc Verify compareFn 4294967296.0 (2^32) as int 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 4294967296.0;
      let arr: Int32Array = new Int32Array([7, 5]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(v);
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArraySortPart03Test054
     * @tc.desc Verify compareFn INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      arr.sort((a: number, b: number): int => {
        return -2147483648;
      });
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArraySortPart03Test055
     * @tc.desc Verify a comparator returning -1 for greater values sorts four elements descending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-6, 11, 0, 4]);
      let cmp = (a: number, b: number): int => {
        if (a > b) {
          return 1;
        }
        if (a < b) {
          return -1;
        }
        return 0;
      };
      arr.sort(cmp);
      expect(arr.$_get(0)).assertEqual(-6);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArraySortPart03Test056
     * @tc.desc Verify compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-6, 11, 0, 4]);
      let cmp = (a: number, b: number): int => {
        if (a > b) {
          return -1;
        }
        if (a < b) {
          return 1;
        }
        return 0;
      };
      arr.sort(cmp);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(3)).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArraySortPart03Test057
     * @tc.desc Verify compareFn a b number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1]);
      let capturedDiff: number = 0;
      arr.sort((a: number, b: number): int => {
        capturedDiff = a - b;
        return Double.toInt(a - b);
      });
      expect(capturedDiff).assertEqual(-2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArraySortPart03Test058
     * @tc.desc Verify compareFn a-b [3,1,3,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 3, 2]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(a - b);
      });
      let cnt3: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        if (arr.$_get(i) === 3) {
          cnt3 = cnt3 + 1;
        }
      }
      expect(cnt3).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArraySortPart03Test059
     * @tc.desc Verify [MAX, MIN] MIN MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 2147483647);
      arr.$_set(1, -2147483648);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArraySortPart03Test060
     * @tc.desc Verify [MIN, MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -2147483648);
      arr.$_set(1, 2147483647);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArraySortPart03Test061
     * @tc.desc Verify [MAX, 0, MIN] [MIN, 0, MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 2147483647);
      arr.$_set(1, 0);
      arr.$_set(2, -2147483648);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArraySortPart03Test062
     * @tc.desc Verify [-1, 0, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArraySortPart03Test063
     * @tc.desc Verify MAX [MAX, 1, MAX] 1 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 2147483647);
      arr.$_set(1, 1);
      arr.$_set(2, 2147483647);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArraySortPart03Test064
     * @tc.desc Verify MIN [MIN, 1, MIN] MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, -2147483648);
      arr.$_set(1, 1);
      arr.$_set(2, -2147483648);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArraySortPart03Test065
     * @tc.desc Verify [-5, 0, 5, -10, 10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, 0, 5, -10, 10]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-10);
      expect(arr.$_get(1)).assertEqual(-5);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArraySortPart03Test066
     * @tc.desc Verify [-3, 0, 2, 7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, 0, 2, 7]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-3);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArraySortPart03Test067
     * @tc.desc Verify [4,3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 3, 2, 1]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArraySortPart03Test068
     * @tc.desc Verify [-1,-2,-3,-4] -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-4);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArraySortPart03Test069
     * @tc.desc Verify Number.NaN ToInt32 0 [0, 1, 0] 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([Double.toInt(Number.NaN), 1, Double.toInt(Number.NaN)]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArraySortPart03Test070
     * @tc.desc Verify [7, -1, 3] -1 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, -1, 3]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArraySortPart03Test071
     * @tc.desc Verify compareFn b-a [3,1,2] 3 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(b - a);
      });
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArraySortPart03Test072
     * @tc.desc Verify [INT32_MIN, 0] INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -2147483648);
      arr.$_set(1, 0);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArraySortPart03Test073
     * @tc.desc Verify [0, INT32_MIN] INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, -2147483648);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArraySortPart03Test074
     * @tc.desc Verify compareFn a-b INT32_MIN 0 abs(MIN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, -2147483648);
      arr.sort((a: number, b: number): int => {
        return a < b ? -1 : (a > b ? 1 : 0);
      });
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArraySortPart03Test075
     * @tc.desc Verify compareFn b-a INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, -2147483648);
      arr.$_set(1, 2147483647);
      arr.$_set(2, 0);
      arr.sort((a: number, b: number): int => {
        return a > b ? -1 : (a < b ? 1 : 0);
      });
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArraySortPart03Test076
     * @tc.desc Verify INT32_MIN INT32_MAX -1 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.$_set(0, 1);
      arr.$_set(1, -2147483648);
      arr.$_set(2, 2147483647);
      arr.$_set(3, -1);
      arr.$_set(4, 0);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArraySortPart03Test077
     * @tc.desc Verify ArrayBuffer sort DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      arr.sort();
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(1);
      expect(dv.getInt32(4, true)).assertEqual(2);
      expect(dv.getInt32(8, true)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArraySortPart03Test078
     * @tc.desc Verify buffer Int32Array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 3);
      a.$_set(1, 1);
      a.$_set(2, 2);
      a.sort();
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(2);
      expect(b.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArraySortPart03Test079
     * @tc.desc Verify subarray sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 3);
      a.$_set(1, 4);
      a.$_set(2, 1);
      a.$_set(3, 2);
      let sub: Int32Array = a.subarray(1, 3);
      sub.sort();
      expect(a.$_get(0)).assertEqual(3);
      expect(a.$_get(1)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(4);
      expect(a.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArraySortPart03Test080
     * @tc.desc Verify byteOffset sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let prefix: Int32Array = new Int32Array(buf, 0, 1);
      let mid: Int32Array = new Int32Array(buf, 4, 3);
      prefix.$_set(0, 999);
      mid.$_set(0, 7);
      mid.$_set(1, 2);
      mid.$_set(2, 5);
      mid.sort();
      expect(prefix.$_get(0)).assertEqual(999);
      expect(mid.$_get(0)).assertEqual(2);
      expect(mid.$_get(1)).assertEqual(5);
      expect(mid.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8100
     * @tc.name int32ArraySortPart03Test081
     * @tc.desc Verify buffer compareFn sort b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 9);
      a.$_set(1, -4);
      a.$_set(2, 6);
      a.$_set(3, 0);
      a.sort((x: number, y: number): int => {
        return Double.toInt(x - y);
      });
      expect(b.$_get(0)).assertEqual(-4);
      expect(b.$_get(1)).assertEqual(0);
      expect(b.$_get(2)).assertEqual(6);
      expect(b.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8200
     * @tc.name int32ArraySortPart03Test082
     * @tc.desc Verify sort forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1]);
      arr.sort();
      let seen: int = 0;
      arr.forEach((v: number, i: int) => {
        seen = seen + 1;
      });
      expect(seen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8300
     * @tc.name int32ArraySortPart03Test083
     * @tc.desc Verify 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(
      [15, 3, 11, 0, 7, 4, 12, 1, 9, 13, 2, 6, 14, 0, 8, 5]);
      arr.sort();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(15)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8400
     * @tc.name int32ArraySortPart03Test084
     * @tc.desc Verify 16 compareFn a-b <=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([15, 3, 11, 0, 7, 4, 12, 1, 9, 13, 2, 6, 14, 8, 10, 5]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(a - b);
      });
      for (let i: int = 0; i < 15; i++) {
        expect(arr.$_get(i) <= arr.$_get(i + 1)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8500
     * @tc.name int32ArraySortPart03Test085
     * @tc.desc Verify compareFn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let calls: int = 0;
      arr.sort((a: number, b: number): int => {
        calls = calls + 1;
        return 0;
      });
      expect(calls > 0).assertTrue();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8600
     * @tc.name int32ArraySortPart03Test086
     * @tc.desc Verify compareFn arr.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 3, 8, 1]);
      let cap: int = -1;
      arr.sort((a: number, b: number): int => {
        if (cap < 0) {
          cap = arr.length;
        }
        return Double.toInt(a - b);
      });
      expect(cap).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8700
     * @tc.name int32ArraySortPart03Test087
     * @tc.desc Verify compareFn -1/1/Number.NaN-as-int(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1, 4, 3]);
      let nanV: number = Number.NaN;
      let tick: int = 0;
      arr.sort((a: number, b: number): int => {
        tick = tick + 1;
        if (tick % 3 === 0) {
          return -1;
        }
        if (tick % 3 === 1) {
          return 1;
        }
        return Double.toInt(nanV);
      });
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SORT_PART03_TEST_MINDMAP_8800
     * @tc.name int32ArraySortPart03Test088
     * @tc.desc Verify compareFn [2,1] a-b [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySortPart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 1]);
      arr.sort((a: number, b: number): int => {
        return Double.toInt(a - b);
      });
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });
  });
}
