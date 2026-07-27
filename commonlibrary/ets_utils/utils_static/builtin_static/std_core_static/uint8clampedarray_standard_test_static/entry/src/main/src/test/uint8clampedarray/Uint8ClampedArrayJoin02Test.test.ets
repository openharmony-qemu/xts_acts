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

export default function uint8ClampedArrayJoin02Test(): void {
  describe('uint8ClampedArrayJoin02Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        },50);
      });
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0100
     * @tc.name testUint8ClampedArrayJoinTwo001
     * @tc.desc Verify join r equals '1,100' for array [1, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 100]);
      const r: string = arr.join(',');
      expect(r).assertEqual('1,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0200
     * @tc.name testUint8ClampedArrayJoinTwo002
     * @tc.desc Verify join r equals '10' for array [0x0A]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0x0A]);
      const r: string = arr.join();
      expect(r).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0300
     * @tc.name testUint8ClampedArrayJoinTwo003
     * @tc.desc Verify join r equals '15' for array [0b1111]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0b1111]);
      const r: string = arr.join();
      expect(r).assertEqual('15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0400
     * @tc.name testUint8ClampedArrayJoinTwo004
     * @tc.desc Verify join r equals '15' for array [0o17]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0o17]);
      const r: string = arr.join();
      expect(r).assertEqual('15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0500
     * @tc.name testUint8ClampedArrayJoinTwo005
     * @tc.desc Verify join r equals '100' for array [1e2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1e2]);
      const r: string = arr.join();
      expect(r).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0600
     * @tc.name testUint8ClampedArrayJoinTwo006
     * @tc.desc Verify join r equals '1,2' for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: string = arr.join();
      expect(r).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0700
     * @tc.name testUint8ClampedArrayJoinTwo007
     * @tc.desc Verify join() of length-0 array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const r: string = arr.join();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0800
     * @tc.name testUint8ClampedArrayJoinTwo008
     * @tc.desc Verify join() of single-element [42] returns 2-char string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      const r: string = arr.join();
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_0900
     * @tc.name testUint8ClampedArrayJoinTwo009
     * @tc.desc Verify join(',') of 3 elements yields length 5 (3 digits + 2 separators)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r: string = arr.join(',');
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1000
     * @tc.name testUint8ClampedArrayJoinTwo010
     * @tc.desc Verify join('') of 3 two-digit elements yields length 6 (no separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: string = arr.join('');
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1100
     * @tc.name testUint8ClampedArrayJoinTwo011
     * @tc.desc Verify join() does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const oldLen: int = arr.length;
      expect(arr.join(',')).assertEqual('1,2,3');
      expect(arr.length).assertEqual(oldLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1200
     * @tc.name testUint8ClampedArrayJoinTwo012
     * @tc.desc Verify join() does not change element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.join(',')).assertEqual('1,2,3');
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1300
     * @tc.name testUint8ClampedArrayJoinTwo013
     * @tc.desc Verify join() returns same result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1: string = arr.join(',');
      const r2: string = arr.join(',');
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1400
     * @tc.name testUint8ClampedArrayJoinTwo014
     * @tc.desc Verify join results differ when using different separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const r1: string = arr.join(',');
      const r2: string = arr.join('|');
      expect(r1).not().assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1500
     * @tc.name testUint8ClampedArrayJoinTwo015
     * @tc.desc Verify join r1 equals '1#2' for array [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      let sep: string = '#';
      const r1: string = arr.join(sep);
      sep = '@';
      const r2: string = arr.join(sep);
      expect(r1).assertEqual('1#2');
      expect(r2).assertEqual('1@2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1600
     * @tc.name testUint8ClampedArrayJoinTwo016
     * @tc.desc Verify join yields byteLength old for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const old: int = arr.buffer.byteLength ;
      expect(arr.join(',')).assertEqual('1,2,3,4');
      expect(arr.buffer.byteLength ).assertEqual(old);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1700
     * @tc.name testUint8ClampedArrayJoinTwo017
     * @tc.desc Verify join yields byteOffset old for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 4);
      const old: int = arr.byteOffset ;
      expect(arr.join(',')).assertEqual('0,0,0,0');
      expect(arr.byteOffset ).assertEqual(old);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1800
     * @tc.name testUint8ClampedArrayJoinTwo018
     * @tc.desc Verify nested join where separator is itself a join result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const r: string = arr.join(arr.join(','));
      expect(r).assertEqual('11,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_1900
     * @tc.name testUint8ClampedArrayJoinTwo019
     * @tc.desc Verify subarray element at arr[1] equals 2 for array [1, 2, 3, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(sub.join(',')).assertEqual('2,3');
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2000
     * @tc.name testUint8ClampedArrayJoinTwo020
     * @tc.desc Verify join(',') of [10,20,30] returns '10,20,30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      const r: string = arr.join(',');
      expect(r).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2100
     * @tc.name testUint8ClampedArrayJoinTwo021
     * @tc.desc Verify join() with long multi-char separator inserts it between each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      expect(arr.join('xxxxxxxxxxxxxxxx')).assertEqual('1xxxxxxxxxxxxxxxx2xxxxxxxxxxxxxxxx3xxxxxxxxxxxxxxxx4xxxxxxxxxxxxxxxx5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2200
     * @tc.name testUint8ClampedArrayJoinTwo022
     * @tc.desc Verify join() of single-element array ignores separator and returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1]);
      let s: string = '';
      for (let i = 0; i < 500; i++) {
        s = s + 'k';
      }
      expect(arr.join(s)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2300
     * @tc.name testUint8ClampedArrayJoinTwo023
     * @tc.desc Verify join r equals '255' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 1000;
      const r: string = arr.join();
      expect(r).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2400
     * @tc.name testUint8ClampedArrayJoinTwo024
     * @tc.desc Verify join r equals '0' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = -1000;
      const r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2500
     * @tc.name testUint8ClampedArrayJoinTwo025
     * @tc.desc Verify Number.MAX_VALUE clamp 255 join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.MAX_VALUE;
      const r: string = arr.join();
      expect(r).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2600
     * @tc.name testUint8ClampedArrayJoinTwo026
     * @tc.desc Verify Number.MIN_VALUE clamp 0 join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.MIN_VALUE;
      const r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2700
     * @tc.name testUint8ClampedArrayJoinTwo027
     * @tc.desc Verify join r equals '255,0,0,128' for length-4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr[0] = 300;
      arr[1] = -5;
      arr[2] = Number.NaN;
      arr[3] = 128;
      const r: string = arr.join(',');
      expect(r).assertEqual('255,0,0,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2800
     * @tc.name testUint8ClampedArrayJoinTwo028
     * @tc.desc Verify join r equals '1' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0.9;
      const r: string = arr.join();
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_2900
     * @tc.name testUint8ClampedArrayJoinTwo029
     * @tc.desc Verify join r equals '0' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0.4;
      const r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_3000
     * @tc.name testUint8ClampedArrayJoinTwo030
     * @tc.desc Verify join r equals '254' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 254.5;
      const r: string = arr.join();
      expect(r).assertEqual('254');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_3100
     * @tc.name testUint8ClampedArrayJoinTwo031
     * @tc.desc Verify join r equals '255' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 255.5;
      const r: string = arr.join();
      expect(r).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_3200
     * @tc.name testUint8ClampedArrayJoinTwo032
     * @tc.desc Verify join r equals '0' for length-1 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = -0;
      const r: string = arr.join();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_3300
     * @tc.name testUint8ClampedArrayJoinTwo033
     * @tc.desc Verify subarray r equals '2,99,4' for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      parent[2] = 99;
      const r: string = sub.join(',');
      expect(r).assertEqual('2,99,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_3400
     * @tc.name testUint8ClampedArrayJoinTwo034
     * @tc.desc Verify subarray r equals '1,88,3,4,5' for array [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = parent.subarray(1, 4);
      sub[0] = 88;
      const r: string = parent.join(',');
      expect(r).assertEqual('1,88,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_3500
     * @tc.name testUint8ClampedArrayJoinTwo035
     * @tc.desc Verify slice r equals '1,2,3' for array [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const s = parent.slice();
      parent[0] = 100;
      const r: string = s.join(',');
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_3600
     * @tc.name testUint8ClampedArrayJoinTwo036
     * @tc.desc Verify join firstView.join(',') equals '10,20' for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf, 0, 2);
      const secondView = new Uint8ClampedArray(buf, 2, 2);
      firstView[0] = 10;
      firstView[1] = 20;
      secondView[0] = 30;
      secondView[1] = 40;
      expect(firstView.join(',')).assertEqual('10,20');
      expect(secondView.join(',')).assertEqual('30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8_CLAMPED_ARRAY_JOIN_TWO_3700
     * @tc.name testUint8ClampedArrayJoinTwo037
     * @tc.desc Verify join secondView.join(',') equals '50,60' for ArrayBuffer-backed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint8ClampedArrayJoinTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const firstView = new Uint8ClampedArray(buf, 0, 4);
      const secondView = new Uint8ClampedArray(buf, 1, 2);
      firstView[1] = 50;
      firstView[2] = 60;
      expect(secondView.join(',')).assertEqual('50,60');
    });
  });
}
