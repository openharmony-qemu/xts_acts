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

export default function uint8ClampedArrayOfOneTest(): void {
  describe('Uint8ClampedArrayOfOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0100
     * @tc.name testUint8ClampedArrayOfOne001
     * @tc.desc Verify of() returns empty Uint8ClampedArray with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0200
     * @tc.name testUint8ClampedArrayOfOne002
     * @tc.desc Verify of(byte 42) returns [42] length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 42;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0300
     * @tc.name testUint8ClampedArrayOfOne003
     * @tc.desc Verify of(byte 7, byte 8) returns [7,8] length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 7;
      const b: byte = 8;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0400
     * @tc.name testUint8ClampedArrayOfOne004
     * @tc.desc Verify of 100 identical byte 5 values returns length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v,
        v, v, v, v, v, v, v, v, v, v
      );
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0500
     * @tc.name testUint8ClampedArrayOfOne005
     * @tc.desc Verify of byte 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0600
     * @tc.name testUint8ClampedArrayOfOne006
     * @tc.desc Verify of byte 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0700
     * @tc.name testUint8ClampedArrayOfOne007
     * @tc.desc Verify of byte -1 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0800
     * @tc.name testUint8ClampedArrayOfOne008
     * @tc.desc Verify of byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const d: byte = 4;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c, d);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_0900
     * @tc.name testUint8ClampedArrayOfOne009
     * @tc.desc Verify Uint8ClampedArray.of with duplicate byte arguments -> array length equals argument count and each element matches input value in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c, b, a);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
      expect(arr[0]).assertEqual(arr[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1000
     * @tc.name testUint8ClampedArrayOfOne010
     * @tc.desc Verify of Uint8ClampedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1100
     * @tc.name testUint8ClampedArrayOfOne011
     * @tc.desc Verify of(byte 1,2,3,4) elements match in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const a: Uint8ClampedArray = Uint8ClampedArray.of(v);
      const b: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(a).not().assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1200
     * @tc.name testUint8ClampedArrayOfOne012
     * @tc.desc Verify of(byte 1) twice produces arrays with different buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const a: Uint8ClampedArray = Uint8ClampedArray.of(v);
      const b: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1300
     * @tc.name testUint8ClampedArrayOfOne013
     * @tc.desc Verify of(byte 1) mutation of first array does not affect second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const a: Uint8ClampedArray = Uint8ClampedArray.of(v);
      a[0] = 99;
      const b: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(b[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1400
     * @tc.name testUint8ClampedArrayOfOne014
     * @tc.desc Verify of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      arr[0] = 50;
      expect(arr[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1500
     * @tc.name testUint8ClampedArrayOfOne015
     * @tc.desc Verify of(byte 1) array element set to 300 clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      arr[0] = 300;
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1600
     * @tc.name testUint8ClampedArrayOfOne016
     * @tc.desc Verify of(byte 77) $\_get(0) returns 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 77;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1700
     * @tc.name testUint8ClampedArrayOfOne017
     * @tc.desc Verify of(byte 1) $\_set(0,88) then element equals 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      arr.$_set(0, 88);
      expect(arr[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1800
     * @tc.name testUint8ClampedArrayOfOne018
     * @tc.desc Verify of(byte 1,2) fill(9) changes all elements to 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b);
      arr.fill(9);
      expect(arr[0]).assertEqual(9);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_1900
     * @tc.name testUint8ClampedArrayOfOne019
     * @tc.desc Verify of(byte 1,2,3) reverse() returns [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c);
      arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2000
     * @tc.name testUint8ClampedArrayOfOne020
     * @tc.desc Verify of(byte 1,2,3).slice(0,2) returns length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c);
      const s: Uint8ClampedArray = arr.slice(0, 2);
      expect(s.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2100
     * @tc.name testUint8ClampedArrayOfOne021
     * @tc.desc Verify of(byte 1,2,3).subarray(1,3) returns [2,3] length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c);
      const s: Uint8ClampedArray = arr.subarray(1, 3);
      expect(s.length).assertEqual(2);
      expect(s[0]).assertEqual(2);
      expect(s[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2200
     * @tc.name testUint8ClampedArrayOfOne022
     * @tc.desc Verify of(byte 7,8).values().next() returns value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 7;
      const b: byte = 8;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b);
      const it = arr.values();
      const r = it.next();
      expect(r.value).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2300
     * @tc.name testUint8ClampedArrayOfOne023
     * @tc.desc Verify of(byte 1,2,3) for..of iterates 3 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c);
      let cnt: int = 0;
      for (const x of arr) {
        cnt = cnt + 1;
      }
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2400
     * @tc.name testUint8ClampedArrayOfOne024
     * @tc.desc Verify of() empty array for..of iterates 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      let cnt: int = 0;
      for (const x of arr) {
        cnt = cnt + 1;
      }
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2500
     * @tc.name testUint8ClampedArrayOfOne025
     * @tc.desc Verify of(byte 42) includes(42) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 42;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr.includes(42)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2600
     * @tc.name testUint8ClampedArrayOfOne026
     * @tc.desc Verify of indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 42;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr.indexOf(42)).assertEqual(0);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2700
     * @tc.name testUint8ClampedArrayOfOne027
     * @tc.desc Verify of indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      expect(arr.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2800
     * @tc.name testUint8ClampedArrayOfOne028
     * @tc.desc Verify of() empty array includes(0) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      expect(arr.includes(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_2900
     * @tc.name testUint8ClampedArrayOfOne029
     * @tc.desc Verify of() empty array join(",") returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      expect(arr.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3000
     * @tc.name testUint8ClampedArrayOfOne030
     * @tc.desc Verify of(byte 1,2) join(",") returns "1,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 1;
      const b: byte = 2;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b);
      expect(arr.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3100
     * @tc.name testUint8ClampedArrayOfOne031
     * @tc.desc Verify of() $_get out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3200
     * @tc.name testUint8ClampedArrayOfOne032
     * @tc.desc Verify of() $_set out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      try {
        arr.$_set(0, 50);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3300
     * @tc.name testUint8ClampedArrayOfOne033
     * @tc.desc Verify of with index RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      try {
        arr.with(5, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3400
     * @tc.name testUint8ClampedArrayOfOne034
     * @tc.desc Verify of with index RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      try {
        arr.with(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3500
     * @tc.name testUint8ClampedArrayOfOne035
     * @tc.desc Verify of reduce initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      try {
        arr.reduce((acc: number, cur: number): number => acc + cur);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3600
     * @tc.name testUint8ClampedArrayOfOne036
     * @tc.desc Verify of reduceRight initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      try {
        arr.reduceRight((acc: number, cur: number): number => acc + cur);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3700
     * @tc.name testUint8ClampedArrayOfOne037
     * @tc.desc Verify of some false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      expect(arr.some((v: number): boolean => v > 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3800
     * @tc.name testUint8ClampedArrayOfOne038
     * @tc.desc Verify of every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      expect(arr.every((v: number): boolean => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_3900
     * @tc.name testUint8ClampedArrayOfOne039
     * @tc.desc Verify of find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      const r = arr.find((v: number): boolean => v > 0);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4000
     * @tc.name testUint8ClampedArrayOfOne040
     * @tc.desc Verify of findIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      expect(arr.findIndex((v: number): boolean => v > 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4100
     * @tc.name testUint8ClampedArrayOfOne041
     * @tc.desc Verify of at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      const r = arr.at(0);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4200
     * @tc.name testUint8ClampedArrayOfOne042
     * @tc.desc Verify of at(-1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      const r = arr.at(-1);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4300
     * @tc.name testUint8ClampedArrayOfOne043
     * @tc.desc Verify of at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 55;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr.at(-1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4400
     * @tc.name testUint8ClampedArrayOfOne044
     * @tc.desc Verify of set RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      try {
        const src = new Uint8ClampedArray([1, 2, 3]);
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4500
     * @tc.name testUint8ClampedArrayOfOne045
     * @tc.desc Verify of set RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      try {
        const src = new Uint8ClampedArray([5]);
        arr.set(src, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4600
     * @tc.name testUint8ClampedArrayOfOne046
     * @tc.desc Verify number 0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4700
     * @tc.name testUint8ClampedArrayOfOne047
     * @tc.desc Verify number 255.0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(255.0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4800
     * @tc.name testUint8ClampedArrayOfOne048
     * @tc.desc Verify number 256.0 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(256.0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_4900
     * @tc.name testUint8ClampedArrayOfOne049
     * @tc.desc Verify number -1.0 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(-1.0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5000
     * @tc.name testUint8ClampedArrayOfOne050
     * @tc.desc Verify number 128.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(128.5);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5100
     * @tc.name testUint8ClampedArrayOfOne051
     * @tc.desc Verify number 0.5 half-even 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0.5);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5200
     * @tc.name testUint8ClampedArrayOfOne052
     * @tc.desc Verify number 2.5 half-even 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(2.5);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5300
     * @tc.name testUint8ClampedArrayOfOne053
     * @tc.desc Verify number 254.6 rounds to 255 (f+0.5 < number, return f+1 per ToUint8Clamp)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(254.6);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5400
     * @tc.name testUint8ClampedArrayOfOne054
     * @tc.desc Verify number 255.5 half-even clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(255.5);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5500
     * @tc.name testUint8ClampedArrayOfOne055
     * @tc.desc Verify number NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(Number.NaN);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5600
     * @tc.name testUint8ClampedArrayOfOne056
     * @tc.desc Verify number Infinity clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5700
     * @tc.name testUint8ClampedArrayOfOne057
     * @tc.desc Verify number -Infinity clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(-Number.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5800
     * @tc.name testUint8ClampedArrayOfOne058
     * @tc.desc Verify of(0x10,0o20,0b10000,16.0) all equal 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0x10, 0o20, 0b10000, 16.0);
      expect(arr[0]).assertEqual(16);
      expect(arr[1]).assertEqual(16);
      expect(arr[2]).assertEqual(16);
      expect(arr[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_5900
     * @tc.name testUint8ClampedArrayOfOne059
     * @tc.desc Verify of(...[]) with empty spread array returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [] as Array<number>;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6000
     * @tc.name testUint8ClampedArrayOfOne060
     * @tc.desc Verify of(...[100.0]) with single element spread returns [100] length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [100.0];
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...src);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6100
     * @tc.name testUint8ClampedArrayOfOne061
     * @tc.desc Verify of(...[1,2,3,4,5]) spread returns [1,2,3,4,5] length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...src);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6200
     * @tc.name testUint8ClampedArrayOfOne062
     * @tc.desc Verify of(...[300,-50,128]) spread clamps to [255,0,128]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [300.0, -50.0, 128.0];
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...src);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6300
     * @tc.name testUint8ClampedArrayOfOne063
     * @tc.desc Verify spread Array<number> NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN, Number.NaN, Number.NaN];
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6400
     * @tc.name testUint8ClampedArrayOfOne064
     * @tc.desc Verify of(11,22,33) $_get(1) returns 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(11.0, 22.0, 33.0);
      expect(arr.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6500
     * @tc.name testUint8ClampedArrayOfOne065
     * @tc.desc Verify of(1,2,3) $\_set(1,300) clamps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0, 3.0);
      arr.$_set(1, 300);
      expect(arr[1]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6600
     * @tc.name testUint8ClampedArrayOfOne066
     * @tc.desc Verify of $_get(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0);
      try {
        arr.$_get(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6700
     * @tc.name testUint8ClampedArrayOfOne067
     * @tc.desc Verify of $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6800
     * @tc.name testUint8ClampedArrayOfOne068
     * @tc.desc Verify of $_set(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0);
      try {
        arr.$_set(2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_6900
     * @tc.name testUint8ClampedArrayOfOne069
     * @tc.desc Verify of $_set(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7000
     * @tc.name testUint8ClampedArrayOfOne070
     * @tc.desc Verify of with index=length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0);
      try {
        arr.with(2, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7100
     * @tc.name testUint8ClampedArrayOfOne071
     * @tc.desc Verify of with index=-length-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.0, 2.0);
      try {
        arr.with(-3, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7200
     * @tc.name testUint8ClampedArrayOfOne072
     * @tc.desc Verify 1000 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<number> = [];
      for (let i: int = 0; i < 1000; i++) {
        list.push(1e6);
      }
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...list);
      expect(arr.length).assertEqual(1000);
      expect(arr[0]).assertEqual(255);
      expect(arr[500]).assertEqual(255);
      expect(arr[999]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7300
     * @tc.name testUint8ClampedArrayOfOne073
     * @tc.desc Verify 1000 NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<number> = [];
      for (let i: int = 0; i < 1000; i++) {
        list.push(Number.NaN);
      }
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...list);
      expect(arr[500]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7400
     * @tc.name testUint8ClampedArrayOfOne074
     * @tc.desc Verify of 1024 elements of 128 returns length 1024, all 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list: Array<number> = [];
      for (let i: int = 0; i < 1024; i++) {
        list.push(128.0);
      }
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(...list);
      expect(arr.length).assertEqual(1024);
      expect(arr[0]).assertEqual(128);
      expect(arr[512]).assertEqual(128);
      expect(arr[1023]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7500
     * @tc.name testUint8ClampedArrayOfOne075
     * @tc.desc Verify of(byte 10) returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 10;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7600
     * @tc.name testUint8ClampedArrayOfOne076
     * @tc.desc Verify of 5 byte params length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 10;
      const b: byte = 20;
      const c: byte = 30;
      const d: byte = 40;
      const e: byte = 50;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c, d, e);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7700
     * @tc.name testUint8ClampedArrayOfOne077
     * @tc.desc Verify of(byte -128) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -128;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7800
     * @tc.name testUint8ClampedArrayOfOne078
     * @tc.desc Verify of(byte 126) passthrough 126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 126;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr[0]).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_7900
     * @tc.name testUint8ClampedArrayOfOne079
     * @tc.desc Verify of(byte -127) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -127;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(v);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8000
     * @tc.name testUint8ClampedArrayOfOne080
     * @tc.desc Verify of(byte 100, byte -100) clamp to 100 and 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: byte = 100;
      const n: byte = -100;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(p, n);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8100
     * @tc.name testUint8ClampedArrayOfOne081
     * @tc.desc Verify of byte descending order 4 3 2 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: byte = 4;
      const b: byte = 3;
      const c: byte = 2;
      const d: byte = 1;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(a, b, c, d);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8200
     * @tc.name testUint8ClampedArrayOfOne082
     * @tc.desc Verify of byte 0 127 0 127 alternating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const z: byte = 0;
      const h: byte = 127;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(z, h, z, h);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(127);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8300
     * @tc.name testUint8ClampedArrayOfOne083
     * @tc.desc Verify of byte 0 64 127 boundary sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const z: byte = 0;
      const m: byte = 64;
      const h: byte = 127;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(z, m, h);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(64);
      expect(arr[2]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8400
     * @tc.name testUint8ClampedArrayOfOne084
     * @tc.desc Verify of(byte -128, byte 127) clamps to [0,127]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: byte = -128;
      const p: byte = 127;
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(n, p);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8500
     * @tc.name testUint8ClampedArrayOfOne085
     * @tc.desc Verify of() byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of();
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8600
     * @tc.name testUint8ClampedArrayOfOne086
     * @tc.desc Verify of(127.5) half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(127.5);
      expect(arr[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8700
     * @tc.name testUint8ClampedArrayOfOne087
     * @tc.desc Verify of(1.5) half-even 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(1.5);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8800
     * @tc.name testUint8ClampedArrayOfOne088
     * @tc.desc Verify of(0.9) round 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0.9);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_OF_ONE_8900
     * @tc.name testUint8ClampedArrayOfOne089
     * @tc.desc Verify of(0.5, 1.5, 2.5, 3.5) half-even 0 2 2 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayOfOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8ClampedArray = Uint8ClampedArray.of(0.5, 1.5, 2.5, 3.5);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(4);
    });
  });
}
