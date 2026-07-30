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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';


export default function uint8ClampedArrayReduceRightTwoTest(): void {
  describe('Uint8ClampedArrayReduceRightTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0100
     * @tc.name testUint8ClampedArrayReduceRightTwo001
     * @tc.desc Verify reduceRight does not mutate original array elements returning currentValue c yields leftmost element 7 for [7,8,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => c);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0200
     * @tc.name testUint8ClampedArrayReduceRightTwo002
     * @tc.desc Verify reduceRight on [100,200,50] without initialValue, callback always returns 0 yields result 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 200, 50]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0300
     * @tc.name testUint8ClampedArrayReduceRightTwo003
     * @tc.desc Verify reduceRight multiplication without initialValue returns product 24 for [2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([2, 3, 4]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p * c);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0400
     * @tc.name testUint8ClampedArrayReduceRightTwo004
     * @tc.desc Verify reduceRight subtract [10,20,30] without initialValue returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p - c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0500
     * @tc.name testUint8ClampedArrayReduceRightTwo005
     * @tc.desc Verify callback returning NaN produces NaN from reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0600
     * @tc.name testUint8ClampedArrayReduceRightTwo006
     * @tc.desc Verify reduceRight on [1,2,3] without initialValue, callback returns Infinity each time, result is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => Number.POSITIVE_INFINITY);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0700
     * @tc.name testUint8ClampedArrayReduceRightTwo007
     * @tc.desc Verify reduceRight on [1,2,3] without initialValue, callback returns -Infinity each time, result is -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => -Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0800
     * @tc.name testUint8ClampedArrayReduceRightTwo008
     * @tc.desc Verify callback adding 0.5 each step produces 5.5 for reduceRight on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + 0.5);
      expect(r).assertEqual(5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_0900
     * @tc.name testUint8ClampedArrayReduceRightTwo009
     * @tc.desc Verify reduceRight on [1,2,3] without initialValue, callback throws RangeError propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => { throw new RangeError('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1000
     * @tc.name testUint8ClampedArrayReduceRightTwo010
     * @tc.desc Verify reduceRight on [1,2,3] without initialValue, callback throws TypeError propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => { throw new TypeError('boom'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1100
     * @tc.name testUint8ClampedArrayReduceRightTwo011
     * @tc.desc Verify reduceRight on [1,2,3] without initialValue, callback throws Error on first invocation, count=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => { count++; throw new Error('x'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1200
     * @tc.name testUint8ClampedArrayReduceRightTwo012
     * @tc.desc Verify error thrown on second callback invocation stops reduceRight early
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let count = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
          count++;
          if (count === 2) throw new Error('mid');
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1300
     * @tc.name testUint8ClampedArrayReduceRightTwo013
     * @tc.desc Verify reduceRight [10,20,30] with captured base=100 without initialValue returns 260
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const base: number = 100;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c + base);
      expect(r).assertEqual(260);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1400
     * @tc.name testUint8ClampedArrayReduceRightTwo014
     * @tc.desc Verify reduceRight [1,2,3,4] without initialValue callback side-effect totals c values except last 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let total: number = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => { total += c; return p; });
      expect(total).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1500
     * @tc.name testUint8ClampedArrayReduceRightTwo015
     * @tc.desc Verify nested reduceRight inside callback sums all elements correctly for [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        const inner = new Uint8ClampedArray([c]);
        return p + inner.reduceRight((pp: number, cc: number, ii: int, aa: Uint8ClampedArray): number => pp + cc);
      });
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1600
     * @tc.name testUint8ClampedArrayReduceRightTwo016
     * @tc.desc Verify previousValue in first callback is last element 99 for length-2 array [10,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 99]);
      let firstP: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (firstP === -1) firstP = p;
        return p;
      });
      expect(firstP).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1700
     * @tc.name testUint8ClampedArrayReduceRightTwo017
     * @tc.desc Verify previousValue is 0 when last element of reduceRight array is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 0]);
      let firstP: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (firstP === -1) firstP = p;
        return p;
      });
      expect(firstP).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1800
     * @tc.name testUint8ClampedArrayReduceRightTwo018
     * @tc.desc Verify previousValue is 255 when last element of reduceRight array is 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 255]);
      let firstP: number = -2;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (firstP === -2) firstP = p;
        return p;
      });
      expect(firstP).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_1900
     * @tc.name testUint8ClampedArrayReduceRightTwo019
     * @tc.desc Verify previousValue in second callback iteration equals first-step result 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 20]);
      let secondP: number = -1;
      let callCnt: number = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        callCnt++;
        if (callCnt === 2) secondP = p;
        return p + c;
      });
      expect(secondP).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2000
     * @tc.name testUint8ClampedArrayReduceRightTwo020
     * @tc.desc Verify currentValue in first callback iteration is second-from-right element 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 50, 99]);
      let firstC: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (firstC === -1) firstC = c;
        return p;
      });
      expect(firstC).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2100
     * @tc.name testUint8ClampedArrayReduceRightTwo021
     * @tc.desc Verify reduceRight on [0,50] without initialValue, first callback currentValue is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 50]);
      let firstC: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        firstC = c;
        return p;
      });
      expect(firstC).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2200
     * @tc.name testUint8ClampedArrayReduceRightTwo022
     * @tc.desc Verify reduceRight on [256,2] without initialValue, first callback currentValue clamped to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = 256;
      let firstC: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        firstC = c;
        return p;
      });
      expect(firstC).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2300
     * @tc.name testUint8ClampedArrayReduceRightTwo023
     * @tc.desc Verify reduceRight on [-1,20] without initialValue, first callback currentValue clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = -1;
      let firstC: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        firstC = c;
        return p;
      });
      expect(firstC).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2400
     * @tc.name testUint8ClampedArrayReduceRightTwo024
     * @tc.desc Verify reduceRight visits indices in descending order [2,1,0] parameter is assignable to int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let typeOk: boolean = false;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        const x: int = i;
        typeOk = (x === 0);
        return p;
      });
      expect(typeOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2500
     * @tc.name testUint8ClampedArrayReduceRightTwo025
     * @tc.desc Verify reduceRight on [1,2,3,4] without initialValue visits indices in descending order [2,1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const idxes: number[] = [];
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        idxes.push(i );
        return p;
      });
      expect(idxes.length).assertEqual(3);
      expect(idxes[0]).assertEqual(2);
      expect(idxes[1]).assertEqual(1);
      expect(idxes[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2600
     * @tc.name testUint8ClampedArrayReduceRightTwo026
     * @tc.desc Verify callback is not called for length-1 array without initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      let visited: boolean = false;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        visited = true;
        return p;
      });
      expect(visited).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2700
     * @tc.name testUint8ClampedArrayReduceRightTwo027
     * @tc.desc Verify reduceRight on [1,2,3] without initialValue, callback fourth argument a equals source array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sameRef: boolean = false;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        sameRef = (a === arr);
        return p;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2800
     * @tc.name testUint8ClampedArrayReduceRightTwo028
     * @tc.desc Verify callback array argument length equals original array length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let alen: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        alen = a.length;
        return p;
      });
      expect(alen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_2900
     * @tc.name testUint8ClampedArrayReduceRightTwo029
     * @tc.desc Verify callback can read array element a[0] matching original array[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      let first: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        first = a[0];
        return p;
      });
      expect(first).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3000
     * @tc.name testUint8ClampedArrayReduceRightTwo030
     * @tc.desc Verify callback array argument shares same ArrayBuffer as original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let sameBuf: boolean = false;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        sameBuf = (a.buffer === arr.buffer);
        return p;
      });
      expect(sameBuf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3100
     * @tc.name testUint8ClampedArrayReduceRightTwo031
     * @tc.desc Verify reduceRight on [1,2,3,4] without initialValue, callback receives currentValues in reverse order [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const vals: number[] = [];
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        vals.push(c);
        return p;
      });
      expect(vals.length).assertEqual(3);
      expect(vals[0]).assertEqual(3);
      expect(vals[1]).assertEqual(2);
      expect(vals[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3200
     * @tc.name testUint8ClampedArrayReduceRightTwo032
     * @tc.desc Verify reduceRight on 256-element array of ones sums to 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(256);
      const arr = new Uint8ClampedArray(buf);
      arr.fill(1);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3300
     * @tc.name testUint8ClampedArrayReduceRightTwo033
     * @tc.desc Verify reduceRight on 65535 zero-initialized elements returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(65535);
      const arr = new Uint8ClampedArray(buf);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3400
     * @tc.name testUint8ClampedArrayReduceRightTwo034
     * @tc.desc Verify reduceRight sum of alternating 0 and 255 values returns 510
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 0, 255]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3500
     * @tc.name testUint8ClampedArrayReduceRightTwo035
     * @tc.desc Verify reduceRight works on array from Uint8ClampedArray.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3600
     * @tc.name testUint8ClampedArrayReduceRightTwo036
     * @tc.desc Verify reduceRight works on Uint8ClampedArray created from ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 0, 4);
      arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3700
     * @tc.name testUint8ClampedArrayReduceRightTwo037
     * @tc.desc Verify reduceRight sum [5,10,15,20] on ArrayBuffer with byteOffset=4 length=4 without initialValue returns 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 4, 4);
      arr[0] = 5; arr[1] = 10; arr[2] = 15; arr[3] = 20;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3800
     * @tc.name testUint8ClampedArrayReduceRightTwo038
     * @tc.desc Verify reduceRight sum [1,256] without initialValue, 256 clamps to 255, returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[1] = 256;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_3900
     * @tc.name testUint8ClampedArrayReduceRightTwo039
     * @tc.desc Verify reduceRight sum [10,-1] without initialValue, -1 clamps to 0, returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[1] = -1;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4000
     * @tc.name testUint8ClampedArrayReduceRightTwo040
     * @tc.desc Verify reduceRight sum [NaN,10] without initialValue, NaN clamps to 0, returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10]);
      arr[0] = Number.NaN;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4100
     * @tc.name testUint8ClampedArrayReduceRightTwo041
     * @tc.desc Verify reduceRight sum [Infinity,2] without initialValue, Infinity clamps to 255, returns 257
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = Number.POSITIVE_INFINITY;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(257);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4200
     * @tc.name testUint8ClampedArrayReduceRightTwo042
     * @tc.desc Verify reduceRight sum [-Infinity,2] without initialValue, -Infinity clamps to 0, returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = -Number.POSITIVE_INFINITY;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4300
     * @tc.name testUint8ClampedArrayReduceRightTwo043
     * @tc.desc Verify reduceRight sum [127.5,2] without initialValue, 127.5 half-even clamps to 128, returns 130
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = 127.5;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4400
     * @tc.name testUint8ClampedArrayReduceRightTwo044
     * @tc.desc Verify reduceRight sum [128.5,2] without initialValue, 128.5 half-even clamps to 128, returns 130
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = 128.5;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4500
     * @tc.name testUint8ClampedArrayReduceRightTwo045
     * @tc.desc Verify reduceRight sum [0.4,2] without initialValue, 0.4 clamps to 0, returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = 0.4;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4600
     * @tc.name testUint8ClampedArrayReduceRightTwo046
     * @tc.desc Verify reduceRight sum [0.9,20] without initialValue, 0.9 clamps to 1, returns 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = 0.9;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4700
     * @tc.name testUint8ClampedArrayReduceRightTwo047
     * @tc.desc Verify reduceRight sum [1e9,2] without initialValue, 1e9 clamps to 255, returns 257
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = 1e9;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(257);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4800
     * @tc.name testUint8ClampedArrayReduceRightTwo048
     * @tc.desc Verify reduceRight sum [-1e9,2] without initialValue, -1e9 clamps to 0, returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = -1e9;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_4900
     * @tc.name testUint8ClampedArrayReduceRightTwo049
     * @tc.desc Verify reduceRight sum [MAX_VALUE,2] without initialValue, MAX_VALUE clamps to 255, returns 257
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      arr[0] = Number.MAX_VALUE;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(257);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5000
     * @tc.name testUint8ClampedArrayReduceRightTwo050
     * @tc.desc Verify reduceRight [1,2,3] without initialValue returns same value as last callback return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let lastRet: number = -1;
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        const ret = p + c;
        lastRet = ret;
        return ret;
      });
      expect(r).assertEqual(lastRet);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5100
     * @tc.name testUint8ClampedArrayReduceRightTwo051
     * @tc.desc Verify reduceRight with subtraction callback can return negative number -90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p - c - 100);
      expect(r).assertEqual(-90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5200
     * @tc.name testUint8ClampedArrayReduceRightTwo052
     * @tc.desc Verify reduceRight [1,2,3] preserves source array length, elements, and buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const beforeBuf = arr.buffer;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.buffer).assertEqual(beforeBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5300
     * @tc.name testUint8ClampedArrayReduceRightTwo053
     * @tc.desc Verify reduceRight does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5400
     * @tc.name testUint8ClampedArrayReduceRightTwo054
     * @tc.desc Verify callback returning negative zero preserves -0 result from reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => -0);
      expect(r).assertEqual(-0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5500
     * @tc.name testUint8ClampedArrayReduceRightTwo055
     * @tc.desc Verify initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5600
     * @tc.name testUint8ClampedArrayReduceRightTwo056
     * @tc.desc Verify reduceRight on empty array from Uint8ClampedArray.of() throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of();
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5700
     * @tc.name testUint8ClampedArrayReduceRightTwo057
     * @tc.desc Verify reduceRight on empty Uint8ClampedArray without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(0));
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5800
     * @tc.name testUint8ClampedArrayReduceRightTwo058
     * @tc.desc Verify callback is not invoked on empty array before TypeError is thrown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let cnt: number = 0;
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => { cnt++; return p; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(cnt).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_5900
     * @tc.name testUint8ClampedArrayReduceRightTwo059
     * @tc.desc Verify callback SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => { throw new SyntaxError('s'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_6000
     * @tc.name testUint8ClampedArrayReduceRightTwo060
     * @tc.desc Verify reduceRight on [1,2,3,4] without initialValue, callback mutates a[0]=99 at index 2, arr[0] becomes 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (i === 2) a[0] = 99;
        return p;
      });
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_6100
     * @tc.name testUint8ClampedArrayReduceRightTwo061
     * @tc.desc Verify callback mutation assigns 300 clamped to 255 in array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        a[0] = 300;
        return p;
      });
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_6200
     * @tc.name testUint8ClampedArrayReduceRightTwo062
     * @tc.desc Verify mutation at index 1 affects currentValue read at index 0 in reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let cVal: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (i === 1) a[0] = 50;
        if (i === 0) cVal = c;
        return p;
      });
      expect(cVal).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_6300
     * @tc.name testUint8ClampedArrayReduceRightTwo063
     * @tc.desc Verify reduceRight on [10,20,30,40] without initialValue, callback reads a[0] at index 2, value is 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let other: number = -1;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (i === 2) other = a[0];
        return p;
      });
      expect(other).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_6400
     * @tc.name testUint8ClampedArrayReduceRightTwo064
     * @tc.desc Verify slice(1,4) on [1,2,3,4,5] then reduceRight sum without initialValue returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r = arr.slice(1, 4).reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_6500
     * @tc.name testUint8ClampedArrayReduceRightTwo065
     * @tc.desc Verify subarray(1,3) on [10,20,30,40] then reduceRight sum without initialValue returns 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const r = arr.subarray(1, 3).reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_6600
     * @tc.name testUint8ClampedArrayReduceRightTwo066
     * @tc.desc Verify toReversed() on [1,2,3] followed by reduceRight, callback receives currentValues [2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const vals: number[] = [];
      arr.toReversed().reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        vals.push(c);
        return p;
      });
      expect(vals.length).assertEqual(2);
      expect(vals[0]).assertEqual(2);
      expect(vals[vals.length - 1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_TWO_6700
     * @tc.name testUint8ClampedArrayReduceRightTwo067
     * @tc.desc Verify subarray(0,2) on [1,2,3,4] then reduceRight, callback fourth arg shares buffer with parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(0, 2);
      let sharedBuf: boolean = false;
      sub.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        sharedBuf = (a.buffer === arr.buffer);
        return p;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
      });
    });
  });
}
