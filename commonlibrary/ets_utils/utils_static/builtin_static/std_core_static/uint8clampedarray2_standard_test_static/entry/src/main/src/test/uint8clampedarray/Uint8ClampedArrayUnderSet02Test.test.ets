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

export default function uint8ClampedArrayUnderSetTwoTest(): void {
  describe('Uint8ClampedArrayUnderSetTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0100
     * @tc.name testUint8ClampedArrayUnderSetTwo001
     * @tc.desc Verify $_set(0, 99) then byteLength equals length on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 99);
      expect(arr.byteLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0200
     * @tc.name testUint8ClampedArrayUnderSetTwo002
     * @tc.desc Verify $_set byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 99);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0300
     * @tc.name testUint8ClampedArrayUnderSetTwo003
     * @tc.desc Verify ArrayBuffer $_set byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 2, 4);
      view.$_set(0, 99);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0400
     * @tc.name testUint8ClampedArrayUnderSetTwo004
     * @tc.desc Verify failed $_set does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 2, 4);
      try {
        view.$_set(100, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0500
     * @tc.name testUint8ClampedArrayUnderSetTwo005
     * @tc.desc Verify $_set(0, 99) preserves buffer reference on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before = arr.buffer;
      arr.$_set(0, 99);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0600
     * @tc.name testUint8ClampedArrayUnderSetTwo006
     * @tc.desc Verify failed $_set(100, 99) preserves buffer reference on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const before = arr.buffer;
      try {
        arr.$_set(100, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0700
     * @tc.name testUint8ClampedArrayUnderSetTwo007
     * @tc.desc Verify view.$_set(0, 99) preserves view.buffer on ArrayBuffer offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint8ClampedArray(buf, 0, 4);
      view.$_set(0, 99);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0800
     * @tc.name testUint8ClampedArrayUnderSetTwo008
     * @tc.desc Verify $_set(0, 99) does not affect sibling elements on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.$_set(0, 99);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_0900
     * @tc.name testUint8ClampedArrayUnderSetTwo009
     * @tc.desc Verify failed $_set does not change element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      try {
        arr.$_set(100, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1000
     * @tc.name testUint8ClampedArrayUnderSetTwo010
     * @tc.desc Verify failed negative $_set does not change element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1100
     * @tc.name testUint8ClampedArrayUnderSetTwo011
     * @tc.desc Verify $_set length buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 99);
      expect(arr.length).assertEqual(arr.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1200
     * @tc.name testUint8ClampedArrayUnderSetTwo012
     * @tc.desc Verify subarray $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      sub.$_set(0, 99);
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(99);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub[0]).assertEqual(99);
      expect(sub[1]).assertEqual(3);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1300
     * @tc.name testUint8ClampedArrayUnderSetTwo013
     * @tc.desc Verify $_set subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      parent.$_set(2, 77);
      expect(parent.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(77);
      expect(parent[3]).assertEqual(4);
      expect(parent[4]).assertEqual(5);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(77);
      expect(sub[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1400
     * @tc.name testUint8ClampedArrayUnderSetTwo014
     * @tc.desc Verify slice $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const copy = parent.slice(0, 3);
      copy.$_set(0, 99);
      expect(copy.buffer).not().assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1500
     * @tc.name testUint8ClampedArrayUnderSetTwo015
     * @tc.desc Verify viewA.$_set(0, 88) visible via viewB.$_get(0) on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const viewA = new Uint8ClampedArray(buf, 0, 4);
      const viewB = new Uint8ClampedArray(buf, 0, 4);
      viewA.$_set(0, 88);
      expect(viewB.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1600
     * @tc.name testUint8ClampedArrayUnderSetTwo016
     * @tc.desc Verify frontView.$_set(3, 222) visible via overlapping backView.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const frontView = new Uint8ClampedArray(buf, 0, 4);
      const backView = new Uint8ClampedArray(buf, 3, 4);
      frontView.$_set(3, 222);
      expect(backView.$_get(0)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1700
     * @tc.name testUint8ClampedArrayUnderSetTwo017
     * @tc.desc Verify viewA.$_set(0, 500) clamps to 255 visible via viewB.$_get(0) on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const viewA = new Uint8ClampedArray(buf, 0, 4);
      const viewB = new Uint8ClampedArray(buf, 0, 4);
      viewA.$_set(0, 500);
      expect(viewB.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1800
     * @tc.name testUint8ClampedArrayUnderSetTwo018
     * @tc.desc Verify $_set(0, 99) returns undefined and element is 99 on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const ret = arr.$_set(0, 99);
      expect(ret).assertEqual(undefined);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_1900
     * @tc.name testUint8ClampedArrayUnderSetTwo019
     * @tc.desc Verify $_set(0, 0.9) rounds arr[0] to 1 on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 0.9);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2000
     * @tc.name testUint8ClampedArrayUnderSetTwo020
     * @tc.desc Verify $_set 128 $_get 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 128);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(128);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2100
     * @tc.name testUint8ClampedArrayUnderSetTwo021
     * @tc.desc Verify $_set 254 $_get 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 254);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(254);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2200
     * @tc.name testUint8ClampedArrayUnderSetTwo022
     * @tc.desc Verify byte 0 $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 0;
      arr.$_set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2300
     * @tc.name testUint8ClampedArrayUnderSetTwo023
     * @tc.desc Verify $_set 1 sibling 0 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.$_set(1, 99);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2400
     * @tc.name testUint8ClampedArrayUnderSetTwo024
     * @tc.desc Verify $_set 2 sibling 0 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.$_set(2, 99);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2500
     * @tc.name testUint8ClampedArrayUnderSetTwo025
     * @tc.desc Verify $_set(0, 256) clamps arr[0] to 255, sibling arr[1]=20 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.$_set(0, 256);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr[0]).assertEqual(255);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2600
     * @tc.name testUint8ClampedArrayUnderSetTwo026
     * @tc.desc Verify $_set(0, -1) clamps arr[0] to 0, sibling arr[1]=20 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.$_set(0, -1);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2700
     * @tc.name testUint8ClampedArrayUnderSetTwo027
     * @tc.desc Verify $_set 254.6 $_get 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.$_set(0, 254.6);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(255);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2800
     * @tc.name testUint8ClampedArrayUnderSetTwo028
     * @tc.desc Verify $_set(0, byte 100) equals $_set(0, number 100) on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8ClampedArray([0, 0, 0]);
      const arr2 = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 100;
      arr1.$_set(0, v);
      arr2.$_set(0, 100);
      expect(arr1.$_get(0)).assertEqual(arr2.$_get(0));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_2900
     * @tc.name testUint8ClampedArrayUnderSetTwo029
     * @tc.desc Verify $_set(0, byte 50) then $_get(0) returns 50 on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 50;
      arr.$_set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(50);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3000
     * @tc.name testUint8ClampedArrayUnderSetTwo030
     * @tc.desc Verify $_set index=0o1 octal writes second element arr[1]=77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.$_set(0o1, 77);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(77);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3100
     * @tc.name testUint8ClampedArrayUnderSetTwo031
     * @tc.desc Verify $_set index=0b10 binary writes third element arr[2]=66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.$_set(0b10, 66);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(66);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3200
     * @tc.name testUint8ClampedArrayUnderSetTwo032
     * @tc.desc Verify $_set after sort uses sorted index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([30, 10, 20]);
      arr.sort();
      arr.$_set(0, 99);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3300
     * @tc.name testUint8ClampedArrayUnderSetTwo033
     * @tc.desc Verify $_set after reverse writes to reversed position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.reverse();
      arr.$_set(0, 99);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(99);
      expect(arr.$_get(2)).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3400
     * @tc.name testUint8ClampedArrayUnderSetTwo034
     * @tc.desc Verify $_set after fill writes over filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.fill(7);
      arr.$_set(1, 99);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(99);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr[2]).assertEqual(7);
      expect(arr[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3500
     * @tc.name testUint8ClampedArrayUnderSetTwo035
     * @tc.desc Verify $_set on of() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(10, 20, 30);
      arr.$_set(1, 99);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(99);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3600
     * @tc.name testUint8ClampedArrayUnderSetTwo036
     * @tc.desc Verify $_set on from() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr = Uint8ClampedArray.from(src);
      arr.$_set(1, 99);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(99);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3700
     * @tc.name testUint8ClampedArrayUnderSetTwo037
     * @tc.desc Verify $_set on byteOffset view writes at view-relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const parent = new Uint8ClampedArray(buf);
      const view = new Uint8ClampedArray(buf, 2, 4);
      view.$_set(0, 99);
      expect(parent[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3800
     * @tc.name testUint8ClampedArrayUnderSetTwo038
     * @tc.desc Verify subarray(1,4).$_set(1, 99) modifies arr[2]=99 on [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = arr.subarray(1, 4);
      sub.$_set(1, 99);
      expect(arr.length).assertEqual(5);
      expect(sub.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(99);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
      expect(sub[0]).assertEqual(20);
      expect(sub[1]).assertEqual(99);
      expect(sub[2]).assertEqual(40);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_3900
     * @tc.name testUint8ClampedArrayUnderSetTwo039
     * @tc.desc Verify $_set on 1024-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr.$_set(512, 88);
      expect(arr.$_get(512)).assertEqual(88);
      expect(arr[0]).assertEqual(0);
      expect(arr[511]).assertEqual(0);
      expect(arr[1023]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_4000
     * @tc.name testUint8ClampedArrayUnderSetTwo040
     * @tc.desc Verify $_set on 65535-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(65535);
      arr.$_set(65534, 77);
      expect(arr.$_get(65534)).assertEqual(77);
      expect(arr[0]).assertEqual(0);
      expect(arr[32767]).assertEqual(0);
      expect(arr[65533]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_4100
     * @tc.name testUint8ClampedArrayUnderSetTwo041
     * @tc.desc Verify $_set value=0o377 writes 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.$_set(0, 0o377);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_4200
     * @tc.name testUint8ClampedArrayUnderSetTwo042
     * @tc.desc Verify $_set value=Number.MAX_VALUE clamp to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.$_set(0, Number.MAX_VALUE);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_4300
     * @tc.name testUint8ClampedArrayUnderSetTwo043
     * @tc.desc Verify $_set then $_get on last element roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.$_set(arr.length - 1, 200);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(arr.length - 1)).assertEqual(200);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_4400
     * @tc.name testUint8ClampedArrayUnderSetTwo044
     * @tc.desc Verify $_set value=2147483648 clamp to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.$_set(0, 2147483648);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_4500
     * @tc.name testUint8ClampedArrayUnderSetTwo045
     * @tc.desc Verify $_set index=length at 256-element array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      try {
        arr.$_set(256, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_4600
     * @tc.name testUint8ClampedArrayUnderSetTwo046
     * @tc.desc Verify $_set multiple sequential writes all reflected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_UNDER_SET_TWO_4700
     * @tc.name testUint8ClampedArrayUnderSetTwo047
     * @tc.desc Verify $_set index via int variable i=1 writes arr[1]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayUnderSetTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const i: int = 1;
      arr.$_set(i, 99);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(i)).assertEqual(99);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });
  });
}
