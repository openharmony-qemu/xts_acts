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

export default function uint32ArrayReduceRightTwoTest(): void {
  describe('Uint32ArrayReduceRightTwoTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0100
     * @tc.name testUint32ArrayReduceRightTwo001
     * @tc.desc Verify arity-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0200
     * @tc.name testUint32ArrayReduceRightTwo002
     * @tc.desc Verify arity-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 10, 15);
      const r = values.reduceRight((prev: number, curr: number, index: int): number => prev + curr);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0300
     * @tc.name testUint32ArrayReduceRightTwo003
     * @tc.desc Verify arity-2 prev curr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const r = values.reduceRight((prev: number, curr: number): number => prev * curr);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0400
     * @tc.name testUint32ArrayReduceRightTwo004
     * @tc.desc Verify arity-1 prev
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const r = values.reduceRight((prev: number): number => prev);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0500
     * @tc.name testUint32ArrayReduceRightTwo005
     * @tc.desc Verify arity-0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const r = values.reduceRight((): number => 7);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0600
     * @tc.name testUint32ArrayReduceRightTwo006
     * @tc.desc Verify arity-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev - curr);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0700
     * @tc.name testUint32ArrayReduceRightTwo007
     * @tc.desc Verify previousValue uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 4294967295);
      let firstPrev: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstPrev = prev; }
        return prev;
      });
      expect(firstPrev).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0800
     * @tc.name testUint32ArrayReduceRightTwo008
     * @tc.desc Verify previousValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 0);
      let firstPrev: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstPrev = prev; }
        return prev;
      });
      expect(firstPrev).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_0900
     * @tc.name testUint32ArrayReduceRightTwo009
     * @tc.desc Verify previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 2, 1);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev - curr);
      expect(r).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1000
     * @tc.name testUint32ArrayReduceRightTwo010
     * @tc.desc Verify previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000, 1000, 1000);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev * curr);
      expect(r).assertEqual(1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1100
     * @tc.name testUint32ArrayReduceRightTwo011
     * @tc.desc Verify previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1200
     * @tc.name testUint32ArrayReduceRightTwo012
     * @tc.desc Verify callCount for 2-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 8);
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        return prev + curr;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1300
     * @tc.name testUint32ArrayReduceRightTwo013
     * @tc.desc Verify previousValue 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 0x80000000);
      let firstPrev: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstPrev = prev; }
        return prev;
      });
      expect(firstPrev).assertEqual(0x80000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1400
     * @tc.name testUint32ArrayReduceRightTwo014
     * @tc.desc Verify previousValue int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2147483647);
      let firstPrev: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstPrev = prev; }
        return prev;
      });
      expect(firstPrev).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1500
     * @tc.name testUint32ArrayReduceRightTwo015
     * @tc.desc Verify previousValue 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 0);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1600
     * @tc.name testUint32ArrayReduceRightTwo016
     * @tc.desc Verify previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let seq: number[] = [];
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        seq.push(prev);
        return prev + curr;
      });
      expect(seq[0]).assertEqual(30);
      expect(seq[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1700
     * @tc.name testUint32ArrayReduceRightTwo017
     * @tc.desc Verify currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let seq: number[] = [];
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        seq.push(curr);
        return prev + curr;
      });
      expect(seq[0]).assertEqual(20);
      expect(seq[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1800
     * @tc.name testUint32ArrayReduceRightTwo018
     * @tc.desc Verify currentValue uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 1);
      let firstCurr: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstCurr = curr; }
        return prev;
      });
      expect(firstCurr).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_1900
     * @tc.name testUint32ArrayReduceRightTwo019
     * @tc.desc Verify currentValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 1);
      let firstCurr: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstCurr = curr; }
        return prev;
      });
      expect(firstCurr).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2000
     * @tc.name testUint32ArrayReduceRightTwo020
     * @tc.desc Verify currentValue int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2147483647, 1);
      let firstCurr: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstCurr = curr; }
        return prev;
      });
      expect(firstCurr).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2100
     * @tc.name testUint32ArrayReduceRightTwo021
     * @tc.desc Verify currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 8);
      let firstCurr: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstCurr = curr; }
        return prev;
      });
      expect(firstCurr).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2200
     * @tc.name testUint32ArrayReduceRightTwo022
     * @tc.desc Verify currentValue 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFF, 1);
      let firstCurr: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstCurr = curr; }
        return prev;
      });
      expect(firstCurr).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2300
     * @tc.name testUint32ArrayReduceRightTwo023
     * @tc.desc Verify currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i = 1; i <= 100; i++) { src.push(i); }
      const values = new Uint32Array(src);
      let firstCurr: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstCurr = curr; }
        return prev;
      });
      expect(firstCurr).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2400
     * @tc.name testUint32ArrayReduceRightTwo024
     * @tc.desc Verify currentIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let seq: number[] = [];
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        seq.push(index);
        return prev + curr;
      });
      expect(seq[0]).assertEqual(1);
      expect(seq[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2500
     * @tc.name testUint32ArrayReduceRightTwo025
     * @tc.desc Verify currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let seq: number[] = [];
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        seq.push(index);
        return prev + curr;
      });
      expect(seq.length).assertEqual(3);
      expect(seq[0]).assertEqual(2);
      expect(seq[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2600
     * @tc.name testUint32ArrayReduceRightTwo026
     * @tc.desc Verify currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      let seq: number[] = [];
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        seq.push(index);
        return prev;
      });
      expect(seq.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2700
     * @tc.name testUint32ArrayReduceRightTwo027
     * @tc.desc Verify currentIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 8);
      let firstIdx: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 1) { firstIdx = index; }
        return prev + curr;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2800
     * @tc.name testUint32ArrayReduceRightTwo028
     * @tc.desc Verify currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        if (index % 2 === 0) { return prev + curr; }
        return prev;
      });
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_2900
     * @tc.name testUint32ArrayReduceRightTwo029
     * @tc.desc Verify currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40);
      let evenCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        if (index % 2 === 0) { evenCount = evenCount + 1; }
        return prev;
      });
      expect(evenCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3000
     * @tc.name testUint32ArrayReduceRightTwo030
     * @tc.desc Verify currentIndex length-1-idx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let revSeq: number[] = [];
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        revSeq.push(array.length - 1 - index);
        return prev + curr;
      });
      expect(revSeq[0]).assertEqual(1);
      expect(revSeq[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3100
     * @tc.name testUint32ArrayReduceRightTwo031
     * @tc.desc Verify currentIndex length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      let allBelow: boolean = true;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        if (index >= array.length - 1) { allBelow = false; }
        return prev + curr;
      });
      expect(allBelow).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3200
     * @tc.name testUint32ArrayReduceRightTwo032
     * @tc.desc Verify currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let idxSum: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        idxSum = idxSum + index;
        return prev + curr;
      });
      expect(idxSum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3300
     * @tc.name testUint32ArrayReduceRightTwo033
     * @tc.desc Verify currentIndex length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      let maxIdx: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        if (index > maxIdx) { maxIdx = index; }
        return prev + curr;
      });
      expect(maxIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3400
     * @tc.name testUint32ArrayReduceRightTwo034
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let sameRef: boolean = false;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        sameRef = (array === values);
        return prev + curr;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3500
     * @tc.name testUint32ArrayReduceRightTwo035
     * @tc.desc Verify array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let arrLen: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        arrLen = array.length;
        return prev + curr;
      });
      expect(arrLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3600
     * @tc.name testUint32ArrayReduceRightTwo036
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let elem0: number = 0;
      let elem2: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        elem0 = array.$_get(0);
        elem2 = array.$_get(2);
        return prev + curr;
      });
      expect(elem0).assertEqual(10);
      expect(elem2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3700
     * @tc.name testUint32ArrayReduceRightTwo037
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const r = values.reduceRight(
        (prev: number, curr: number, index: int, array: Uint32Array): number => prev + array.$_get(2))
      ;
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3800
     * @tc.name testUint32ArrayReduceRightTwo038
     * @tc.desc Verify array reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(1)).assertEqual(20);
      expect(values.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_3900
     * @tc.name testUint32ArrayReduceRightTwo039
     * @tc.desc Verify array.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let byteLen: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        byteLen = array.byteLength;
        return prev + curr;
      });
      expect(byteLen).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4000
     * @tc.name testUint32ArrayReduceRightTwo040
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let sameCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        if (array === values) { sameCount = sameCount + 1; }
        return prev + curr;
      });
      expect(sameCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4100
     * @tc.name testUint32ArrayReduceRightTwo041
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let innerSum: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        innerSum = 0;
        for (let i = 0; i < array.length; i++) { innerSum = innerSum + array.$_get(i); }
        return prev + curr;
      });
      expect(innerSum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4200
     * @tc.name testUint32ArrayReduceRightTwo042
     * @tc.desc Verify array subarray reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40);
      const view = base.subarray(1, 4);
      const r = view.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4300
     * @tc.name testUint32ArrayReduceRightTwo043
     * @tc.desc Verify array currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let collected: number[] = [];
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        collected.push(array.$_get(index));
        return prev + curr;
      });
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual(2);
      expect(collected[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4400
     * @tc.name testUint32ArrayReduceRightTwo044
     * @tc.desc Verify array byteOffset subarray 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40);
      const view = base.subarray(1, 3);
      let offset: number = 0;
      view.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        offset = array.byteOffset;
        return prev + curr;
      });
      expect(offset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4500
     * @tc.name testUint32ArrayReduceRightTwo045
     * @tc.desc Verify array subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40);
      const view = base.subarray(0, 3);
      let sameRef: boolean = false;
      view.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        sameRef = (array === view);
        return prev + curr;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4600
     * @tc.name testUint32ArrayReduceRightTwo046
     * @tc.desc Verify uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => 4294967295);
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4700
     * @tc.name testUint32ArrayReduceRightTwo047
     * @tc.desc Verify reduceRight returns -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => -5);
      expect(r).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4800
     * @tc.name testUint32ArrayReduceRightTwo048
     * @tc.desc Verify NaN previousValue NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 10, 15);
      let secondPrev: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 2) { secondPrev = prev; }
        return Number.NaN;
      });
      let isNan: boolean = isNaN(secondPrev);
      expect(isNan).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_4900
     * @tc.name testUint32ArrayReduceRightTwo049
     * @tc.desc Verify Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const r = values.reduceRight(
        (prev: number, curr: number, index: int, array: Uint32Array): number => Number.POSITIVE_INFINITY)
      ;
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5000
     * @tc.name testUint32ArrayReduceRightTwo050
     * @tc.desc Verify reduceRight subtraction of(100,10,1) returns -109
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 10, 1);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev - curr);
      expect(r).assertEqual(-109);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5100
     * @tc.name testUint32ArrayReduceRightTwo051
     * @tc.desc Verify reduceRight sum of(7,8) returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7, 8);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5200
     * @tc.name testUint32ArrayReduceRightTwo052
     * @tc.desc Verify uint32 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 1);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5300
     * @tc.name testUint32ArrayReduceRightTwo053
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 5, 10);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev * curr);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5400
     * @tc.name testUint32ArrayReduceRightTwo054
     * @tc.desc Verify reduceRight product of(2,3,4) returns 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2, 3, 4);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev * curr);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5500
     * @tc.name testUint32ArrayReduceRightTwo055
     * @tc.desc Verify reduceRight sum of(1,2,3) returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5600
     * @tc.name testUint32ArrayReduceRightTwo056
     * @tc.desc Verify length reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5700
     * @tc.name testUint32ArrayReduceRightTwo057
     * @tc.desc Verify reduceRight of(1,1) subtraction returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 1);
      const r = values.reduceRight(
        (prev: number, curr: number, index: int, array: Uint32Array): number => prev - curr - curr)
      ;
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5800
     * @tc.name testUint32ArrayReduceRightTwo058
     * @tc.desc Verify reduceRight sum of 1..100 returns 5050
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i = 1; i <= 100; i++) { src.push(i); }
      const values = new Uint32Array(src);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(5050);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_5900
     * @tc.name testUint32ArrayReduceRightTwo059
     * @tc.desc Verify reduceRight sum of(5,5,5) returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 5, 5);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6000
     * @tc.name testUint32ArrayReduceRightTwo060
     * @tc.desc Verify uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6100
     * @tc.name testUint32ArrayReduceRightTwo061
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6200
     * @tc.name testUint32ArrayReduceRightTwo062
     * @tc.desc Verify reduceRight initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      try {
        values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6300
     * @tc.name testUint32ArrayReduceRightTwo063
     * @tc.desc Verify Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      try {
        values.reduceRight(
          (prev: number, curr: number, index: int, array: Uint32Array): number => { throw new Error('boom'); })
        ;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6400
     * @tc.name testUint32ArrayReduceRightTwo064
     * @tc.desc Verify reduceRight throws on first callback, callCount 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let callCount: number = 0;
      try {
        values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
          callCount = callCount + 1;
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6500
     * @tc.name testUint32ArrayReduceRightTwo065
     * @tc.desc Verify reduceRight throws on 2nd callback of(1,2,3,4), callCount 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let callCount: number = 0;
      try {
        values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
          callCount = callCount + 1;
          if (callCount === 2) { throw new Error('middle'); }
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6600
     * @tc.name testUint32ArrayReduceRightTwo066
     * @tc.desc Verify reduceRight throws on 2nd callback of(10,20,30), callCount 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let callCount: number = 0;
      try {
        values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
          callCount = callCount + 1;
          if (callCount === 2) { throw new Error('last'); }
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6700
     * @tc.name testUint32ArrayReduceRightTwo067
     * @tc.desc Verify reduceRight single element of(99) returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(99);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6800
     * @tc.name testUint32ArrayReduceRightTwo068
     * @tc.desc Verify reduceRight throws Error, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      try {
        values.reduceRight(
          (prev: number, curr: number, index: int, array: Uint32Array): number => { throw new Error('boom'); })
        ;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_6900
     * @tc.name testUint32ArrayReduceRightTwo069
     * @tc.desc Verify uint32 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 4294967295);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(8589934590);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7000
     * @tc.name testUint32ArrayReduceRightTwo070
     * @tc.desc Verify reduceRight subtraction of(5,3,1) returns -7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 3, 1);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev - curr);
      expect(r).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7100
     * @tc.name testUint32ArrayReduceRightTwo071
     * @tc.desc Verify 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(65536, 65536, 2);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev * curr);
      expect(r).assertEqual(8589934592);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7200
     * @tc.name testUint32ArrayReduceRightTwo072
     * @tc.desc Verify previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 2, 1);
      let seq: number[] = [];
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        seq.push(prev);
        return prev - curr;
      });
      expect(seq[0]).assertEqual(1);
      expect(seq[1]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7300
     * @tc.name testUint32ArrayReduceRightTwo073
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 0, 0);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7400
     * @tc.name testUint32ArrayReduceRightTwo074
     * @tc.desc Verify uint32 2^32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 4294967295, 4294967295, 4294967295);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(17179869180);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7500
     * @tc.name testUint32ArrayReduceRightTwo075
     * @tc.desc Verify 0 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 4294967295, 0);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7600
     * @tc.name testUint32ArrayReduceRightTwo076
     * @tc.desc Verify NaN previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let recorded: number = 0;
      let callCount: number = 0;
      values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => {
        callCount = callCount + 1;
        if (callCount === 3) { recorded = prev; }
        return Number.NaN;
      });
      let isNan: boolean = isNaN(recorded);
      expect(isNan).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7700
     * @tc.name testUint32ArrayReduceRightTwo077
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2, 1, 0);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev - curr);
      expect(r).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_REDUCERIGHT_TWO_7800
     * @tc.name testUint32ArrayReduceRightTwo078
     * @tc.desc Verify int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayReduceRightTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2147483647, 2147483647);
      const r = values.reduceRight((prev: number, curr: number, index: int, array: Uint32Array): number => prev + curr);
      expect(r).assertEqual(4294967294);
    });

  });
}
