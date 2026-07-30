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


export default function uint8ClampedArrayReduceRightOneTest(): void {
  describe('Uint8ClampedArrayReduceRightOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0100
     * @tc.name testUint8ClampedArrayReduceRightOne001
     * @tc.desc Verify reduceRight sum [1,2,3] initialValue=0 returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const sum: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0200
     * @tc.name testUint8ClampedArrayReduceRightOne002
     * @tc.desc Verify reduceRight on empty array without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0300
     * @tc.name testUint8ClampedArrayReduceRightOne003
     * @tc.desc Verify reduceRight callback receives descending indices 2,1,0 on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const order: number[] = [];
      arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { order.push(i ); return p; }, 0);
      expect(order[0]).assertEqual(2);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0400
     * @tc.name testUint8ClampedArrayReduceRightOne004
     * @tc.desc Verify reduceRight callback receives element 7 at index 2 then 6 at index 1 on [5,6,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const values: number[] = [];
      arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { values.push(c); return p; }, 0);
      expect(values[0]).assertEqual(7);
      expect(values[1]).assertEqual(6);
      expect(values[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0500
     * @tc.name testUint8ClampedArrayReduceRightOne005
     * @tc.desc Verify reduceRight callback that throws on second call stops at count=2 on [1,2,3] on [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let captured: Uint8ClampedArray | null = null;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { captured = a; return p; }, 0);
      expect(captured).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0600
     * @tc.name testUint8ClampedArrayReduceRightOne006
     * @tc.desc Verify reduceRight U=string initialValue='' on [1,2,3] returns '321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const s: string = arr.reduceRight<string>((p: string, c: number, i: int, a: Uint8ClampedArray): string => p + c.toString(), '');
      expect(s).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0700
     * @tc.name testUint8ClampedArrayReduceRightOne007
     * @tc.desc Verify reduceRight callback that throws Error propagates exception to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { throw new Error('cb-fail'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0800
     * @tc.name testUint8ClampedArrayReduceRightOne008
     * @tc.desc Verify reduceRight callback that throws stops iteration immediately count=1 on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count: int = 0;
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { count++; throw new Error('boom'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_0900
     * @tc.name testUint8ClampedArrayReduceRightOne009
     * @tc.desc Verify reduceRight callback receives source array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count: int = 0;
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
          count++;
          if (count == 2) throw new Error('mid');
          return p;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1000
     * @tc.name testUint8ClampedArrayReduceRightOne010
     * @tc.desc Verify reduceRight callback throws TypeError propagates to caller on [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { throw new TypeError('te'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1100
     * @tc.name testUint8ClampedArrayReduceRightOne011
     * @tc.desc Verify reduceRight callback returning NaN on each call produces NaN on [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => Number.NaN, 0);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1200
     * @tc.name testUint8ClampedArrayReduceRightOne012
     * @tc.desc Verify reduceRight callback returning +Infinity on each call produces +Infinity on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => Number.POSITIVE_INFINITY, 0);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1300
     * @tc.name testUint8ClampedArrayReduceRightOne013
     * @tc.desc Verify reduceRight callback returning -Infinity on each call produces -Infinity on [1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => -Number.POSITIVE_INFINITY, 0);
      expect(r).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1400
     * @tc.name testUint8ClampedArrayReduceRightOne014
     * @tc.desc Verify reduceRight [1,2,3] with captured factor=10 initialValue=0 returns 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const factor: number = 10;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c * factor, 0);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1500
     * @tc.name testUint8ClampedArrayReduceRightOne015
     * @tc.desc Verify reduceRight [1,2,3,4,5] initialValue=0 callback is invoked 5 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      let calls: int = 0;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { calls++; return p; }, 0);
      expect(calls).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1600
     * @tc.name testUint8ClampedArrayReduceRightOne016
     * @tc.desc Verify nested reduceRight on [3,4] with inner reduceRight sum [1,2] returns 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Uint8ClampedArray([1, 2]);
      const outer = new Uint8ClampedArray([3, 4]);
      const r: number = outer.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        return p + inner.reduceRight<number>((pp: number, cc: number): number => pp + cc, 0) + c;
      }, 0);
      expect(r).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1700
     * @tc.name testUint8ClampedArrayReduceRightOne017
     * @tc.desc Verify reduceRight callback returning accumulator p on [1,2,3] initialValue=42 returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p, 42);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1800
     * @tc.name testUint8ClampedArrayReduceRightOne018
     * @tc.desc Verify reduceRight callback returning current element c on [1,2,3] initialValue=0 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => c, 0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_1900
     * @tc.name testUint8ClampedArrayReduceRightOne019
     * @tc.desc Verify reduceRight callback returning 0 on [1,2,3,4,5] initialValue=100 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => 0, 100);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2000
     * @tc.name testUint8ClampedArrayReduceRightOne020
     * @tc.desc Verify reduceRight p-c on [1,2,3,4] initialValue=100 returns 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p - c, 100);
      expect(r).assertEqual(100 - 4 - 3 - 2 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2100
     * @tc.name testUint8ClampedArrayReduceRightOne021
     * @tc.desc Verify reduceRight accumulating a[0] on [10,20,30] initialValue=0 returns 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + a[0], 0);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2200
     * @tc.name testUint8ClampedArrayReduceRightOne022
     * @tc.desc Verify reduceRight U=string concatenating indices returns '210' on [7,8,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const s: string = arr.reduceRight<string>((p: string, c: number, i: int, a: Uint8ClampedArray): string => p + i.toString(), '');
      expect(s).assertEqual('210');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2300
     * @tc.name testUint8ClampedArrayReduceRightOne023
     * @tc.desc Verify reduceRight sum [1,2,3] initialValue=NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2400
     * @tc.name testUint8ClampedArrayReduceRightOne024
     * @tc.desc Verify reduceRight sum [1,2] initialValue=Infinity returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, Number.POSITIVE_INFINITY);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2500
     * @tc.name testUint8ClampedArrayReduceRightOne025
     * @tc.desc Verify reduceRight sum [1,2] initialValue=-Infinity returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, -Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2600
     * @tc.name testUint8ClampedArrayReduceRightOne026
     * @tc.desc Verify reduceRight sum [1,2] initialValue=0.5 returns 3.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0.5);
      expect(r).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2700
     * @tc.name testUint8ClampedArrayReduceRightOne027
     * @tc.desc Verify reduceRight on [1] initialValue=Number.MAX_VALUE, callback returns p, result equals MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p, Number.MAX_VALUE);
      expect(r).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2800
     * @tc.name testUint8ClampedArrayReduceRightOne028
     * @tc.desc Verify reduceRight on [1] initialValue=Number.MIN_VALUE, callback returns p, result equals MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p, Number.MIN_VALUE);
      expect(r).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_2900
     * @tc.name testUint8ClampedArrayReduceRightOne029
     * @tc.desc Verify reduceRight sum [1,2] initialValue=Number.MAX_SAFE_INTEGER returns 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, Number.MAX_SAFE_INTEGER);
      expect(r).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3000
     * @tc.name testUint8ClampedArrayReduceRightOne030
     * @tc.desc Verify reduceRight sum [1,2] initialValue=Number.MIN_SAFE_INTEGER returns MIN_SAFE_INTEGER+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, Number.MIN_SAFE_INTEGER);
      expect(r).assertEqual(Number.MIN_SAFE_INTEGER + 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3100
     * @tc.name testUint8ClampedArrayReduceRightOne031
     * @tc.desc Verify reduceRight [1,2] U=string initialValue=start returns start21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: string = arr.reduceRight<string>((p: string, c: number, i: int, a: Uint8ClampedArray): string => p + c.toString(), 'start');
      expect(r).assertEqual('start21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3200
     * @tc.name testUint8ClampedArrayReduceRightOne032
     * @tc.desc Verify reduceRight U=string initialValue=Unicode on [1] returns concatenated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: string = arr.reduceRight<string>((p: string, c: number, i: int, a: Uint8ClampedArray): string => p + c.toString(), '中文');
      expect(r).assertEqual('中文1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3300
     * @tc.name testUint8ClampedArrayReduceRightOne033
     * @tc.desc Verify reduceRight U=string initialValue='emoji' on [5] returns 'emoji5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5]);
      const r: string = arr.reduceRight<string>((p: string, c: number, i: int, a: Uint8ClampedArray): string => p + c.toString(), '😀');
      expect(r).assertEqual('😀5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3400
     * @tc.name testUint8ClampedArrayReduceRightOne034
     * @tc.desc Verify reduceRight U=boolean initialValue=false OR on [1,2] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: boolean = arr.reduceRight<boolean>((p: boolean, c: number, i: int, a: Uint8ClampedArray): boolean => p || (c > 0), false);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3500
     * @tc.name testUint8ClampedArrayReduceRightOne035
     * @tc.desc Verify reduceRight U=boolean initialValue=true AND on [0,0] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const r: boolean = arr.reduceRight<boolean>((p: boolean, c: number, i: int, a: Uint8ClampedArray): boolean => p && (c == 0), true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3600
     * @tc.name testUint8ClampedArrayReduceRightOne036
     * @tc.desc Verify reduceRight U=number[] initialValue=[] collects elements in reverse order [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number[] = arr.reduceRight<number[]>((p: number[], c: number, i: int, a: Uint8ClampedArray): number[] => { p.push(c); return p; }, []);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3700
     * @tc.name testUint8ClampedArrayReduceRightOne037
     * @tc.desc Verify reduceRight on empty array initialValue=42 returns 42 without invoking callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      let called: int = 0;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { called++; return p + c; }, 42);
      expect(r).assertEqual(42);
      expect(called).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3800
     * @tc.name testUint8ClampedArrayReduceRightOne038
     * @tc.desc Verify reduceRight on empty array initialValue=NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_3900
     * @tc.name testUint8ClampedArrayReduceRightOne039
     * @tc.desc Verify reduceRight on empty array U=string initialValue='' returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const r: string = arr.reduceRight<string>((p: string, c: number, i: int, a: Uint8ClampedArray): string => p + c.toString(), '');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4000
     * @tc.name testUint8ClampedArrayReduceRightOne040
     * @tc.desc Verify reduceRight single element [42] initialValue=0 callback invoked once returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      let called: int = 0;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { called++; return p + c; }, 0);
      expect(called).assertEqual(1);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4100
     * @tc.name testUint8ClampedArrayReduceRightOne041
     * @tc.desc Verify reduceRight callback receives index 0 on single-element array [99] initialValue=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      let idx: int = -1;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { idx = i; return p; }, 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4200
     * @tc.name testUint8ClampedArrayReduceRightOne042
     * @tc.desc Verify reduceRight sum 256 elements of 1 initialValue=0 returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: number[] = [];
      for (let k: number = 0; k < 256; k++) buf.push(1);
      const arr = new Uint8ClampedArray(buf);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4300
     * @tc.name testUint8ClampedArrayReduceRightOne043
     * @tc.desc Verify reduceRight sum 1024 elements of 2 initialValue=0 returns 2048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: number[] = [];
      for (let k: number = 0; k < 1024; k++) buf.push(2);
      const arr = new Uint8ClampedArray(buf);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(2048);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4400
     * @tc.name testUint8ClampedArrayReduceRightOne044
     * @tc.desc Verify reduceRight sum [0,0,0,0] initialValue=7 returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 7);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4500
     * @tc.name testUint8ClampedArrayReduceRightOne045
     * @tc.desc Verify reduceRight sum [255,255,255] initialValue=0 returns 765
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(765);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4600
     * @tc.name testUint8ClampedArrayReduceRightOne046
     * @tc.desc Verify Uint8ClampedArray clamps -1 to 0 then reduceRight sum returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 5, 10]);
      arr[0] = -1;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4700
     * @tc.name testUint8ClampedArrayReduceRightOne047
     * @tc.desc Verify Uint8ClampedArray clamps 256 to 255 then reduceRight sum returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr[2] = 256;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4800
     * @tc.name testUint8ClampedArrayReduceRightOne048
     * @tc.desc Verify reduceRight sum [127,128,255] initialValue=0 returns 510
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127, 128, 255]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_4900
     * @tc.name testUint8ClampedArrayReduceRightOne049
     * @tc.desc Verify Uint8ClampedArray clamps 127.5 to 128 then reduceRight sum returns 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr[0] = 127.5;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5000
     * @tc.name testUint8ClampedArrayReduceRightOne050
     * @tc.desc Verify Uint8ClampedArray clamps NaN to 0 then reduceRight sum [0,20] returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      arr[0] = Number.NaN;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5100
     * @tc.name testUint8ClampedArrayReduceRightOne051
     * @tc.desc Verify Uint8ClampedArray clamps +Infinity to 255 then reduceRight sum returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr[0] = Number.POSITIVE_INFINITY;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5200
     * @tc.name testUint8ClampedArrayReduceRightOne052
     * @tc.desc Verify Uint8ClampedArray clamps -Infinity to 0 then reduceRight sum initialValue=100 returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr[0] = -Number.POSITIVE_INFINITY;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 100);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5300
     * @tc.name testUint8ClampedArrayReduceRightOne053
     * @tc.desc Verify reduceRight sum on Uint8ClampedArray backed by ArrayBuffer [1,2,3,4] returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5400
     * @tc.name testUint8ClampedArrayReduceRightOne054
     * @tc.desc Verify reduceRight sum on Uint8ClampedArray with byteOffset=2 length=3 returns 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Uint8ClampedArray(buf, 2, 3);
      arr[0] = 10; arr[1] = 20; arr[2] = 30;
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5500
     * @tc.name testUint8ClampedArrayReduceRightOne055
     * @tc.desc Verify reduceRight sum on Uint8ClampedArray.of(5,10,15) initialValue=0 returns 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(5, 10, 15);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5600
     * @tc.name testUint8ClampedArrayReduceRightOne056
     * @tc.desc Verify reduceRight [1,2,3] callback p*10+c initialValue=0 returns 321
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p * 10 + c, 0);
      expect(r).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5700
     * @tc.name testUint8ClampedArrayReduceRightOne057
     * @tc.desc Verify reduceRight [1,2,3] initialValue=0 preserves source array elements and buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const bufBefore = arr.buffer;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5800
     * @tc.name testUint8ClampedArrayReduceRightOne058
     * @tc.desc Verify reduceRight [1,2] initialValue=0 returns 3 and preserves array length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(arr.length).assertEqual(2);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_5900
     * @tc.name testUint8ClampedArrayReduceRightOne059
     * @tc.desc Verify reduceRight preserves byteLength unchanged on [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const beforeBL = arr.byteLength;
      arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c, 0);
      expect(arr.byteLength).assertEqual(beforeBL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6000
     * @tc.name testUint8ClampedArrayReduceRightOne060
     * @tc.desc Verify reduceRight callback mutates source array a[0]=99 at last index returns 104
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
        if (i == 2) a[0] = 99;
        return p + c;
      }, 0);
      expect(r).assertEqual(99 + 2 + 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6100
     * @tc.name testUint8ClampedArrayReduceRightOne061
     * @tc.desc Verify reduceRight callback throws RangeError propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { throw new RangeError('x'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6200
     * @tc.name testUint8ClampedArrayReduceRightOne062
     * @tc.desc Verify reduceRight callback throws on 3rd invocation partial sum equals 9 on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let partial: number = -1;
      let count: int = 0;
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => {
          count++;
          partial = p + c;
          if (count == 3) throw new Error('third');
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(count).assertEqual(3);
        expect(partial).assertEqual(4 + 3 + 2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6300
     * @tc.name testUint8ClampedArrayReduceRightOne063
     * @tc.desc Verify reduceRight callback throws SyntaxError propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => { throw new SyntaxError('sx'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6400
     * @tc.name testUint8ClampedArrayReduceRightOne064
     * @tc.desc Verify reduceRight p+c+a.length on [1,2,3] initialValue=0 returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduceRight<number>((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c + a.length, 0);
      expect(r).assertEqual(6 + 9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6500
     * @tc.name testUint8ClampedArrayReduceRightOne065
     * @tc.desc Verify reduceRight single element [42] without initialValue returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6600
     * @tc.name testUint8ClampedArrayReduceRightOne066
     * @tc.desc Verify reduceRight [10,20] without initialValue callback invoked 1 time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      let count = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => { count++; return p + c; });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6700
     * @tc.name testUint8ClampedArrayReduceRightOne067
     * @tc.desc Verify reduceRight [1,2,3] without initialValue callback invoked 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let count = 0;
      arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => { count++; return p + c; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6800
     * @tc.name testUint8ClampedArrayReduceRightOne068
     * @tc.desc Verify reduceRight [1,2,3] with undefined as callback throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.reduceRight((undefined as Object) as (p: number, c: number, i: int, a: Uint8ClampedArray) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_6900
     * @tc.name testUint8ClampedArrayReduceRightOne069
     * @tc.desc Verify reduceRight [1,2,3,4] without initialValue returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p + c);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCERIGHT_ONE_7000
     * @tc.name testUint8ClampedArrayReduceRightOne070
     * @tc.desc Verify reduceRight [5,10,20,99] without initialValue callback returns p returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceRightOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 10, 20, 99]);
      const r = arr.reduceRight((p: number, c: number, i: int, a: Uint8ClampedArray): number => p);
      expect(r).assertEqual(99);
    });
  });
}
