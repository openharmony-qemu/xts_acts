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
import Utils from './../Util.test';

export default function int8ArrayValuesPart01Test(): void {
  describe('Int8ArrayValuesPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0100
     * @tc.name int8ArrayValuesPart01Test001
     * @tc.desc Verify values() zero-arg call returns valid iterator, first next() yields first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([11, 22, 33]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 11;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0200
     * @tc.name int8ArrayValuesPart01Test002
     * @tc.desc Verify same array calls values() twice, second call still returns first element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6]);
      let i1 = arr.values();
      let i2 = arr.values();
      let actualValue1 = i1.next().value;
      let expectedValue1: int = 5;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = i2.next().value;
      let expectedValue2: int = 5;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0300
     * @tc.name int8ArrayValuesPart01Test003
     * @tc.desc Verify length=0 empty array values() first next().done===true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter = arr.values();
      let isDone: boolean = iter.next().done;
      expect(isDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0400
     * @tc.name int8ArrayValuesPart01Test004
     * @tc.desc Verify length=0 empty array values() first next().value===undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let iter = arr.values();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0500
     * @tc.name int8ArrayValuesPart01Test005
     * @tc.desc Verify length=1 single-element array values() first next().value equals the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 42;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0600
     * @tc.name int8ArrayValuesPart01Test006
     * @tc.desc Verify length=1 single-element array values() second next().done===true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let iter = arr.values();
      iter.next();
      let isDone: boolean = iter.next().done;
      expect(isDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0700
     * @tc.name int8ArrayValuesPart01Test007
     * @tc.desc Verify length=2 dual-element array values() sequential read [a, b]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 9]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 3;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 9;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0800
     * @tc.name int8ArrayValuesPart01Test008
     * @tc.desc Verify length=1000 large array values() complete iteration count===1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let big: Int8Array = new Int8Array(1000);
      let iter = big.values();
      let count: int = 0;
      let r = iter.next();
      while (!r.done) {
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_0900
     * @tc.name int8ArrayValuesPart01Test009
     * @tc.desc Verify array with MIN(-128) and MAX(127) values() sequential read [-128, 127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MIN;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: number = INT8_MAX;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1000
     * @tc.name int8ArrayValuesPart01Test010
     * @tc.desc Verify MAX and MIN reversed array values() sequential read [127, -128], confirm no auto-sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MAX;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: number = INT8_MIN;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1100
     * @tc.name int8ArrayValuesPart01Test011
     * @tc.desc Verify five-element boundary sequence [-128, -1, 0, 1, 127] values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, -1, 0, 1, INT8_MAX]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MIN;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = -1;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 0;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter.next().value;
      let expectedValue4: int = 1;
      expect(actualValue4).assertEqual(expectedValue4);
      let actualValue5 = iter.next().value;
      let expectedValue5: number = INT8_MAX;
      expect(actualValue5).assertEqual(expectedValue5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1200
     * @tc.name int8ArrayValuesPart01Test012
     * @tc.desc Verify all-zero array [0, 0, 0] values() sequential read three zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 0;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 0;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 0;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1300
     * @tc.name int8ArrayValuesPart01Test013
     * @tc.desc Verify all-MIN array [-128, -128, -128] values() sequential read three -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MIN;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: number = INT8_MIN;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: number = INT8_MIN;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1400
     * @tc.name int8ArrayValuesPart01Test014
     * @tc.desc Verify all-MAX array [127, 127, 127] values() sequential read three 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MAX;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: number = INT8_MAX;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: number = INT8_MAX;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1500
     * @tc.name int8ArrayValuesPart01Test015
     * @tc.desc Verify neg/zero/pos sequence [-1, 0, 1] values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, 0, 1]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = -1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 0;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 1;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1600
     * @tc.name int8ArrayValuesPart01Test016
     * @tc.desc Verify [127, 0, -128] (MAX/zero/MIN) values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, 0, INT8_MIN]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MAX;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 0;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: number = INT8_MIN;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1700
     * @tc.name int8ArrayValuesPart01Test017
     * @tc.desc Verify alternating extremes [-128, 127, -128, 127] values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX, INT8_MIN, INT8_MAX]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MIN;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: number = INT8_MAX;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: number = INT8_MIN;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter.next().value;
      let expectedValue4: number = INT8_MAX;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1800
     * @tc.name int8ArrayValuesPart01Test018
     * @tc.desc Verify write 200 via bracket assignment truncated to -56 then values() reads -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr[0] = 200;
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = -56;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_1900
     * @tc.name int8ArrayValuesPart01Test019
     * @tc.desc Verify write 300 via bracket assignment truncated to 44 then values() reads 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr[0] = 300;
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 44;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2000
     * @tc.name int8ArrayValuesPart01Test020
     * @tc.desc Verify write -200 via bracket assignment truncated to 56 then values() reads 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr[0] = -200;
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 56;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2100
     * @tc.name int8ArrayValuesPart01Test021
     * @tc.desc Verify five-element no-repeat boundary [127, -1, 0, 1, -128] values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, -1, 0, 1, INT8_MIN]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MAX;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = -1;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 0;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter.next().value;
      let expectedValue4: int = 1;
      expect(actualValue4).assertEqual(expectedValue4);
      let actualValue5 = iter.next().value;
      let expectedValue5: number = INT8_MIN;
      expect(actualValue5).assertEqual(expectedValue5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2200
     * @tc.name int8ArrayValuesPart01Test022
     * @tc.desc Verify two full views share same ArrayBuffer, modify via view b then a.values() reflects new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let a: Int8Array = new Int8Array(buf);
      let b: Int8Array = new Int8Array(buf);
      a[0] = 10;
      a[1] = 20;
      a[2] = 30;
      b[0] = 99;
      let iter = a.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 99;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2300
     * @tc.name int8ArrayValuesPart01Test023
     * @tc.desc Verify subarray shared view, modify original array then sub.values() reflects change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sub: Int8Array = src.subarray(1, 3);
      src[1] = 99;
      let iter = sub.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 99;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2400
     * @tc.name int8ArrayValuesPart01Test024
     * @tc.desc Verify subarray(-2) last two elements view values() reads last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sub: Int8Array = src.subarray(-2);
      let iter = sub.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 3;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 4;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2500
     * @tc.name int8ArrayValuesPart01Test025
     * @tc.desc Verify subarray(1, -1) middle section view (exclude head and tail) values() reads middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([1, 2, 3, 4]);
      let sub: Int8Array = src.subarray(1, -1);
      let iter = sub.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 2;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 3;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2600
     * @tc.name int8ArrayValuesPart01Test026
     * @tc.desc Verify slice creates independent copy, modify original array then copy.values() unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([1, 2, 3]);
      let copy: Int8Array = src.slice(0, 3);
      src[0] = 99;
      let iter = copy.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2700
     * @tc.name int8ArrayValuesPart01Test027
     * @tc.desc Verify view values() reads only view range for offset 0 and offset 2 views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf);
      full[0] = 11;
      full[1] = 22;
      full[2] = 33;
      full[3] = 44;
      let view1: Int8Array = new Int8Array(buf, 0, 2);
      let iter1 = view1.values();
      let actualValue1 = iter1.next().value;
      let expectedValue1: int = 11;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter1.next().value;
      let expectedValue2: int = 22;
      expect(actualValue2).assertEqual(expectedValue2);
      let view2: Int8Array = new Int8Array(buf, 2, 2);
      let iter2 = view2.values();
      let actualValue3 = iter2.next().value;
      let expectedValue3: int = 33;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter2.next().value;
      let expectedValue4: int = 44;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2800
     * @tc.name int8ArrayValuesPart01Test028
     * @tc.desc Verify new Int8Array(buf, 2) length omitted, values() reads from offset to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf);
      full[0] = 11;
      full[1] = 22;
      full[2] = 33;
      full[3] = 44;
      let view: Int8Array = new Int8Array(buf, 2);
      let iter = view.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 33;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 44;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_2900
     * @tc.name int8ArrayValuesPart01Test029
     * @tc.desc Verify new Int8Array(buf, 4) zero-length view at end values() first next().done===true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 4, 0);
      let iter = view.values();
      let isDone: boolean = iter.next().done;
      expect(isDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3000
     * @tc.name int8ArrayValuesPart01Test030
     * @tc.desc Verify empty ArrayBuffer (byteLength=0) view values() first next().done===true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let view: Int8Array = new Int8Array(buf);
      let iter = view.values();
      let isDone: boolean = iter.next().done;
      expect(isDone).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3100
     * @tc.name int8ArrayValuesPart01Test031
     * @tc.desc Verify fill(7) fully fills then values() reads all 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.fill(7);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 7;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 7;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 7;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter.next().value;
      let expectedValue4: int = 7;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3200
     * @tc.name int8ArrayValuesPart01Test032
     * @tc.desc Verify fill(7, 1, 3) partial fill then values() reads [1, 7, 7, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.fill(7, 1, 3);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 7;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 7;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter.next().value;
      let expectedValue4: int = 4;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3300
     * @tc.name int8ArrayValuesPart01Test033
     * @tc.desc Verify reverse() reversed then values() reads [3, 2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reverse();
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 3;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 1;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3400
     * @tc.name int8ArrayValuesPart01Test034
     * @tc.desc Verify sort() default ascending then values() reads [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      arr.sort();
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 3;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3500
     * @tc.name int8ArrayValuesPart01Test035
     * @tc.desc Verify sort descending comparator then values() reads [3, 2, 1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 3, 2]);
      arr.sort((a: number, b: number): int => (a < b ? 1 : a > b ? -1 : 0));
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 3;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 1;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3600
     * @tc.name int8ArrayValuesPart01Test036
     * @tc.desc Verify copyWithin(0, 2, 4) reordered then values() reads [3, 4, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2, 4);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 3;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 4;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 3;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter.next().value;
      let expectedValue4: int = 4;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3700
     * @tc.name int8ArrayValuesPart01Test037
     * @tc.desc Verify copyWithin(1, -2) negative index normalized then values() reads [1, 3, 4, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(1, -2);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 3;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 4;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter.next().value;
      let expectedValue4: int = 4;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3800
     * @tc.name int8ArrayValuesPart01Test038
     * @tc.desc Verify set(same-type source, 1) offset overlay then values() reads [1, 9, 9, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let src: Int8Array = new Int8Array([9, 9]);
      arr.set(src, 1);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 9;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 9;
      expect(actualValue3).assertEqual(expectedValue3);
      let actualValue4 = iter.next().value;
      let expectedValue4: int = 4;
      expect(actualValue4).assertEqual(expectedValue4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_3900
     * @tc.name int8ArrayValuesPart01Test039
     * @tc.desc Verify bracket assignment single-point modify then values() reads [1, 99, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr[1] = 99;
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 99;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 3;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4000
     * @tc.name int8ArrayValuesPart01Test040
     * @tc.desc Verify bracket assignment out-of-bounds positive index throws RangeError then values() reads unchanged [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr[5] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 3;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4100
     * @tc.name int8ArrayValuesPart01Test041
     * @tc.desc Verify $_set(arr.length - 1, 99) tail-element modify then values() reads [1, 2, 99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.$_set(arr.length - 1, 99);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 99;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4200
     * @tc.name int8ArrayValuesPart01Test042
     * @tc.desc Verify fill(-50) all-negative fill then values() reads all -50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.fill(-50);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = -50;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = -50;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = -50;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4300
     * @tc.name int8ArrayValuesPart01Test043
     * @tc.desc Verify Int8Array.from(Array<number> [10, 20, 30]) values() reads [10, 20, 30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [10, 20, 30];
      let arr: Int8Array = Int8Array.from(src);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 10;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 20;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 30;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4400
     * @tc.name int8ArrayValuesPart01Test044
     * @tc.desc Verify multi-value boundary construct with [-128, 127, 0] values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX, 0]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MIN;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: number = INT8_MAX;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 0;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4500
     * @tc.name int8ArrayValuesPart01Test045
     * @tc.desc Verify new Int8Array(3) length construct then bracket assign custom values, values() reads custom values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr[0] = 8;
      arr[1] = 16;
      arr[2] = 32;
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 8;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 16;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 32;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4600
     * @tc.name int8ArrayValuesPart01Test046
     * @tc.desc Verify ascending positive construct with [1, 2, 3] values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 3;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4700
     * @tc.name int8ArrayValuesPart01Test047
     * @tc.desc Verify nested subarray (subarray of subarray) values() reads double-layer view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let mid: Int8Array = src.subarray(1, 4);
      let inner: Int8Array = mid.subarray(1, 3);
      let iter = inner.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 3;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 4;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4800
     * @tc.name int8ArrayValuesPart01Test048
     * @tc.desc Verify new Int8Array(buf, 1, 1) single byte offset view values() reads single byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf);
      full[0] = 11;
      full[1] = 22;
      full[2] = 33;
      full[3] = 44;
      let view: Int8Array = new Int8Array(buf, 1, 1);
      let iter = view.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 22;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_4900
     * @tc.name int8ArrayValuesPart01Test049
     * @tc.desc Verify subarray(0) full view values() reads all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([1, 2, 3]);
      let sub: Int8Array = src.subarray(0);
      let iter = sub.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 3;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_5000
     * @tc.name int8ArrayValuesPart01Test050
     * @tc.desc Verify double slice copy chain, modify original then innermost copy values() unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([1, 2, 3]);
      let c1: Int8Array = src.slice(0, 3);
      let c2: Int8Array = c1.slice(0, 3);
      src[0] = 99;
      c1[1] = 88;
      let iter = c2.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = 3;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_5100
     * @tc.name int8ArrayValuesPart01Test051
     * @tc.desc Verify offset window view and full view share buffer, modify full then window view values() reflects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let full: Int8Array = new Int8Array(buf);
      let win: Int8Array = new Int8Array(buf, 1, 2);
      full[0] = 10;
      full[1] = 20;
      full[2] = 30;
      full[1] = 99;
      let iter = win.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 99;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 30;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_5200
     * @tc.name int8ArrayValuesPart01Test052
     * @tc.desc Verify three-element descending negative values [-1, -2, -3] values() sequential read, confirm not abs-value sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = -1;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = -2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3 = iter.next().value;
      let expectedValue3: int = -3;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_5300
     * @tc.name int8ArrayValuesPart01Test053
     * @tc.desc Verify [100, -100] large-magnitude positive-negative pair values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([100, -100]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: int = 100;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = -100;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_5400
     * @tc.name int8ArrayValuesPart01Test054
     * @tc.desc Verify [127, -1] MAX and negative one values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, -1]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MAX;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = -1;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_VALUES_PART01_5500
     * @tc.name int8ArrayValuesPart01Test055
     * @tc.desc Verify [-128, 1] MIN and positive one values() sequential read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayValuesPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, 1]);
      let iter = arr.values();
      let actualValue1 = iter.next().value;
      let expectedValue1: number = INT8_MIN;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2 = iter.next().value;
      let expectedValue2: int = 1;
      expect(actualValue2).assertEqual(expectedValue2);
    });
  });
}
