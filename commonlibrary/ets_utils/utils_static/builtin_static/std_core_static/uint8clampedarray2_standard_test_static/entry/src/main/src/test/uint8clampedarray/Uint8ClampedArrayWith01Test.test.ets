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

export default function uint8ClampedArrayWithOneTest(): void {
  describe('Uint8ClampedArrayWithOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0100
     * @tc.name testUint8ClampedArrayWithOne001
     * @tc.desc Verify with [1,2,3] returns [10,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 10;
      const r = arr.with(0, v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0200
     * @tc.name testUint8ClampedArrayWithOne002
     * @tc.desc Verify with [1,2,3] returns [1,20,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 20;
      const r = arr.with(1, v);
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(20);
      expect(r[0]).assertEqual(1);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0300
     * @tc.name testUint8ClampedArrayWithOne003
     * @tc.desc Verify with [1,2,3] returns [1,2,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 30;
      const r = arr.with(2, v);
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(30);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0400
     * @tc.name testUint8ClampedArrayWithOne004
     * @tc.desc Verify index=-1 replaces last element [5,6,7]->[5,6,77]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const v: byte = 77;
      const r = arr.with(-1, v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(6);
      expect(r[2]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0500
     * @tc.name testUint8ClampedArrayWithOne005
     * @tc.desc Verify index=length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const v: byte = 1;
      try {
        arr.with(3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0600
     * @tc.name testUint8ClampedArrayWithOne006
     * @tc.desc Verify index=INT_MAX RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const v: byte = 1;
      try {
        arr.with(2147483647, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0700
     * @tc.name testUint8ClampedArrayWithOne007
     * @tc.desc Verify index=INT_MIN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 6, 7]);
      const v: byte = 1;
      try {
        arr.with(-2147483648, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0800
     * @tc.name testUint8ClampedArrayWithOne008
     * @tc.desc Verify index=0o7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50, 60, 70, 80]);
      const v: byte = 9;
      const r = arr.with(0o7, v);
      expect(r.length).assertEqual(8);
      expect(r[7]).assertEqual(9);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_0900
     * @tc.name testUint8ClampedArrayWithOne009
     * @tc.desc Verify with [100] returns [55]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const v: byte = 55;
      const r = arr.with(0, v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1000
     * @tc.name testUint8ClampedArrayWithOne010
     * @tc.desc Verify index =1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const v: byte = 1;
      try {
        arr.with(1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1100
     * @tc.name testUint8ClampedArrayWithOne011
     * @tc.desc Verify with(0, v) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const v: byte = 1;
      try {
        arr.with(0, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1200
     * @tc.name testUint8ClampedArrayWithOne012
     * @tc.desc Verify index=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 256; i++) { src.push(i); }
      const arr = new Uint8ClampedArray(src);
      const v: byte = 50;
      const r = arr.with(255, v);
      expect(r.length).assertEqual(256);
      expect(r[255]).assertEqual(50);
      expect(r[0]).assertEqual(0);
      expect(r[128]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1300
     * @tc.name testUint8ClampedArrayWithOne013
     * @tc.desc Verify index=256 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      for (let i: int = 0; i < 256; i++) { src.push(i); }
      const arr = new Uint8ClampedArray(src);
      const v: byte = 1;
      try {
        arr.with(256, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1400
     * @tc.name testUint8ClampedArrayWithOne014
     * @tc.desc Verify with [10,20,30] returns [10,0,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v: byte = 0;
      const r = arr.with(1, v);
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(0);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1500
     * @tc.name testUint8ClampedArrayWithOne015
     * @tc.desc Verify with [10,20,30] returns [10,127,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v: byte = 127;
      const r = arr.with(1, v);
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(127);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1600
     * @tc.name testUint8ClampedArrayWithOne016
     * @tc.desc Verify with [10,20,30] returns [10,-128,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const v: byte = -128;
      const r = arr.with(1, v);
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(0);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1700
     * @tc.name testUint8ClampedArrayWithOne017
     * @tc.desc Verify with(0,9) on [1,2,3] returns [9,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 9;
      const r = arr.with(0, v);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(9);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1800
     * @tc.name testUint8ClampedArrayWithOne018
     * @tc.desc Verify with(0,9) on [1,2,3] result is not same object as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 9;
      const r = arr.with(0, v);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_1900
     * @tc.name testUint8ClampedArrayWithOne019
     * @tc.desc Verify with(0,9) on [1,2,3] result.buffer differs from arr.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 9;
      const r = arr.with(0, v);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2000
     * @tc.name testUint8ClampedArrayWithOne020
     * @tc.desc Verify with(0,99) on [1,2,3] discarding result, original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 99;
      arr.with(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2100
     * @tc.name testUint8ClampedArrayWithOne021
     * @tc.desc Verify with [1,2,3,4] returns [1,2,99,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 99;
      const r = arr.with(2, v);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(99);
      expect(r[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2200
     * @tc.name testUint8ClampedArrayWithOne022
     * @tc.desc Verify with(0,10).with(1,20) on [1,2,3] returns [10,20,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const withValue1: byte = 10;
      const withValue2: byte = 20;
      const r1 = arr.with(0, withValue1);
      const r2 = r1.with(1, withValue2);
      expect(r2.length).assertEqual(3);
      expect(r2[0]).assertEqual(10);
      expect(r2[1]).assertEqual(20);
      expect(r2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2300
     * @tc.name testUint8ClampedArrayWithOne023
     * @tc.desc Verify with(10,v) throws RangeError, original length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 9;
      try {
        arr.with(10, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2400
     * @tc.name testUint8ClampedArrayWithOne024
     * @tc.desc Verify with ArrayBuffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 0, 2);
      const v: byte = 9;
      try {
        arr.with(2, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2500
     * @tc.name testUint8ClampedArrayWithOne025
     * @tc.desc Verify with(5,9) on [1,2,3] throws RangeError, arr.buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const origBuf = arr.buffer;
      const v: byte = 9;
      try {
        arr.with(5, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.buffer).assertEqual(origBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2600
     * @tc.name testUint8ClampedArrayWithOne026
     * @tc.desc Verify with result independent from source; r[1]=200 does not affect arr[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 99;
      const r = arr.with(0, v);
      r[1] = 200;
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2700
     * @tc.name testUint8ClampedArrayWithOne027
     * @tc.desc Verify subarray(1,4).with(0,9) on [1,2,3,4,5] result independent, parent and sub unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      const v: byte = 9;
      const r = sub.with(0, v);
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(r.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
      expect(r[0]).assertEqual(9);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2800
     * @tc.name testUint8ClampedArrayWithOne028
     * @tc.desc Verify with(0,99) on ArrayBuffer view discarding result, view[0] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Uint8ClampedArray(buf);
      view[0] = 1;
      view[1] = 2;
      const v: byte = 99;
      view.with(0, v);
      expect(view[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_2900
     * @tc.name testUint8ClampedArrayWithOne029
     * @tc.desc Verify with(0,9) on byteOffset=2 view result.byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 2, 4);
      const v: byte = 9;
      const r = view.with(0, v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3000
     * @tc.name testUint8ClampedArrayWithOne030
     * @tc.desc Verify with() arity 0 throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        const withFn = (arr as Object as Record<string, (...args: number[]) => Uint8ClampedArray>)['with'] as (...args: number[]) => Uint8ClampedArray;
        withFn();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3100
     * @tc.name testUint8ClampedArrayWithOne031
     * @tc.desc Verify with(0) arity 1 throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        const withFn = (arr as Object as Record<string, (...args: number[]) => Uint8ClampedArray>)['with'] as (...args: number[]) => Uint8ClampedArray;
        withFn(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3200
     * @tc.name testUint8ClampedArrayWithOne032
     * @tc.desc Verify with(0,99) on [10,20,30] returns [99,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 99.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(99);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3300
     * @tc.name testUint8ClampedArrayWithOne033
     * @tc.desc Verify with(1,99) on [10,20,30] returns [10,99,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(1, 99.0);
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(99);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3400
     * @tc.name testUint8ClampedArrayWithOne034
     * @tc.desc Verify with(2,99) on [10,20,30] returns [10,20,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(2, 99.0);
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(99);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3500
     * @tc.name testUint8ClampedArrayWithOne035
     * @tc.desc Verify index=length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      try {
        arr.with(3, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3600
     * @tc.name testUint8ClampedArrayWithOne036
     * @tc.desc Verify index=-1 replaces last element [10,20,30]->[10,20,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(-1, 99.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3700
     * @tc.name testUint8ClampedArrayWithOne037
     * @tc.desc Verify index=INT_MAX(2147483647) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      try {
        arr.with(2147483647, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3800
     * @tc.name testUint8ClampedArrayWithOne038
     * @tc.desc Verify index=INT_MIN(-2147483648) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      try {
        arr.with(-2147483648, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_3900
     * @tc.name testUint8ClampedArrayWithOne039
     * @tc.desc Verify with(0,...) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      try {
        arr.with(0, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4000
     * @tc.name testUint8ClampedArrayWithOne040
     * @tc.desc Verify with(0,...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.with(0, 99.0);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4100
     * @tc.name testUint8ClampedArrayWithOne041
     * @tc.desc Verify with(1,...) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      try {
        arr.with(1, 99.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4200
     * @tc.name testUint8ClampedArrayWithOne042
     * @tc.desc Verify with(0,0) on [10,20,30] returns [0,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 0.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4300
     * @tc.name testUint8ClampedArrayWithOne043
     * @tc.desc Verify with(0,255) on [10,20,30] returns [255,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 255.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4400
     * @tc.name testUint8ClampedArrayWithOne044
     * @tc.desc Verify value=256 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 256.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4500
     * @tc.name testUint8ClampedArrayWithOne045
     * @tc.desc Verify value=-1 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, -1.0);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4600
     * @tc.name testUint8ClampedArrayWithOne046
     * @tc.desc Verify value=NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, Number.NaN);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4700
     * @tc.name testUint8ClampedArrayWithOne047
     * @tc.desc Verify value=Infinity clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, Number.POSITIVE_INFINITY);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4800
     * @tc.name testUint8ClampedArrayWithOne048
     * @tc.desc Verify value=-Infinity clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, -Number.POSITIVE_INFINITY);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_4900
     * @tc.name testUint8ClampedArrayWithOne049
     * @tc.desc Verify with(0,0) on [10,20,30] returns [0,20,30].5 half-even 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 0.5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5000
     * @tc.name testUint8ClampedArrayWithOne050
     * @tc.desc Verify value=2.5 half-even 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 2.5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5100
     * @tc.name testUint8ClampedArrayWithOne051
     * @tc.desc Verify value=128.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 128.5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(128);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5200
     * @tc.name testUint8ClampedArrayWithOne052
     * @tc.desc Verify value=254.5 half-even 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 254.5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(254);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5300
     * @tc.name testUint8ClampedArrayWithOne053
     * @tc.desc Verify with(0,255) on [10,20,30] returns [255,20,30].5 half-even 256 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 255.5);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(255);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5400
     * @tc.name testUint8ClampedArrayWithOne054
     * @tc.desc Verify with(0,256) on [0] returns [255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r = arr.with(0, 256.0);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5500
     * @tc.name testUint8ClampedArrayWithOne055
     * @tc.desc Verify index=0b10 binary literal r[2]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const v: byte = 99;
      const r = arr.with(0b10, v);
      expect(r.length).assertEqual(4);
      expect(r[2]).assertEqual(99);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5600
     * @tc.name testUint8ClampedArrayWithOne056
     * @tc.desc Verify index=0x2 hex literal r[2]=88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const v: byte = 88;
      const r = arr.with(0x2, v);
      expect(r[2]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5700
     * @tc.name testUint8ClampedArrayWithOne057
     * @tc.desc Verify with returns new array length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const v: byte = 9;
      const r = arr.with(0, v);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(9);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5800
     * @tc.name testUint8ClampedArrayWithOne058
     * @tc.desc Verify with on single element returns length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const v: byte = 9;
      const r = arr.with(0, v);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_5900
     * @tc.name testUint8ClampedArrayWithOne059
     * @tc.desc Verify with(1,99) on [1,2,3] discarding result, original arr[0],arr[2] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 99;
      arr.with(1, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6000
     * @tc.name testUint8ClampedArrayWithOne060
     * @tc.desc Verify with(2,99) on [1,2,3] discarding result, original arr[0],arr[1] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 99;
      arr.with(2, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6100
     * @tc.name testUint8ClampedArrayWithOne061
     * @tc.desc Verify original array length unchanged after with arr.length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 99;
      arr.with(0, v);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6200
     * @tc.name testUint8ClampedArrayWithOne062
     * @tc.desc Verify with [1,2,3,4] returns [99,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 99;
      const r = arr.with(0, v);
      expect(r.length).assertEqual(4);
      expect(r[1]).assertEqual(2);
      expect(r[0]).assertEqual(99);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6300
     * @tc.name testUint8ClampedArrayWithOne063
     * @tc.desc Verify with [1,2,3,4] returns [99,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const v: byte = 99;
      const r = arr.with(0, v);
      expect(r.length).assertEqual(4);
      expect(r[3]).assertEqual(4);
      expect(r[0]).assertEqual(99);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6400
     * @tc.name testUint8ClampedArrayWithOne064
     * @tc.desc Verify with returns new array byteLength=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const v: byte = 9;
      const r = arr.with(0, v);
      expect(r.byteLength).assertEqual(5);
      expect(r[0]).assertEqual(9);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
      expect(r[3]).assertEqual(4);
      expect(r[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6500
     * @tc.name testUint8ClampedArrayWithOne065
     * @tc.desc Verify with returns new array BYTES_PER_ELEMENT=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 9;
      const r = arr.with(0, v);
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6600
     * @tc.name testUint8ClampedArrayWithOne066
     * @tc.desc Verify with returns new array byteOffset=0 on plain array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 9;
      const r = arr.with(0, v);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6700
     * @tc.name testUint8ClampedArrayWithOne067
     * @tc.desc Verify with(0,10) then with(1,20) on [1,2,3] discarding results, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const withValue1: byte = 10;
      const withValue2: byte = 20;
      arr.with(0, withValue1);
      arr.with(1, withValue2);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6800
     * @tc.name testUint8ClampedArrayWithOne068
     * @tc.desc Verify with() on [1,2,3] discarding result, original all elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const withValue1: byte = 10;
      const withValue2: byte = 20;
      arr.with(0, withValue1);
      arr.with(1, withValue2);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_6900
     * @tc.name testUint8ClampedArrayWithOne069
     * @tc.desc Verify with(0) on zero-length view throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 0, 0);
      const v: byte = 9;
      try {
        arr.with(0, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_7000
     * @tc.name testUint8ClampedArrayWithOne070
     * @tc.desc Verify with(0,99) on [1,2,3] result independent from arr[1] mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 99;
      const r = arr.with(0, v);
      arr[1] = 200;
      expect(r.length).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[0]).assertEqual(99);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_7100
     * @tc.name testUint8ClampedArrayWithOne071
     * @tc.desc Verify subarray(1,4).with(0,99) on [1,2,3,4,5] parent and sub unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      const v: byte = 99;
      sub.with(0, v);
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_7200
     * @tc.name testUint8ClampedArrayWithOne072
     * @tc.desc Verify with on buf view returns byteLength=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 2, 4);
      const v: byte = 9;
      const r = view.with(0, v);
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_WITH_ONE_7300
     * @tc.name testUint8ClampedArrayWithOne073
     * @tc.desc Verify with(0,0) on [10,20,30] returns [0,20,30].4 rounds to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayWithOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r = arr.with(0, 0.4);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });
  });
}
