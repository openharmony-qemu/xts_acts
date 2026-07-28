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

export default function uint8ClampedArrayReduceOneTest(): void {
  describe('Uint8ClampedArrayReduceOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0100
     * @tc.name testUint8ClampedArrayReduceOne001
     * @tc.desc Verify reduce sum [1,2,3,4] initialValue=0 returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0200
     * @tc.name testUint8ClampedArrayReduceOne002
     * @tc.desc Verify reduce multiply [1,2,3,4] initialValue=1 returns 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const r: number = arr.reduce<number>((p: number, c: number) => p * c, 1);
      expect(r).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0300
     * @tc.name testUint8ClampedArrayReduceOne003
     * @tc.desc Verify reduce [1,2,3] initialValue=100 with callback returning only previousValue returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p, 100);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0400
     * @tc.name testUint8ClampedArrayReduceOne004
     * @tc.desc Verify reduce [10,20,30] initialValue=0 with callback returning only currentValue returns 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: number = arr.reduce<number>((p: number, c: number) => c, 0);
      expect(r).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0500
     * @tc.name testUint8ClampedArrayReduceOne005
     * @tc.desc Verify reduce [5,5,5] initialValue=0 sums indices 0+1+2 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      const r: number = arr.reduce<number>((p: number, c: number, i: int) => p + i, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0600
     * @tc.name testUint8ClampedArrayReduceOne006
     * @tc.desc Verify reduce callback receives source array as fourth argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number, i: int, a: Uint8ClampedArray) => p + a.length, 0);
      expect(r).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0700
     * @tc.name testUint8ClampedArrayReduceOne007
     * @tc.desc Verify reduce max of [3,7,2,5,1] initialValue=0 returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 7, 2, 5, 1]);
      const r: number = arr.reduce<number>((p: number, c: number) => p > c ? p : c, 0);
      expect(r).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0800
     * @tc.name testUint8ClampedArrayReduceOne008
     * @tc.desc Verify reduce min of [3,7,2,5,1] initialValue=255 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 7, 2, 5, 1]);
      const r: number = arr.reduce<number>((p: number, c: number) => p < c ? p : c, 255);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_0900
     * @tc.name testUint8ClampedArrayReduceOne009
     * @tc.desc Verify reduce count evens in [1,2,3,4,5,6] initialValue=0 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5, 6]);
      const r: number = arr.reduce<number>((p: number, c: number) => c % 2 === 0 ? p + 1 : p, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1000
     * @tc.name testUint8ClampedArrayReduceOne010
     * @tc.desc Verify nested reduce [1,2,3] outer with inner reduce [10,20] sum initialValue=0 returns 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const inner = new Uint8ClampedArray([10, 20]);
      const r: number = arr.reduce<number>((p: number, c: number) =>
        p + inner.reduce<number>((p2: number, c2: number) => p2 + c2, 0), 0);
      expect(r).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1100
     * @tc.name testUint8ClampedArrayReduceOne011
     * @tc.desc Verify reduce [1,2,3] with captured variable factor=10 initialValue=0 returns 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const factor: number = 10;
      const r: number = arr.reduce<number>((p: number, c: number) => p + c * factor, 0);
      expect(r).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1200
     * @tc.name testUint8ClampedArrayReduceOne012
     * @tc.desc Verify reduce [1,2,3] initialValue=0 callback invoked 3 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let counter: number = 0;
      arr.reduce<number>((p: number, c: number) => { counter += 1; return p + c; }, 0);
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1300
     * @tc.name testUint8ClampedArrayReduceOne013
     * @tc.desc Verify reduce [1,2,3] initialValue=0 with callback throwing Error propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.reduce<number>((p: number, c: number) => { throw new Error('cb fail'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1400
     * @tc.name testUint8ClampedArrayReduceOne014
     * @tc.desc Verify reduce [1,2,3] initialValue=0 with callback throwing TypeError propagates TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.reduce<number>((p: number, c: number) => { throw new TypeError('cb type'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1500
     * @tc.name testUint8ClampedArrayReduceOne015
     * @tc.desc Verify reduce [1,2,3] initialValue=0 with callback throwing RangeError propagates RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.reduce<number>((p: number, c: number) => { throw new RangeError('cb range'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1600
     * @tc.name testUint8ClampedArrayReduceOne016
     * @tc.desc Verify reduce [1,2,3] initialValue=0 callback throws Error on first call so calls=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let calls: number = 0;
      try {
        arr.reduce<number>((p: number, c: number) => { calls += 1; throw new Error('x'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1700
     * @tc.name testUint8ClampedArrayReduceOne017
     * @tc.desc Verify reduce [1,2,3,4] initialValue=0 callback throws Error on 3rd call so calls=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      let calls: number = 0;
      try {
        arr.reduce<number>((p: number, c: number) => { calls += 1; if (calls === 3) throw new Error('mid'); return p + c; }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1800
     * @tc.name testUint8ClampedArrayReduceOne018
     * @tc.desc Verify reduce [1,2,3] initialValue=0 with callback mutating a[2]=99 at index 0 returns 102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number, i: int, a: Uint8ClampedArray) => {
        if (i === 0) a[2] = 99;
        return p + c;
      }, 0);
      expect(r).assertEqual(102);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_1900
     * @tc.name testUint8ClampedArrayReduceOne019
     * @tc.desc Verify reduce sum [255] initialValue=0 returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2000
     * @tc.name testUint8ClampedArrayReduceOne020
     * @tc.desc Verify reduce sum [1,2,3] initialValue=100 returns 106
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 100);
      expect(r).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2100
     * @tc.name testUint8ClampedArrayReduceOne021
     * @tc.desc Verify reduce sum [1,2,3] initialValue=-10 returns -4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, -10);
      expect(r).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2200
     * @tc.name testUint8ClampedArrayReduceOne022
     * @tc.desc Verify reduce sum [1,2,3] initialValue=1.5 returns 7.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 1.5);
      expect(r).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2300
     * @tc.name testUint8ClampedArrayReduceOne023
     * @tc.desc Verify reduce sum [1] initialValue=Number.MAX_SAFE_INTEGER returns MAX_SAFE_INTEGER+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, Number.MAX_SAFE_INTEGER);
      expect(r).assertEqual(Number.MAX_SAFE_INTEGER + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2400
     * @tc.name testUint8ClampedArrayReduceOne024
     * @tc.desc Verify reduce sum [1] initialValue=Number.MIN_SAFE_INTEGER returns MIN_SAFE_INTEGER+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, Number.MIN_SAFE_INTEGER);
      expect(r).assertEqual(Number.MIN_SAFE_INTEGER + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2500
     * @tc.name testUint8ClampedArrayReduceOne025
     * @tc.desc Verify reduce sum [0] initialValue=Number.MAX_VALUE returns Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, Number.MAX_VALUE);
      expect(r).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2600
     * @tc.name testUint8ClampedArrayReduceOne026
     * @tc.desc Verify reduce sum [0] initialValue=Number.MIN_VALUE returns Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, Number.MIN_VALUE);
      expect(r).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2700
     * @tc.name testUint8ClampedArrayReduceOne027
     * @tc.desc Verify reduce sum [1,2,3] initialValue=Infinity returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, Number.POSITIVE_INFINITY);
      expect(r).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2800
     * @tc.name testUint8ClampedArrayReduceOne028
     * @tc.desc Verify reduce sum [1,2,3] initialValue=-Infinity returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, -Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_2900
     * @tc.name testUint8ClampedArrayReduceOne029
     * @tc.desc Verify reduce sum [1,2,3] initialValue=NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3000
     * @tc.name testUint8ClampedArrayReduceOne030
     * @tc.desc Verify reduce sum [1,2,3] initialValue=-0 returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, -0);
      expect(r).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3100
     * @tc.name testUint8ClampedArrayReduceOne031
     * @tc.desc Verify reduce sum [1] initialValue=0xFF(255) returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0xFF);
      expect(r).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3200
     * @tc.name testUint8ClampedArrayReduceOne032
     * @tc.desc Verify reduce sum [1] initialValue=0o77(63) returns 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0o77);
      expect(r).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3300
     * @tc.name testUint8ClampedArrayReduceOne033
     * @tc.desc Verify reduce initialValue 0b1010 on [0] returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0b1010);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3400
     * @tc.name testUint8ClampedArrayReduceOne034
     * @tc.desc Verify reduce sum [0] initialValue=1e3(1000) returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 1e3);
      expect(r).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3500
     * @tc.name testUint8ClampedArrayReduceOne035
     * @tc.desc Verify reduce U=string initialValue='' on [1,2,3] concats elements returns '123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.reduce<string>((p: string, c: number) => p + c.toString(), '');
      expect(r).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3600
     * @tc.name testUint8ClampedArrayReduceOne036
     * @tc.desc Verify reduce U=string initialValue='S' on [10,20,30] concats with '-' returns 'S-10-20-30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: string = arr.reduce<string>((p: string, c: number) => p + '-' + c.toString(), 'S');
      expect(r).assertEqual('S-10-20-30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3700
     * @tc.name testUint8ClampedArrayReduceOne037
     * @tc.desc Verify reduce U=string initialValue='X' on [1,2] concats elements returns 'X12'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: string = arr.reduce<string>((p: string, c: number) => p + c.toString(), 'X');
      expect(r).assertEqual('X12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3800
     * @tc.name testUint8ClampedArrayReduceOne038
     * @tc.desc Verify reduce U=Array<number> on [1,2,3] pushes all elements returns array of length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: Array<number> = arr.reduce<Array<number>>((p: Array<number>, c: number) => { p.push(c); return p; }, new Array<number>());
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_3900
     * @tc.name testUint8ClampedArrayReduceOne039
     * @tc.desc Verify reduce U=boolean initialValue=true on [1,2,3] with AND c!=0 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: boolean = arr.reduce<boolean>((p: boolean, c: number) => p && c !== 0, true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4000
     * @tc.name testUint8ClampedArrayReduceOne040
     * @tc.desc Verify reduce U=boolean initialValue=true on [1,0,3] with AND c!=0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 0, 3]);
      const r: boolean = arr.reduce<boolean>((p: boolean, c: number) => p && c !== 0, true);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4100
     * @tc.name testUint8ClampedArrayReduceOne041
     * @tc.desc Verify reduce sum [0,0,0,0] initialValue=0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4200
     * @tc.name testUint8ClampedArrayReduceOne042
     * @tc.desc Verify reduce sum [255,255,255,255] initialValue=0 returns 1020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255, 255]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(1020);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4300
     * @tc.name testUint8ClampedArrayReduceOne043
     * @tc.desc Verify reduce sum [0,255,0,255] initialValue=0 returns 510
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255, 0, 255]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4400
     * @tc.name testUint8ClampedArrayReduceOne044
     * @tc.desc Verify clamp [256,1] to [255,1] reduce sum initialValue=0 returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, 1]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4500
     * @tc.name testUint8ClampedArrayReduceOne045
     * @tc.desc Verify clamp [-1,5] to [0,5] reduce sum initialValue=0 returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 5]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4600
     * @tc.name testUint8ClampedArrayReduceOne046
     * @tc.desc Verify clamp [NaN,10] to [0,10] reduce sum initialValue=0 returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN, 10]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4700
     * @tc.name testUint8ClampedArrayReduceOne047
     * @tc.desc Verify clamp [Infinity,0] to [255,0] reduce sum initialValue=0 returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY, 0]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4800
     * @tc.name testUint8ClampedArrayReduceOne048
     * @tc.desc Verify clamp [-Infinity,100] to [0,100] reduce sum initialValue=0 returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY, 100]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_4900
     * @tc.name testUint8ClampedArrayReduceOne049
     * @tc.desc Verify round [127.5] to 128 reduce sum initialValue=0 returns 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5000
     * @tc.name testUint8ClampedArrayReduceOne050
     * @tc.desc Verify round [128.5] to 128 reduce sum initialValue=0 returns 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5100
     * @tc.name testUint8ClampedArrayReduceOne051
     * @tc.desc Verify reduce sum of 100 ones initialValue=0 returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = ([] as Array<number>).fill(1, 0, 100) as Array<number>;
      for (let i = 0; i < 100; i++) { (src as Array<number>).push(1); }
      const arr = new Uint8ClampedArray(src);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5200
     * @tc.name testUint8ClampedArrayReduceOne052
     * @tc.desc Verify reduce sum of 256 twos initialValue=0 returns 512
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tmp: Array<number> = [];
      for (let i = 0; i < 256; i++) { tmp.push(2); }
      const src: Array<number> = tmp as Array<number>;
      const arr = new Uint8ClampedArray(src);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(512);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5300
     * @tc.name testUint8ClampedArrayReduceOne053
     * @tc.desc Verify reduce sum [1,2,3,4] on ArrayBuffer-backed Uint8ClampedArray initialValue=0 returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 1; arr[1] = 2; arr[2] = 3; arr[3] = 4;
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, 0);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5400
     * @tc.name testUint8ClampedArrayReduceOne054
     * @tc.desc Verify reduce callback receives initialValue=999 as previousValue at index 0 on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let firstPrev: number = -1;
      arr.reduce<number>((p: number, c: number, i: int) => { if (i === 0) firstPrev = p; return p + c; }, 999);
      expect(firstPrev).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5500
     * @tc.name testUint8ClampedArrayReduceOne055
     * @tc.desc Verify reduce callback receives currentIndex=0 on first call with initialValue on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let firstIdx: int = -1;
      arr.reduce<number>((p: number, c: number, i: int) => { if (firstIdx === -1) firstIdx = i; return p + c; }, 0);
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5600
     * @tc.name testUint8ClampedArrayReduceOne056
     * @tc.desc Verify reduce callback receives currentIndex=3 on last call with initialValue on [10,20,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      let lastIdx: int = -1;
      arr.reduce<number>((p: number, c: number, i: int) => { lastIdx = i; return p + c; }, 0);
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5700
     * @tc.name testUint8ClampedArrayReduceOne057
     * @tc.desc Verify reduce U=string initialValue='' on [10,20,30] concats currentIndex values returns '012'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: string = arr.reduce<string>((p: string, c: number, i: int) => p + i.toString(), '');
      expect(r).assertEqual('012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5800
     * @tc.name testUint8ClampedArrayReduceOne058
     * @tc.desc Verify reduce U=string initialValue='' on [7,8,9] concats currentValue elements returns '789'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r: string = arr.reduce<string>((p: string, c: number) => p + c.toString(), '');
      expect(r).assertEqual('789');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_5900
     * @tc.name testUint8ClampedArrayReduceOne059
     * @tc.desc Verify reduce callback fourth argument is the source array on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      let same: boolean = false;
      arr.reduce<number>((p: number, c: number, i: int, a: Uint8ClampedArray) => { same = (a === arr); return p + c; }, 0);
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6000
     * @tc.name testUint8ClampedArrayReduceOne060
     * @tc.desc Verify reduce callback currentValue equals array[currentIndex] for each element on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      let match: boolean = true;
      arr.reduce<number>((p: number, c: number, i: int, a: Uint8ClampedArray) => { if (c !== a[i]) match = false; return p; }, 0);
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6100
     * @tc.name testUint8ClampedArrayReduceOne061
     * @tc.desc Verify reduce U=boolean initialValue=true on [1,2] callback returns only previousValue returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: boolean = arr.reduce<boolean>((p: boolean, c: number) => p, true);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6200
     * @tc.name testUint8ClampedArrayReduceOne062
     * @tc.desc Verify reduce accumulator reference is same object on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const acc = new Array<number>();
      const r: Array<number> = arr.reduce<Array<number>>((p: Array<number>, c: number) => { p.push(c); return p; }, acc);
      expect(r).assertEqual(acc);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6300
     * @tc.name testUint8ClampedArrayReduceOne063
     * @tc.desc Verify reduce on empty Uint8ClampedArray(0) with initialValue=42 returns 42 and callback not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let calls: number = 0;
      const r: number = arr.reduce<number>((p: number, c: number) => { calls += 1; return p + c; }, 42);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6400
     * @tc.name testUint8ClampedArrayReduceOne064
     * @tc.desc Verify reduce on empty Uint8ClampedArray(0) with initialValue=0 callback never called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      let calls: number = 0;
      arr.reduce<number>((p: number, c: number) => { calls += 1; return p + c; }, 0);
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6500
     * @tc.name testUint8ClampedArrayReduceOne065
     * @tc.desc Verify reduce on empty Uint8ClampedArray(0) U=string initialValue='init' returns 'init'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r: string = arr.reduce<string>((p: string, c: number) => p + c.toString(), 'init');
      expect(r).assertEqual('init');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6600
     * @tc.name testUint8ClampedArrayReduceOne066
     * @tc.desc Verify reduce on empty Uint8ClampedArray(0) initialValue=-100 returns -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, -100);
      expect(r).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6700
     * @tc.name testUint8ClampedArrayReduceOne067
     * @tc.desc Verify reduce on empty Uint8ClampedArray(0) initialValue=NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c, Number.NaN);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6800
     * @tc.name testUint8ClampedArrayReduceOne068
     * @tc.desc Verify reduce [1,2] initialValue=0 with callback throwing SyntaxError propagates SyntaxError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        arr.reduce<number>((p: number, c: number) => { throw new SyntaxError('syn'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_6900
     * @tc.name testUint8ClampedArrayReduceOne069
     * @tc.desc Verify reduce [1,2] initialValue=0 with callback throwing URIError propagates URIError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        arr.reduce<number>((p: number, c: number) => { throw new URIError('uri'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('URIError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_7000
     * @tc.name testUint8ClampedArrayReduceOne070
     * @tc.desc Verify reduce callback receives 256 clamped to 255 on [256]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      let seen: number = -1;
      arr.reduce<number>((p: number, c: number) => { seen = c; return p + c; }, 0);
      expect(seen).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_7100
     * @tc.name testUint8ClampedArrayReduceOne071
     * @tc.desc Verify reduce callback receives -1 clamped to 0 on [-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      let seen: number = -99;
      arr.reduce<number>((p: number, c: number) => { seen = c; return p + c; }, 0);
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_7200
     * @tc.name testUint8ClampedArrayReduceOne072
     * @tc.desc Verify reduce callback receives NaN clamped to 0 on [NaN]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      let seen: number = -1;
      arr.reduce<number>((p: number, c: number) => { seen = c; return p + c; }, 0);
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_7300
     * @tc.name testUint8ClampedArrayReduceOne073
     * @tc.desc Verify reduce callback receives 1e9 clamped to 255 on [1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e9]);
      let seen: number = -1;
      arr.reduce<number>((p: number, c: number) => { seen = c; return p + c; }, 0);
      expect(seen).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_7400
     * @tc.name testUint8ClampedArrayReduceOne074
     * @tc.desc Verify reduce callback receives -1e9 clamped to 0 on [-1e9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1e9]);
      let seen: number = -1;
      arr.reduce<number>((p: number, c: number) => { seen = c; return p + c; }, 0);
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_7500
     * @tc.name testUint8ClampedArrayReduceOne075
     * @tc.desc Verify reduce subtract [1,2,3] initialValue=0 returns -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p - c, 0);
      expect(r).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_7600
     * @tc.name testUint8ClampedArrayReduceOne076
     * @tc.desc Verify reduce [1,2,3] initialValue=0 with callback p + c/2 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: number = arr.reduce<number>((p: number, c: number) => p + c / 2, 0);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_REDUCE_ONE_7700
     * @tc.name testUint8ClampedArrayReduceOne077
     * @tc.desc Verify reduce U=string initialValue='' on [65,66,67] concats elements returns '656667'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayReduceOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([65, 66, 67]);
      const r: string = arr.reduce<string>((p: string, c: number) => p + c.toString(), '');
      expect(r).assertEqual('656667');
    });
  });
}
