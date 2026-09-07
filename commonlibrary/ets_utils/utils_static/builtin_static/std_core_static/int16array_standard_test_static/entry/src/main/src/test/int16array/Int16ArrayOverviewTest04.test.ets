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

export default function Int16ArrayOverviewTest04(): void {
  describe('Int16ArrayOverviewTest04', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0100
     * @tc.name testInt16ArrayOverviewTestFour001
     * @tc.desc Verify default $_iterator sequence matches values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 0x7fff, 50);
      let iterValues: Array<number> = [];
      let defaultValues: Array<number> = [];
      for (const v of arr.values()) {
        iterValues.push(v);
      }
      for (const v of arr) {
        defaultValues.push(v);
      }
      let defaultFirstValue: number = defaultValues[0];
      let iterFirstValue: number = iterValues[0];
      expect(defaultFirstValue).assertEqual(iterFirstValue);
      let defaultSecondValue: number = defaultValues[1];
      let iterSecondValue: number = iterValues[1];
      expect(defaultSecondValue).assertEqual(iterSecondValue);
      let defaultThirdValue: number = defaultValues[2];
      let iterThirdValue: number = iterValues[2];
      expect(defaultThirdValue).assertEqual(iterThirdValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0200
     * @tc.name testInt16ArrayOverviewTestFour002
     * @tc.desc Verify subarray(1,3) byteOffset equals 1*BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 0x7fff, 50, 100);
      const sub = arr.subarray(1, 3);
      let actualByteOffset: int = sub.byteOffset;
      let expectedByteOffset: int = 2;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0300
     * @tc.name testInt16ArrayOverviewTestFour003
     * @tc.desc Verify subarray(0,1) shares same buffer as parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 0x7fff, 50);
      const sub = arr.subarray(0, 1);
      let actualBuffer: object = sub.buffer;
      let expectedBuffer: object = arr.buffer as object;
      expect(actualBuffer).assertEqual(expectedBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0400
     * @tc.name testInt16ArrayOverviewTestFour004
     * @tc.desc Verify slice(0,1) buffer is independent of parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 0x7fff, 50);
      const sliced = arr.slice(0, 1);
      expect(sliced.buffer).not().assertEqual(arr.buffer as object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0500
     * @tc.name testInt16ArrayOverviewTestFour005
     * @tc.desc Verify slice(0,1) byteOffset is 0 on new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 0x7fff, 50);
      const sliced = arr.slice(0, 1);
      let actualByteOffset: int = sliced.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0600
     * @tc.name testInt16ArrayOverviewTestFour006
     * @tc.desc Verify subarray write is visible on parent shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 0x7fff, 50);
      const sub = arr.subarray(0, 2);
      sub.$_set(0, 99);
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 99;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0700
     * @tc.name testInt16ArrayOverviewTestFour007
     * @tc.desc Verify slice copy write does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 0x7fff, 50);
      const sliced = arr.slice(0, 3);
      sliced.$_set(0, 99);
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = 10;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0800
     * @tc.name testInt16ArrayOverviewTestFour008
     * @tc.desc Verify Int16Array.from empty FixedArray length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [];
      const arr = Int16Array.from(src);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_0900
     * @tc.name testInt16ArrayOverviewTestFour009
     * @tc.desc Verify map producing 0x8000 truncates element to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2);
      const result = arr.map((_v: number, _i: int, _a: Int16Array) => 0x8000);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = -32768;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1000
     * @tc.name testInt16ArrayOverviewTestFour010
     * @tc.desc Verify with(0, 0x8000) truncates new element to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200);
      const result = arr.with(0, 0x8000);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = -32768;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1100
     * @tc.name testInt16ArrayOverviewTestFour011
     * @tc.desc Verify includes finds -32768 truncation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, -32768, 50);
      let found: boolean = arr.includes(-32768);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1200
     * @tc.name testInt16ArrayOverviewTestFour012
     * @tc.desc Verify indexOf finds -32768 truncation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 0, -32768);
      let actualIndex: int = arr.indexOf(-32768);
      let expectedIndex: int = 2;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1300
     * @tc.name testInt16ArrayOverviewTestFour013
     * @tc.desc Verify fill(0x8000) fills all elements as -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      arr.fill(0x8000);
      let actualFirstElement: number = arr.$_get(0);
      let expectedFirstElement: int = -32768;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualSecondElement: number = arr.$_get(1);
      let expectedSecondElement: int = -32768;
      expect(actualSecondElement).assertEqual(expectedSecondElement);
      let actualThirdElement: number = arr.$_get(2);
      let expectedThirdElement: int = -32768;
      expect(actualThirdElement).assertEqual(expectedThirdElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1400
     * @tc.name testInt16ArrayOverviewTestFour014
     * @tc.desc Verify join on array with zeros produces 1,0,3 string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 0, 3);
      let actualJoined: string = arr.join(',');
      let expectedJoined: string = '1,0,3';
      expect(actualJoined).assertEqual(expectedJoined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1500
     * @tc.name testInt16ArrayOverviewTestFour015
     * @tc.desc Verify toString of 0x8000 truncated value is -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0x8000);
      let actualString: string = arr.toString();
      let expectedString: string = '-32768';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1600
     * @tc.name testInt16ArrayOverviewTestFour016
     * @tc.desc Verify toLocaleString on empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let actualString: string = arr.toLocaleString('en-US');
      let expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1700
     * @tc.name testInt16ArrayOverviewTestFour017
     * @tc.desc Verify $_set at max int index 2147483647 throws RangeError leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      try {
        arr.$_set(2147483647, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let actualValue1: number = arr.$_get(0);
      let expectedValue1: int = 10;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(1);
      let expectedValue2: int = 20;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1800
     * @tc.name testInt16ArrayOverviewTestFour018
     * @tc.desc Verify with relative negative index -1 returns updated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result = arr.with(-1, 99);
      let actualValue1: number = result.$_get(2);
      let expectedValue1: int = 99;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_1900
     * @tc.name testInt16ArrayOverviewTestFour019
     * @tc.desc Verify with at negative index -4 on 3-element array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        arr.with(-4, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2000
     * @tc.name testInt16ArrayOverviewTestFour020
     * @tc.desc Verify with throws RangeError on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      try {
        arr.with(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2100
     * @tc.name testInt16ArrayOverviewTestFour021
     * @tc.desc Verify set with negative offset -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      try {
        let val: int = 1;
        arr.set(Int16Array.of(val), -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2200
     * @tc.name testInt16ArrayOverviewTestFour022
     * @tc.desc Verify set at offset 3 beyond length 2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      try {
        let val: int = 1;
        arr.set(Int16Array.of(val), 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2300
     * @tc.name testInt16ArrayOverviewTestFour023
     * @tc.desc Verify set of 3-element source at offset 0 on 2-element target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      try {
        arr.set(Int16Array.of(1, 2, 3), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2400
     * @tc.name testInt16ArrayOverviewTestFour024
     * @tc.desc Verify set throws RangeError on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      try {
        let val: int = 1;
        arr.set(Int16Array.of(val), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2500
     * @tc.name testInt16ArrayOverviewTestFour025
     * @tc.desc Verify copyWithin with negative target -5 clamps to 0 keeping element 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      let result = arr.copyWithin(-5, 0);
      let actualValue1: number = result.$_get(0);
      let expectedValue1: int = 1;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2600
     * @tc.name testInt16ArrayOverviewTestFour026
     * @tc.desc Verify subarray with start 10 beyond length returns subarray of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let sub = arr.subarray(10);
      let actualValue1: int = sub.length;
      let expectedValue1: int = 0;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2700
     * @tc.name testInt16ArrayOverviewTestFour027
     * @tc.desc Verify subarray, $_get out-of-range clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let sub = arr.subarray(1, 20);
      let actualValue1: int = sub.length;
      let expectedValue1: int = 2;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = sub.$_get(0);
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
      let actualValue3: number = sub.$_get(1);
      let expectedValue3: int = 3;
      expect(actualValue3).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2800
     * @tc.name testInt16ArrayOverviewTestFour028
     * @tc.desc Verify find returns undefined on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result = arr.find((v: number): boolean => v > 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_2900
     * @tc.name testInt16ArrayOverviewTestFour029
     * @tc.desc Verify findLastIndex on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result = arr.findLastIndex((v: number): boolean => v > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3000
     * @tc.name testInt16ArrayOverviewTestFour030
     * @tc.desc Verify filter on empty array does not invoke callback and returns an empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let callbackCount: int = 0;
      let result: Int16Array = arr.filter((v: number): boolean => {
        callbackCount++;
        return v > 0;
      });
      let actualValue1: int = result.length;
      let expectedValue1: int = 0;
      expect(actualValue1).assertEqual(expectedValue1);
      let expectedCallbackCount: int = 0;
      expect(callbackCount).assertEqual(expectedCallbackCount);
      let result1: int = result.byteLength;
      let expect1: int = 0;
      expect(result1).assertEqual(expect1);
      expect(result.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3100
     * @tc.name testInt16ArrayOverviewTestFour031
     * @tc.desc Verify map, length on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result = arr.map((v: number): number => v * 2);
      let actualValue1: int = result.length;
      let expectedValue1: int = 0;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3200
     * @tc.name testInt16ArrayOverviewTestFour032
     * @tc.desc Verify reduce single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5;
      let arr: Int16Array = Int16Array.of(val);
      let result = arr.reduce((acc: number, v: number): number => acc + v);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3300
     * @tc.name testInt16ArrayOverviewTestFour033
     * @tc.desc Verify lastIndexOf all-equal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let actualValue1: int = arr.lastIndexOf(0);
      let expectedValue1: int = 2;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3400
     * @tc.name testInt16ArrayOverviewTestFour034
     * @tc.desc Verify filter preserves all equal elements and their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 7, 7);
      let callbackCount: int = 0;
      let result: Int16Array = arr.filter((v: number): boolean => {
        callbackCount++;
        return v === 7;
      });
      let actualValue1: int = result.length;
      let expectedValue1: int = 3;
      expect(actualValue1).assertEqual(expectedValue1);
      let resultElement0: number = result.$_get(0);
      let resultElement1: number = result.$_get(1);
      let resultElement2: number = result.$_get(2);
      let expectedElement: int = 7;
      expect(resultElement0).assertEqual(expectedElement);
      expect(resultElement1).assertEqual(expectedElement);
      expect(resultElement2).assertEqual(expectedElement);
      let expectedCallbackCount: int = 3;
      expect(callbackCount).assertEqual(expectedCallbackCount);
      let result1: string = result.toString();
      let expect1: string = '7,7,7';
      expect(result1).assertEqual(expect1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3500
     * @tc.name testInt16ArrayOverviewTestFour035
     * @tc.desc Verify includes zero equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -0;
      let arr: Int16Array = Int16Array.of(val);
      let actualValue1: boolean = arr.includes(0);
      expect(actualValue1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3600
     * @tc.name testInt16ArrayOverviewTestFour036
     * @tc.desc Verify indexOf zero equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let actualValue1: int = arr.indexOf(-0);
      let expectedValue1: int = 0;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3700
     * @tc.name testInt16ArrayOverviewTestFour037
     * @tc.desc Verify new Int16Array throws RangeError float truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int16Array = new Int16Array(-3.7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3800
     * @tc.name testInt16ArrayOverviewTestFour038
     * @tc.desc Verify new Int16Array with unaligned byteOffset 1 on 8-byte buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        let arr: Int16Array = new Int16Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_3900
     * @tc.name testInt16ArrayOverviewTestFour039
     * @tc.desc Verify new Int16Array with 3-byte buffer and length 2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      try {
        let arr: Int16Array = new Int16Array(buf, 0, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4000
     * @tc.name testInt16ArrayOverviewTestFour040
     * @tc.desc Verify map, $_get float truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let result = arr.map((v: number): number => 3.7);
      let actualValue1: number = result.$_get(0);
      let expectedValue1: int = 3;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4100
     * @tc.name testInt16ArrayOverviewTestFour041
     * @tc.desc Verify set, $_get overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let inputValue: int = -32769;
      arr.set(Int16Array.of(inputValue), 0);
      let actualValue1: number = arr.$_get(0);
      let expectedValue1: int = 32767;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4200
     * @tc.name testInt16ArrayOverviewTestFour042
     * @tc.desc Verify fill, $_get overflow wrap out-of-range clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0);
      arr.fill(-32769);
      let actualValue1: number = arr.$_get(0);
      let expectedValue1: int = 32767;
      expect(actualValue1).assertEqual(expectedValue1);
      let actualValue2: number = arr.$_get(1);
      let expectedValue2: int = 32767;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4300
     * @tc.name testInt16ArrayOverviewTestFour043
     * @tc.desc Verify keys behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let found: boolean = false;
      for (let key of arr.keys()) {
        if (key === 0) {
          found = true;
        }
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4400
     * @tc.name testInt16ArrayOverviewTestFour044
     * @tc.desc Verify entries behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let count: int = 0;
      for (let entry of arr.entries()) {
        let idx: number = entry[0];
        let val: number = entry[1];
        if (idx === 0) {
          let e0: int = 10;
          expect(val).assertEqual(e0);
          count = count + 1;
        }
        if (idx === 1) {
          let e1: int = 20;
          expect(val).assertEqual(e1);
          count = count + 1;
        }
      }
      let expectedCount: int = 2;
      expect(count).assertEqual(expectedCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4500
     * @tc.name testInt16ArrayOverviewTestFour045
     * @tc.desc Verify new Int16Array throws RangeError zero-byte ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        let arr: Int16Array = new Int16Array(buf, 0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4600
     * @tc.name testInt16ArrayOverviewTestFour046
     * @tc.desc Verify Int16Array.from(Uint16Array) wraps unsigned values to signed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(0, 32767, 32768, 65535);
      const result: Int16Array = Int16Array.from(source);
      const actualValues: string = result.join(',');
      const expectedValues: string = '0,32767,-32768,-1';
      expect(actualValues).assertEqual(expectedValues);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4700
     * @tc.name testInt16ArrayOverviewTestFour047
     * @tc.desc Verify set(ArrayLike) rejects a negative offset with RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Int16Array = Int16Array.of(5, 6);
      const source: Float64Array = Float64Array.of(1);
      try {
        target.set(source, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4800
     * @tc.name testInt16ArrayOverviewTestFour048
     * @tc.desc Verify set(ArrayLike) rejects a nonempty source at target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Int16Array = Int16Array.of(5, 6);
      const source: Float64Array = Float64Array.of(1);
      try {
        target.set(source, target.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_4900
     * @tc.name testInt16ArrayOverviewTestFour049
     * @tc.desc Verify set(ArrayLike) rejects a source exceeding remaining space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Int16Array = Int16Array.of(5, 6);
      const source: Float64Array = Float64Array.of(1, 2);
      try {
        target.set(source, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const actualValues: string = target.join(',');
      const expectedValues: string = '5,6';
      expect(actualValues).assertEqual(expectedValues);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5000
     * @tc.name testInt16ArrayOverviewTestFour050
     * @tc.desc Verify includes(number, undefined) searches from index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const array: Int16Array = Int16Array.of(10, 20, 30);
      const searchValue: number = 10;
      const actualResult: boolean = array.includes(searchValue, undefined);
      expect(actualResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5100
     * @tc.name testInt16ArrayOverviewTestFour051
     * @tc.desc Verify includes(number, negative fromIndex) normalizes from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const array: Int16Array = Int16Array.of(10, 20, 30);
      const searchValue: number = 10;
      const fromIndex: int = -2;
      const actualResult: boolean = array.includes(searchValue, fromIndex);
      expect(actualResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5200
     * @tc.name testInt16ArrayOverviewTestFour052
     * @tc.desc Verify lastIndexOf(number, undefined) uses the SDK start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const array: Int16Array = Int16Array.of(7, 7, 9);
      const searchValue: number = 7;
      const actualIndex: int = array.lastIndexOf(searchValue, undefined);
      const expectedIndex: int = 0;
      expect(actualIndex).assertEqual(expectedIndex);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5300
     * @tc.name testInt16ArrayOverviewTestFour053
     * @tc.desc Verify copyWithin overlapping ranges copy from a stable source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const array: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      const result: Int16Array = array.copyWithin(2, 0, 4);
      const actualValues: string = result.join(',');
      const expectedValues: string = '1,2,1,2,3';
      expect(actualValues).assertEqual(expectedValues);
      expect(result).assertEqual(array);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5400
     * @tc.name testInt16ArrayOverviewTestFour054
     * @tc.desc Verify slice copies and subarray shares a nonzero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const backing: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      const parent: Int16Array = new Int16Array(backing.buffer, 2, 3);
      const copied: Int16Array = parent.slice(1, 3);
      const shared: Int16Array = parent.subarray(1, 3);
      expect(copied.buffer).not().assertEqual(parent.buffer);
      const sharedBuffer: ArrayBuffer = shared.buffer;
      const parentBuffer: ArrayBuffer = parent.buffer;
      expect(sharedBuffer).assertEqual(parentBuffer);
      copied.$_set(0, 99);
      shared.$_set(0, 88);
      const copiedValue: number = copied.$_get(0);
      const expectedCopiedValue: int = 99;
      expect(copiedValue).assertEqual(expectedCopiedValue);
      const parentValue: number = parent.$_get(1);
      const expectedParentValue: int = 88;
      expect(parentValue).assertEqual(expectedParentValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5500
     * @tc.name testInt16ArrayOverviewTestFour055
     * @tc.desc Verify Int16Array constructor rejects an object cast to int with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unsupported: Object = new Object();
      try {
        const invalidLength: int = unsupported as object as int;
        new Int16Array(invalidLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5600
     * @tc.name testInt16ArrayOverviewTestFour056
     * @tc.desc Verify Int16Array constructor rejects an object cast to ArrayBuffer with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unsupported: Object = new Object();
      try {
        const invalidBuffer: ArrayBuffer = unsupported as object as ArrayBuffer;
        new Int16Array(invalidBuffer);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5700
     * @tc.name testInt16ArrayOverviewTestFour057
     * @tc.desc Verify Int16Array.from rejects an object cast to Array with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unsupported: Object = new Object();
      try {
        const invalidSource: Array<int> = unsupported as object as Array<int>;
        Int16Array.from(invalidSource);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5800
     * @tc.name testInt16ArrayOverviewTestFour058
     * @tc.desc Verify Int16Array.from rejects an object cast to map function with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unsupported: Object = new Object();
      try {
        const invalidMapFn: (v: number, k: number) => number = unsupported as object as (
          v: number,
          k: number,
        ) => number;
        Int16Array.from(Int16Array.of(1, 2), invalidMapFn);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_5900
     * @tc.name testInt16ArrayOverviewTestFour059
     * @tc.desc Verify Int16Array.of rejects an object cast to number with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unsupported: Object = new Object();
      try {
        const invalidItem: number = unsupported as object as number;
        Int16Array.of(invalidItem);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_6000
     * @tc.name testInt16ArrayOverviewTestFour060
     * @tc.desc Verify set rejects an object cast to ArrayLike with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidSource: ArrayLike<number> = unsupported as object as ArrayLike<number>;
        arr.set(invalidSource);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_6100
     * @tc.name testInt16ArrayOverviewTestFour061
     * @tc.desc Verify includes rejects an object cast to number with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidSearch: number = unsupported as object as number;
        arr.includes(invalidSearch);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OVERVIEW_FOUR_6200
     * @tc.name testInt16ArrayOverviewTestFour062
     * @tc.desc Verify indexOf rejects an object cast to int fromIndex with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayOverviewTestFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1, 2, 3);
      const unsupported: Object = new Object();
      try {
        const invalidFromIndex: int = unsupported as object as int;
        arr.indexOf(1, invalidFromIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
