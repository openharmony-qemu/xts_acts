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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

function assertStoredNegativeZero(value: number): void {
  const actualResult = 1.0 / value;
  const expectedResult: number = -Infinity;
  expect(actualResult).assertEqual(expectedResult);
}

function expectBracketWriteRangeError(arr: Float64Array, index: int, value: number): void {
  let isThrown = false;
  try {
    arr[index] = value;
  } catch (e) {
    isThrown = true;
    const actualName = e.name;
    const expectedName: string = 'RangeError';
    expect(actualName).assertEqual(expectedName);
    const actualMessage = e.message;
    const expectedMessage: string = 'invalid index';
    expect(actualMessage).assertEqual(expectedMessage);
  }
  expect(isThrown).assertTrue();
}

export default function Float64ArrayBracketAccessTest(): void {
  describe('Float64ArrayBracketAccessTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0100
     * @tc.name testFloat64ArrayBracketAccess001
     * @tc.desc Verify bracket read supports first middle and last elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const actualResult = arr[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[2];
      const expectedResultSecond: number = 3.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[4];
      const expectedResultThird: number = 5.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0200
     * @tc.name testFloat64ArrayBracketAccess002
     * @tc.desc Verify bracket write latest assignment wins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr[0] = 1.0;
      arr[0] = 2.0;
      arr[0] = 3.0;
      const actualResult = arr[0];
      const expectedResult: number = 3.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0300
     * @tc.name testFloat64ArrayBracketAccess003
     * @tc.desc Verify bracket write matches dollar get readback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(0.0, 0.0, 0.0);
      arr[1] = 99.5;
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = 99.5;
      expect(actualElement1).assertEqual(expectedElement1);
      expect(arr[1]).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0400
     * @tc.name testFloat64ArrayBracketAccess004
     * @tc.desc Verify dollar set matches bracket readback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr.$_set(2, 123.0);
      const actualResult = arr[2];
      const expectedResult: number = 123.0;
      expect(actualResult).assertEqual(expectedResult);
      expect(arr[2]).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0500
     * @tc.name testFloat64ArrayBracketAccess005
     * @tc.desc Verify bracket write and read preserve NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr[0] = NaN;
      expect(arr[0]).assertNaN();
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0600
     * @tc.name testFloat64ArrayBracketAccess006
     * @tc.desc Verify bracket write and read preserve infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(2);
      arr[0] = Infinity;
      arr[1] = -Infinity;
      const actualResult = arr[0];
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = -Infinity;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = -Infinity;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0700
     * @tc.name testFloat64ArrayBracketAccess007
     * @tc.desc Verify bracket write stores negative zero and read remains numeric zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr[0] = -0.0;
      const actualResult = arr[0];
      const expectedResult: number = 0.0;
      expect(actualResult).assertEqual(expectedResult);
      assertStoredNegativeZero(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0800
     * @tc.name testFloat64ArrayBracketAccess008
     * @tc.desc Verify bracket write preserves max min and subnormal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr[0] = Number.MAX_VALUE;
      arr[1] = Number.MIN_VALUE;
      arr[2] = 5e-324;
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MAX_VALUE;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = arr.$_get(1);
      const expectedElement1: number = Number.MIN_VALUE;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = arr.$_get(2);
      const expectedElement2: number = 5e-324;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_0900
     * @tc.name testFloat64ArrayBracketAccess009
     * @tc.desc Verify parent bracket write propagates to subarray child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(NaN, Number.MIN_VALUE, -0.0, Infinity);
      const child: Float64Array = parent.subarray(1, 3);
      parent[1] = 88.0;
      const actualResult = child[0];
      const expectedResult: number = 88.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = child.$_get(0);
      const expectedElement0: number = 88.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1000
     * @tc.name testFloat64ArrayBracketAccess010
     * @tc.desc Verify child bracket write propagates to parent and sibling view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -Number.MAX_SAFE_INTEGER, NaN, Infinity);
      const child: Float64Array = parent.subarray(1, 4);
      const sibling: Float64Array = parent.subarray(2, 4);
      child[1] = 77.0;
      const actualElement2 = parent.$_get(2);
      const expectedElement2: number = 77.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualResult = sibling[0];
      const expectedResult: number = 77.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1100
     * @tc.name testFloat64ArrayBracketAccess011
     * @tc.desc Verify bracket write on slice copy does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(Number.MAX_SAFE_INTEGER, -0.0, Number.MIN_VALUE, -Number.MAX_SAFE_INTEGER);
      const copy: Float64Array = source.slice(1, 4);
      copy[1] = 99.0;
      const actualResult = copy[1];
      const expectedResult: number = 99.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = source.$_get(2);
      const expectedElement2: number = Number.MIN_VALUE;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1200
     * @tc.name testFloat64ArrayBracketAccess012
     * @tc.desc Verify source bracket write does not affect slice copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(5.0, 6.0, 7.0);
      const copy: Float64Array = source.slice(0, 3);
      source[0] = 50.0;
      const actualResult = source[0];
      const expectedResult: number = 50.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = copy[0];
      const expectedResultSecond: number = 5.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1300
     * @tc.name testFloat64ArrayBracketAccess013
     * @tc.desc Verify values iterator observes unread bracket mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, Number.MIN_VALUE, Infinity);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      expect(actualIteratorValue).assertNaN();
      arr[1] = 22.0;
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 22.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = Infinity;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1400
     * @tc.name testFloat64ArrayBracketAccess014
     * @tc.desc Verify exhausted entries iterator stays done after bracket mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(9.0);
      const iter = arr.entries();
      iter.next();
      expect(iter.next().done).assertTrue();
      arr[0] = 90.0;
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1500
     * @tc.name testFloat64ArrayBracketAccess015
     * @tc.desc Verify bracket read supports zero and last index boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const actualResult = arr[0];
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElementValue = arr[arr.length - 1];
      const expectedElementValue: number = 30.0;
      expect(actualElementValue).assertEqual(expectedElementValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1600
     * @tc.name testFloat64ArrayBracketAccess016
     * @tc.desc Verify bracket read at length throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      let isThrown = false;
      try {
        const value = arr[arr.length];
        const actualResult = value;
        const expectedResult: number = 0.0;
        expect(actualResult).assertEqual(expectedResult);
      } catch (e) {
        isThrown = true;
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(isThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1700
     * @tc.name testFloat64ArrayBracketAccess017
     * @tc.desc Verify bracket read with negative index throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      let isThrown = false;
      try {
        const value = arr[-1];
        const actualResult = value;
        const expectedResult: number = 0.0;
        expect(actualResult).assertEqual(expectedResult);
      } catch (e) {
        isThrown = true;
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(isThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1800
     * @tc.name testFloat64ArrayBracketAccess018
     * @tc.desc Verify bracket negative zero index aliases zero index on read and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(5.0, 6.0);
      const actualResult = arr[-0];
      const expectedResult: number = 5.0;
      expect(actualResult).assertEqual(expectedResult);
      arr[-0] = 50.0;
      const actualResultSecond = arr[0];
      const expectedResultSecond: number = 50.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = 50.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_1900
     * @tc.name testFloat64ArrayBracketAccess019
     * @tc.desc Verify empty array bracket read throws invalid index and keeps length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      let isThrown = false;
      try {
        const value = arr[0];
        const actualResult = value;
        const expectedResult: number = 0.0;
        expect(actualResult).assertEqual(expectedResult);
      } catch (e) {
        isThrown = true;
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(isThrown).assertTrue();
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2000
     * @tc.name testFloat64ArrayBracketAccess020
     * @tc.desc Verify large array bracket access supports first middle and last valid boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1000);
      arr[0] = 1.0;
      arr[500] = 501.0;
      arr[999] = 1000.0;
      const actualResult = arr[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[500];
      const expectedResultSecond: number = 501.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[999];
      const expectedResultThird: number = 1000.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2100
     * @tc.name testFloat64ArrayBracketAccess021
     * @tc.desc Verify positive out-of-range bracket writes do not change typed array length or in-range values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      expectBracketWriteRangeError(arr, arr.length, 99.0);
      const actualLength = arr.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualResult = arr[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[2];
      const expectedResultThird: number = 3.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2200
     * @tc.name testFloat64ArrayBracketAccess022
     * @tc.desc Verify negative bracket writes do not change typed array contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0, 8.0, 9.0);
      expectBracketWriteRangeError(arr, -1, 70.0);
      const actualResult = arr[0];
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = 8.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[2];
      const expectedResultThird: number = 9.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2300
     * @tc.name testFloat64ArrayBracketAccess023
     * @tc.desc Verify last valid bracket write updates last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(4.0, 5.0, 6.0);
      arr[arr.length - 1] = 60.0;
      const actualElementValue = arr[arr.length - 1];
      const expectedElementValue: number = 60.0;
      expect(actualElementValue).assertEqual(expectedElementValue);
      const actualElementValueSecond = arr.$_get(arr.length - 1);
      const expectedElementValueSecond: number = 60.0;
      expect(actualElementValueSecond).assertEqual(expectedElementValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2400
     * @tc.name testFloat64ArrayBracketAccess024
     * @tc.desc Verify boundary bracket writes support special values at first middle and last indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr[0] = NaN;
      arr[1] = Infinity;
      arr[2] = -Infinity;
      expect(arr[0]).assertNaN();
      const actualResult = arr[1];
      const expectedResult: number = Infinity;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[2];
      const expectedResultSecond: number = -Infinity;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2500
     * @tc.name testFloat64ArrayBracketAccess025
     * @tc.desc Verify nested subarray boundary bracket writes propagate to root array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Float64Array = Float64Array.of(NaN, Number.MIN_VALUE, -0.0, Infinity, Number.MAX_SAFE_INTEGER);
      const child: Float64Array = root.subarray(1, 5);
      const grandchild: Float64Array = child.subarray(1, 3);
      grandchild[0] = 33.0;
      grandchild[grandchild.length - 1] = 44.0;
      const actualElement2 = root.$_get(2);
      const expectedElement2: number = 33.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement3 = root.$_get(3);
      const expectedElement3: number = 44.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2600
     * @tc.name testFloat64ArrayBracketAccess026
     * @tc.desc Verify negative zero bracket write on subarray boundary preserves stored sign in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const child: Float64Array = parent.subarray(1, 3);
      child[0] = -0.0;
      const actualResult = child[0];
      const expectedResult: number = 0.0;
      expect(actualResult).assertEqual(expectedResult);
      assertStoredNegativeZero(parent.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2700
     * @tc.name testFloat64ArrayBracketAccess027
     * @tc.desc Verify boundary bracket write then values iterator observes NaN and infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const iter: IterableIterator<number> = arr.values();
      arr[0] = NaN;
      arr[2] = Infinity;
      expect(iter.next().value).assertNaN();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 2.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = Infinity;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2800
     * @tc.name testFloat64ArrayBracketAccess028
     * @tc.desc Verify entries iterator after partial consume observes boundary bracket mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const iter = arr.entries();
      const first = iter.next();
      const actualResult = first.value![0];
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = first.value![1];
      const expectedResultSecond: number = 1.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      arr[arr.length - 1] = 30.0;
      iter.next();
      const last = iter.next();
      const actualResultThird = last.value![0];
      const expectedResultThird: number = 2;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = last.value![1];
      const expectedResultFourth: number = 30.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_2900
     * @tc.name testFloat64ArrayBracketAccess029
     * @tc.desc Verify dollar set at valid boundaries stays aligned with bracket read on large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(256);
      arr.$_set(0, 11.0);
      arr.$_set(128, 129.0);
      arr.$_set(255, 256.0);
      const actualResult = arr[0];
      const expectedResult: number = 11.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[128];
      const expectedResultSecond: number = 129.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[255];
      const expectedResultThird: number = 256.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3000
     * @tc.name testFloat64ArrayBracketAccess030
     * @tc.desc Verify large positive bracket index write leaves typed array data unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      expectBracketWriteRangeError(arr, 99999, 55.0);
      const actualLength = arr.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualResult = arr[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3100
     * @tc.name testFloat64ArrayBracketAccess031
     * @tc.desc Verify source bracket write of infinity does not affect slice copy boundary slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(NaN, -0.0, Number.MIN_VALUE);
      const copy: Float64Array = source.slice(0, 3);
      source[source.length - 1] = Infinity;
      const actualElementValue = source[source.length - 1];
      const expectedElementValue: number = Infinity;
      expect(actualElementValue).assertEqual(expectedElementValue);
      const actualElementValueSecond = copy[copy.length - 1];
      const expectedElementValueSecond: number = Number.MIN_VALUE;
      expect(actualElementValueSecond).assertEqual(expectedElementValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3200
     * @tc.name testFloat64ArrayBracketAccess032
     * @tc.desc Verify copy bracket write of negative infinity does not affect source boundary slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(8.0, 9.0, 10.0);
      const copy: Float64Array = source.slice(0, 3);
      copy[0] = -Infinity;
      const actualResult = copy[0];
      const expectedResult: number = -Infinity;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = source[0];
      const expectedResultSecond: number = 8.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3300
     * @tc.name testFloat64ArrayBracketAccess033
     * @tc.desc Verify sibling subarray boundary bracket write propagates across overlap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Float64Array = Float64Array.of(NaN, Number.MIN_VALUE, -0.0, Infinity);
      const left: Float64Array = root.subarray(0, 3);
      const right: Float64Array = root.subarray(2, 4);
      left[left.length - 1] = 33.0;
      const actualResult = right[0];
      const expectedResult: number = 33.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = root.$_get(2);
      const expectedElement2: number = 33.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3400
     * @tc.name testFloat64ArrayBracketAccess034
     * @tc.desc Verify forEach callback array bracket read matches dollar get after boundary write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(NaN, 2.0, -Infinity);
      arr[arr.length - 1] = 30.0;
      let seenLast: number = 0.0;
      arr.forEach((v: number, index: int, a: Float64Array): void => {
        if (index === a.length - 1) {
          seenLast = a[index];
          expect(a[index]).assertEqual(a.$_get(index));
          const actualResult = v;
          const expectedResult: number = 30.0;
          expect(actualResult).assertEqual(expectedResult);
        }
      });
      const actualResultSecond = seenLast;
      const expectedResultSecond: number = 30.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3500
     * @tc.name testFloat64ArrayBracketAccess035
     * @tc.desc Verify empty array positive out of range bracket write throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      expectBracketWriteRangeError(arr, 0, 11.0);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3600
     * @tc.name testFloat64ArrayBracketAccess036
     * @tc.desc Verify empty array negative bracket write throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      expectBracketWriteRangeError(arr, -1, 77.0);
      const actualLength = arr.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3700
     * @tc.name testFloat64ArrayBracketAccess037
     * @tc.desc Verify out of range bracket writes with special values do not affect typed array data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      expectBracketWriteRangeError(arr, arr.length, NaN);
      const actualResult = arr[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[2];
      const expectedResultThird: number = 3.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3800
     * @tc.name testFloat64ArrayBracketAccess038
     * @tc.desc Verify large array out of range writes keep boundary reads unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(512);
      arr[0] = 1.0;
      arr[511] = 512.0;
      expectBracketWriteRangeError(arr, 512, 999.0);
      const actualResult = arr[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[511];
      const expectedResultSecond: number = 512.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_3900
     * @tc.name testFloat64ArrayBracketAccess039
     * @tc.desc Verify dollar set valid boundary remains unaffected by abnormal bracket writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(4);
      arr.$_set(0, 10.0);
      arr.$_set(3, 40.0);
      expectBracketWriteRangeError(arr, 4, 400.0);
      const actualResultFifth = arr[0];
      const expectedResultFifth: number = 10.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
      const actualResultSixth = arr[3];
      const expectedResultSixth: number = 40.0;
      expect(actualResultSixth).assertEqual(expectedResultSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4000
     * @tc.name testFloat64ArrayBracketAccess040
     * @tc.desc Verify subarray boundary data stays unchanged after abnormal bracket writes on child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const child: Float64Array = parent.subarray(1, 3);
      expectBracketWriteRangeError(child, child.length, 100.0);
      const actualResultFifth = parent[1];
      const expectedResultFifth: number = 2.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
      const actualResultSixth = parent[2];
      const expectedResultSixth: number = 3.0;
      expect(actualResultSixth).assertEqual(expectedResultSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4100
     * @tc.name testFloat64ArrayBracketAccess041
     * @tc.desc Verify values iterator stays exhausted after abnormal bracket writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
      expectBracketWriteRangeError(arr, arr.length, 99.0);
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4200
     * @tc.name testFloat64ArrayBracketAccess042
     * @tc.desc Verify keys iterator index range stays unchanged after abnormal bracket writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      expectBracketWriteRangeError(arr, -1, 111.0);
      const iter = arr.keys();
      const actualIteratorValueFourth = iter.next().value;
      const expectedIteratorValueFourth: number = 0;
      expect(actualIteratorValueFourth).assertEqual(expectedIteratorValueFourth);
      const actualIteratorValueFifth = iter.next().value;
      const expectedIteratorValueFifth: number = 1;
      expect(actualIteratorValueFifth).assertEqual(expectedIteratorValueFifth);
      const actualIteratorValueSixth = iter.next().value;
      const expectedIteratorValueSixth: number = 2;
      expect(actualIteratorValueSixth).assertEqual(expectedIteratorValueSixth);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4300
     * @tc.name testFloat64ArrayBracketAccess043
     * @tc.desc Verify map callback bracket read matches dollar get after first boundary write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(4.0, 5.0, 6.0);
      arr[0] = 40.0;
      const mapped: Float64Array = arr.map((v: number, index: int, a: Float64Array): number => {
        expect(a[index]).assertEqual(a.$_get(index));
        return v;
      });
      const actualResultFifth = mapped[0];
      const expectedResultFifth: number = 40.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
      const actualResultSixth = mapped[2];
      const expectedResultSixth: number = 6.0;
      expect(actualResultSixth).assertEqual(expectedResultSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4400
     * @tc.name testFloat64ArrayBracketAccess044
     * @tc.desc Verify filter callback bracket read matches dollar get after last boundary write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(Number.MIN_VALUE, 2.0, -Infinity);
      arr[arr.length - 1] = 30.0;
      const filtered: Float64Array = arr.filter((v: number, index: int, a: Float64Array): boolean => {
        expect(a[index]).assertEqual(a.$_get(index));
        return v >= 2.0;
      });
      const actualResultFifth = filtered[0];
      const expectedResultFifth: number = 2.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
      const actualResultSixth = filtered[1];
      const expectedResultSixth: number = 30.0;
      expect(actualResultSixth).assertEqual(expectedResultSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4500
     * @tc.name testFloat64ArrayBracketAccess045
     * @tc.desc Verify find callback sees infinity written through bracket at boundary slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr[arr.length - 1] = Infinity;
      const found = arr.find((v: number, index: int, a: Float64Array): boolean => {
        expect(a[index]).assertEqual(a.$_get(index));
        return v === Infinity;
      });
      const actualResultFifth = found;
      const expectedResultFifth: number = Infinity;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4600
     * @tc.name testFloat64ArrayBracketAccess046
     * @tc.desc Verify nested subarray abnormal writes do not affect root boundary data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const child: Float64Array = root.subarray(1, 5);
      const grandchild: Float64Array = child.subarray(1, 3);
      expectBracketWriteRangeError(grandchild, grandchild.length, 77.0);
      const actualResultFifth = root[2];
      const expectedResultFifth: number = 3.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
      const actualResultSixth = root[3];
      const expectedResultSixth: number = 4.0;
      expect(actualResultSixth).assertEqual(expectedResultSixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4700
     * @tc.name testFloat64ArrayBracketAccess047
     * @tc.desc Verify copy subarray abnormal write throws invalid index and source remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(9.0, 8.0, 7.0, 6.0);
      const copy: Float64Array = source.slice(1, 4);
      const sub: Float64Array = copy.subarray(1, 3);
      expectBracketWriteRangeError(sub, sub.length, 123.0);
      const actualResultFifth = copy[0];
      const expectedResultFifth: number = 8.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
      const actualResultSixth = copy[1];
      const expectedResultSixth: number = 7.0;
      expect(actualResultSixth).assertEqual(expectedResultSixth);
      const actualResultSeventh = copy[2];
      const expectedResultSeventh: number = 6.0;
      expect(actualResultSeventh).assertEqual(expectedResultSeventh);
      const actualResultEighth = source[2];
      const expectedResultEighth: number = 7.0;
      expect(actualResultEighth).assertEqual(expectedResultEighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4800
     * @tc.name testFloat64ArrayBracketAccess048
     * @tc.desc Verify singleton bracket write and read at zero index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1);
      arr[0] = 42.0;
      const actualResultFifth = arr[0];
      const expectedResultFifth: number = 42.0;
      expect(actualResultFifth).assertEqual(expectedResultFifth);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 42.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_4900
     * @tc.name testFloat64ArrayBracketAccess049
     * @tc.desc Verify singleton positive out of range bracket write throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0);
      expectBracketWriteRangeError(arr, 1, 70.0);
      const actualResult = arr[0];
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5000
     * @tc.name testFloat64ArrayBracketAccess050
     * @tc.desc Verify singleton negative bracket write throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(8.0);
      expectBracketWriteRangeError(arr, -1, 80.0);
      const actualResult = arr[0];
      const expectedResult: number = 8.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualLength = arr.length;
      const expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5100
     * @tc.name testFloat64ArrayBracketAccess051
     * @tc.desc Verify parent first boundary bracket write is visible to child view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const child: Float64Array = parent.subarray(0, 2);
      parent[0] = 11.0;
      const actualResult = child[0];
      const expectedResult: number = 11.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement0 = child.$_get(0);
      const expectedElement0: number = 11.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5200
     * @tc.name testFloat64ArrayBracketAccess052
     * @tc.desc Verify child last boundary bracket write is visible to parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(4.0, 5.0, 6.0, 7.0);
      const child: Float64Array = parent.subarray(1, 3);
      child[child.length - 1] = 66.0;
      const actualResult = parent[2];
      const expectedResult: number = 66.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement2 = parent.$_get(2);
      const expectedElement2: number = 66.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5300
     * @tc.name testFloat64ArrayBracketAccess053
     * @tc.desc Verify nested subarray first boundary bracket write is visible to root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const child: Float64Array = root.subarray(1, 4);
      const grandchild: Float64Array = child.subarray(0, 2);
      grandchild[0] = 22.0;
      const actualResult = root[1];
      const expectedResult: number = 22.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = root.$_get(1);
      const expectedElement1: number = 22.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5400
     * @tc.name testFloat64ArrayBracketAccess054
     * @tc.desc Verify nested subarray last boundary bracket write is visible to root
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const child: Float64Array = root.subarray(1, 5);
      const grandchild: Float64Array = child.subarray(1, 3);
      grandchild[grandchild.length - 1] = 44.0;
      const actualResult = root[3];
      const expectedResult: number = 44.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement3 = root.$_get(3);
      const expectedElement3: number = 44.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5500
     * @tc.name testFloat64ArrayBracketAccess055
     * @tc.desc Verify overlapping sibling first boundary propagation through bracket write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const left: Float64Array = root.subarray(0, 2);
      const right: Float64Array = root.subarray(1, 4);
      right[0] = 22.0;
      const actualResult = left[1];
      const expectedResult: number = 22.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElement1 = root.$_get(1);
      const expectedElement1: number = 22.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5600
     * @tc.name testFloat64ArrayBracketAccess056
     * @tc.desc Verify overlapping sibling abnormal write throws invalid index and root remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const root: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const left: Float64Array = root.subarray(0, 3);
      expectBracketWriteRangeError(left, left.length, 99.0);
      const actualResult = root[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = root[2];
      const expectedResultSecond: number = 3.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5700
     * @tc.name testFloat64ArrayBracketAccess057
     * @tc.desc Verify slice copy first boundary write remains isolated from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(2.0, 4.0, 6.0);
      const copy: Float64Array = source.slice(0, 3);
      copy[0] = 20.0;
      const actualResult = copy[0];
      const expectedResult: number = 20.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = source[0];
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5800
     * @tc.name testFloat64ArrayBracketAccess058
     * @tc.desc Verify slice copy last boundary write remains isolated from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(3.0, 6.0, 9.0);
      const copy: Float64Array = source.slice(0, 3);
      copy[copy.length - 1] = 90.0;
      const actualElementValue = copy[copy.length - 1];
      const expectedElementValue: number = 90.0;
      expect(actualElementValue).assertEqual(expectedElementValue);
      const actualElementValueSecond = source[source.length - 1];
      const expectedElementValueSecond: number = 9.0;
      expect(actualElementValueSecond).assertEqual(expectedElementValueSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_5900
     * @tc.name testFloat64ArrayBracketAccess059
     * @tc.desc Verify values iterator observes first boundary bracket mutation before first read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const iter: IterableIterator<number> = arr.values();
      arr[0] = 10.0;
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 10.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6000
     * @tc.name testFloat64ArrayBracketAccess060
     * @tc.desc Verify values iterator observes last boundary bracket mutation after partial consume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const iter: IterableIterator<number> = arr.values();
      const actualIteratorValue = iter.next().value;
      const expectedIteratorValue: number = 1.0;
      expect(actualIteratorValue).assertEqual(expectedIteratorValue);
      arr[arr.length - 1] = 33.0;
      const actualIteratorValueSecond = iter.next().value;
      const expectedIteratorValueSecond: number = 2.0;
      expect(actualIteratorValueSecond).assertEqual(expectedIteratorValueSecond);
      const actualIteratorValueThird = iter.next().value;
      const expectedIteratorValueThird: number = 33.0;
      expect(actualIteratorValueThird).assertEqual(expectedIteratorValueThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6100
     * @tc.name testFloat64ArrayBracketAccess061
     * @tc.desc Verify entries iterator observes first boundary bracket mutation before first read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(2.0, 4.0);
      const iter = arr.entries();
      arr[0] = 20.0;
      const first = iter.next();
      const actualResult = first.value![0];
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = first.value![1];
      const expectedResultSecond: number = 20.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6200
     * @tc.name testFloat64ArrayBracketAccess062
     * @tc.desc Verify forEach callback sees first boundary negative zero through bracket and dollar get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0);
      arr[0] = -0.0;
      arr.forEach((v: number, index: int, a: Float64Array): void => {
        if (index === 0) {
          const actualResult = a[index];
          const expectedResult: number = 0.0;
          expect(actualResult).assertEqual(expectedResult);
          assertStoredNegativeZero(a.$_get(index));
          const actualResultSecond = v;
          const expectedResultSecond: number = 0.0;
          expect(actualResultSecond).assertEqual(expectedResultSecond);
        }
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6300
     * @tc.name testFloat64ArrayBracketAccess063
     * @tc.desc Verify map callback sees NaN at first boundary and infinity at last boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr[0] = NaN;
      arr[arr.length - 1] = Infinity;
      const result = arr.map((v: number, index: int, a: Float64Array): number => {
        if (index === 0) {
          expect(a[index]).assertNaN();
        }
        if (index === a.length - 1) {
          const actualResult = a[index];
          const expectedResult: number = Infinity;
          expect(actualResult).assertEqual(expectedResult);
        }
        return v;
      });
      const actualResultSecond = result[1];
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6400
     * @tc.name testFloat64ArrayBracketAccess064
     * @tc.desc Verify filter callback keeps negative zero at first boundary and infinity at last boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr[0] = -0.0;
      arr[arr.length - 1] = Infinity;
      const filtered = arr.filter((v: number, index: int, a: Float64Array): boolean => {
        expect(a[index]).assertEqual(a.$_get(index));
        return index === 0 || index === a.length - 1;
      });
      const actualResult = filtered[0];
      const expectedResult: number = 0.0;
      expect(actualResult).assertEqual(expectedResult);
      assertStoredNegativeZero(filtered.$_get(0));
      const actualResultSecond = filtered[1];
      const expectedResultSecond: number = Infinity;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6500
     * @tc.name testFloat64ArrayBracketAccess065
     * @tc.desc Verify findIndex callback detects last boundary infinity after bracket write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr[arr.length - 1] = Infinity;
      const index = arr.findIndex((v: number): boolean => v === Infinity);
      const actualResult = index;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6600
     * @tc.name testFloat64ArrayBracketAccess066
     * @tc.desc Verify reverse after boundary bracket writes swaps first and last values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr[0] = 10.0;
      arr[arr.length - 1] = 30.0;
      arr.reverse();
      const actualResult = arr[0];
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElementValue = arr[arr.length - 1];
      const expectedElementValue: number = 10.0;
      expect(actualElementValue).assertEqual(expectedElementValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6700
     * @tc.name testFloat64ArrayBracketAccess067
     * @tc.desc Verify toReversed after boundary bracket writes leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr[0] = 10.0;
      arr[arr.length - 1] = 30.0;
      const reversed = arr.toReversed();
      const actualResult = arr[0];
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElementValue = arr[arr.length - 1];
      const expectedElementValue: number = 30.0;
      expect(actualElementValue).assertEqual(expectedElementValue);
      const actualResultSecond = reversed[0];
      const expectedResultSecond: number = 30.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = reversed[2];
      const expectedResultThird: number = 10.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6800
     * @tc.name testFloat64ArrayBracketAccess068
     * @tc.desc Verify sort after boundary bracket writes orders ordinary values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 2.0, 1.0);
      arr[0] = 30.0;
      arr[arr.length - 1] = 10.0;
      arr.sort();
      const actualResult = arr[0];
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = 10.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[2];
      const expectedResultThird: number = 30.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_6900
     * @tc.name testFloat64ArrayBracketAccess069
     * @tc.desc Verify toSorted after boundary bracket writes keeps source unchanged and returns sorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(3.0, 2.0, 1.0);
      arr[0] = 30.0;
      arr[arr.length - 1] = 10.0;
      const sorted = arr.toSorted();
      const actualResult = arr[0];
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElementValue = arr[arr.length - 1];
      const expectedElementValue: number = 10.0;
      expect(actualElementValue).assertEqual(expectedElementValue);
      const actualResultSecond = sorted[0];
      const expectedResultSecond: number = 2.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = sorted[1];
      const expectedResultThird: number = 10.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualResultFourth = sorted[2];
      const expectedResultFourth: number = 30.0;
      expect(actualResultFourth).assertEqual(expectedResultFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7000
     * @tc.name testFloat64ArrayBracketAccess070
     * @tc.desc Verify copyWithin after boundary bracket writes copies expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr[0] = 10.0;
      arr[arr.length - 1] = 40.0;
      arr.copyWithin(1, 0, 2);
      const actualResult = arr[0];
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = 10.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[2];
      const expectedResultThird: number = 2.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7100
     * @tc.name testFloat64ArrayBracketAccess071
     * @tc.desc Verify fill after boundary bracket writes overwrites full range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      arr[0] = 10.0;
      arr[arr.length - 1] = 30.0;
      arr.fill(7.0);
      const actualResult = arr[0];
      const expectedResult: number = 7.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = 7.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[2];
      const expectedResultThird: number = 7.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7200
     * @tc.name testFloat64ArrayBracketAccess072
     * @tc.desc Verify large array slice preserves bracket-written boundary and middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(128);
      arr[0] = 1.0;
      arr[64] = 65.0;
      arr[127] = 128.0;
      const copy = arr.slice(0, 128);
      const actualResult = copy[0];
      const expectedResult: number = 1.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = copy[64];
      const expectedResultSecond: number = 65.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = copy[127];
      const expectedResultThird: number = 128.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7300
     * @tc.name testFloat64ArrayBracketAccess073
     * @tc.desc Verify bracket writes and dollar set writes coexist on separate boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr[0] = 10.0;
      arr.$_set(1, 20.0);
      arr[2] = 30.0;
      const actualResult = arr[0];
      const expectedResult: number = 10.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = arr[1];
      const expectedResultSecond: number = 20.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      const actualResultThird = arr[2];
      const expectedResultThird: number = 30.0;
      expect(actualResultThird).assertEqual(expectedResultThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7400
     * @tc.name testFloat64ArrayBracketAccess074
     * @tc.desc Verify large array first and last boundary writes remain after abnormal write throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1024);
      arr[0] = Number.MAX_VALUE;
      arr[arr.length - 1] = Number.MIN_VALUE;
      expectBracketWriteRangeError(arr, arr.length, 999.0);
      const actualElement0 = arr.$_get(0);
      const expectedElement0: number = Number.MAX_VALUE;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementValue = arr.$_get(arr.length - 1);
      const expectedElementValue: number = Number.MIN_VALUE;
      expect(actualElementValue).assertEqual(expectedElementValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7500
     * @tc.name testFloat64ArrayBracketAccess075
     * @tc.desc Verify bracket read beyond length by one throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      let isThrown = false;
      try {
        const value = arr[arr.length + 1];
        const actualResult = value;
        const expectedResult: number = 0.0;
        expect(actualResult).assertEqual(expectedResult);
      } catch (e) {
        isThrown = true;
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(isThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7600
     * @tc.name testFloat64ArrayBracketAccess076
     * @tc.desc Verify negative bracket write below minus one throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(7.0, 8.0, 9.0);
      expectBracketWriteRangeError(arr, -2, 80.0);
      const actualResult = arr[1];
      const expectedResult: number = 8.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7700
     * @tc.name testFloat64ArrayBracketAccess077
     * @tc.desc Verify subarray negative write throws invalid index and parent remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const child: Float64Array = parent.subarray(1, 3);
      expectBracketWriteRangeError(child, -1, 200.0);
      const actualResult = parent[1];
      const expectedResult: number = 2.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7800
     * @tc.name testFloat64ArrayBracketAccess078
     * @tc.desc Verify large array read at length throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(1000);
      let isThrown = false;
      try {
        const value = arr[1000];
        const actualResult = value;
        const expectedResult: number = 0.0;
        expect(actualResult).assertEqual(expectedResult);
      } catch (e) {
        isThrown = true;
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(isThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_7900
     * @tc.name testFloat64ArrayBracketAccess079
     * @tc.desc Verify read after last valid write at length throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(4.0, 5.0, 6.0);
      arr[arr.length - 1] = 60.0;
      const actualElementValue = arr.$_get(arr.length - 1);
      const expectedElementValue: number = 60.0;
      expect(actualElementValue).assertEqual(expectedElementValue);
      let isThrown = false;
      try {
        const value = arr[arr.length];
        const actualResult = value;
        const expectedResult: number = 0.0;
        expect(actualResult).assertEqual(expectedResult);
      } catch (e) {
        isThrown = true;
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(isThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_8000
     * @tc.name testFloat64ArrayBracketAccess080
     * @tc.desc Verify read after dollar set last boundary at length throws invalid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(256);
      arr.$_set(255, 256.0);
      const actualResult = arr[255];
      const expectedResult: number = 256.0;
      expect(actualResult).assertEqual(expectedResult);
      let isThrown = false;
      try {
        const value = arr[256];
        const actualResultSecond = value;
        const expectedResultSecond: number = 0.0;
        expect(actualResultSecond).assertEqual(expectedResultSecond);
      } catch (e) {
        isThrown = true;
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }
      expect(isThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_8100
     * @tc.name testFloat64ArrayBracketAccess081
     * @tc.desc Verify bracket access supports hexadecimal index literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      arr[0x2] = 20.0;
      const actualResult = arr[2];
      const expectedResult: number = 20.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElementAt0x2 = arr.$_get(0x2);
      const expectedElementAt0x2: number = 20.0;
      expect(actualElementAt0x2).assertEqual(expectedElementAt0x2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_8200
     * @tc.name testFloat64ArrayBracketAccess082
     * @tc.desc Verify bracket access supports binary index literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(4);
      arr[0b11] = 30.0;
      const actualResult = arr[3];
      const expectedResult: number = 30.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElementAt0b11 = arr.$_get(0b11);
      const expectedElementAt0b11: number = 30.0;
      expect(actualElementAt0b11).assertEqual(expectedElementAt0b11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_8300
     * @tc.name testFloat64ArrayBracketAccess083
     * @tc.desc Verify bracket access supports octal index literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5);
      arr[0o4] = 40.0;
      const actualResult = arr[4];
      const expectedResult: number = 40.0;
      expect(actualResult).assertEqual(expectedResult);
      const actualElementAt0o4 = arr.$_get(0o4);
      const expectedElementAt0o4: number = 40.0;
      expect(actualElementAt0o4).assertEqual(expectedElementAt0o4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_BRACKET_ACCESS_8400
     * @tc.name testFloat64ArrayBracketAccess084
     * @tc.desc Verify bracket write feeds subarray slice chain result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayBracketAccess084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      arr[1] = 20.0;
      const result: Float64Array = arr.subarray(0).slice(1, 3);
      const actualLength = result.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = result.$_get(0);
      const expectedElement0: number = 20.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = result.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });
  })
}
