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

export default function Int16ArrayReverseTest02(): void {
  describe('Int16ArrayReverseTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0100
     * @tc.name testInt16ArrayReverseTestTwo001
     * @tc.desc Verify reverse() mixed truncated and normal values swap correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32768, 5, -32769, 8]);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 8;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 5;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -32768;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0200
     * @tc.name testInt16ArrayReverseTestTwo002
     * @tc.desc Verify reverse() swaps 0x8000 and 0x7FFF pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0x8000, 0x7fff]);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0300
     * @tc.name testInt16ArrayReverseTestTwo003
     * @tc.desc Verify reverse().$_get(0) on empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      try {
        arr.reverse().$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0400
     * @tc.name testInt16ArrayReverseTestTwo004
     * @tc.desc Verify reverse().$_get(0) returns last original element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let actualValue: number = arr.reverse().$_get(0);
      let expectedValue: int = 30;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0500
     * @tc.name testInt16ArrayReverseTestTwo005
     * @tc.desc Verify fill(999).reverse() keeps filled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.fill(999).reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 999;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 999;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0600
     * @tc.name testInt16ArrayReverseTestTwo006
     * @tc.desc Verify reverse().sort() results in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(30, 10, 50, 20);
      arr.reverse().sort();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 10;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 50;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0700
     * @tc.name testInt16ArrayReverseTestTwo007
     * @tc.desc Verify reverse().copyWithin(0, 2) overwrites head from tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      arr.reverse().copyWithin(0, 2);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 2;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 1;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0800
     * @tc.name testInt16ArrayReverseTestTwo008
     * @tc.desc Verify subarray(1, 3).reverse() only reverses sub-view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      arr.subarray(1, 3).reverse();
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 30;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 20;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 10;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_0900
     * @tc.name testInt16ArrayReverseTestTwo009
     * @tc.desc Verify reverse().reverse().reverse() equals single reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      arr.reverse().reverse().reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 5;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = 1;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1000
     * @tc.name testInt16ArrayReverseTestTwo010
     * @tc.desc Verify Int16Array.from(arr.reverse()) copies reversed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let copy: Int16Array = Int16Array.from(arr.reverse());
      let elementAt0: number = copy.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = copy.$_get(2);
      let expectedElement2: int = 1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1100
     * @tc.name testInt16ArrayReverseTestTwo011
     * @tc.desc Verify reverse().$_set(0, 888) mutates original head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      arr.reverse().$_set(0, 888);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 888;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1200
     * @tc.name testInt16ArrayReverseTestTwo012
     * @tc.desc Verify fill(-1).reverse().fill(0, 0, 1) chained mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.fill(-1).reverse().fill(0, 0, 1);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 0;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1300
     * @tc.name testInt16ArrayReverseTestTwo013
     * @tc.desc Verify reverse() preserves length 1 after reversing single element [-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1;
      let arr: Int16Array = Int16Array.of(val);
      arr.reverse();
      let actualLength: int = arr.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1400
     * @tc.name testInt16ArrayReverseTestTwo014
     * @tc.desc Verify reverse() on empty Int16Array(0) keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      arr.reverse();
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1500
     * @tc.name testInt16ArrayReverseTestTwo015
     * @tc.desc Verify reverse().$_get(0) on empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      arr.reverse();
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1600
     * @tc.name testInt16ArrayReverseTestTwo016
     * @tc.desc Verify reverse() keeps length 6 unchanged for Int16Array.of(1, 2, 3, 4, 5, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5, 6);
      let lenBefore = arr.length;
      arr.reverse();
      let actualLength: int = arr.length;
      let expectedLength: number = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1700
     * @tc.name testInt16ArrayReverseTestTwo017
     * @tc.desc Verify reverse byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let byteLenBefore = arr.byteLength;
      arr.reverse();
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: number = byteLenBefore;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1800
     * @tc.name testInt16ArrayReverseTestTwo018
     * @tc.desc Verify reverse BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 15, 25);
      arr.reverse();
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 2;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_1900
     * @tc.name testInt16ArrayReverseTestTwo019
     * @tc.desc Verify reverse this === result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let result = arr.reverse();
      let actualResult: Int16Array = result;
      let expectedResult: Int16Array = arr;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2000
     * @tc.name testInt16ArrayReverseTestTwo020
     * @tc.desc Verify reverse() turns [-5, -4, -3, -2, -1] into [-1, -2, -3, -4, -5] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-5, -4, -3, -2, -1);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -3;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -4;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = -5;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2100
     * @tc.name testInt16ArrayReverseTestTwo021
     * @tc.desc Verify four reverse() calls restore [-10, 0, 10] from [-10, 0, 10] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-10, 0, 10);
      arr.reverse().reverse().reverse().reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -10;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 10;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2200
     * @tc.name testInt16ArrayReverseTestTwo022
     * @tc.desc Verify reverse() $_get/$_get/iteration (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300, 400, 500, 600);
      for (let i = 0; i < 5; i++) {
        arr.reverse();
      }
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 600;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt5: number = arr.$_get(5);
      let expectedElement5: int = 100;
      expect(elementAt5).assertEqual(expectedElement5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2300
     * @tc.name testInt16ArrayReverseTestTwo023
     * @tc.desc Verify reverse() moves $_set(0, 99) value of [1, 2, 3, 4] to last index via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      arr.$_set(0, 99);
      arr.reverse();
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 99;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2400
     * @tc.name testInt16ArrayReverseTestTwo024
     * @tc.desc Verify reverse().join(',') on [1, 2, 3] returns '3,2,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let s = arr.reverse().join(',');
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2500
     * @tc.name testInt16ArrayReverseTestTwo025
     * @tc.desc Verify reverse().fill(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      arr.reverse().fill(0);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 0;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 0;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2600
     * @tc.name testInt16ArrayReverseTestTwo026
     * @tc.desc Verify reverse().slice() copies reversed [4, 3, 2, 1] from [1, 2, 3, 4] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      let sliced = arr.reverse().slice();
      let elementAt0: number = sliced.$_get(0);
      let expectedElement0: int = 4;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = sliced.$_get(3);
      let expectedElement3: int = 1;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt02: number = arr.$_get(0);
      let expectedElement02: int = 4;
      expect(elementAt02).assertEqual(expectedElement02);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2700
     * @tc.name testInt16ArrayReverseTestTwo027
     * @tc.desc Verify reverse().toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      let s = arr.reverse().toString();
      expect(s).assertEqual('30,20,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2800
     * @tc.name testInt16ArrayReverseTestTwo028
     * @tc.desc Verify reverse().includes(x)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let found = arr.reverse().includes(1);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_2900
     * @tc.name testInt16ArrayReverseTestTwo029
     * @tc.desc Verify reverse().indexOf(x)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40);
      let idx = arr.reverse().indexOf(10);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3000
     * @tc.name testInt16ArrayReverseTestTwo030
     * @tc.desc Verify reverse().every(predicate)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let allPositive = arr.reverse().every((v: number): boolean => v > 0);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3100
     * @tc.name testInt16ArrayReverseTestTwo031
     * @tc.desc Verify sort() then reverse() on [5, 2, 8, 1, 9] yields [9, 8, 5, 2, 1] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 2, 8, 1, 9);
      arr.sort();
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 9;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 8;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 5;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 2;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = 1;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3200
     * @tc.name testInt16ArrayReverseTestTwo032
     * @tc.desc Verify fill(0, 0, 2) then reverse() yields [5, 4, 3, 0, 0] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      arr.fill(0, 0, 2);
      arr.reverse();
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 0;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = 0;
      expect(elementAt4).assertEqual(expectedElement4);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 5;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 4;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3300
     * @tc.name testInt16ArrayReverseTestTwo033
     * @tc.desc Verify copyWithin(2, 0, 2) then reverse() on [10, 20, 30, 40, 50] yields [50, 20, 10, 20, 10] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30, 40, 50);
      arr.copyWithin(2, 0, 2);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 50;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 20;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 10;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 20;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = 10;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3400
     * @tc.name testInt16ArrayReverseTestTwo034
     * @tc.desc Verify reverse() after set([99, 88], 1) on [1, 2, 3, 4] yields [4, 88, 99, 1] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      let src = Int16Array.of(99, 88);
      arr.set(src, 1);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 4;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 88;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 99;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 1;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3500
     * @tc.name testInt16ArrayReverseTestTwo035
     * @tc.desc Verify reverse() yields [3, 2, 1, -32768] with int16.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, 1, 2, 3);
      arr.reverse();
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -32768;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3600
     * @tc.name testInt16ArrayReverseTestTwo036
     * @tc.desc Verify reverse() yields [-3, -2, -1, 32767] with int16.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767, -1, -2, -3);
      arr.reverse();
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 32767;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3700
     * @tc.name testInt16ArrayReverseTestTwo037
     * @tc.desc Verify reverse() yields [200, -32768, 100] for [100, -32768, 200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, -32768, 200);
      arr.reverse();
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 200;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 100;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3800
     * @tc.name testInt16ArrayReverseTestTwo038
     * @tc.desc Verify reverse() yields [-200, 32767, -100] for [-100, 32767, -200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-100, 32767, -200);
      arr.reverse();
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -200;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -100;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_3900
     * @tc.name testInt16ArrayReverseTestTwo039
     * @tc.desc Verify reverse() yields [32767, 0, 0, -32768]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768, 0, 0, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -32768;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4000
     * @tc.name testInt16ArrayReverseTestTwo040
     * @tc.desc Verify $_set(-32769) then reverse() yields [4, 3, 2, 32767]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      arr.$_set(0, -32769);
      arr.reverse();
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 32767;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 4;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 3;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 2;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4100
     * @tc.name testInt16ArrayReverseTestTwo041
     * @tc.desc Verify $_set(32768) then reverse() yields [-32768, 3, 2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      arr.$_set(3, 32768);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 3;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 2;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 1;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4200
     * @tc.name testInt16ArrayReverseTestTwo042
     * @tc.desc Verify -3.7 -3 reverse -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      arr.$_set(0, -3.7);
      arr.reverse();
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -3;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4300
     * @tc.name testInt16ArrayReverseTestTwo043
     * @tc.desc Verify Int16Array reverse $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let parent = new Int16Array(buf);
      parent.$_set(0, 10);
      parent.$_set(1, 20);
      parent.$_set(2, 30);
      parent.$_set(3, 40);
      parent.$_set(4, 50);
      parent.$_set(5, 60);
      let child = parent.subarray(1, 4);
      parent.reverse();
      let elementAt0: number = child.$_get(0);
      let expectedElement0: int = 50;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = child.$_get(1);
      let expectedElement1: int = 40;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = child.$_get(2);
      let expectedElement2: int = 30;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4400
     * @tc.name testInt16ArrayReverseTestTwo044
     * @tc.desc Verify child.reverse() then parent.reverse() on [10, 20, 30, 40] yields [40, 20, 30, 10] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let parent = new Int16Array(buf);
      parent.$_set(0, 10);
      parent.$_set(1, 20);
      parent.$_set(2, 30);
      parent.$_set(3, 40);
      let child = parent.subarray(1, 3);
      child.reverse();
      parent.reverse();
      let elementAt0: number = parent.$_get(0);
      let expectedElement0: int = 40;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = parent.$_get(1);
      let expectedElement1: int = 20;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = parent.$_get(2);
      let expectedElement2: int = 30;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = parent.$_get(3);
      let expectedElement3: int = 10;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4500
     * @tc.name testInt16ArrayReverseTestTwo045
     * @tc.desc Verify parent reverse() keeps subarray(1, 3) length unchanged via assertEqual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let parent = new Int16Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      parent.$_set(4, 5);
      let child = parent.subarray(1, 3);
      let childLenBefore = child.length;
      parent.reverse();
      let actualLength: int = child.length;
      let expectedLength: number = childLenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4600
     * @tc.name testInt16ArrayReverseTestTwo046
     * @tc.desc Verify ArrayBuffer 2 reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let view = new Int16Array(buf, 2, 3);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.reverse();
      let elementAt0: number = view.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = view.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = view.$_get(2);
      let expectedElement2: int = 1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4700
     * @tc.name testInt16ArrayReverseTestTwo047
     * @tc.desc Verify reverse() on [10, 20, 30] visible through new Int16Array(buf) view via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let parent = new Int16Array(buf);
      parent.$_set(0, 10);
      parent.$_set(1, 20);
      parent.$_set(2, 30);
      parent.reverse();
      let fullView = new Int16Array(buf);
      let elementAt0: number = fullView.$_get(0);
      let expectedElement0: int = 30;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = fullView.$_get(1);
      let expectedElement1: int = 20;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = fullView.$_get(2);
      let expectedElement2: int = 10;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4800
     * @tc.name testInt16ArrayReverseTestTwo048
     * @tc.desc Verify begin === end reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let parent = new Int16Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      let child = parent.subarray(1, 1);
      child.reverse();
      let elementAt0: number = parent.$_get(0);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = parent.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = parent.$_get(2);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_4900
     * @tc.name testInt16ArrayReverseTestTwo049
     * @tc.desc Verify $_set(0, 777) on reverse() returned alias updates array index 0 via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      let returned = arr.reverse();
      expect(returned).assertEqual(arr);
      returned.$_set(0, 777);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 777;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5000
     * @tc.name testInt16ArrayReverseTestTwo050
     * @tc.desc Verify reverse() $_get/iteration (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4);
      arr.reverse();
      let result: number[] = [];
      for (let i = 0; i < arr.length; i++) {
        result.push(arr.$_get(i));
      }
      let actualIndexed: number = result[0];
      let expectedIndexed: int = 4;
      expect(actualIndexed).assertEqual(expectedIndexed);
      let resultAt1: number = result[1];
      let expectedResultAt1: int = 3;
      expect(resultAt1).assertEqual(expectedResultAt1);
      let resultAt2: number = result[2];
      let expectedResultAt2: int = 2;
      expect(resultAt2).assertEqual(expectedResultAt2);
      let resultAt3: number = result[3];
      let expectedResultAt3: int = 1;
      expect(resultAt3).assertEqual(expectedResultAt3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5100
     * @tc.name testInt16ArrayReverseTestTwo051
     * @tc.desc Verify reverse() forEach (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.reverse();
      let collected: number[] = [];
      arr.forEach((v: number): void => {
        collected.push(v);
      });
      let actualIndexed: number = collected[0];
      let expectedIndexed: int = 30;
      expect(actualIndexed).assertEqual(expectedIndexed);
      let collectedAt1: number = collected[1];
      let expectedCollectedAt1: int = 20;
      expect(collectedAt1).assertEqual(expectedCollectedAt1);
      let collectedAt2: number = collected[2];
      let expectedCollectedAt2: int = 10;
      expect(collectedAt2).assertEqual(expectedCollectedAt2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5200
     * @tc.name testInt16ArrayReverseTestTwo052
     * @tc.desc Verify reverse() entries/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300);
      arr.reverse();
      let iter = arr.entries();
      let first = iter.next();
      let actualValue: number = first.value![0];
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
      let actualValue2: number = first.value![1];
      let expectedValue2: int = 300;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5300
     * @tc.name testInt16ArrayReverseTestTwo053
     * @tc.desc Verify reverse() values/next (assertEqual)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3);
      arr.reverse();
      let iter = arr.values();
      let first = iter.next();
      let actualValue: number = first.value!;
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5400
     * @tc.name testInt16ArrayReverseTestTwo054
     * @tc.desc Verify reverse keys 0 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 20, 30);
      arr.reverse();
      let iter = arr.keys();
      let first = iter.next();
      let actualValue: number = first.value!;
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5500
     * @tc.name testInt16ArrayReverseTestTwo055
     * @tc.desc Verify reverse() preserves palindrome [5, 5, 3, 5, 5] unchanged via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 5, 3, 5, 5);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 5;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 5;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 5;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = 5;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5600
     * @tc.name testInt16ArrayReverseTestTwo056
     * @tc.desc Verify reverse() keeps all-zero [0, 0, 0, 0] elements unchanged via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0, 0, 0, 0);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 0;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 0;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5700
     * @tc.name testInt16ArrayReverseTestTwo057
     * @tc.desc Verify reverse() on [1, -1, 2, -2] yields [-2, 2, -1, 1] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, -1, 2, -2);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -2;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 1;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5800
     * @tc.name testInt16ArrayReverseTestTwo058
     * @tc.desc Verify reverse() on identical pair [7, 7] leaves values unchanged via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(7, 7);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 7;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 7;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_5900
     * @tc.name testInt16ArrayReverseTestTwo059
     * @tc.desc Verify reverse buffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 2, 4);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let offsetBefore = arr.byteOffset;
      arr.reverse();
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: number = offsetBefore;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_TWO_6000
     * @tc.name testInt16ArrayReverseTestTwo060
     * @tc.desc Verify reverse() on Int16Array.from([10, 20, 30, 40, 50]) yields [50, ..., 10] via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: int[] = [10, 20, 30, 40, 50];
      let arr = Int16Array.from(source);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 50;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = 10;
      expect(elementAt4).assertEqual(expectedElement4);
    });

  });
}
