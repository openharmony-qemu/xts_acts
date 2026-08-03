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

export default function uint8ClampedArrayToLocaleStringOneTest(): void {
  describe('Uint8ClampedArrayToLocaleStringOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0100
     * @tc.name testUint8ClampedArrayToLocaleStringOne001
     * @tc.desc Verify toLocaleString() on [10,20] returns "10,20"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      expect(arr.toLocaleString()).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0200
     * @tc.name testUint8ClampedArrayToLocaleStringOne002
     * @tc.desc Verify toLocaleString(undefined) on [1,2] result contains comma at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const s: string = arr.toLocaleString(undefined);
      expect(arr.length).assertEqual(2);
      expect(s.indexOf(',')).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0300
     * @tc.name testUint8ClampedArrayToLocaleStringOne003
     * @tc.desc Verify toLocaleString("") on [1,2,3] throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.toLocaleString('');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0400
     * @tc.name testUint8ClampedArrayToLocaleStringOne004
     * @tc.desc Verify toLocaleString("en-US") on [1,2,3] result contains comma at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const s: string = arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(3);
      expect(s.indexOf(',')).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0500
     * @tc.name testUint8ClampedArrayToLocaleStringOne005
     * @tc.desc Verify toLocaleString("en-US", undefined) on [1,2,3] result contains comma at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const s: string = arr.toLocaleString('en-US', undefined);
      expect(arr.length).assertEqual(3);
      expect(s.indexOf(',')).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0600
     * @tc.name testUint8ClampedArrayToLocaleStringOne006
     * @tc.desc Verify toLocaleString("en-US") on empty ArrayBuffer view returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new ArrayBuffer(0));
      const s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0700
     * @tc.name testUint8ClampedArrayToLocaleStringOne007
     * @tc.desc Verify toLocaleString("en-US") on [255] returns "255"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      const s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0800
     * @tc.name testUint8ClampedArrayToLocaleStringOne008
     * @tc.desc Verify toLocaleString("en-US") on [0] returns "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_0900
     * @tc.name testUint8ClampedArrayToLocaleStringOne009
     * @tc.desc Verify toLocaleString("en-US") on [255,255,255] result contains comma at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const s: string = arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(3);
      expect(s.indexOf(',')).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1000
     * @tc.name testUint8ClampedArrayToLocaleStringOne010
     * @tc.desc Verify indexOf on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString();
      expect(arr.length).assertEqual(3);
      expect(r.indexOf(',')).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1100
     * @tc.name testUint8ClampedArrayToLocaleStringOne011
     * @tc.desc Verify toLocaleString() on empty Uint8ClampedArray(0) returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r = arr.toLocaleString();
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1200
     * @tc.name testUint8ClampedArrayToLocaleStringOne012
     * @tc.desc Verify toLocaleString() on [42] returns "42"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r = arr.toLocaleString();
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1300
     * @tc.name testUint8ClampedArrayToLocaleStringOne013
     * @tc.desc Verify toLocaleString("en-US") on [1,2] result contains comma at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(2);
      expect(r.indexOf(',')).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1400
     * @tc.name testUint8ClampedArrayToLocaleStringOne014
     * @tc.desc Verify toLocaleString(undefined, undefined) on [1,2] result contains comma at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r = arr.toLocaleString(undefined, undefined);
      expect(arr.length).assertEqual(2);
      expect(r.indexOf(',')).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1500
     * @tc.name testUint8ClampedArrayToLocaleStringOne015
     * @tc.desc Verify toLocaleString() on [255,255,255] result contains comma at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      const r = arr.toLocaleString();
      expect(arr.length).assertEqual(3);
      expect(r.indexOf(',')).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1600
     * @tc.name testUint8ClampedArrayToLocaleStringOne016
     * @tc.desc Verify toLocaleString() on [0,0,0,0] result contains comma at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const r = arr.toLocaleString();
      expect(arr.length).assertEqual(4);
      expect(r.indexOf(',')).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1700
     * @tc.name testUint8ClampedArrayToLocaleStringOne017
     * @tc.desc Verify toLocaleString() on [7,8,9] twice returns same result "7,8,9"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([7, 8, 9]);
      const r1 = arr.toLocaleString();
      const r2 = arr.toLocaleString();
      expect(arr.length).assertEqual(3);
      expect(r1).assertEqual(r2);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(8);
      expect(arr[2]).assertEqual(9);
      expect(r1).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1800
     * @tc.name testUint8ClampedArrayToLocaleStringOne018
     * @tc.desc Verify toLocaleString() on [1] differs from toLocaleString() on [2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([1]);
      const a2 = new Uint8ClampedArray([2]);
      expect(a1.toLocaleString()).not().assertEqual(a2.toLocaleString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_1900
     * @tc.name testUint8ClampedArrayToLocaleStringOne019
     * @tc.desc Verify toLocaleString() on [1] differs from toLocaleString() on [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([1]);
      const a2 = new Uint8ClampedArray([1, 2]);
      expect(a1.toLocaleString()).not().assertEqual(a2.toLocaleString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2000
     * @tc.name testUint8ClampedArrayToLocaleStringOne020
     * @tc.desc Verify toLocaleString() on Uint8ClampedArray(0) differs from [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray(0);
      const a2 = new Uint8ClampedArray([0]);
      expect(a1.toLocaleString()).not().assertEqual(a2.toLocaleString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2100
     * @tc.name testUint8ClampedArrayToLocaleStringOne021
     * @tc.desc Verify toLocaleString("en-US") on [256] result contains "255", arr[0] clamped to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      const r = arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(1);
      expect(r.indexOf('255')).assertLargerOrEqual(0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2200
     * @tc.name testUint8ClampedArrayToLocaleStringOne022
     * @tc.desc Verify -1 clamp 0 '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      const r = arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(1);
      expect(r.charAt(0)).assertEqual(c'0');
      expect(arr[0]).assertEqual(0);
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2300
     * @tc.name testUint8ClampedArrayToLocaleStringOne023
     * @tc.desc Verify toLocaleString("en-US") on [0] result contains "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const r = arr.toLocaleString('en-US');
      expect(arr.length).assertEqual(1);
      expect(r.indexOf('0')).assertLargerOrEqual(0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2400
     * @tc.name testUint8ClampedArrayToLocaleStringOne024
     * @tc.desc Verify toLocaleString("en-US") on [100] returns "100" length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100]);
      const r = arr.toLocaleString('en-US');
      expect(r.length).assertEqual(3);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      expect(r).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2500
     * @tc.name testUint8ClampedArrayToLocaleStringOne025
     * @tc.desc Verify toLocaleString() on [1,2,3] does not mutate array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const lenBefore = arr.length;
      arr.toLocaleString();
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2600
     * @tc.name testUint8ClampedArrayToLocaleStringOne026
     * @tc.desc Verify toLocaleString() on [11,22,33] does not mutate arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([11, 22, 33]);
      arr.toLocaleString();
      expect(arr[0]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2700
     * @tc.name testUint8ClampedArrayToLocaleStringOne027
     * @tc.desc Verify toLocaleString("en-US") on [1,2,3] does not affect join(",") result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const joinBefore = arr.join(',');
      arr.toLocaleString('en-US');
      expect(arr.join(',')).assertEqual(joinBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2800
     * @tc.name testUint8ClampedArrayToLocaleStringOne028
     * @tc.desc Verify subarray(1,3).toLocaleString() on [10,20,30,40] parent and sub unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40]);
      const sub = parent.subarray(1, 3);
      sub.toLocaleString();
      expect(parent.length).assertEqual(4);
      expect(sub.length).assertEqual(2);
      expect(parent[0]).assertEqual(10);
      expect(parent[1]).assertEqual(20);
      expect(parent[2]).assertEqual(30);
      expect(parent[3]).assertEqual(40);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(30);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_2900
     * @tc.name testUint8ClampedArrayToLocaleStringOne029
     * @tc.desc Verify subarray(0,2).toLocaleString() on [10,20,30] parent and sub unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30]);
      const sub = parent.subarray(0, 2);
      sub.toLocaleString();
      expect(parent.length).assertEqual(3);
      expect(sub.length).assertEqual(2);
      expect(parent[0]).assertEqual(10);
      expect(parent[1]).assertEqual(20);
      expect(parent[2]).assertEqual(30);
      expect(sub[0]).assertEqual(10);
      expect(sub[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3000
     * @tc.name testUint8ClampedArrayToLocaleStringOne030
     * @tc.desc Verify subarray(1,1).toLocaleString() on [1,2,3] empty sub, parent unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const sub = parent.subarray(1, 1);
      const r = sub.toLocaleString();
      expect(parent.length).assertEqual(3);
      expect(sub.length).assertEqual(0);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3100
     * @tc.name testUint8ClampedArrayToLocaleStringOne031
     * @tc.desc Verify toLocaleString() on byteOffset=2 view, byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 2, 4);
      view.toLocaleString();
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3200
     * @tc.name testUint8ClampedArrayToLocaleStringOne032
     * @tc.desc Verify toLocaleString() on byteOffset=0 view, buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 0, 4);
      view.toLocaleString();
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3300
     * @tc.name testUint8ClampedArrayToLocaleStringOne033
     * @tc.desc Verify toLocaleString() on zero-length ArrayBuffer view returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view = new Uint8ClampedArray(buf, 4, 0);
      const r = view.toLocaleString();
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3400
     * @tc.name testUint8ClampedArrayToLocaleStringOne034
     * @tc.desc Verify slice(1,3).toLocaleString() on [5,6,7,8], slice unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([5, 6, 7, 8]);
      const sli = parent.slice(1, 3);
      sli.toLocaleString();
      expect(sli.length).assertEqual(2);
      expect(sli[0]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3500
     * @tc.name testUint8ClampedArrayToLocaleStringOne035
     * @tc.desc Verify slice(0,2).toLocaleString() on [5,6,7,8], slice.buffer !== parent.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([5, 6, 7, 8]);
      const sli = parent.slice(0, 2);
      sli.toLocaleString();
      expect(sli.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3600
     * @tc.name testUint8ClampedArrayToLocaleStringOne036
     * @tc.desc Verify toLocaleString() on [1,2,3] result length equals toString() result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const a = arr.toLocaleString();
      const b = arr.toString();
      expect(a.length).assertEqual(b.length);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(a).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3700
     * @tc.name testUint8ClampedArrayToLocaleStringOne037
     * @tc.desc Verify toLocaleString zh-CN [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('zh-CN');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3800
     * @tc.name testUint8ClampedArrayToLocaleStringOne038
     * @tc.desc Verify toLocaleString de-DE [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('de-DE');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_3900
     * @tc.name testUint8ClampedArrayToLocaleStringOne039
     * @tc.desc Verify toLocaleString ar [1,2,3] length >= 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('ar');
      expect(r.length).assertLargerOrEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4000
     * @tc.name testUint8ClampedArrayToLocaleStringOne040
     * @tc.desc Verify toLocaleString ja-JP [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('ja-JP');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4100
     * @tc.name testUint8ClampedArrayToLocaleStringOne041
     * @tc.desc Verify toLocaleString fr-FR [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('fr-FR');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4200
     * @tc.name testUint8ClampedArrayToLocaleStringOne042
     * @tc.desc Verify toLocaleString ko-KR [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('ko-KR');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4300
     * @tc.name testUint8ClampedArrayToLocaleStringOne043
     * @tc.desc Verify toLocaleString ru-RU [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('ru-RU');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4400
     * @tc.name testUint8ClampedArrayToLocaleStringOne044
     * @tc.desc Verify toLocaleString en-GB [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('en-GB');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4500
     * @tc.name testUint8ClampedArrayToLocaleStringOne045
     * @tc.desc Verify toLocaleString en [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('en');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4600
     * @tc.name testUint8ClampedArrayToLocaleStringOne046
     * @tc.desc Verify toLocaleString zh [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('zh');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4700
     * @tc.name testUint8ClampedArrayToLocaleStringOne047
     * @tc.desc Verify toLocaleString EN-US [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('EN-US');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4800
     * @tc.name testUint8ClampedArrayToLocaleStringOne048
     * @tc.desc Verify toLocaleString en-us [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('en-us');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_4900
     * @tc.name testUint8ClampedArrayToLocaleStringOne049
     * @tc.desc Verify toLocaleString en-US-u-nu-arab [1,2,3] length >= 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('en-US-u-nu-arab');
      expect(r.length).assertLargerOrEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_5000
     * @tc.name testUint8ClampedArrayToLocaleStringOne050
     * @tc.desc Verify toLocaleString en-US-u-nu-latn [1,2,3] length >= 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r = arr.toLocaleString('en-US-u-nu-latn');
      expect(r.length).assertLargerOrEqual(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_5100
     * @tc.name testUint8ClampedArrayToLocaleStringOne051
     * @tc.desc Verify toLocaleString spaces throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.toLocaleString('   ');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_5200
     * @tc.name testUint8ClampedArrayToLocaleStringOne052
     * @tc.desc Verify toLocaleString digits throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.toLocaleString('12345');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_5300
     * @tc.name testUint8ClampedArrayToLocaleStringOne053
     * @tc.desc Verify toLocaleString xxxx throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.toLocaleString('xxxx');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_5400
     * @tc.name testUint8ClampedArrayToLocaleStringOne054
     * @tc.desc Verify toLocaleString special chars throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.toLocaleString('!@#$%');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_5500
     * @tc.name testUint8ClampedArrayToLocaleStringOne055
     * @tc.desc Verify toLocaleString Chinese chars throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.toLocaleString('中文');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_5600
     * @tc.name testUint8ClampedArrayToLocaleStringOne056
     * @tc.desc Verify toLocaleString hyphen only throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.toLocaleString('-');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOLOCALESTRING_ONE_5700
     * @tc.name testUint8ClampedArrayToLocaleStringOne057
     * @tc.desc Verify toLocaleString underscore separator throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToLocaleStringOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.toLocaleString('en_US');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
