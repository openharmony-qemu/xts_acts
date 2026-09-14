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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayFromTest03(): void {
  describe('Int16ArrayFromTest03', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0100
     * @tc.name testInt16ArrayFromTestThree001
     * @tc.desc Verify Int16Array.from result BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1]);
      const result = Int16Array.from(src);
      let r1: int = result.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0200
     * @tc.name testInt16ArrayFromTestThree002
     * @tc.desc Verify Int16Array.from result is not the same object as source (different identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      let r1: boolean = result === src;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0300
     * @tc.name testInt16ArrayFromTestThree003
     * @tc.desc Verify Int16Array.from result buffer is different from source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      const srcBuf = src.buffer;
      const resultBuf = result.buffer;
      let r1: boolean = resultBuf === srcBuf;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0400
     * @tc.name testInt16ArrayFromTestThree004
     * @tc.desc Verify Int16Array.from result byteOffset is 0 for a fresh copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20]);
      const result = Int16Array.from(src);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0500
     * @tc.name testInt16ArrayFromTestThree005
     * @tc.desc Verify Int16Array.from result byteLength matches source byteLength when source owns full buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([7, 8, 9]);
      const result = Int16Array.from(src);
      let r1: int = result.byteLength;
      let e1: number = src.byteLength;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0600
     * @tc.name testInt16ArrayFromTestThree006
     * @tc.desc Verify Modify source element at index 0 via $_set after Int16Array.from ensures result element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20]);
      const result = Int16Array.from(src);
      src.$_set(0, 999);
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0700
     * @tc.name testInt16ArrayFromTestThree007
     * @tc.desc Verify Modify source element at last index via $_set after Int16Array.from ensures result unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3, 4]);
      const result = Int16Array.from(src);
      src.$_set(3, 999);
      let r1: number = result.$_get(3);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0800
     * @tc.name testInt16ArrayFromTestThree008
     * @tc.desc Verify Modify source via fill after Int16Array.from ensures all result elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 5, 5]);
      const result = Int16Array.from(src);
      src.fill(0);
      let r1: number = result.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_0900
     * @tc.name testInt16ArrayFromTestThree009
     * @tc.desc Verify Int16Array.from Modify result element at index 0 via $_set ensures source element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([30, 40]);
      const result = Int16Array.from(src);
      result.$_set(0, 777);
      let r1: number = src.$_get(0);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1000
     * @tc.name testInt16ArrayFromTestThree010
     * @tc.desc Verify Int16Array.from Modify result element at last index via $_set ensures source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3, 4]);
      const result = Int16Array.from(src);
      result.$_set(3, 999);
      let r1: number = src.$_get(3);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1100
     * @tc.name testInt16ArrayFromTestThree011
     * @tc.desc Verify Int16Array.from Modify result via fill ensures all source elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([7, 7, 7]);
      const result = Int16Array.from(src);
      result.fill(-1);
      let r1: number = src.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = src.$_get(2);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1200
     * @tc.name testInt16ArrayFromTestThree012
     * @tc.desc Verify Int16Array.from result join output matches source join output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([-5, 0, 5, 10]);
      const result = Int16Array.from(src);
      let r1: string = result.join(',');
      let e1: string = src.join(',');
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1300
     * @tc.name testInt16ArrayFromTestThree013
     * @tc.desc Verify Int16Array.from result toString output matches source toString output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      let r1: string = result.toString();
      let e1: string = src.toString();
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1400
     * @tc.name testInt16ArrayFromTestThree014
     * @tc.desc Verify Chained Int16Array.from(from(src)) preserves all elements through double copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([11, 22, 33]);
      const result = Int16Array.from(Int16Array.from(src));
      let r1: number = result.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 22;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 33;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1500
     * @tc.name testInt16ArrayFromTestThree015
     * @tc.desc Verify Triple chained Int16Array.from(from(from(src))) preserves all elements through triple copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 15, 25]);
      const result = Int16Array.from(Int16Array.from(Int16Array.from(src)));
      let r1: number = result.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 25;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1600
     * @tc.name testInt16ArrayFromTestThree016
     * @tc.desc Verify Chained Int16Array.from creates independent copies at each level (modify middle copy does not affect final)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const mid = Int16Array.from(src);
      const result = Int16Array.from(mid);
      mid.$_set(0, 999);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1700
     * @tc.name testInt16ArrayFromTestThree017
     * @tc.desc Verify Chained Int16Array.from creates independent copies at each level (modify final does not affect middle)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20]);
      const mid = Int16Array.from(src);
      const result = Int16Array.from(mid);
      result.$_set(1, 888);
      let r1: number = mid.$_get(1);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1800
     * @tc.name testInt16ArrayFromTestThree018
     * @tc.desc Verify Int16Array.from result forEach visits same elements in same order as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 3, 5, 7]);
      const result = Int16Array.from(src);
      const resultValues: number[] = [];
      result.forEach((v: number, _idx: int) => {
        resultValues.push(v);
      });
      let r1: number = resultValues[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = resultValues[3];
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_1900
     * @tc.name testInt16ArrayFromTestThree019
     * @tc.desc Verify Int16Array.from result entries iterator produces same index-value pairs as source entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20]);
      const result = Int16Array.from(src);
      for (const entry of result.entries()) {
        let r1: boolean = entry[0] >= 0;
        expect(r1).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2000
     * @tc.name testInt16ArrayFromTestThree020
     * @tc.desc Verify Int16Array.from result keys iterator produces same indices as source keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 10, 15]);
      const result = Int16Array.from(src);
      let count: int = 0;
      for (const k of result.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2100
     * @tc.name testInt16ArrayFromTestThree021
     * @tc.desc Verify Int16Array.from result values iterator produces same values as source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([100, 200, 300]);
      const result = Int16Array.from(src);
      const vals: number[] = [];
      for (const v of result.values()) {
        vals.push(v);
      }
      let r1: number = vals[0];
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = vals[2];
      let e2: int = 300;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2200
     * @tc.name testInt16ArrayFromTestThree022
     * @tc.desc Verify Int16Array.from result every callback matches source every callback outcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([2, 4, 6, 8]);
      const result = Int16Array.from(src);
      const allEven = result.every((v: number) => v % 2 === 0);
      expect(allEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2300
     * @tc.name testInt16ArrayFromTestThree023
     * @tc.desc Verify Int16Array.from result some callback outcome independent of source mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([0, 0, 3, 0]);
      const result = Int16Array.from(src);
      src.$_set(2, 0);
      const hasPositive = result.some((v: number) => v > 0);
      expect(hasPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2400
     * @tc.name testInt16ArrayFromTestThree024
     * @tc.desc Verify Int16Array.from result includes returns same as source includes for a present value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3, -1]);
      const result = Int16Array.from(src);
      let r1: boolean = result.includes(-1);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2500
     * @tc.name testInt16ArrayFromTestThree025
     * @tc.desc Verify Int16Array.from result includes returns same as source includes for an absent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      let r1: boolean = result.includes(999);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2600
     * @tc.name testInt16ArrayFromTestThree026
     * @tc.desc Verify Int16Array.from result indexOf returns same index as source for first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20, 10, 30]);
      const result = Int16Array.from(src);
      let r1: int = result.indexOf(10);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2700
     * @tc.name testInt16ArrayFromTestThree027
     * @tc.desc Verify Int16Array.from result lastIndexOf returns same index as source for last occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20, 10, 30]);
      const result = Int16Array.from(src);
      let r1: int = result.lastIndexOf(10);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2800
     * @tc.name testInt16ArrayFromTestThree028
     * @tc.desc Verify Int16Array.from result $_get with negative index -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      try {
        result.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_2900
     * @tc.name testInt16ArrayFromTestThree029
     * @tc.desc Verify Int16Array.from result $_get with index equal to length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      try {
        result.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_3000
     * @tc.name testInt16ArrayFromTestThree030
     * @tc.desc Verify Int16Array.from result $_get with index beyond length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2]);
      const result = Int16Array.from(src);
      try {
        result.$_get(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_3100
     * @tc.name testInt16ArrayFromTestThree031
     * @tc.desc Verify from with source constructed via Int16Array.from of another array preserves all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Int16Array([33, 66, 99]);
      const src = Int16Array.from(original);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 33;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(2);
      let e2: int = 99;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_3200
     * @tc.name testInt16ArrayFromTestThree032
     * @tc.desc Verify Int16Array.from with valid Int16Array source preserves element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3]);
      const result = Int16Array.from(src);
      let r1: number = result.$_get(1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_3600
     * @tc.name testInt16ArrayFromTestThree036
     * @tc.desc Verify Int16Array.from [-0] converts negative zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-0];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_4500
     * @tc.name testInt16ArrayFromTestThree045
     * @tc.desc Verify Int16Array.from [32769] wraps to -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [32769];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_4600
     * @tc.name testInt16ArrayFromTestThree046
     * @tc.desc Verify Int16Array.from [-32770] wraps to 32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32770];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32766;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_4900
     * @tc.name testInt16ArrayFromTestThree049
     * @tc.desc Verify Int16Array.from [NaN] coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_5000
     * @tc.name testInt16ArrayFromTestThree050
     * @tc.desc Verify Int16Array.from [Infinity] coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.POSITIVE_INFINITY];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_5100
     * @tc.name testInt16ArrayFromTestThree051
     * @tc.desc Verify Int16Array.from [-Infinity] coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-Number.POSITIVE_INFINITY];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_5200
     * @tc.name testInt16ArrayFromTestThree052
     * @tc.desc Verify Int16Array.from [3.7] truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [3.7];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_5600
     * @tc.name testInt16ArrayFromTestThree056
     * @tc.desc Verify Int16Array.from [32767.9] truncates to 32767 without wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [32767.9];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_5700
     * @tc.name testInt16ArrayFromTestThree057
     * @tc.desc Verify Int16Array.from [-32768.9] truncates to -32768 without wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-32768.9];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_5800
     * @tc.name testInt16ArrayFromTestThree058
     * @tc.desc Verify Int16Array.from [32768.5] truncates then wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [32768.5];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_5900
     * @tc.name testInt16ArrayFromTestThree059
     * @tc.desc Verify Int16Array.from [-32769.5] truncates then wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-32769.5];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_6100
     * @tc.name testInt16ArrayFromTestThree061
     * @tc.desc Verify Int16Array.from [-1,-2,-3] keeps all negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-1, -2, -3];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_6200
     * @tc.name testInt16ArrayFromTestThree062
     * @tc.desc Verify Int16Array.from [0,1,-1] keeps mixed zero positive negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0, 1, -1];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_6400
     * @tc.name testInt16ArrayFromTestThree064
     * @tc.desc Verify Int16Array.from [-32768,0,32767] keeps extremes with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32768, 0, 32767];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_6500
     * @tc.name testInt16ArrayFromTestThree065
     * @tc.desc Verify Int16Array.from [-32769,32768] wraps both overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32769, 32768];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_6600
     * @tc.name testInt16ArrayFromTestThree066
     * @tc.desc Verify Int16Array.from [-32769,0,32768] wraps overflows with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32769, 0, 32768];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_6700
     * @tc.name testInt16ArrayFromTestThree067
     * @tc.desc Verify Int16Array.from [42,42,42,42] keeps repeated positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [42, 42, 42, 42];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 42;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 42;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 42;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_6900
     * @tc.name testInt16ArrayFromTestThree069
     * @tc.desc Verify Int16Array.from [-32768,-32768,-32768] keeps repeated int16 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32768, -32768, -32768];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7000
     * @tc.name testInt16ArrayFromTestThree070
     * @tc.desc Verify Int16Array.from [32767,32767,32767] keeps repeated int16 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [32767, 32767, 32767];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7100
     * @tc.name testInt16ArrayFromTestThree071
     * @tc.desc Verify Int16Array.from [NaN,Infinity,-Infinity] coerces specials to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7200
     * @tc.name testInt16ArrayFromTestThree072
     * @tc.desc Verify Int16Array.from [NaN,0,NaN] keeps middle zero with NaN neighbors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN, 0, Number.NaN];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7300
     * @tc.name testInt16ArrayFromTestThree073
     * @tc.desc Verify Int16Array.from [1.5,2.7,3.2] truncates positive floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1.5, 2.7, 3.2];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7400
     * @tc.name testInt16ArrayFromTestThree074
     * @tc.desc Verify Int16Array.from [-1.5,-2.7,-3.2] truncates negative floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-1.5, -2.7, -3.2];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -2;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7500
     * @tc.name testInt16ArrayFromTestThree075
     * @tc.desc Verify Int16Array.from [0.5,-0.5,1.5,-1.5] truncates mixed floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [0.5, -0.5, 1.5, -1.5];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -1;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7600
     * @tc.name testInt16ArrayFromTestThree076
     * @tc.desc Verify Int16Array.from [32767.9,32768.5] boundary float truncate and wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [32767.9, 32768.5];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7700
     * @tc.name testInt16ArrayFromTestThree077
     * @tc.desc Verify Int16Array.from [-32768.9,-32769.5] negative boundary float truncate and wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-32768.9, -32769.5];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7800
     * @tc.name testInt16ArrayFromTestThree078
     * @tc.desc Verify Int16Array.from [1,-1,2,-2,3,-3] keeps alternating signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, -1, 2, -2, 3, -3];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -2;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(4);
      let e5: int = 3;
      expect(r5).assertEqual(e5);
      let r6: number = result.$_get(5);
      let e6: int = -3;
      expect(r6).assertEqual(e6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_7900
     * @tc.name testInt16ArrayFromTestThree079
     * @tc.desc Verify Int16Array.from [0,1,2,3,4] keeps ascending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0, 1, 2, 3, 4];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 3;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(4);
      let e5: int = 4;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8000
     * @tc.name testInt16ArrayFromTestThree080
     * @tc.desc Verify Int16Array.from [-4,-3,-2,-1,0] keeps negative ascending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-4, -3, -2, -1, 0];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -4;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -3;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -2;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -1;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(4);
      let e5: int = 0;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8100
     * @tc.name testInt16ArrayFromTestThree081
     * @tc.desc Verify Int16Array.from [-32769,32768,32767] mixes wraps with MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32769, 32768, 32767];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8200
     * @tc.name testInt16ArrayFromTestThree082
     * @tc.desc Verify Int16Array.from [-32769,32768,-1,1] mixes wraps with normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32769, 32768, -1, 1];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 1;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8300
     * @tc.name testInt16ArrayFromTestThree083
     * @tc.desc Verify Int16Array.from [32767,32768,32769] MAX neighborhood overflow sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [32767, 32768, 32769];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8400
     * @tc.name testInt16ArrayFromTestThree084
     * @tc.desc Verify Int16Array.from [32767,-32768,32767,-32768] alternates MAX and MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [32767, -32768, 32767, -32768];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -32768;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8500
     * @tc.name testInt16ArrayFromTestThree085
     * @tc.desc Verify Int16Array.from 100 ones keeps length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = new FixedArray<int>(100);
      for (let i: int = 0; i < 100; i++) {
        src[i] = 1;
      }
      let result: Int16Array = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(99);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8600
     * @tc.name testInt16ArrayFromTestThree086
     * @tc.desc Verify Int16Array.from 100 mixed boundary values keeps ends and middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = new FixedArray<int>(100);
      for (let i: int = 0; i < 100; i++) {
        src[i] = -32768;
      }
      src[0] = 32767;
      src[50] = 0;
      src[99] = 32767;
      let result: Int16Array = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(50);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(99);
      let e4: int = 32767;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(1);
      let e5: int = -32768;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8700
     * @tc.name testInt16ArrayFromTestThree087
     * @tc.desc Verify Int16Array.from runtime arithmetic expression values convert correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [10 + 20, 50 - 60, 2 * 3];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 6;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8800
     * @tc.name testInt16ArrayFromTestThree088
     * @tc.desc Verify Int16Array.from [-1.0,-2.0] keeps negative float-represented integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-1.0, -2.0];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_8900
     * @tc.name testInt16ArrayFromTestThree089
     * @tc.desc Verify Int16Array.from [0,-0,0,-0] stores zeros and negative zeros as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [0, -0, 0, -0];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 0;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_9000
     * @tc.name testInt16ArrayFromTestThree090
     * @tc.desc Verify Int16Array.from representative int16 domain values convert correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32768, -16384, -1, 0, 1, 16384, 32767];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -16384;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 0;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(4);
      let e5: int = 1;
      expect(r5).assertEqual(e5);
      let r6: number = result.$_get(5);
      let e6: int = 16384;
      expect(r6).assertEqual(e6);
      let r7: number = result.$_get(6);
      let e7: int = 32767;
      expect(r7).assertEqual(e7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_9400
     * @tc.name testInt16ArrayFromTestThree094
     * @tc.desc Verify Int16Array.from non-empty result byteLength equals length times 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4, 5];
      let result: Int16Array = Int16Array.from(src);
      let r1: int = result.byteLength;
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_9500
     * @tc.name testInt16ArrayFromTestThree095
     * @tc.desc Verify Int16Array.from $_get(0) returns normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [42, 100];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_9600
     * @tc.name testInt16ArrayFromTestThree096
     * @tc.desc Verify Int16Array.from $_get(0) coerces NaN to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN, 5];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_THREE_9700
     * @tc.name testInt16ArrayFromTestThree097
     * @tc.desc Verify Int16Array.from $_get(length-1) returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestThree097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4, 5];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(4);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });
  });
}

